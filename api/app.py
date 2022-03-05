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
        result=user.User().GetData(data)
        return jsonify({'response':result})
    return jsonify({'response':'Error request was not allowed'})
@app.route('/login', methods=['POST'])
def LogIn():
    if request.method=="POST":
        data=request.get_json()
        result=user.User().LogIn(data)
        return jsonify({'response':result})
    return jsonify({'response':'Error request was not allowed'})
if __name__ =='__main__':
    app.run(debug=True)
