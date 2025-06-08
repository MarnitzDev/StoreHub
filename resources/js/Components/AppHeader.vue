<template>
    <header class="store-header">
        <div class="header-content">
            <div class="logo">
                <h1>StoreHub</h1>
            </div>
            <nav class="navigation">
                <ul>
                    <li>
                        <Link href="/" class="nav-link">Home</Link>
                    </li>
                    <li>
                        <Link href="/products" class="nav-link">Products</Link>
                    </li>
                    <li><a href="#" class="nav-link">About</a></li>
                    <li><a href="#" class="nav-link">Contact</a></li>
                </ul>
            </nav>
            <div class="user-actions">
                <Button icon="pi pi-search" class="p-button-rounded p-button-text" />
                <Button icon="pi pi-shopping-cart" class="p-button-rounded p-button-text" />
                <Button icon="pi pi-user" class="p-button-rounded p-button-text" />
            </div>
        </div>
    </header>
</template>

<script setup>
import Button from 'primevue/button';
import { Link } from '@inertiajs/vue3';
</script>

<style scoped>
.store-header {
    background-color: #f8f9fa;
    padding: 1rem 0;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.header-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
}

.logo h1 {
    margin: 0;
    font-size: 1.5rem;
    color: #333;
}

.navigation ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: flex;
}

.navigation li {
    margin: 0 1rem;
}

.navigation .nav-link {
    text-decoration: none;
    color: #333;
    font-weight: 500;
}

.user-actions {
    display: flex;
    gap: 0.5rem;
}
</style>
