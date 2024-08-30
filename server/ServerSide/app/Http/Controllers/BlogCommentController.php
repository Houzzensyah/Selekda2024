<?php

namespace App\Http\Controllers;

use App\Models\BlogComment;
use Illuminate\Container\Attributes\Auth;
use Illuminate\Http\Request;

class BlogCommentController extends Controller
{
    public function index()
    {
        $comments = BlogComment::all();

        return response()->json([
            'status' => 'success',
            'comments' => $comments,
        ], 200);
    }

    public function store(Request $request)
    {
        $params = $request->validate([
            'name' => ['required'],
            'email' => ['required', 'email', 'max:255'],
            'subject' => ['required'],
            'website' => ['nullable'],
            'comment' => ['required'],
            'captcha' => ['nullable'],

        ]);

        $params['user_id'] = \auth()->user()->id;
        $comment = BlogComment::create($params);

        return response()->json([
            'status' => 'success',
            'comment' => $comment,
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $comment = BlogComment::where('id', $id)->first();

        $params = $request->validate([
            'name' => ['sometimes', 'required'],
            'email' => ['sometimes', 'required', 'email', 'max:255'],
            'subject' => ['sometimes', 'required'],
            'website' => ['nullable'],
            'comment' => ['sometimes', 'required'],
            'captcha' => ['nullable'],
            'date' => ['sometimes', 'required', 'date'],
        ]);

        $comment->update($params);

        return response()->json([
            'status' => 'success',
            'comment' => $comment,
        ], 201);
    }

    public function destroy($id)
    {
        $comment = BlogComment::findOrFail($id);
        if(!$comment) {
            return response()->json([
                'status' => 'not-found',
                'message'  => 'Not Found'
            ],404);
        }
        $comment->delete();

        return response()->json([
            'status' => 'success',
        ], 204);
    }

}
