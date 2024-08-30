<?php

namespace Database\Seeders;

use App\Models\Portfolio;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PortfolioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Portfolio::create([
            'title' => 'E-commerce Website',
            'image' => 'portfolio_images/ecommerce.jpg',
            'description' => 'A fully functional e-commerce website with a custom CMS.',
            'author' => 'John Doe',
        ]);

        Portfolio::create([
            'title' => 'Portfolio Website',
            'image' => 'portfolio_images/portfolio.jpg',
            'description' => 'A personal portfolio website showcasing various projects.',
            'author' => 'Jane Smith',
        ]);
    }
}
