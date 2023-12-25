import mysql.connector
import json

# MySQL database configuration
db_config = {
    'host': 'your_mysql_host',
    'user': 'your_mysql_user',
    'password': 'your_mysql_password',
    'database': 'your_mysql_database',
}

VALID_USER_TYPES = ["victim", "donor"]

def signup(username, email, password):
    # Load existing user data from the database
    users = load_users_from_database()

    # Check if the username or email is already taken
    if username in users or email in [user["email"] for user in users.values()]:
        print("Username or email already exists. Please choose different credentials.")
        return

  

    # Store the new user information in the database
    store_user_in_database(username, email, password)
    print("Registration successful.")

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

def store_user_in_database(username, email, password):
    # Connect to the database
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()

    # Insert the new user information into the 'users' table
    cursor.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)",
                   (username, email, password))

    # Commit the changes and close the connection
    connection.commit()
    cursor.close()
    connection.close()

