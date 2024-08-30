<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserAdminController extends Controller
{
        public function index()
        {
            $users = User::all();

            return response()->json([
                'status' => 'success',
                'users' => $users,

            ],200);
        }

        public function store(Request $request)
        {
            $params = $request->validate([
                'name' => ['required'],
                'username'  => ['required', 'unique:users,username','min:3', 'max:20'],
                'email' => ['required', 'email', 'max:255'],
                'password'  => ['required', 'min:6', 'max:20'],
                'date_of_birth' => ['required','date'],
                'phone_number'  =>['nullable', 'max:15'],
                'profile_picture' => ['nullable', 'mimes:jpeg,png,jpg,gif|max:2048', 'image'],
            ]);

            if ($request->hasFile('profile_picture')) {
                $path = $request->file('profile_picture')->store('profile_pictures', 'public');
                $params['profile_picture'] = $path;
            }

            $params['password'] = Hash::make($params['password']);
            $user = User::create($params);

            $token = $user->createToken('token', ['role:user'])->plainTextToken;

            return response()->json([
                "status"=> "success",
                'token'=> $token
            ],201);
        }

    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

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
            $params['profile_picture'] = $request->file('profile_picture')->store('profile_pictures', 'public');
        }

        $params['password'] = $request->filled('password') ? Hash::make($params['password']) : $user->password;

        $user->update($params);

        return response()->json([
            'status' => 'success',
            'user' => $user,
        ], 200);
    }

    public function destroy($id)
    {
        $users = User::findOrFail($id);
        if(!$users) {
            return response()->json([
                'status' => 'not-found',
                'message'  => 'Not Found'
            ],404);
        }
        $users->delete();
        return response()->json([
            'status' => 'success',
        ],204);
    }
}
