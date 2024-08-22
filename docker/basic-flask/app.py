from flask import Flask,render_template
import os
import socket

app = Flask(__name__)

@app.route("/")
def index():
  
#  for data in os.environ:
#    print(f"{data}={os.environ[data]}")

  for name, value in sorted(os.environ.items()):
     print("   " + name + "=" + value)

  try:
    host_name = socket.gethostname()
    host_ip = socket.gethostbyname(host_name)
    return render_template('index.html', hostname=host_name, ip=host_ip)
  except:
    return render_template('error.html')


if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)



import numpy as np

my_dict = {'yash': 2, 'rajnish': 9,
        'sanjeev': 15, 'chanda': 10, 'suraj': 32}


print("-----sorting by key-----")
