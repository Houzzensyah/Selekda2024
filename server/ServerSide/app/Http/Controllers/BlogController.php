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
            'title' =>['required', 'mimes:jpeg,png,jpg,gif', 'max:2048', 'image'],
            'image' => ['required'],
            'description'  => ['required'],
            'author' =>['required'],
            'tags' => ['nullable'],
            'date' => ['required', 'date']
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
            'date' => ['sometimes', 'required', 'date'],
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
        $blog->delete();

        return response()->json([
            'status' => 'success',
        ], 200);
    }
}
