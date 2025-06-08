<template>
    <AppLayout>
        <div class="products-page">
            <h1 class="text-3xl font-bold text-blue-500 mb-4">Products</h1>


            <div class="card flex justify-center">
                <div class="p-selectbutton p-component" role="group" aria-labelledby="category-filter">
                    <button
                        v-for="category in categories"
                        :key="category"
                        type="button"
                        class="p-togglebutton p-component"
                        :class="{ 'p-togglebutton-checked': selectedCategory === category }"
                        :aria-pressed="selectedCategory === category"
                        @click="selectCategory(category)"
                    >
                        <span class="p-togglebutton-content">
                            <span class="p-togglebutton-label">{{ category }}</span>
                        </span>
                    </button>
                </div>
            </div>

            <div v-if="filteredProducts.length" class="product-grid">
                <div v-for="product in filteredProducts" :key="product.id" class="product-card">
                    <img :src="product.image" :alt="product.title" class="product-image">
                    <h2>{{ product.title }}</h2>
                    <p class="price">${{ product.price.toFixed(2) }}</p>
                    <p class="category">{{ product.category }}</p>
                    <Link :href="`/products/${product.id}`" class="view-details">View Details</Link>
                </div>
            </div>
            <p v-else>No products available in this category.</p>
        </div>
    </AppLayout>
</template>

<script setup>
import { ref, computed } from 'vue';
import { Link } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import Button from 'primevue/button';

const props = defineProps({
    products: {
        type: Array,
        default: () => []
    },
    categories: {
        type: Array,
        default: () => ['All Categories']
    }
});

const selectedCategory = ref('All Categories');

const selectCategory = (category) => {
    selectedCategory.value = category;
};

const filteredProducts = computed(() => {
    if (selectedCategory.value === 'All Categories') {
        return props.products;
    }
    return props.products.filter(product => product.category === selectedCategory.value);
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

.card {
    margin-bottom: 2rem;
}

.p-selectbutton {
    display: flex;
}

.p-togglebutton {
    background-color: #ffffff;
    border: 1px solid #ced4da;
    color: #495057;
    transition: background-color 0.2s, color 0.2s, border-color 0.2s, box-shadow 0.2s;
    padding: 0.5rem 1rem;
}

.p-togglebutton:not(:last-child) {
    border-right-width: 0;
}

.p-togglebutton:first-child {
    border-top-left-radius: 6px;
    border-bottom-left-radius: 6px;
}

.p-togglebutton:last-child {
    border-top-right-radius: 6px;
    border-bottom-right-radius: 6px;
}

.p-togglebutton.p-togglebutton-checked {
    background-color: #3B82F6;
    border-color: #3B82F6;
    color: #ffffff;
}

.p-togglebutton:not(.p-disabled):not(.p-togglebutton-checked):hover {
    background-color: #e9ecef;
    border-color: #ced4da;
    color: #495057;
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
