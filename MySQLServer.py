#!/usr/bin/env python3

import mysql.connector
from mysql.connector import errorcode

def main():
    db_config = {
        "host": "localhost",
        "user": "root",
        "password": "@Jarule5055",
        # No database specified initially to allow database creation
    }

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        try:
            cursor.execute("CREATE DATABASE IF NOT EXISTS `alx_book_store`")
            print("Database 'alx_book_store' created successfully!")
        except mysql.connector.Error as err:
            print(f"Error creating database: {err}")
            return

    except mysql.connector.Error as err:
        print("Failed to connect to MySQL server:")
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("  Access denied: check your username or password.")
        else:
            print(f"  {err}")
    finally:
        try:
            cursor.close()
        except Exception:
            pass
        try:
            conn.close()
        except Exception:
            pass

if __name__ == "__main__":
    main()
