// @ts-check
import { defineConfig } from 'astro/config';
import react from '@astrojs/react';

// https://astro.build/config
export default defineConfig({
  // Set this to your deployed URL (e.g. https://yourname.github.io) before building for prod.
  // For GitHub Pages project sites, also set `base: '/your-repo-name'`.
  site: 'https://example.com',
  integrations: [react()],
});
