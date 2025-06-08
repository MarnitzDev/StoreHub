<template>
    <AppLayout>
        <div class="products-page">
            <h1>Products</h1>
            <div class="product-grid">
                <div v-for="product in products" :key="product.id" class="product-card">
                    <img :src="product.image" :alt="product.title" class="product-image">
                    <h2>{{ product.title }}</h2>
                    <p class="price">${{ product.price }}</p>
                    <Link :href="`/products/${product.id}`" class="view-details">View Details</Link>
                </div>
            </div>
        </div>
    </AppLayout>
</template>

<script setup>
import { Link } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';

defineProps({
    products: Array,
});
</script>

<style scoped>
.products-page {
    max-width: 1200px;
    margin: 0 auto;
}

h1 {
    text-align: center;
    margin-bottom: 2rem;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 2rem;
}

.product-card {
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 1rem;
    text-align: center;
    transition: box-shadow 0.3s ease;
}

.product-card:hover {
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.product-image {
    width: 100%;
    max-width: 200px;
    height: auto;
    margin-bottom: 1rem;
}

.price {
    font-weight: bold;
    margin: 0.5rem 0;
}

.view-details {
    display: inline-block;
    padding: 0.5rem 1rem;
    background-color: #4CAF50;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

.view-details:hover {
    background-color: #45a049;
}
</style>
