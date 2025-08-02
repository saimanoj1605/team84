#!/usr/bin/env python3
"""
EchoVerse Deployment Test
Tests if all components are working correctly
"""

import sys
import subprocess
import importlib

def test_imports():
    """Test if all required modules can be imported"""
    required_modules = [
        'streamlit',
        'requests',
        'edge_tts',
        'asyncio',
        'os',
        'time'
    ]
    
    print("🧪 Testing module imports...")
    failed_imports = []
    
    for module in required_modules:
        try:
            importlib.import_module(module)
            print(f"✅ {module}")
        except ImportError as e:
            print(f"❌ {module}: {e}")
            failed_imports.append(module)
    
    return failed_imports

def test_api_endpoints():
    """Test API connectivity"""
    print("\n🌐 Testing API connectivity...")
    
    try:
        import requests
        # Test Hugging Face API
        response = requests.get("https://api-inference.huggingface.co/", timeout=10)
        print("✅ Hugging Face API reachable")
    except Exception as e:
        print(f"❌ Hugging Face API: {e}")
    
    # Test Edge TTS
    try:
        import edge_tts
        print("✅ Edge TTS module available")
    except Exception as e:
        print(f"❌ Edge TTS: {e}")

def test_directories():
    """Test if required directories exist"""
    print("\n📁 Testing directory structure...")
    
    import os
    required_dirs = ['narrations']
    
    for dir_name in required_dirs:
        if os.path.exists(dir_name):
            print(f"✅ {dir_name}/ directory exists")
        else:
            print(f"⚠️  {dir_name}/ directory missing - will be created")
            os.makedirs(dir_name, exist_ok=True)
            print(f"✅ Created {dir_name}/ directory")

def main():
    print("🎵 EchoVerse Deployment Test 🎵")
    print("================================")
    
    # Test imports
    failed_imports = test_imports()
    
    # Test APIs
    test_api_endpoints()
    
    # Test directories
    test_directories()
    
    print("\n📋 Test Summary:")
    if failed_imports:
        print(f"❌ Failed imports: {', '.join(failed_imports)}")
        print("Run: pip install -r requirements.txt")
        return False
    else:
        print("✅ All imports successful")
        print("✅ Ready for deployment!")
        return True

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
