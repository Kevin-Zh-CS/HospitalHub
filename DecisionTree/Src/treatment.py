import pandas as pd
class csv2str:
    def __init__(self,df) -> None:
        self.df = df
    
    def go(self,col_name,disease):
        df = self.df
        row = df[df['name'] == disease.lower()]
        res = []
        for each in col_name:
            temp = row[each].values[0].strip('[]').split(',')
            temp = [ i.strip("\t\b\r\n '\"") for i in temp]
            res.append(" ".join(temp))
        return res