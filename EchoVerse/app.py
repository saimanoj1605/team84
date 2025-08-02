#!/usr/bin/env python3
"""
EchoVerse - AI Audiobook Creator
Entry point for deployment
"""

import streamlit as st
import sys
import os

# Add the current directory to Python path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Import and run the main application
if __name__ == "__main__":
    # This ensures the app runs when called directly
    from main import *
