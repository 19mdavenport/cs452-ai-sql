from ChatGPTCommunicator import ChatGPTCommunicator
from DatabaseManager import DatabaseManager


def sanitize_sql(sql):
    start_sql = "```sql"
    end_sql = "```"
    if start_sql in sql:
        sql = sql.split(start_sql)[1]
    if end_sql in sql:
        sql = sql.split(end_sql)[0]
    return sql


class GPTSQL:
    def __init__(self, db_manager: DatabaseManager, communicator: ChatGPTCommunicator, db_schema_script):
        self.db_manager = db_manager
        self.communicator = communicator
        self.db_schema_script = db_schema_script

    def answer_question(self, question):
        ret = {"question": question}
        request = "Given the following sqlite database schema: \n" + self.db_schema_script + "\n\nplease create a sqlite select statment to answer the following question: \n" + question + "\nPlease respond with only the sqlite query."
        response = self.communicator.get_response(request)
        sql = sanitize_sql(response)
        ret["sql"] = sql
        try:
            sql_output = self.db_manager.execute_query(sql)
            ret["sql_output"] = sql_output
        except Exception as e:
            ret["error"] = str(e)
            request = "Given the following sqlite database schema: \n" + self.db_schema_script + "\nI asked the question: " + question + "and you gave me\n" + sql + "\nWhich produced this error: " + e.args[0] + "\n\nCould you adjust the query? " + question + "\nPlease respond with only the sqlite query."
            response = self.communicator.get_response(request)
            sql = sanitize_sql(response)
            ret["corrected_sql"] = sql
            sql_output = self.db_manager.execute_query(sql)
            ret["sql_output"] = sql_output
        request = "Given the following sqlite database schema: \n" + self.db_schema_script + "\nI asked the question: " + question + "and you gave me\n" + sql + "\nHere are the results: " + str(sql_output) + "\n\nCould you please interpret this for me? " + question + "\nPlease respond with only the answer to the question."
        response = self.communicator.get_response(request)
        ret["interpreted_answer"] = response
        return ret
