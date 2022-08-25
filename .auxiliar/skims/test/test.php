<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use GuzzleHttp\Client;

// Non compliant code
function insecure_info_2(Request $request)
{
    $email = $request->input('email');
    $password = $request->input('password');

    $client = new Client();
    $res = $client->request('POST', 'http://example.com/api/login', [
        'form_params' => [
            'email' => $email,
            'password' => $password
        ]
    ]);

    return response()->json(['message' => 'Login successful']);
};

?>
