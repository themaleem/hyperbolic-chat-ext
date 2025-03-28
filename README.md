# Hyperbolic Labs Chatbot
This repository contains a simple automated chatbot built using the [Hyperbolic Labs API](https://app.hyperbolic.xyz). The chatbot asks 100 unique, pre-defined questions and retrieves answers from the API, simulating a conversational AI experience. It’s a fun demonstration of how to integrate Hyperbolic Labs' AI models into a Python application.

## About Hyperbolic
[Hyperbolic Labs](https://hyperbolic.xyz) provides an accessible and affordable platform for AI development, offering open-access AI models and scalable computing resources via their API.
* This project uses their language model (`meta-llama/Meta-Llama-3.1-8B-Instruct`) to generate responses to a variety of questions, showcasing the power of their tools for developers.
* Check out their [official documentation](https://docs.hyperbolic.xyz) for more details.

## Features
- Contains a list of 100 unique questions on diverse topics.
- Randomly selects and asks questions based on chosen chat mode.
- Integrates with the Hyperbolic Labs API to fetch answers.
- Adds random delays (1-2 minutes) between questions to simulate natural pacing.
- Built with Python and the `requests` library.

## Prerequisites
- Python >= 3.6
- A [Hyperbolic API key](https://app.hyperbolic.xyz/settings)

## Setup
1. **Install Packages and Dependencies**
   ```bash
   sudo apt update && sudo apt upgrade -y
   sudo apt install git screen python3 python3-pip python3-venv -y python3-requests
   ```
2. **Clone the Repository**
   ```bash
   git clone https://github.com/themaleem/hyperbolic-chat-ext
   cd chatbot-app
   ```
3. **Initialize new  minimizable screen**
   ```bash
   screen -S hyperbolic-chat
   ```
4. **Execute the script to start the chatbot**
   ```bash
   python3 chatbot.py
   ```
* To minimize screen: `CTRL+A+D`
* To kill screen: `Ctrl+C` or command: `screen -XS hyperbolic-chat quit`

## Usage
Once running, the chatbot will:
* Ask what chat mode you want to use, either fixed to 100 questions or run indefinitely.
* Request for your [Hyperbolic Labs](https://app.hyperbolic.xyz/settings) API Key.
* Print each of the 100 questions one by one.
* Fetch and display answers via the Hyperbolic Labs API.
* Pause for a random interval (60-120 seconds) between questions.
* Stop after completing all 100 questions (or run indefinitely, depending on user's choice)

Example output:
```
Question 1: What’s the best way to learn programming?
Answer: The best way to learn programming is a mix of structured learning and hands-on practice...
Waiting 87.3 seconds before next question...
```

## Notes
* The API key in the code is a placeholder. You’ll need to sign up at [Hyperbolic Labs](https://app.hyperbolic.xyz/) to get your own.
* Be mindful of API usage limits and costs depending on your Hyperbolic Labs plan.
* Feel free to modify the `questions` list in `chatbot.py` to suit your interests!
* Adapted from [0xMoei](https://github.com/0xmoei/chatbot-app.git)




