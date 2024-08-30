<?php

namespace Database\Seeders;

use App\Models\Banner;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BannerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Banner::create([
            'title' => 'Welcome to Our Website',
            'image' => 'banner_images/test.jpg',
            'description' => 'This is the main banner of our website.',
            'status' => 'active',
            'date' => now(),
        ]);

        Banner::create([
            'title' => 'Special Offer!',
            'image' => 'banner_images/special_offer.jpg',
            'description' => 'Dont miss our special offer, available for a limited time.',
            'status' => 'inactive',
            'date' => now(),
        ]);
    }
}
