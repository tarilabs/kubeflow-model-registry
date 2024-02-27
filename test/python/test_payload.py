import requests
from datetime import datetime

current_datetime = datetime.now()
timestamp = datetime.timestamp(current_datetime)

from faker import Faker
fake = Faker()

def generate_random_sentence(max_chars):
    random_sentence = ""
    while len(random_sentence) < max_chars:
        random_sentence += fake.sentence() + " "
    return random_sentence[:max_chars]

max_chars = 400000
random_sentence = generate_random_sentence(max_chars)

url = 'http://localhost:8080/api/model_registry/v1alpha2/registered_models'
headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json'
}
data = {
    "description": random_sentence,
    "name": f"prova lorem{generate_random_sentence(100)}{timestamp}"
}

response = requests.post(url, headers=headers, json=data)

print(response.status_code)
print(response.json())  # If you expect JSON response
