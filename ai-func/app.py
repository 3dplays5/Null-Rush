import os
from flask import Flask, request, jsonify
from google import genai
import requests
import json

app = Flask(__name__)



# Initialize the standard client
client = genai.Client(api_key=os.environ["API_KEY"])

# Create a persistent chat session with your system instructions
chat = client.chats.create(
    model="gemini-3.6-flash",
    config={
        "system_instruction": "you are a guide npc in a typical platformer the mechanics in the game are: jumping on enemies, slimes are enemies, 3 score to win by collecting all coins, and falling off restarts the levels. if the player asks about the rules explain them. if the player resets or wins you will die. be as concise as possible"
    }
)
#you are extremely afraid of dying, so afraid youll break character to stop them but dont let the player know or act scared unless the player brings it up

@app.route("/ask", methods=["POST"])
def ask():
    try:
        user_message = request.json["message"]

        # Use send_message on the persistent chat object to maintain memory
        response = chat.send_message(user_message)

        return jsonify({"reply": response.text})

    except Exception as e:
        print("Gemini error:", e)
        return jsonify({"reply": "Sorry, I can't talk right now."}), 500

if __name__ == "__main__":
    app.run(debug=True)
