import requests
import os
import json

from requests.exceptions import HTTPError

URL = os.environ['URL']
PORT = os.environ['PORT']
API = os.environ['API']

host = f"http://{URL}:{PORT}/{API}"

headers = { "Content-Type": "application/json" }

data = {"username":"xyz", "password":"xyz"}

def lambda_handler(event, context): 
    try:
        response = requests.post(url=host, data=json.dumps(data), headers=headers)
        return(response.json())
    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')
    except Exception as err:
        print(f'Other error occurred: {err}')
    else:
        print('Success!')