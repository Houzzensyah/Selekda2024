<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        Admin::create([
            'name' => 'Admin',
            'username' => 'admin',
            'email' => 'admin@gmail.com',
            'password' => 'admin123',
            'date_of_birth' => '1990-01-01',
            'phone_number' => '1234567890',
            'profile_picture' => 'path/to/picture.jpg',
        ]);

    }
}
