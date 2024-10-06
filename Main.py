from ChatGPTCommunicator import ChatGPTCommunicator
from DatabaseManager import DatabaseManager
from GPTSQL import GPTSQL
import json

db_schema_file = "setup.sql"
db_insert_file = "data.sql"
db_file = "db.sqlite"
api_key_file = "openai_key.json"
output_file = "output.json"


if __name__ == '__main__':
    db_schema_script = open(db_schema_file, "r").read()
    db_insert_script = open(db_insert_file, "r").read()
    db_manager = DatabaseManager(db_file, db_schema_script, db_insert_script)

    key_json = json.load(open(api_key_file))
    communicator = ChatGPTCommunicator(key_json['apiKey'], key_json['orgId'])

    gpt_sql = GPTSQL(db_manager, communicator, db_schema_script)
    questions = [
        "How many people participated in events?",
        "What is the most common event type, and how many events of that occurred? In the event of a tie please list all applicable event types.",
        "Are there any locations without events that happened at those locations? If so, what are their names?",
        "Are there any events with no particpants?",
        "Are there any people with no relatives? If so, what are their names?",
        "Who participated in the most events, and how many events did they participate in?",
        "What are the names of the people who participated in the event that occurred farthest north?",
        "Which 3 events occurred farthest south, and who particpated in them?",
        "Who particpated in events occuring in Australia or Denmark, and when did they participate in these events? Please separate the events occurring in each country.",
        "Which person has the most ancestors in the database, and how many ancesters did they have? Please include as many direct ancestors as possible, including grandparents, great-grandparents, and so on."
    ]

    answers = []
    for question in questions:
        answer = gpt_sql.answer_question(question)
        answers.append(answer)
    output_fd = open(output_file, "w")
    json.dump(answers, output_fd, indent=2)