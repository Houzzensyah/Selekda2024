<?php

namespace Database\Seeders;

use App\Models\Banner;
use App\Models\Blog;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BlogSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Blog::create([
            'image' => 'blog_images/post1.jpg',
            'title' => 'The Importance of SEO',
            'description' => 'In this blog post, we discuss why SEO is crucial for your business.',
            'author' => 'John Doe',
            'tags' => 'SEO,Marketing,Business',
            'date' => now(),
        ]);
        Blog::create([
            'blog_image' => 'blog_images/post2.jpg',
            'blog_title' => '10 Tips for Web Design',
            'description' => 'Learn the top 10 tips for designing an effective website.',
            'author' => 'Jane Smith',
            'tags' => 'Web Design,UI/UX,Development',
            'date' => now(),
        ]);
        Blog::create([
            'blog_image' => 'blog_images/post3.jpg',
            'blog_title' => 'rahasia alam',
            'description' => 'panggilan alam saat lomba.',
            'author' => 'Sam Smith',
            'tags' => 'Alam,Seru,Lomba',
            'date' => now(),
        ]);
        Blog::create([
            'blog_image' => 'blog_images/post2.jpg',
            'blog_title' => '10 Tips for Web Design',
            'description' => 'Learn the top 10 tips for designing an effective website.',
            'author' => 'Jane Smith',
            'tags' => 'Web Design,UI/UX,Development',
            'date' => now(),
        ]);
    }
}
