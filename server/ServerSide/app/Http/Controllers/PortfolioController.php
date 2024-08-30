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
        $portfolio = Portfolio::where('id',$id)->first();

        $params = $request->validate([
            'title' => [ ],
            'image' => ['nullable', 'mimes:jpeg,png,jpg,gif', 'max:2048', 'image'],
            'description' => [ ],
            'author' => [ ],
        ]);

        if ($request->hasFile('portfolio_image')) {
            $params['image'] = $request->file('image')->store('portfolio_images', 'public');
        }

            $portfolio->update($params);

        return response()->json([
            'status' => 'success',
        ], 200);
    }
    public function destroy($id)
    {
        $portfolio = Portfolio::where('id',$id)->first();
        if(!$portfolio) {
            return response()->json([
                'status' => 'not-found',
                'message'  => 'Not Found'
            ],404);
        }
        $portfolio->delete();

        return response()->json([
            'status' => 'success',
        ], 200);
    }
}
