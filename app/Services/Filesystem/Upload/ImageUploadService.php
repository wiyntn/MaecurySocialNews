<?php

namespace App\Services\Filesystem\Upload;

use Exception;
use Throwable;
use App\Constants\Filesystem;
use Intervention\Image\ImageManager;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\Drivers\Gd\Encoders\PngEncoder;
use Intervention\Image\Drivers\Gd\Encoders\JpegEncoder;
use Intervention\Image\Drivers\Gd\Encoders\WebpEncoder;
use App\Traits\Services\Filesystem\ThrowsUploadExceptions;
use App\Services\Filesystem\Abstract\AbstractUploadService;
class ImageUploadService extends AbstractUploadService
{
    use ThrowsUploadExceptions;

    private $image;
    private $manager;
    private string $imageDefaultExtension = 'webp';
    private string $imageEncoder = 'webp';
    private string $imageLQIPBase64 = '';
    protected $timeout = 30;

    public function __construct()
    {
        $this->imageEncoder = config('filesystems.image_encoder');

        // အရေးကြီးချက် - Disk ကို ဘယ်နေရာကမှ မထည့်ပေးလိုက်ရင် Local ထဲ မရောက်သွားစေရန် 
        // Default အနေနဲ့ 'idrive' (သို့မဟုတ် filesystems.default) ကို သုံးပေးမည်
        if (empty($this->storageDisk)) {
            $this->storageDisk = config('filesystems.default', 'idrive');
        }

        return $this;
    }

   public function load($imagePath)
{
    $this->manager = new ImageManager(new Driver());

    try {
        // 1. Handle UploadedFile or objects with get() method
        if (
            $imagePath instanceof \Illuminate\Http\UploadedFile ||
            (is_object($imagePath) && method_exists($imagePath, 'get'))
        ) {
            if (
                method_exists($imagePath, 'isValid') &&
                !$imagePath->isValid()
            ) {
                throw new Exception('The uploaded file is not valid.');
            }

            $imageContents = $imagePath->get();

            if (empty($imageContents)) {
                throw new Exception('Uploaded image file is empty.');
            }

            $this->image = $this->manager->read($imageContents);

        } elseif (is_string($imagePath)) {

            $fileContent = null;
            $livewireDisk = config('livewire.temporary_file_upload.disk', 'public');

            // Case A: Valid URL (remote or storage URL)
            if (filter_var($imagePath, FILTER_VALIDATE_URL)) {
                $response = \Illuminate\Support\Facades\Http::timeout(30)->get($imagePath);
                if ($response->successful()) {
                    $fileContent = $response->body();
                }
            } 
            // Case B: Check across configured disks (Livewire disk, public, local, idrive, etc.)
            else {
                $disks = [$livewireDisk, 'public', 'local', 'idrive', 's3'];

                foreach ($disks as $disk) {
                    try {
                        if (\Illuminate\Support\Facades\Storage::disk($disk)->exists($imagePath)) {
                            $fileContent = \Illuminate\Support\Facades\Storage::disk($disk)->get($imagePath);
                            break;
                        }
                    } catch (\Throwable $e) {
                        // Skip disk if it throws driver configuration errors
                        continue;
                    }
                }

                // Case C: Fallback to direct local path check if storage get didn't catch it
                if (empty($fileContent)) {
                    $localPaths = [
                        $imagePath,
                        storage_path('app/' . $imagePath),
                        storage_path('app/public/livewire-tmp/' . basename($imagePath)),
                        storage_path('app/livewire-tmp/' . basename($imagePath))
                    ];

                    foreach ($localPaths as $path) {
                        if (file_exists($path) && filesize($path) > 0) {
                            $fileContent = file_get_contents($path);
                            break;
                        }
                    }
                }
            }

            // Final validation of the loaded file content
            if (!empty($fileContent)) {
                $this->image = $this->manager->read($fileContent);
            } else {
                throw new Exception(
                    'Image file does not exist, is empty, or has expired: ' . $imagePath
                );
            }

        } else {
            throw new Exception(
                'Provided input is neither a valid UploadedFile nor an existing file path.'
            );
        }

    } catch (Throwable $e) {
        throw new Exception(
            'Invalid image source: Unable to decode input. Details: ' .
            $e->getMessage()
        );
    }

    return $this;
}

    public function compress(int $rate = 70): self
    {
        $imageEncoder = $this->getImageEncoder();

        $this->image = $this->image->encode(new $imageEncoder($rate));

        return $this;
    }

    public function scaleTo1080x1920(): self
    {
        $canvas = $this->manager->create(1080, 1920)->fill('#000000');

        $this->image->scale(1080);

        $verticalPosition = (1920 - $this->image->height()) / 2;

        $this->image = $canvas->place($this->image, 'top', 0, (int) $verticalPosition);

        return $this;
    }

    public function crop(int $width, int $height): self
    {
        $this->image->cover($width, $height);

        return $this;
    }

    public function placeholder(): self
    {
        $this->image->scale(Filesystem::IMAGE_PLACEHOLDER_WIDTH)->blur(Filesystem::IMAGE_PLACEHOLDER_BLUR);

        return $this;
    }

    public function upload(): array
    {
        try {
            // Storage Disk အလွတ်ဖြစ်နေပါက idrive သို့ အတင်းပြောင်းမည် (Local ထဲ မရောက်စေရန်)
            if (empty($this->storageDisk) || $this->storageDisk === 'local' || $this->storageDisk === 'public') {
                $this->storageDisk = 'idrive';
            }

            $uploadData = [
                'disk' => $this->storageDisk,
                'image_size' => $this->getImageSize(),
                'image_path' => $this->determineStoragePath($this->imageDefaultExtension)
            ];

            if (! empty($this->imageLQIPBase64)) {
                $uploadData['image_lqip'] = $this->imageLQIPBase64;
            }

            $imageUploadStatus = Storage::disk($this->storageDisk)->put($uploadData['image_path'], (string) $this->image);
            
            if (empty($imageUploadStatus)) {
                $this->makeUploadException("Image upload on disk ({$this->storageDisk}) failed.");
            }

            return $uploadData;
        }

        catch(Exception $e) {
            $this->makeUploadException($e->getMessage());
        }
    }

    public function setImageEncoder(string $encoderName)
    {
        $this->imageEncoder = $encoderName;
    }

    private function getImageSize()
    {
        try {
            if (function_exists('mb_strlen')) {
                $size = mb_strlen($this->image, '8bit');
            }
            
            else {
                $size = strlen($this->image);
            }

            return $size;
        } catch (Exception $e) {
            return 0;
        }
    }

    private function getImageEncoder()
    {
        $encoders = [
            'webp' => WebpEncoder::class,
            'png' => PngEncoder::class,
            'jpeg' => JpegEncoder::class
        ];

        return $encoders[$this->imageEncoder] ?? WebpEncoder::class;
    }
}