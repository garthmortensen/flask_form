from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

@app.route('/')
def index():
    """render default page

    :return: main page
    :rtype: object
    """
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    """insert values into database.

    :return: status message
    :rtype: string
    """
    name = request.form['name']
    email = request.form['email']

    conn = sqlite3.connect('mydatabase.db')
    cursor = conn.cursor()
    cursor.execute("CREATE TABLE IF NOT EXISTS users (name TEXT, email TEXT)")
    cursor.execute("INSERT INTO users (name, email) VALUES (?, ?)", (name, email))
    conn.commit()
    conn.close()

    return "Data submitted successfully!"

if __name__ == '__main__':
    app.run()
