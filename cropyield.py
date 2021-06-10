import requests
import os
from datetime import datetime
import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
from sklearn import utils
from sklearn import metrics
from flask import Flask,jsonify,request
import json

response = " "
production1 = " "

app = Flask(__name__)
@app.route("/",methods = ['GET','POST'])


def nameroute():
    global response,production1
    if(request.method == 'POST'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        location = request_data['city']
    
        user_api = "765fb6f4e326058496208ad4b995e5a0"
        

        complete_api_link = "https://api.openweathermap.org/data/2.5/weather?q="+location+"&appid="+user_api
        api_link = requests.get(complete_api_link)
        api_data = api_link.json()

        #create variables to store and display data
        Temp = ((api_data['main']['temp']) - 273.15)
        weather_desc = api_data['weather'][0]['description']
        Humid= api_data['main']['humidity']
        Windsp = api_data['wind']['speed']
        Rainfll=api_data['clouds']['all']
        date_time = datetime.now().strftime("%d %b %Y | %I:%M:%S %p")

        print ("-------------------------------------------------------------")
        print ("Weather Stats for - {}  || {}".format(location.upper(), date_time))
        print ("-------------------------------------------------------------")

        print ("Current temperature is: {:.2f} deg C".format(Temp))
        print ("Current weather desc  :",weather_desc)
        print ("Current Humidity      :",Humid, '%')
        print ("Current wind speed    :",Windsp ,'kmph')
        print ("Current rainfall      :",Rainfll)

        df = pd.read_csv("cropsets.csv")
        df.head()

        features = df[['Rainfall','Temperature', 'Humidity', 'Windspeed']]
        target = df['Crop']
        labels = df['Crop']

        X_train,X_test,y_train,y_test=train_test_split(features,target,test_size=0.2,random_state=2)

        RF = RandomForestClassifier(n_estimators=100, random_state=1)
        RF.fit(X_train,y_train)

        y_pred = RF.predict(X_test)

        predicted_values = RF.predict(X_test)
        x = metrics.accuracy_score(y_test, predicted_values)

        df = np.array([[Temp,Humid,Rainfll,Windsp]])
        prediction = RF.predict(df)
        print(prediction)
        area=float(request_data['area'])
        print((area))
        if area>0:
            crop=''.join(prediction)
            production1=str(crop)

            new=pd.read_csv("cropandprodctn.csv",index_col='Crop')
            pg=new.loc[prediction]
            print(pg)
            n=pg.Production
            production=float(n)

        # print(production)

            yields=production/area
            yields=str(yields)
            print(yields)
            response=yields
            return " "
        else:
            return "Invalid"
    else:
        return jsonify({'response': response,'production':production1,})


if __name__== "__main__":
    app.run(host = '0.0.0.0',)
