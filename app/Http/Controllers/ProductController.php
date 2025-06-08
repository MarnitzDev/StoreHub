<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index()
    {
        $products = Http::get('https://fakestoreapi.com/products')->json();
        $categories = Http::get('https://fakestoreapi.com/products/categories')->json();

        array_unshift($categories, 'All Categories');

        return Inertia::render('Products', [
            'products' => $products,
            'categories' => $categories
        ]);
    }
}
