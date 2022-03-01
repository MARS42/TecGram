import re
import CheckInputs 
import fire_base
class User:
    def ValidateUser(self,email,password):
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
            
    def CheckInput(self,user,password):
        St=CheckInputs.CheckString()
        if St.check_string(user) and St.check_string(password):
            result=self.ValidateUser(user,password)
            if result==True:
                return fire_base.fire_base().signup(user,password)
            else:
                return result
        return "Error inputs are not allowed"
            


print(User().CheckInput('18680060@cuautla.tecnm.mx','18680060'))
