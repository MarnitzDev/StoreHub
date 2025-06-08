<template>
    <div class="app-layout">
        <AppHeader />
        <main>
            <slot></slot>
        </main>
    </div>
</template>

<script setup>
import AppHeader from '@/Components/AppHeader.vue';
</script>

<style scoped>
.app-layout {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

main {
    flex: 1;
    padding: 2rem;
}
</style>
