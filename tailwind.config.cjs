/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: ["class"],
  content: ["./index.html", "./src/**/*.{ts,tsx,js,jsx}"],
  theme: {
    extend: {
      colors: {
        orange: {
          600: "#FFAC06",
        },
        red: {
          600: "#FD0000",
        },
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
};
