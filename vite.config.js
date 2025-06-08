import { defineConfig, loadEnv } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';
import tailwindcss from '@tailwindcss/vite'

export default defineConfig(({ mode }) => {
    const env = loadEnv(mode, process.cwd(), '');

    return {
        plugins: [
            laravel({
                input: ['resources/css/app.css', 'resources/js/app.js'],
                refresh: true,
            }),
            vue({
                template: {
                    transformAssetUrls: {
                        base: null,
                        includeAbsolute: false,
                    },
                },
            }),
            tailwindcss(),
        ],
        server: {
            host: '0.0.0.0',
            port: parseInt(env.VITE_SERVER_PORT || '5173'),
            strictPort: true,
        },
        preview: {
            host: '0.0.0.0',
            port: 5173,
            strictPort: true,
        },
    };
});
