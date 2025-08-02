@echo off
REM EchoVerse Deployment Script for Windows

echo 🎵 EchoVerse Deployment Helper 🎵
echo ==================================

if "%1"=="local" goto local
if "%1"=="docker" goto docker
if "%1"=="heroku" goto heroku
if "%1"=="streamlit" goto streamlit
goto usage

:local
echo 📦 Installing dependencies...
pip install -r requirements.txt
echo 🚀 Starting EchoVerse locally...
streamlit run main.py --server.port 8501
goto end

:docker
echo 🐳 Building Docker image...
docker build -t echoverse .
echo 🐳 Running EchoVerse in Docker...
docker-compose up -d
goto end

:heroku
echo 🔺 Creating Heroku deployment files...
echo web: streamlit run main.py --server.port=$PORT --server.address=0.0.0.0 > Procfile
echo 📝 Heroku files created! Now run:
echo    heroku create your-app-name
echo    git push heroku main
goto end

:streamlit
echo ☁️ Instructions for Streamlit Cloud deployment:
echo 1. Push your code to GitHub
echo 2. Go to https://share.streamlit.io/
echo 3. Connect your GitHub repository
echo 4. Set main file to: main.py
echo 5. Click Deploy!
goto end

:usage
echo Usage: %0 {local^|docker^|heroku^|streamlit}
echo.
echo   local     - Install deps and run locally
echo   docker    - Build and run with Docker
echo   heroku    - Create Heroku deployment files
echo   streamlit - Show Streamlit Cloud instructions

:end
