from DatabaseManager import DatabaseManager

db_schema_file = "setup.sql"
db_insert_file = "data.sql"
db_file = "db.sqlite"

if __name__ == '__main__':
    db_schema_script = open(db_schema_file, "r").read()
    db_insert_script = open(db_insert_file, "r").read()
    db_manager = DatabaseManager(db_file, db_schema_script, db_insert_script)
    print(db_manager.execute_query("SELECT * FROM Person"))