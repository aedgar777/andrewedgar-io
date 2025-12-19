#!/bin/bash

# Verification script for andrewedgar.io portfolio refactoring

echo "🔍 Verifying andrewedgar.io Portfolio Setup"
echo "============================================"
echo ""

ERRORS=0
WARNINGS=0

# Check required files exist
echo "📁 Checking required files..."

check_file() {
    if [ -f "$1" ]; then
        echo "  ✓ $1"
    else
        echo "  ❌ Missing: $1"
        ((ERRORS++))
    fi
}

check_dir() {
    if [ -d "$1" ]; then
        echo "  ✓ $1/"
    else
        echo "  ❌ Missing directory: $1"
        ((ERRORS++))
    fi
}

# Core files
check_file "package.json"
check_file "tsconfig.json"
check_file "vite.config.ts"
check_file "firebase.json"

# Source files
check_dir "src"
check_file "src/main.ts"

# Public files
check_dir "public"
check_file "public/index.html"
check_file "public/styles.css"
check_file "public/favicon.png"
check_file "public/manifest.json"

# Assets
check_dir "assets"
check_dir "assets/icons"
check_file "assets/icons/github-mark-white.png"
check_file "assets/icons/InBug-White.png"
check_file "assets/icons/instagram.png"

echo ""
echo "🔍 Checking file contents..."

# Check if main.ts has Firebase config
if grep -q "firebaseConfig" src/main.ts; then
    echo "  ✓ Firebase config found in main.ts"
else
    echo "  ❌ Firebase config missing in main.ts"
    ((ERRORS++))
fi

# Check if main.ts has projects array
if grep -q "const projects" src/main.ts; then
    PROJECT_COUNT=$(grep -c "title:" src/main.ts)
    if [ "$PROJECT_COUNT" -ge 5 ]; then
        echo "  ✓ Portfolio projects found ($PROJECT_COUNT items)"
    else
        echo "  ⚠️  Only $PROJECT_COUNT portfolio projects found (expected 5+)"
        ((WARNINGS++))
    fi
else
    echo "  ❌ Projects array missing in main.ts"
    ((ERRORS++))
fi

# Check if HTML has all sections
if grep -q 'id="about"' public/index.html && \
   grep -q 'id="portfolio"' public/index.html && \
   grep -q 'id="contact"' public/index.html; then
    echo "  ✓ All sections found in HTML (about, portfolio, contact)"
else
    echo "  ❌ Missing sections in HTML"
    ((ERRORS++))
fi

# Check CSS has color variables
if grep -q "\-\-violet:" public/styles.css && \
   grep -q "\-\-light-violet:" public/styles.css; then
    echo "  ✓ CSS color variables defined"
else
    echo "  ❌ CSS color variables missing"
    ((ERRORS++))
fi

# Check CSS has responsive breakpoints
if grep -q "@media" public/styles.css; then
    MEDIA_COUNT=$(grep -c "@media" public/styles.css)
    echo "  ✓ CSS responsive breakpoints found ($MEDIA_COUNT media queries)"
else
    echo "  ⚠️  No media queries found in CSS"
    ((WARNINGS++))
fi

echo ""
echo "🔍 Checking Firebase configuration..."

# Check firebase.json points to dist
if grep -q '"public": "dist"' firebase.json; then
    echo "  ✓ Firebase hosting points to 'dist' directory"
else
    echo "  ⚠️  Firebase hosting not configured for 'dist' directory"
    ((WARNINGS++))
fi

echo ""
echo "🔍 Checking package.json scripts..."

# Check if key npm scripts exist
if grep -q '"dev"' package.json && \
   grep -q '"build"' package.json && \
   grep -q '"deploy"' package.json; then
    echo "  ✓ NPM scripts configured (dev, build, deploy)"
else
    echo "  ❌ Missing NPM scripts in package.json"
    ((ERRORS++))
fi

echo ""
echo "🔍 Checking dependencies..."

if [ -f "package.json" ]; then
    if grep -q '"firebase"' package.json && \
       grep -q '"vite"' package.json && \
       grep -q '"typescript"' package.json; then
        echo "  ✓ Core dependencies listed (firebase, vite, typescript)"
    else
        echo "  ❌ Missing core dependencies in package.json"
        ((ERRORS++))
    fi
fi

# Check if node_modules exists
if [ -d "node_modules" ]; then
    echo "  ✓ node_modules directory exists"
else
    echo "  ⚠️  node_modules not found - run 'npm install'"
    ((WARNINGS++))
fi

echo ""
echo "============================================"
echo "📊 Verification Summary"
echo "============================================"

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo "✅ All checks passed! Your portfolio is ready."
    echo ""
    echo "Next steps:"
    echo "  1. Run 'npm install' (if not already done)"
    echo "  2. Run 'npm run dev' to start development server"
    echo "  3. Run 'npm run build' to build for production"
    echo "  4. Run 'npm run deploy' to deploy to Firebase"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo "⚠️  Verification completed with $WARNINGS warning(s)"
    echo ""
    echo "Your setup is functional but has minor issues."
    echo "Review warnings above."
    exit 0
else
    echo "❌ Verification failed with $ERRORS error(s) and $WARNINGS warning(s)"
    echo ""
    echo "Please fix the errors above before proceeding."
    exit 1
fi
