import os
import sqlite3

class DatabaseManager:
    def __init__(self, db_file_name, db_schema_script, db_insert_script):
        self.db_file_name = db_file_name
        if os.path.exists(db_file_name):
            os.remove(db_file_name)

        def load_schema(_, cursor):
            cursor.executescript(db_schema_script)
            cursor.executescript(db_insert_script)

        self.__sql_execute(load_schema)


    def execute_query(self, sql):
        def execute(_, cursor):
            return cursor.execute(sql).fetchall()
        return self.__sql_execute(execute)


    def __sql_execute(self, func):
        conn = sqlite3.connect(self.db_file_name)
        cursor = conn.cursor()
        output = func(conn, cursor)
        cursor.close()
        conn.close()
        return output

