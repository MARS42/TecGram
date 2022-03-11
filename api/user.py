import re
import CheckInputs 
import database
import attributes

class User:
    mensaje=""
    def refreshToken(self,json):
        if attributes.attributes().TestAttribute(json,'refreshToken'):
            return database.database().freshToken(json['refreshToken'])
        return "You missed the refreshToken"
        
    def UserLike(self,name,lastname,username):
        #to lower to comparate
        name=name.lower()
        lastname=lastname.lower()
        username=username.lower()
        full_name=name+" "+lastname
        pattern=re.compile(username)
        return pattern.search(name) or pattern.search(lastname) or pattern.search(full_name)


    def SearchUserByName(self,json):
        if attributes.attributes().ValidateAttributes(json,['idToken','username']):
            return database.database().SearchByName(json['username'],json['idToken'])
            

    def LogIn(self,json):
        if attributes.attributes().ValidateAttributes(json,['email','password']):
            if self.CheckEmailPassword(json['email'],json['password'])==True:
                return database.database().SignIn(json['email'],json['password'])

        return self.mensaje

    def GetData(self,json):
        result=attributes.attributes().ValidateAttributes(json,['email','password','data'])
        if result==True:
            return self.CheckInput(json['email'],json['password'],json['data'])
            
        else:
            self.mensaje='Error You have to declared email, password and data'
        return self.mensaje

    def ValidateEmailPasswordUser(self,email,password):
        if self.CheckEmailAdress(email):
            if self.CheckPassword(password):
                return True
            else:
                self.mansaje="Password is not valid"
        else:
            self.mensaje= "Email adress is invalid"

        return False
        
        
    def CheckEmailAdress(self,email):
        pattern=re.compile('.*@cuautla.tecnm.mx')
        return pattern.search(email)!=None
         
        
    def CheckPassword(self,password):
        return len(password)>=8
    
    def CheckEmailPassword(self,user,password):
        St=CheckInputs.CheckString()
        if St.check_string(user) and St.check_string(password):
            if self.ValidateEmailPasswordUser(user,password)==True:
                return True
        self.mensaje="Error email and password can not be empity"
        return False

    def CheckInput(self,user,password,data):
        if self.CheckEmailPassword(user,password)==True:
            if self.CheckDataRequired(data)==True:
                database.database().signup(user,password,data)
                return 'User added'

        return self.mensaje
        
    def CheckDataRequired(self,data):
        
        if attributes.attributes().ValidateAttributes(data,['name','rol']):
            #check the rol and change the required data
            if data['rol']=='student':
                self.mensaje=student().CheckStudent(data)
                return True
            elif data['rol']=='teacher':
                self.mensaje=teacher().CheckTeacher(data)
                return True
                
            elif data['rol']=="office":
                return True
            else:
                self.mensaje="Rol is not in the list"
        else :
            self.mensaje="Name and rol must be declared"
        return False

class person:
    mensaje=""
    def CheckDataRequired(self,data):
        if attributes.attributes().TestAttribute(data,'lastname'):
            return self.CheckNameLastName(data)==True
        self.mensaje= "Last name can not be empity"
        return False
    
    def CheckNameLastName(self,data):
        if data['name'] !=None and len(data['name'])>0:
            if data['lastname'] !=None and len(data['lastname'])>0:
                return True
        return False


class teacher(person):
    def CheckTeacher(self,data):
        if self.CheckDataRequired(data):
            if self.CheckDeparment(data):
                return True
        return self.mensaje

    def CheckDeparment(self,data):
        if attributes.attributes().ValidateAttributes(data,['deparment']):
            if data['deparment'] in ['Sistemas','Gestion','Contador','Mecatronica','Industrial','Electronica','Basicas']:
               return True 
            else:
                 self.mensaje="Teacher's deparment is not in the list"
        return False

class student(person):
    def CheckStudent(self,data):
        result=self.CheckDataRequired(data)
        if result==True:
            if self.CheckOptionalData(data)==True:
                return True 
        return self.mensaje
        

    def CheckOptionalData(self,data):
        return self.CheckCareer(data) and self.CheckSemester(data)

    def CheckSemester(self,data):
        if attributes.attributes().TestAttribute(data,'semester'):
            try:
                int(data['semester'])
            except:
                self.mensaje="Semester must be a number"
                return False
        return True
    
    def CheckCareer(self,data):

        if attributes.attributes().TestAttribute(data,'career'):
            if data['career']  in ['ISC','IGE','II','IE','IM','CP','MA']:
                return True
            else:
                self.mensaje="Career is not in the list"
        return False
    

