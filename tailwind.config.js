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
        'scout-border': '#32312B',
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
        "bounce-tongue": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-7px)' },
        },
        "bounce-wheels": {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-1px)' },
        },
        "bounce-body": {
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
        "bounce-tongue": 'bounce-tongue 0.6s ease-in-out infinite',
        "bounce-wheels": 'bounce-wheels 0.6s ease-in-out infinite',
        "bounce-body": 'bounce-body 0.6s ease-in-out infinite',
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
          'text-shadow': '-1px 1px 0px #32312B, -2px 2px 0px #32312B, -3px 3px 0px #32312B, -4px 4px 0px #32312B',
          '-webkit-text-stroke': '6px #32312B',
        },
        '@media (prefers-color-scheme: dark)': {
          '.text-scout-shadow': {
            'color': '#ffffff',
            'text-shadow': '-1px 1px 0px #32312B, -2px 2px 0px #32312B, -3px 3px 0px #32312B, -4px 4px 0px #32312B',
            '-webkit-text-stroke': '6px #32312B',
          },
        },
        '.text-subheadline-shadow': {
          'color': '#ffffff',
          'text-shadow': '-1px 1px 0px #32312B, -2px 2px 0px #32312B',
          '-webkit-text-stroke': '2px #32312B',
        },
        '@media (prefers-color-scheme: dark)': {
          '.text-subheadline-shadow': {
            'color': '#ffffff',
            'text-shadow': '-1px 1px 0px #32312B, -2px 2px 0px #32312B',
            '-webkit-text-stroke': '2px #32312B',
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
        '.text-scout-border': {
          'color': '#32312B',
        },
        '.dotted-background': {
          'background-image': 'radial-gradient(circle, rgba(0, 0, 0, 0.1) 1px, transparent 1px)',
          'background-size': '3px 3px',
        },
        '.dotted-background-dark': {
          'background-image': 'radial-gradient(circle, rgba(0, 0, 0, 0.3) 1px, transparent 1px)',
          'background-size': '2px 2px',
        },
        '.chat-bubble': {
          'position': 'relative',
          'background': '#F5ECD3',
          'border-radius': '1rem',
          'padding': '1.5rem',
          'box-shadow': '-2px 2px 0px #32312B, -4px 4px 0px #32312B, -6px 6px 0px #32312B',
          'border': '6px solid #32312B',
          'z-index': '30',
        },
        '.chat-bubble::after': {
          'content': '""',
          'position': 'absolute',
          'bottom': '-12px',
          'left': '50%',
          'transform': 'translateX(-50%)',
          'width': '0',
          'height': '0',
          'border-left': '12px solid transparent',
          'border-right': '12px solid transparent',
          'border-top': '12px solid #F5ECD3',
        },
        '.chat-bubble::before': {
          'content': '""',
          'position': 'absolute',
          'bottom': '-18px',
          'left': '50%',
          'transform': 'translateX(-50%)',
          'width': '0',
          'height': '0',
          'border-left': '16px solid transparent',
          'border-right': '16px solid transparent',
          'border-top': '16px solid #32312B',
        },
        '@media (prefers-color-scheme: dark)': {
          '.chat-bubble': {
            'background': '#374151',
            'border-color': '#32312B',
            'z-index': '30',
          },
          '.chat-bubble::after': {
            'border-top-color': '#374151',
          },
          '.chat-bubble::before': {
            'border-top-color': '#32312B',
          },
        },
        '.comic-strip-grid': {
          'display': 'grid',
          'grid-template-columns': 'repeat(auto-fit, minmax(280px, 1fr))',
          'gap': '2rem',
          'width': '100%',
        },
        '.comic-panel': {
          'background': '#ffffff',
          'border': '4px solid #32312B',
          'border-radius': '1rem',
          'box-shadow': '8px 8px 0px #32312B',
          'position': 'relative',
          'transition': 'transform 0.2s ease',
        },
        '.comic-panel:hover': {
          'transform': 'translateY(-4px)',
          'box-shadow': '12px 12px 0px #32312B',
        },
        '@media (prefers-color-scheme: dark)': {
          '.comic-panel': {
            'background': '#374151',
            'border-color': '#32312B',
          },
        },
        '.comic-speech-bubble': {
          'position': 'relative',
          'background': '#F5ECD3',
          'border': '2px solid #32312B',
          'border-radius': '1rem',
          'padding': '0.75rem 1rem',
          'font-style': 'italic',
          'margin-top': '1rem',
        },
        '.comic-speech-bubble::after': {
          'content': '\"\"',
          'position': 'absolute',
          'top': '-8px',
          'left': '50%',
          'transform': 'translateX(-50%)',
          'width': '0',
          'height': '0',
          'border-left': '8px solid transparent',
          'border-right': '8px solid transparent',
          'border-bottom': '8px solid #F5ECD3',
        },
        '.comic-speech-bubble::before': {
          'content': '\"\"',
          'position': 'absolute',
          'top': '-11px',
          'left': '50%',
          'transform': 'translateX(-50%)',
          'width': '0',
          'height': '0',
          'border-left': '10px solid transparent',
          'border-right': '10px solid transparent',
          'border-bottom': '10px solid #32312B',
        },
        '@media (prefers-color-scheme: dark)': {
          '.comic-speech-bubble': {
            'background': '#d1d5db',
            'color': '#111827',
          },
          '.comic-speech-bubble::after': {
            'border-bottom-color': '#d1d5db',
          },
        },
        '.scout-button-shadow': {
          'box-shadow': '-4px 4px 0px #78350f, -3px 3px 0px #78350f, -2px 2px 0px #78350f, -1px 1px 0px #78350f',
        },
        '.scout-button-shadow:hover': {
          'box-shadow': '-4px 4px 0px #78350f, -3px 3px 0px #78350f',
        },
        '.scout-button-shadow:active': {
          'box-shadow': '-4px 4px 0px #78350f',
        }
      })
    }),
  ],
}