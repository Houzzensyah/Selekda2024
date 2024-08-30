<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use App\Models\Portfolio;
use Illuminate\Http\Request;

class PortfolioController extends Controller
{
    public function index()
    {
        $portfolio = Portfolio::all();

        return response()->json([
            'message' =>'success',
            'portfolio'=> $portfolio
        ],200);
    }

    public function store(Request $request)
    {
        $params = $request->validate([
            'title' => ['required'],
            'image' => ['required', 'mimes:jpeg,png,jpg,gif', 'max:2048', 'image'],
            'description' => ['required'],
            'author' => ['required'],
        ]);

        $params['image'] = $request->file('image')->store('portfolio_images', 'public');

        $portfolio = Portfolio::create($params);

        return response()->json([
            'status' => 'success',
            'portfolio' => $portfolio,
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $portfolio = Portfolio::findOrFail($id);

        $params = $request->validate([
            'title' => ['sometimes', 'required'],
            'image' => ['nullable', 'mimes:jpeg,png,jpg,gif', 'max:2048', 'image'],
            'description' => ['sometimes', 'required'],
            'author' => ['sometimes', 'required'],
        ]);

        if ($request->hasFile('portfolio_image')) {
            $params['image'] = $request->file('image')->store('portfolio_images', 'public');
        }

        $portfolio->update($params);

        return response()->json([
            'status' => 'success',
            'portfolio' => $portfolio,
        ], 200);
    }
    public function destroy($id)
    {
        $portfolio = Portfolio::findOrFail($id);
        $portfolio->delete();

        return response()->json([
            'status' => 'success',
        ], 200);
    }
}
