import mysql.connector
import json

# MySQL database configuration
db_config = {
    'host': 'your_mysql_host',
    'user': 'your_mysql_user',
    'password': 'your_mysql_password',
    'database': 'your_mysql_database',
}

def login(username, password):
    # Load user data from the database
    users = load_users_from_database()

    # Check if the username exists
    if username in users:
        # Verify the password
        stored_password = users[username]["password"]
        if password == stored_password:
            print("Login successful.")
        else:
            print("Incorrect password. Please try again.")
    else:
        print("Username not found. Please check your username.")

def load_users_from_database():
    # Connect to the database
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor(dictionary=True)

    # Retrieve user data from the 'users' table
    cursor.execute("SELECT * FROM users")
    users = {user["username"]: user for user in cursor.fetchall()}

    # Close the connection
    cursor.close()
    connection.close()

    return users


