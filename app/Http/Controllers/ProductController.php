<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index()
    {
        $products = Http::get('https://fakestoreapi.com/products')->json();
        return Inertia::render('Products', ['products' => $products]);
    }
}
