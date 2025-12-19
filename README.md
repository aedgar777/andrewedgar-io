# andrewedgar.io

Andrew Edgar's portfolio website - A single-page portfolio site built with TypeScript, HTML, and CSS.

## Tech Stack

- **TypeScript** - Type-safe JavaScript
- **HTML5** - Semantic markup
- **CSS3** - Modern styling with responsive design
- **Firebase** - Hosting and Analytics
- **Vite** - Fast build tool and dev server

## Project Structure

```
andrewedgar-io/
├── public/           # Static files (HTML, CSS, favicon, manifest)
├── src/              # TypeScript source files
├── assets/           # Icons and fonts
├── dist/             # Build output (generated)
└── firebase.json     # Firebase hosting configuration
```

## Getting Started

### Prerequisites

- Node.js (v18 or higher)
- npm or yarn
- Firebase CLI (for deployment)

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```

### Development

Run the development server with hot reload:

```bash
npm run dev
```

The site will be available at `http://localhost:5173`

### Building

Build for production:

```bash
npm run build
```

This will:
1. Compile TypeScript
2. Bundle assets with Vite
3. Copy assets and web resources to the `dist/` folder

### Firebase Deployment

To deploy to Firebase Hosting:

```bash
npm run deploy
```

Or deploy manually:

```bash
npm run build
firebase deploy
```

### Local Firebase Preview

Test the production build locally:

```bash
npm run serve
```

## Features

- **Responsive Design** - Works on desktop, tablet, and mobile
- **Smooth Scrolling** - Animated navigation between sections
- **Mobile Menu** - Hamburger menu for narrow screens
- **Firebase Integration** - Analytics tracking
- **Portfolio Grid** - Responsive project showcase with hover effects
- **Social Links** - Footer with LinkedIn, Instagram, and GitHub links

## Sections

1. **About** - Introduction and bio
2. **Portfolio** - Project showcase with descriptions and tags
3. **Contact** - Social links and email
