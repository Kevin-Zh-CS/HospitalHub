from flask import Flask,request
from predict import predicter
import json
from flask_cors import CORS
import pandas as pd
from translate import translate
from treatment import csv2str
df = pd.read_csv('./treatment.csv')
doctor = csv2str(df)
app = Flask(__name__)
CORS(app)
fromLang = 'zh'
toLang = 'en'
cols = ['symptoms', 'causes', 'treatment']
translator = translate()
handler = predicter(translator)
with open('./stopwords.txt', encoding='utf8') as f:
    stopW = f.read().split('\n')  # filt(f1.read())

@app.route('/diagnosis',methods=['POST'])
def diagnosis():
    symptom = request.form['symptom_discription']
    res = handler.go(symptom,fromLang,toLang)
    doctor_advice = doctor.go(cols,res[0])
    doctor_advice = translator.go(sentence="$".join(doctor_advice),fromLang='en',toLang='zh').split('$')
    return json.dumps({'status':'success', 'result':res[1],'more_symptoms':doctor_advice[0],'possible_causes':doctor_advice[1],'treatment_advice':doctor_advice[2]},ensure_ascii=False)


if __name__ == '__main__':
    app.run(debug=False,host = '0.0.0.0')

