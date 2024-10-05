import openai

class ChatGPTCommunicator:
    def __init__(self, api_key, org_id):
        self.client = openai.OpenAI(api_key = api_key, organization=org_id)


    def get_response(self, request_text):
        response = self.client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[{"role": "user", "content": request_text}]
        )
        return response.choices[0].message.content