# .env file with (export TWITTER_BEARER_TOKEN=AAAAAAAAAAAAAAAAAAAAA...)

import datetime
from dotenv import load_dotenv
import json
import os
import requests
import sys
import textwrap

from send_email import send_email

project_folder = os.path.expanduser('.')
load_dotenv(os.path.join(project_folder, '.env'))

def get_twitter_user(username):
    print("Get Twitter/X user by username...")
    bearer_token = os.getenv("TWITTER_BEARER_TOKEN")
    url = 'https://api.twitter.com/1.1/users/show.json'
    headers = {
        'Authorization': f"Bearer {bearer_token}"
    }
    params = {
        'screen_name': username
    }

    response = requests.get(url, headers=headers, params=params)
    print(f"Twitter/X response code: {response.status_code}.")
    return response

if __name__ == '__main__':
    current_time = datetime.datetime.today()
    time_string = current_time.strftime('%Y-%m-%d %H:%M:%S')

    response = get_twitter_user("dumitrux")
    pretty_json = json.dumps(response.json(), indent=4, sort_keys=True)
    indented_json = "\n".join("          " + line for line in pretty_json.split("\n"))

    if response.status_code != 200:
        print(f"Twitter/X response code is not 200 OK is: {response.status_code}.")
        email_content = "PythonAnywhere Twitter username @dumitrux is free:\n"
        email_content += f"🕒 Current time: {time_string}\n"
        email_content += f"📫 Response status: {response.status_code}\n"
        email_content += f"📦 Response content:\n"
        email_content += indented_json
        send_email("PythonAnywhere Twitter username free!", email_content)
    elif current_time.day == int(sys.argv[1]):
        print(f"Today is day {sys.argv[1]}, time for a monthly update.")
        email_content = "PythonAnywhere Twitter username @dumitrux monthly update:\n"
        email_content += f"🕒 Current time: {time_string}\n"
        email_content += f"📫 Response status: {response.status_code}\n"
        email_content += f"📦 Response content:\n"
        email_content += indented_json
        send_email("PythonAnywhere Twitter monthly update", email_content)
