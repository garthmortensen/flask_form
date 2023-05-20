from flask import Flask, jsonify
import sqlite3

app = Flask(__name__)
DATABASE = 'mydatabase.db'

def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/calendar_years')
def get_calendar_years():
    conn = get_db_connection()
    cursor = conn.execute('SELECT * FROM calendar_year')
    calendar_years = cursor.fetchall()
    conn.close()
    return jsonify([dict(year_id=row['year_id'], year=row['year'], description=row['description']) for row in calendar_years])

@app.route('/ingredients')
def get_ingredients():
    conn = get_db_connection()
    cursor = conn.execute('SELECT * FROM ingredient')
    ingredients = cursor.fetchall()
    conn.close()
    return jsonify([dict(ingredient_id=row['ingredient_id'], ingredient=row['ingredient'], description=row['description'], seller=row['seller'], season=row['season'], year_id=row['year_id']) for row in ingredients])

@app.route('/menu_items')
def get_menu_items():
    conn = get_db_connection()
    cursor = conn.execute('SELECT * FROM menu_item')
    menu_items = cursor.fetchall()
    conn.close()
    return jsonify([dict(menu_item_id=row['menu_item_id'], buyer=row['buyer'], description=row['description'], step=row['step'], season=row['season'], year_id=row['year_id']) for row in menu_items])

if __name__ == '__main__':
    app.run()
