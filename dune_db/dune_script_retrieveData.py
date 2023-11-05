import dotenv
import os
import json
import requests
import pandas as pd
import time

api_key = ""

# authentiction with api key
headers = {"x-dune-api-key": api_key}
lead_wallet_address = ''

query_id = 3172982
base_url = f"https://api.dune.com/api/v1/query/{query_id}/results"
params = {
    "params.lead_wallet_address": lead_wallet_address, # one and only param for this query
}
result_response = requests.request("GET", base_url, headers=headers, params=params)

result_response.text