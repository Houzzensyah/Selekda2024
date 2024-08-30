<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request  $request)
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

    public function login(Request $request)
    {
        $params = $request->validate([
            'username'  => ['required','min:3', 'max:20'],
            'password'  => ['required', 'min:6', 'max:20'],
        ]);

        $user = User::where('username', $params['username'])->first();
        if($user && Hash::check($params['password'], $user->password)) {
            $token = $user->createToken('token', ['role:user'])->plainTextToken;
            return response()->json([
                "status"=>"success",
                "token"=>$token,
                'role'=>'user'
            ]);
        }

        $admin = Admin::where('username', $params['username'])->first();
        if($admin && Hash::check($params['password'], $admin->password)) {
            $token = $admin->createToken('token', ['role:admin'])->plainTextToken;
            return response()->json([
                "status"=>"success",
                "token"=>$token,
                'role'=>'admin'
            ]);
        }

        return response()->json([
            "status"=> "invalid",
            "message"=> "Wrong username or password"
        ],401);
    }

    public function logout(Request $request)
    {
        auth()->user()->currentAccessToken()->delete();

        return response()->json([
            "status"=> "success"
        ],200);
    }
}
