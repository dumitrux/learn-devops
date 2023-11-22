# .env file with (export GMAIL_APP_PASSWORD=aaaa aaaa aaaa aaaa...)

from dotenv import load_dotenv
from email.mime.text import MIMEText
import os
import smtplib

project_folder = os.path.expanduser('.')
load_dotenv(os.path.join(project_folder, '.env'))

def send_email(subject, content):
    print("Send email through GMail...")
    msg = MIMEText(content)
    gmail_account = "mariandaci7@gmail.com"
    msg["Subject"] = subject
    msg['From'] = gmail_account
    msg['To'] = gmail_account

    smtp_server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    gmail_app_password = os.getenv("GMAIL_APP_PASSWORD")
    smtp_server.login(gmail_account, gmail_app_password)
    response = smtp_server.sendmail(msg["From"], msg['To'], msg.as_string())
    smtp_server.quit()
    print(f"Email using GMail SMPT sent.")
