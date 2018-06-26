from textblob import TextBlob
from flask import Flask, request, jsonify
import subprocess
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route("/generate", methods=['POST'])
def generatePaySlip():
    firstName = request.get_json()['firstName']
    lastName = request.get_json()['lastName']
    paymentPeriod = request.get_json()['paymentPeriod']
    annualSalary = request.get_json()['annualSalary']
    superRate = request.get_json()['superRate']

    #completed = subprocess.call()
    output = subprocess.Popen(['generate_pay_slip', firstName, lastName, annualSalary, superRate, paymentPeriod], stdout=subprocess.PIPE).communicate()[0]

    return jsonify(
        paySlip=output
    )

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
