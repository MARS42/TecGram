import pyrebase
import os
import requests
#from firebase import firebase 
import user

class database:
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

    def SearchByName(self,name,idToken):
        person=[]
        if self.CheckToken(idToken):
            db =self.firebase.database()
            users_by_name = db.child("users").get()
            for user_ in users_by_name.each():
                client=user_.val()
                #check if there is a lastname
                if client['rol'] in ['student','teacher']:
                    if user.User().UserLike(client['name'],client['lastname'],name):
                        person.append(client)
                else:
                    if user.User().UserLike(client['name'],"---",name):
                        person.append(client)
            
            return person

        return "Your token has expired"

    def UserLike(self,name,lastname,username):
        #to lower to comparate
        name=name.lower()
        lastname=lastname.lower()
        username=username.lower()
        full_name=name+" "+lastname
        if name==username or lastname==name or full_name==username:
            return True
        return False

    def CheckToken(self,idToken):
        try:
            self.auth.get_account_info(idToken)
        except:
            return False
        return True
    def SignIn(self,email,password):
        try:
            user = self.auth.sign_in_with_email_and_password(email, password)
            data=self.auth.get_account_info(user['idToken'])
            if (data['users'][0]['emailVerified'])==False:
                self.verifyEmail (user['idToken'])
                return "Email is not verified please check your email"
            return user
        except:
            return "Email or password was incorrect"
    def signup(self,email,password,data):
        try:
            user=self.auth.create_user_with_email_and_password(email,password)
            self.verifyEmail (user['idToken'])
            data['localId']=user['localId']
            self.SignupUser(data)
            return user
        except:
            return 'Email already exists'
    
    def SignupUser(self,data):
        db =self.firebase.database()
        db.child("users").push(data)
        
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
