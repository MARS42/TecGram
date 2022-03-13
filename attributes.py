class attributes:
    def ValidateAttributes(self,dictionary,attributes):
        for x in attributes:
            if self.TestAttribute(dictionary,x)==False:
                return False
        return True


    def TestAttribute(self,data,attribute):
        try:
            data[attribute]
        except:
            return False
        return True





