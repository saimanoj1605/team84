# 🎵 EchoVerse - AI Audiobook Creator

Transform your text into engaging audio stories with customized tone, voice, and language using AI.

## ✨ Features

- **AI Text Rewriting**: Automatically enhance your text with engaging narrative styles
- **Multiple Voices**: Choose from various voice options (Lisa, Martin, Sofia, Ethan)
- **Tone Customization**: Select from Inspiring, Suspenseful, Dramatic, Comedic, or Neutral tones
- **Multi-language Support**: English, Spanish, French, and German
- **Custom Themes**: Glass, Pastel, Sunlight, Forest themes
- **File Support**: Upload .txt files or type directly
- **Audio Download**: Download generated MP3 files
- **Narration History**: Keep track of all your created audiobooks

## 🚀 Quick Start

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/saimanoj1605/team84.git
   cd team84/EchoVerse
   ```

2. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Run the application**
   ```bash
   streamlit run main.py
   ```

4. **Open your browser** to `http://localhost:8501`

### Using Deployment Scripts

**Windows:**
```cmd
deploy.bat local
```

**Linux/Mac:**
```bash
chmod +x deploy.sh
./deploy.sh local
```

## 🐳 Docker Deployment

### Quick Docker Run
```bash
# Build and run with Docker Compose
./deploy.sh docker
```

### Manual Docker Commands
```bash
# Build the image
docker build -t echoverse .

# Run the container
docker run -p 8501:8501 echoverse
```

## ☁️ Cloud Deployment

### Streamlit Cloud (Recommended)

1. Push your code to GitHub
2. Go to [Streamlit Cloud](https://share.streamlit.io/)
3. Connect your GitHub repository
4. Set main file to: `main.py`
5. Click Deploy!

### Heroku Deployment

1. **Create Heroku files**
   ```bash
   ./deploy.sh heroku
   ```

2. **Deploy to Heroku**
   ```bash
   heroku create your-app-name
   git push heroku main
   ```

### Railway Deployment

1. Connect your GitHub repository to [Railway](https://railway.app)
2. Set the start command to: `streamlit run main.py --server.port=$PORT --server.address=0.0.0.0`

### Render Deployment

1. Connect your GitHub repository to [Render](https://render.com)
2. Set the build command to: `pip install -r requirements.txt`
3. Set the start command to: `streamlit run main.py --server.port=$PORT --server.address=0.0.0.0`

## 📁 Project Structure

```
EchoVerse/
├── main.py                 # Main Streamlit application
├── api_rewriter.py         # Text rewriting API using Hugging Face
├── api_tts.py             # Text-to-speech API using Edge TTS
├── requirements.txt        # Python dependencies
├── Dockerfile             # Docker configuration
├── docker-compose.yml     # Docker Compose configuration
├── deploy.sh              # Deployment script (Linux/Mac)
├── deploy.bat             # Deployment script (Windows)
├── .streamlit/
│   └── config.toml        # Streamlit configuration
├── narrations/            # Generated audio files
└── README.md              # This file
```

## 🛠️ Dependencies

- **streamlit**: Web framework for the UI
- **edge-tts**: Microsoft Edge Text-to-Speech
- **requests**: HTTP library for API calls
- **transformers**: Hugging Face transformers (if using local models)

## 🎨 Usage

1. **Choose Input Method**: Type text directly or upload a .txt file
2. **Select Options**: 
   - Tone (Inspiring, Suspenseful, Dramatic, etc.)
   - Voice (Lisa, Martin, Sofia, Ethan)
   - Language (English, Spanish, French, German)
3. **Generate**: Click "Rewrite and Generate Audio"
4. **Download**: Save your audio file and rewritten text

## 🔧 Configuration

### Environment Variables

Create a `.env` file for configuration:
```env
HUGGINGFACE_API_TOKEN=your_token_here  # Optional for faster API access
```

### Streamlit Secrets

For Streamlit Cloud, add secrets in the dashboard:
```toml
[secrets]
HUGGINGFACE_API_TOKEN = "your_token_here"
```

## 🚨 Troubleshooting

### Common Issues

1. **"Module not found" errors**: Make sure all dependencies are installed
   ```bash
   pip install -r requirements.txt
   ```

2. **Edge TTS not working**: Ensure you have internet connection for Edge TTS service

3. **Memory issues**: For local deployment, ensure you have enough RAM (4GB+ recommended)

4. **Port conflicts**: Change the port in the run command:
   ```bash
   streamlit run main.py --server.port 8502
   ```

## 📜 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 🆘 Support

- Create an issue on GitHub for bugs
- Check the troubleshooting section
- Review Streamlit documentation for deployment issues

---

Made with ❤️ by the EchoVerse team