class CheckString:
    def IsString(self,var):
        if type(var)==str:
            return True
        return False

    def IsNone(self,var):
        if var!=None:
            return True
        return False

    def check_string(self,var):
        if self.IsString(var) and self.IsNone(var):
            return True
        return False

