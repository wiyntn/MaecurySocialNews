<?php

/*
|--------------------------------------------------------------------------
| Mercury Social Newial New - The Social Network Web Application.
|--------------------------------------------------------------------------
| Author: Mansur Terla. Full-Stack Web Developer, UI/UX Designer.
| Website: www.terla.me
| E-mail: mansurtl.contact@gmail.com
| Instagram: @mansur_terla
| Telegram: @mansurtl_contact
|--------------------------------------------------------------------------
| Copyright (c)  Mercury Social Newial Newial New. All rights reserved.
|--------------------------------------------------------------------------
*/

namespace App\Services\Filesystem\RoundRobin;

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Cache;

class RoundRobinService
{
    private array $disks = [];

    private string $diskCacheKey = 'current_file_storage_disk_index';

    public function __construct()
    {
        $this->disks = array_keys($this->getRoundRobinDisks());

        // Disk စာရင်း အလွတ်ဖြစ်နေပါက default အနေဖြင့် 'idrive' ကို သုံးရန်
        if (empty($this->disks)) {
            $this->disks = ['idrive'];
        }
    }

    public function getNextDisk() 
    {
        $currentIndex = Cache::get($this->diskCacheKey, 0);

        if ($currentIndex >= count($this->disks)) {
            $currentIndex = 0;
        }

        $selectedDisk = $this->disks[$currentIndex];

        // Cache တွင် index အသစ်ကို သိမ်းဆည်းရန်
        Cache::put($this->diskCacheKey, ($currentIndex + 1) % count($this->disks));

        return $selectedDisk;
    }

    public function getRoundRobinDisks()
    {
        // config('filesystems.disks') ထဲမှ Cloud Disks များကိုသာ ယူမည် (local နှင့် public ကို လုံးဝ ဖြုတ်မည်)
        return Arr::except(config('filesystems.disks'), ['local', 'public']);
    }
}