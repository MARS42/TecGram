import pyrebase
import os
import requests

class fire_base:
    firebaseConfig={
            "apiKey": os.environ.get('apiKey'),
            "authDomain": os.environ.get('authDomain'),
            "databaseURL":os.environ.get('databaseURL'),
            "projectId": os.environ.get('projectId'),
            "storageBucket": os.environ.get('storageBucket'),
            "messagingSenderId": os.environ.get('messagingSenderId'),
            "appId": os.environ.get('appId'),
            "measurementId": os.environ.get('measurementId')
            }
    firebase=pyrebase.initialize_app(firebaseConfig)
    auth=firebase.auth()
 
    def signup(self,email,password):
        try:
            user=self.auth.create_user_with_email_and_password(email,password)
            self.verifyEmail (user['idToken'])
            return user
        except:
            return 'Email already exists'
    def verifyEmail(self,token):
        headers = {
        'Content-Type': 'application/json',
        }
        data='{"requestType":"VERIFY_EMAIL","idToken":"'+token+'"}'
        r = requests.post('https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key={}'.format(os.environ.get('apiKey')), headers=headers, data=data)
        if 'error' in r.json().keys():
            return {'status':'error','message':r.json()['error']['message']}
        if 'email' in r.json().keys():
            return {'status':'success','email':r.json()['email']}