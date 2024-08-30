<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    public function index()
    {
        $blog = Blog::all();

        return response()->json([
            'message' =>'success',
            'blog'=> $blog
        ],200);
    }


    public function store(Request $request)
    {
        $params = $request->validate([
            'image' =>['required', 'mimes:jpeg,png,jpg,gif', 'max:2048', 'image'],
            'title' => ['required'],
            'description'  => ['required'],
            'author' =>['required'],
            'tags' => ['nullable'],

        ]);

        $params['image'] = $request->file('image')->store('blog_images', 'public');
        $blog = Blog::create($params);

        return response()->json([
            'status' => 'success',
            'blog' => $blog,
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $blog = Blog::findOrFail($id);

        $params = $request->validate([
            'image' => ['nullable', 'mimes:jpeg,png,jpg,gif', 'max:2048', 'image'],
            'title' => ['sometimes', 'required'],
            'description' => ['sometimes', 'required'],
            'author' => ['sometimes', 'required'],
            'tags' => ['nullable'],

        ]);

        if ($request->hasFile('image')) {
            $params['image'] = $request->file('image')->store('blog_images', 'public');
        }

        $blog->update($params);

        return response()->json([
            'status' => 'success',
            'blog' => $blog,
        ], 200);
    }

    public function destroy($id)
    {
        $blog = Blog::findOrFail($id);
        if(!$blog) {
            return response()->json([
                'status' => 'not-found',
                'message'  => 'Not Found'
            ],404);
        }
        $blog->delete();

        return response()->json([
            'status' => 'success',
        ], 200);
    }
}
