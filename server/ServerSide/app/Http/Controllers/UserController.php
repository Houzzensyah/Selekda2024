<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function updateProfile(Request $request)
    {
        $user = Auth::user();  // Fetches the currently authenticated user

        $params = $request->validate([
            'name' => ['sometimes', 'required'],
            'username' => ['sometimes', 'required', 'unique:users,username,' . $user->id, 'min:3', 'max:20'],
            'email' => ['sometimes', 'required', 'email', 'max:255', 'unique:users,email,' . $user->id],
            'password' => ['sometimes', 'required', 'min:6', 'max:20'],
            'date_of_birth' => ['sometimes', 'required', 'date'],
            'phone_number' => ['nullable', 'max:15'],
            'profile_picture' => ['nullable', 'mimes:jpeg,png,jpg,gif', 'max:2048', 'image'],
        ]);

        if ($request->hasFile('profile_picture')) {
            $path = $request->file('profile_picture')->store('profile_pictures', 'public');
            $params['profile_picture'] = $path;
        }

        if (isset($params['password'])) {
            $params['password'] = Hash::make($params['password']);
        }

        $user->update($params);  // Updates the authenticated user's record

        return response()->json([
            'status' => 'success',
            'user' => $user,
        ], 200);
    }

    public function getUserProfile()
    {

    }
}
