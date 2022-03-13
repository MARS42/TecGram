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

@app.route('/searchuser')
def searchuser():
    if request.method=="GET":
        data=request.get_json()
        return jsonify({'response':user.User().SearchUserByName(data)})      
    return jsonify({'response':'Error request was not allowed'})

@app.route('/refreshtoken', methods=['POST'])
def freshtoken():
    if request.method=="POST":
        data=request.get_json()
        return  jsonify({'response':user.User().refreshToken(data)})

@app.route('/sendresquest',methods=["POST"])
def sendresquest():
    if request.method=="POST":
        data=request.get_json()
        return jsonify({'response':user.User().SendRequest(data)})

@app.route('/acceptrequest',methods=["POST"])
def AcceptRequest():
    if request.method=="POST":
        json=request.get_json()
        response=user.User().AcceptRequest(json)
        return jsonify({'response':response})
@app.route('/getrequest')
def getrequest():
    json=request.get_json()
    response=user.User().GetRequest(json)
    return jsonify({'response':response})
if __name__ =='__main__':
    app.run(debug=True,host="0.0.0.0", port=5000)
