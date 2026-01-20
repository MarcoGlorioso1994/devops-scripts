# This script checks the health of a specified API endpoint defined in a YAML configuration file. 
# It logs the status code and response time in a structured JSON-like format.

import requests
import yaml
import logging
import time
from datetime import datetime

# Logging configuration (JSON-like)
logging.basicConfig(
    level=logging.INFO,
    format='{"timestamp":"%(asctime)s","level":"%(levelname)s","message":"%(message)s"}'
)

CONFIG_PATH = "../configs/app.yaml"

def load_config(path):
    with open(path, "r") as file:
        return yaml.safe_load(file)

def check_api(api_config):
    url = api_config["url"]
    timeout = api_config.get("timeout", 5)

    start = time.time()
    response = requests.get(url, timeout=timeout)
    elapsed = round(time.time() - start, 2)

    logging.info(
        f'API={api_config["name"]} STATUS={response.status_code} TIME={elapsed}s'
    )

    response.raise_for_status()

def main():
    config = load_config(CONFIG_PATH)
    check_api(config["api"])

if __name__ == "__main__":
    main()