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

    def GenerateRequest(self,idlocal,personidlocal,idToken):
        if self.CheckToken(idToken):
            response=self.sendresquest(idlocal,personidlocal)
            if response==False:
                return "Couldn't send your follow requests"
            else:
                return "Follow requests sended"
        return "Your token has expired"


    def sendresquest(self,idlocal,personidlocal):
        person=[]
        sender=None
        db =self.firebase.database()
        users_by_id = db.child("users").get()
        for user in users_by_id.each():
            user_=user.val()
            if user_['localId']==personidlocal:
                person.append(user.val())
                person.append(user.key())
            elif user_['localId']==idlocal:
                sender =user.key()

        self.checkprofilesetting(person,sender)
        return self.Update_Request(person)

    def Update_Request(self,person):
        try:
            db =self.firebase.database()
            db.child("users").child(person[1]).set(person[0])
        except:
            return False
        return True

    def checkprofilesetting(self,person,sender):
        if person[0]["profile"]=="private":
            self.SaveRequest(person,sender)
        else:
            #add as follower
            self.AceptFollowigRequest(person,sender)
            pass

    def AceptFollowigRequest(self,person,sender):
        if person[0]["followers"][0]==0:
            person[0]["followers"]=[sender]
        else:
            person[0]["followers"].append(sender)

    def SaveRequest(self,person,sender):
        if person[0]["requests"][0]==0:
            person[0]["requests"]=[sender]
        else:
            person[0]["requests"].append(sender)

    def freshToken(self,refreshToken):
        try:
            user = self.auth.refresh(refreshToken)
            return user['idToken']
        except:
            return "refreshToken token is not valid"

    def SearchByName(self,name,idToken):
        person=[]
        if self.CheckToken(idToken):
            db =self.firebase.database()
            users_by_name = db.child("users").get()
            if users_by_name !=None:
                person=self.serach_by_name(users_by_name,name)
            
            return person

        return "Your token has expired"

    def serach_by_name(self,user_collection,name):
        person=[]
        for user_ in user_collection.each():
            client=user_.val()
            #check if there is a lastname
            if client['rol'] in ['student','teacher']:
                if user.User().UserLike(client['name'],client['lastname'],name):
                    person.append(client)
                else:
                    if user.User().UserLike(client['name'],"---",name):
                        person.append(client)
        return person

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
        data['following']=[0]
        data['followers']=[0]

        if data['rol']=="office":
            data['profile']="public"
        else:
            data['profile']="private"
        data['requests']=[0]
        data['photo']="https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/user.png?alt=media&token=e4f489a7-f79f-43bf-9e15-daee3eaf031e"
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


