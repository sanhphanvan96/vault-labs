from flask import Flask, request, jsonify
import os
import sys

app = Flask(__name__)

def get_secret_from_env(ENV_VARIABLE):
    return os.environ.get(ENV_VARIABLE)

def get_secret_from_file(file_path):
    try:
        with open(file_path, 'r') as file:
            for line in file:
                key, value = line.strip().split('=')
                if key == 'APP_TOKEN':
                    return value
    except FileNotFoundError:
        return None

@app.route('/', methods=['GET'])
def get_secret():
    secret_from_env = get_secret_from_env('APP_TOKEN')
    secret_from_file = get_secret_from_file('/etc/app/app.conf')
    
    if secret_from_env:
        secret = secret_from_env
    elif secret_from_file:
        secret = secret_from_file
    else:
        secret = "No secret found"
    
    return jsonify({'secret': secret})

if __name__ == "__main__":
    app.run()
