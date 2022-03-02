from flask import render_template,request,jsonify
from flask import Flask
import user
app=Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/signin',methods=['POST'])
def SignIn():
    if request.method=="POST":
        data=request.get_json()
        result=user.User().CheckInput(data['user'],data['password'])
        return jsonify({'response':result})
    return jsonify({'response':'Error request was not allowed'})
if __name__ =='__main__':
    app.run(debug=True)
