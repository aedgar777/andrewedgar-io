#!/bin/bash

# Setup script for andrewedgar.io portfolio

echo "Setting up andrewedgar.io portfolio..."
echo ""

# Check if node is installed
if ! command -v node &> /dev/null
then
    echo "❌ Node.js is not installed. Please install Node.js v18 or higher."
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

echo "✓ Node.js version: $(node --version)"

# Check if npm is installed
if ! command -v npm &> /dev/null
then
    echo "❌ npm is not installed. Please install npm."
    exit 1
fi

echo "✓ npm version: $(npm --version)"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install

if [ $? -eq 0 ]; then
    echo "✓ Dependencies installed successfully"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  • Run 'npm run dev' to start the development server"
echo "  • Run 'npm run build' to build for production"
echo "  • Run 'npm run deploy' to deploy to Firebase"
echo ""
