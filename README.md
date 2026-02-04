# Globus Auth Django Demo

Simple Django app with a "Sign In with Globus" button using Python Social Auth.

## Setup

1) Create a Globus Auth app and set the redirect URI to:
   `http://localhost:8000/auth/complete/globus/`

2) Create a local env file from the example:
   `cp .env.example .env`

3) Install dependencies and run migrations:
   `python -m pip install -r requirements.txt`
   `python manage.py migrate`

4) Start the server:
   `python manage.py runserver`

Open `http://localhost:8000/` and click "Sign In with Globus".
