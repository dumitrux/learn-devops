# Twitter checks <!-- omit in toc -->

- [Gmail](#gmail)
- [Twitter API](#twitter-api)
- [Platforms](#platforms)
  - [GitHub Actions](#github-actions)
  - [PythonAnywhere](#pythonanywhere)

## Gmail

- [Quick Tip: Sending Email via Gmail with Python](https://www.sitepoint.com/quick-tip-sending-email-via-gmail-with-python/)
- [SMTP for free users](https://help.pythonanywhere.com/pages/SMTPForFreeUsers/)
- [Sign in with app passwords](https://support.google.com/accounts/answer/185833?hl=en)
- [Google](https://support.google.com/accounts/answer/185833?hl=en&sjid=1804814364665939162-EU)

Go to: Google Account > Security > 2-Step Verification > App passwords.
The App password will look like `aaaa aaaa aaaa aaaa`.

## Twitter API

- [Twitter - Developer Portal](https://developer.twitter.com/en/portal/dashboard)
- Project & App: `twitter-nickname`
- Authentication Tokens (Bearer Token): `AAAAAAAAAAAAAAAAAAAAA`

## Platforms

Platform to schdule the task for free:

- [Python Free Hosts](https://wiki.python.org/moin/FreeHosts)
  - [PythonAnywhere](https://www.pythonanywhere.com)
- GitHub Actions

### GitHub Actions

### PythonAnywhere

- [PythonAnywhere Overview](https://www.youtube.com/watch?v=yhqYFyo7dAM)
- [How to set environment variables for your web apps (for SECRET_KEY etc)](https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/)
- [Scheduled tasks](https://help.pythonanywhere.com/pages/ScheduledTasks/)
- [Installing new modules](https://help.pythonanywhere.com/pages/InstallingNewModules/)

```bash
python --version # Python 3.10.5
pip --version # pip 22.2 from /usr/local/lib/python3.10/site-packages/pip (python 3.10)
pip3.10 --version # pip 22.2 from /usr/local/lib/python3.10/site-packages/pip (python 3.10)
pip install --user python-dotenv

cd /home/mitru/twitter_nickname/
echo "export TWITTER_BEARER_TOKEN=AAAAAAAAAAAAAAAAAAAAA" >> .env
echo "export GMAIL_APP_PASSWORD=aaaa aaaa aaaa aaaa" >> .env
cat .env
```
