#!/bin/bash

# EchoVerse Deployment Script
# This script helps deploy EchoVerse on different platforms

echo "🎵 EchoVerse Deployment Helper 🎵"
echo "=================================="

# Function to install dependencies
install_deps() {
    echo "📦 Installing dependencies..."
    pip install -r requirements.txt
}

# Function to run locally
run_local() {
    echo "🚀 Starting EchoVerse locally..."
    streamlit run main.py --server.port 8501
}

# Function to build Docker
build_docker() {
    echo "🐳 Building Docker image..."
    docker build -t echoverse .
}

# Function to run Docker
run_docker() {
    echo "🐳 Running EchoVerse in Docker..."
    docker-compose up -d
}

# Function to deploy to Streamlit Cloud
deploy_streamlit_cloud() {
    echo "☁️ Instructions for Streamlit Cloud deployment:"
    echo "1. Push your code to GitHub"
    echo "2. Go to https://share.streamlit.io/"
    echo "3. Connect your GitHub repository"
    echo "4. Set main file to: main.py"
    echo "5. Click Deploy!"
}

# Function to deploy to Heroku
deploy_heroku() {
    echo "🔺 Creating Heroku deployment files..."
    
    # Create Procfile
    echo "web: streamlit run main.py --server.port=\$PORT --server.address=0.0.0.0" > Procfile
    
    # Create setup.sh
    cat > setup.sh << 'EOF'
mkdir -p ~/.streamlit/
echo "\
[general]\n\
email = \"\"\n\
" > ~/.streamlit/credentials.toml
echo "\
[server]\n\
headless = true\n\
enableCORS=false\n\
port = $PORT\n\
" > ~/.streamlit/config.toml
EOF
    
    echo "📝 Heroku files created! Now run:"
    echo "   heroku create your-app-name"
    echo "   git push heroku main"
}

# Main menu
case "$1" in
    "local")
        install_deps
        run_local
        ;;
    "docker")
        build_docker
        run_docker
        ;;
    "heroku")
        deploy_heroku
        ;;
    "streamlit")
        deploy_streamlit_cloud
        ;;
    *)
        echo "Usage: $0 {local|docker|heroku|streamlit}"
        echo ""
        echo "  local     - Install deps and run locally"
        echo "  docker    - Build and run with Docker"
        echo "  heroku    - Create Heroku deployment files"
        echo "  streamlit - Show Streamlit Cloud instructions"
        ;;
esac
