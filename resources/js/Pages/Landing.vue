<template>
    <AppLayout>
        <div class="landing-page">
            <div class="content p-d-flex p-flex-column p-ai-center">
                <h2>Welcome to StoreHub</h2>
                <p>Discover amazing products at great prices!</p>
                <Link href="/products">
                    <Button label="Shop Now" icon="pi pi-shopping-cart" class="p-button-rounded" />
                </Link>

                <div class="featured-products">
                    <h3>Featured Products</h3>
                    <Carousel :value="products" :numVisible="3" :numScroll="1" :responsiveOptions="responsiveOptions">
                        <template #item="slotProps">
                            <div class="product-item">
                                <img :src="slotProps.data.image" :alt="slotProps.data.name" />
                                <h4>{{ slotProps.data.name }}</h4>
                                <h6>${{ slotProps.data.price }}</h6>
                                <Button icon="pi pi-shopping-cart" class="p-button-rounded" />
                            </div>
                        </template>
                    </Carousel>
                </div>
            </div>
        </div>
    </AppLayout>
</template>

<script setup>
import { ref } from 'vue';
import { Link } from '@inertiajs/vue3';
import Button from 'primevue/button';
import Carousel from 'primevue/carousel';
import AppLayout from '@/Layouts/AppLayout.vue';

const products = ref([
    { id: 1, name: 'Product 1', price: 19.99, image: 'https://via.placeholder.com/150' },
    { id: 2, name: 'Product 2', price: 29.99, image: 'https://via.placeholder.com/150' },
    { id: 3, name: 'Product 3', price: 39.99, image: 'https://via.placeholder.com/150' },
    { id: 4, name: 'Product 4', price: 49.99, image: 'https://via.placeholder.com/150' },
]);

const responsiveOptions = ref([
    {
        breakpoint: '1024px',
        numVisible: 3,
        numScroll: 3
    },
    {
        breakpoint: '600px',
        numVisible: 2,
        numScroll: 2
    },
    {
        breakpoint: '480px',
        numVisible: 1,
        numScroll: 1
    }
]);
</script>

<style scoped>
.landing-page {
    font-family: Arial, sans-serif;
}

.content {
    padding: 2rem;
    text-align: center;
}

.featured-products {
    margin-top: 2rem;
}

.product-item {
    text-align: center;
    padding: 1rem;
}

.product-item img {
    width: 100%;
    max-width: 150px;
}
</style>
