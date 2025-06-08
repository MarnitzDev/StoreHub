<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index()
    {
        $products = Http::get('https://fakestoreapi.com/products')->json();
        return Inertia::render('Products/Index', ['products' => $products]);
    }

    public function show($id)
    {
        $product = Http::get("https://fakestoreapi.com/products/{$id}")->json();
        return Inertia::render('Products/Show', ['product' => $product]);
    }
}
