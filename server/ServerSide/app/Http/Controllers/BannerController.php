<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use Illuminate\Http\Request;

class BannerController extends Controller
{
    public function index()
    {
        $banners = Banner::all();

        return response()->json([
            'status' => 'success',
            'banners' => $banners,
        ], 200);
    }

    public function store(Request $request  )
    {
        $params = $request->validate([
            'title' => ['required'],
            'image' => ['required', 'mimes:jpeg,png,jpg,gif', 'max:2048', 'image'],
            'description' => ['nullable'],
            'status' => ['required', 'in:active,inactive'],
        ]);

        $params['image'] = $request->file('image')->store('banner_images', 'public');

        $banner = Banner::create($params);

        return response()->json([
            'status' => 'success',
            'banner' => $banner,
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $banner = Banner::findOrFail($id);

        $params = $request->validate([
            'title' => ['sometimes', 'required'],
            'image' => ['nullable', 'mimes:jpeg,png,jpg,gif', 'max:2048', 'image'],
            'description' => ['nullable'],
            'status' => ['sometimes', 'required', 'in:active,inactive'],

        ]);

        if ($request->hasFile('image')) {
            $params['image'] = $request->file('banner_image')->store('banner_images', 'public');
        }

        $banner->update($params);

        return response()->json([
            'status' => 'success',
            'banner' => $banner,
        ], 200);
    }

    public function destroy( $id)
    {
        $banner = Banner::findOrFail($id);
        if(!$banner) {
            return response()->json([
                'status' => 'not-found',
                'message'  => 'Not Found'
            ],404);
        }
        $banner->delete();

        return response()->json([
            'status' => 'success',
        ], 200);
    }
}
