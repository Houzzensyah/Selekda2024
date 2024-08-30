<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'userjuga',
            'username' => 'useruser',
            'email' => 'alucard@example.com',
            'password' => Hash::make('password'),
            'date_of_birth' => '1980-01-01',
            'phone_number' => '1234567890',
            'profile_picture' => 'profile_pictures/default.jpg',
        ]);

        User::create([
            'name' => 'Jane Doe',
            'username' => 'janedoe',
            'email' => 'jane@example.com',
            'password' => Hash::make('password'),
            'date_of_birth' => '1990-05-15',
            'phone_number' => '0987654321',
            'profile_picture' => 'profile_pictures/janedoe.jpg',
        ]);
    }
}
