from ChatGPTCommunicator import ChatGPTCommunicator
from DatabaseManager import DatabaseManager
import json

db_schema_file = "setup.sql"
db_insert_file = "data.sql"
db_file = "db.sqlite"
api_key_file = "openai_key.json"

def create_db_manager():
    db_schema_script = open(db_schema_file, "r").read()
    db_insert_script = open(db_insert_file, "r").read()
    return DatabaseManager(db_file, db_schema_script, db_insert_script)


def create_gpt_communicator():
    key_json = json.load(open(api_key_file))
    return ChatGPTCommunicator(key_json['apiKey'], key_json['orgId'])


if __name__ == '__main__':
    db_manager = create_db_manager()

    communicator = create_gpt_communicator()
    print(communicator.get_response("Did I successfully set up my code to contact your API?"))