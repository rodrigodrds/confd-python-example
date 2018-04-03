import os
import json
from flask import Flask
from flask import jsonify
from flask import Response
from dotenv import load_dotenv

app = Flask(__name__)

load_dotenv("/code/.env")


@app.route("/")
def hello():
    data = os.getenv("DATABASES", None)
    print(data["database_test"])

    js = json.loads(data["database_test"])
    js = json.dumps(js)

    resp = Response(js, status=200, mimetype='application/json')

    return resp


@app.route("/version")
def version():
    return "helloworld 1.0.0\n"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
