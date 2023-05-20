from flask import Flask, render_template
import sqlite3

app = Flask(__name__)

@app.route('/')
def display_data():
    # Connect to the SQLite database
    conn = sqlite3.connect('mydatabase.db')
    cursor = conn.cursor()

    # Retrieve data from the tables
    cursor.execute('SELECT * FROM calendar_year')
    calendar_year_data = cursor.fetchall()

    cursor.execute('SELECT * FROM ingredient')
    ingredient_data = cursor.fetchall()

    cursor.execute('SELECT * FROM menu_item')
    menu_item_data = cursor.fetchall()

    # Close the database connection
    conn.close()

    # Render the HTML template with the retrieved data
    return render_template('data.html', calendar_year_data=calendar_year_data,
                           ingredient_data=ingredient_data, menu_item_data=menu_item_data)

if __name__ == '__main__':
    app.run()
