import requests
import os
import json

from requests.exceptions import HTTPError


URL = os.environ['URL']
PORT = os.environ['PORT']
API = os.environ['API']


host = f"http://{URL}:{PORT}/{API}"


headers = { "Content-Type": "application/json" }

params = dict(
    username='xyz',
    password='xyz'
)

def lambda_handler(event, context): 
    try:
        response = requests.get(url=host, params=params, headers=headers)
        return(response.json())
        response.raise_for_status()
    except HTTPError as http_err:
        return(f'HTTP error occurred: {http_err}')
    except Exception as err:
        return(f'Other error occurred: {err}')
    else:
        return('Success!')
