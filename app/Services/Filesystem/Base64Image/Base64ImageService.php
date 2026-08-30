<?php

namespace App\Services\Filesystem\Base64Image;

use Exception;
use App\Constants\Filesystem;
use Illuminate\Support\Facades\Http;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\Encoders\WebpEncoder;

class Base64ImageService
{
	private $image;
    private $manager;
    private $scaleWidth;
    private $blurRadius;
    private $timeout = 60;
    private $compressRate = 1;

    public function __construct()
    {
        $this->manager = new ImageManager(new Driver());
        $this->scaleWidth = Filesystem::IMAGE_PLACEHOLDER_WIDTH;
        $this->blurRadius = Filesystem::IMAGE_PLACEHOLDER_BLUR;
    }

    public function load(string $imagePath)
    {
        $this->image = $this->manager->read($imagePath);

        return $this;
    }

   public function loadFromUrl(string $imageUrl)
    {
        try {
            $response = Http::timeout($this->timeout)->withOptions([
                'verify' => false,
                'allow_redirects' => true
            ])->get($imageUrl);
        
            // HTTP request အောင်မြင်ရဲ့လား စစ်ဆေးမည်
            if (! $response->successful()) {
                throw new \Exception("HTTP Error status: " . $response->status());
            }

            $body = $response->body();

            if (empty($body)) {
                throw new \Exception("The downloaded image content is empty.");
            }

            $this->image = $this->manager->read($body);

            return $this;
        }
        catch (\Exception $e) {
            throw new \Exception("Failed to get image from URL. {$e->getMessage()}");
        }
    }

    public function setScaleWidth(int $scaleWidth)
    {
        $this->scaleWidth = $scaleWidth;

        return $this;
    }

    public function setBlurRadius(int $blurRadius)
    {
        $this->blurRadius = $blurRadius;

        return $this;
    }

    public function setCompressRate(int $compressRate)
    {
        $this->compressRate = $compressRate;

        return $this;
    }
    
    public function getBase64(): string
    {
        $this->image->scale($this->scaleWidth)->blur($this->blurRadius);
		
		$this->image = $this->image->encode(new WebpEncoder($this->compressRate));

		$base64 = base64_encode((string) $this->image);

        return "data:image/webp;base64,{$base64}";
    }
}