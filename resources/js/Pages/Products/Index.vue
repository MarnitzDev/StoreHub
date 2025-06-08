<template>
    <div>
        <h1>Products</h1>
        <div v-for="product in products" :key="product.id">
            <h2>{{ product.title }}</h2>
            <p>{{ product.price }}</p>
            <img :src="product.image" :alt="product.title" style="width: 100px;">
            <Link :href="`/products/${product.id}`">View Details</Link>
        </div>
    </div>
</template>

<script>
import { Link } from '@inertiajs/vue3'

export default {
    components: {
        Link,
    },
    props: {
        products: Array,
    },
}
</script>
