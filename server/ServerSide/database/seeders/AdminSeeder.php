<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        Admin::create([
            'name' => 'Admin1',
            'username' => 'admin1',
            'email' => 'admin1@gmail.com',
            'password' => Hash::make('admin123'),
            'date_of_birth' => '1990-01-01',
            'phone_number' => '1234567890',
            'profile_picture' => 'path/to/picture.jpg',
        ]);

    }
}
