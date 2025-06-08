import { createApp, h } from 'vue';
import { createInertiaApp } from '@inertiajs/vue3';
import PrimeVue from 'primevue/config';

// Import PrimeVue styles
// import 'primevue/resources/themes/lara-light-blue/theme.css';
import 'primeicons/primeicons.css';

// Import core PrimeVue functionality
import Button from 'primevue/button';
import InputText from 'primevue/inputtext';
// Add other PrimeVue components as needed

createInertiaApp({
    resolve: name => {
        const pages = import.meta.glob('./Pages/**/*.vue', { eager: true });
        return pages[`./Pages/${name}.vue`];
    },
    setup({ el, App, props, plugin }) {
        const app = createApp({ render: () => h(App, props) });
        app.use(plugin);
        app.use(PrimeVue, { ripple: true });

        // Register PrimeVue components
        app.component('Button', Button);
        app.component('InputText', InputText);
        // Register other PrimeVue components as needed

        app.mount(el);
    },
});
