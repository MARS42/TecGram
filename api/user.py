import re
import CheckInputs 
import database
import attributes

class User:
    def GetData(self,json):
        result=attributes.attributes().ValidateAttributes(json,['email','password','data'])
        if result==True:
            return self.CheckInput(json['email'],json['password'],json['data'])
        return 'Error You have to declared email, password and data'

    def ValidateEmailPasswordUser(self,email,password):
        if self.CheckEmailAdress(email):
            if self.CheckPassword(password):
                return True
            else:
                return "Password is not valid"
        else:
            return "Email adress is invalid"
        
        
    def CheckEmailAdress(self,email):
        pattern=re.compile('.*@cuautla.tecnm.mx')
        return pattern.search(email)!=None
         
        
    def CheckPassword(self,password):
        return len(password)>=8
            
    def CheckInput(self,user,password,data):
        St=CheckInputs.CheckString()
        if St.check_string(user) and St.check_string(password):
            result=self.ValidateEmailPasswordUser(user,password)
            if result==True:
                r= self.CheckDataRequired(data)
                if r==True:
                    return database.database().signup(user,password,data)
                return r

            else:
                return result
        return "Error inputs are not allowed"
    


    
    def CheckDataRequired(self,data):
        mensaje="User added"
        if attributes.attributes().ValidateAttributes(data,['name','rol']):
            #check the rol and change the required data
            if data['rol']=='student':
                mensaje=student().CheckStudent(data)
            elif data['rol']=='teacher':
                mensaje=teacher().CheckTeacher(data)
                
            elif data['rol']=="office":
                return True
            else:
                mensaje="Rol is not in the list"
        else :
            mensaje="Name and rol must be declared"
        return mensaje

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
    

