const plugin = require('tailwindcss/plugin')

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./site/**/*.html"],
  theme: {
    extend: {
      colors: {
        'scout-orange': '#F0AA4F',
        'scout-orange-dark': '#E89A3C',
        'scout-orange-darker': '#D68829',
        'scout-brown': '#3D2306',
        'scout-yellow': '#EEA048',
      },
      keyframes: {
        "drive-car": {
          '0%, 100%': { transform: 'translateX(64px)' },
          '50%': { transform: 'translateX(-48px)' },
        },
        "bounce-car": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-4px)' },
        },
        "bounce-paw": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-5px)' },
        },
        "bounce-wheels": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-1px)' },
        },
        "bounce-hog": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-8px)' },
        },
        "typewriter": {
          '0%': { width: '0' },
          '100%': { width: '100%' },
        },
        "blink": {
          '0%, 50%': { 'border-color': 'transparent' },
          '51%, 100%': { 'border-color': 'currentColor' },
        },
      },
      animation: {
        "drive-car": 'drive-car 12s ease-in-out infinite',
        "bounce-car": 'bounce-car 0.6s ease-in-out infinite',
        "bounce-paw": 'bounce-paw 0.6s ease-in-out infinite',
        "bounce-wheels": 'bounce-wheels 0.6s ease-in-out infinite',
        "bounce-hog": 'bounce-hog 0.6s ease-in-out infinite',
        "typewriter": 'typewriter 1.5s steps(20, end) forwards',
        "blink": 'blink 1s infinite',
      },
      extrude: {
        sm: '0 1px 0px var(--tw-shadow-color)',
        DEFAULT: '0 4px 0px var(--tw-shadow-color)',
        lg: '0 2px 0px var(--tw-shadow-color), 0 4px 0px var(--tw-shadow-color), 0 6px 0px var(--tw-shadow-color), 0 8px 0px var(--tw-shadow-color)',
      },
      fontWeight: {
        'tight': '900',
      },
    },
    fontFamily: {
      'rounded': ['ui-rounded', '-apple-system', 'system-ui', 'BlinkMacSystemFont', '"Segoe UI"', 'Roboto', '"Helvetica Neue"', 'Arial', 'sans-serif'],
      'avenir': ['"Avenir Next"', 'Avenir', '-apple-system', 'system-ui', 'sans-serif']
    },
    container: {
      center: true
    },
    screens: {
      'sm': '375px',
      'md': '900px',
    }
  },
  plugins: [
    plugin(function ({ matchUtilities, theme, addUtilities }) {
      matchUtilities({
          'text-extrude': (value) => ({
            'text-shadow': value,
          }),
        },
        { values: theme('extrude') }
      )
      matchUtilities({
          'container-extrude': (value) => ({
            'box-shadow': value,
          }),
        },
        { values: theme('extrude') }
      )
      addUtilities({
        '.text-scout-shadow': {
          'color': '#ffffff',
          'text-shadow': '-1px 1px 0px #28251B, -2px 2px 0px #28251B, -3px 3px 0px #28251B, -4px 4px 0px #28251B',
          '-webkit-text-stroke': '6px #28251B',
        },
        '@media (prefers-color-scheme: dark)': {
          '.text-scout-shadow': {
            'color': '#ffffff',
            'text-shadow': '-1px 1px 0px #613300, -2px 2px 0px #613300, -3px 3px 0px #613300, -4px 4px 0px #613300',
            '-webkit-text-stroke': '6px #613300',
          },
        },
        '.text-subheadline-shadow': {
          'color': '#ffffff',
          'text-shadow': '-1px 1px 0px #28251B, -2px 2px 0px #28251B',
          '-webkit-text-stroke': '2px #28251B',
        },
        '@media (prefers-color-scheme: dark)': {
          '.text-subheadline-shadow': {
            'color': '#ffffff',
            'text-shadow': '-1px 1px 0px #613300, -2px 2px 0px #613300',
            '-webkit-text-stroke': '2px #613300',
          },
        },
        '.rotate-slight': {
          'transform': 'rotate(-8deg)',
        },
        '.font-tight': {
          'letter-spacing': '-0.05em',
          'font-stretch': 'condensed',
        },
        '.typewriter': {
          'border-right': '3px solid',
          'white-space': 'nowrap',
          'display': 'inline',
          'vertical-align': 'baseline',
        },
        '.typewriter-container': {
          'text-align': 'left',
          'display': 'inline-block',
          'width': '100%',
          'margin-top': '-40px',
        },
        '.dotted-background': {
          'background-image': 'radial-gradient(circle, rgba(0, 0, 0, 0.1) 1px, transparent 1px)',
          'background-size': '3px 3px',
        },
        '.dotted-background-dark': {
          'background-image': 'radial-gradient(circle, rgba(0, 0, 0, 0.3) 1px, transparent 1px)',
          'background-size': '2px 2px',
        }
      })
    }),
  ],
}