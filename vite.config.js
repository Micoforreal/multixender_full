import path from "path"
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import {NodeGlobalsPolyfillPlugin} from "@esbuild-plugins/node-globals-polyfill"
import {NodeModulesPolyfillPlugin} from "@esbuild-plugins/node-modules-polyfill"
import rollupNodePolyFill from 'rollup-plugin-node-polyfills'



// https://vite.dev/config/
export default defineConfig({
 
  plugins: [react()],
  server: { hmr: { overlay: true, // Enable error overlay 
  
  }, },

  build: {
    commonjsOptions: {
      include: [/node_modules/],
      transformMixedEsModules: true
    },
    rollupOptions: {
      plugins: [
        // Enable rollup polyfills plugin
        // used during production bundling
        rollupNodePolyFill()
      ]
    }
  },



  optimizeDeps: {
    // disabled: false,
    esbuildOptions: {
      // Enable esbuild polyfill plugins
      plugins: [
        NodeGlobalsPolyfillPlugin({
          // process: true,
          // buffer: true
        }),
        NodeModulesPolyfillPlugin()
      ]
    }
  },
  
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
})
