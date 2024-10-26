from fastapi import FastAPI
from pydantic import BaseModel
from model.todo import Todo
import sqlite3

app = FastAPI()


def database_connection():
    conn = sqlite3.connect("database/todo.db")
    return conn


def create_table():
    conn = database_connection()
    cursor = conn.cursor()
    cursor.execute(
        "CREATE TABLE IF NOT EXISTS todos (id INTEGER PRIMARY KEY, title TEXT, description TEXT, completed BOOLEAN)")
    conn.commit()
    conn.close()


def insert_todo(todo):
    conn = database_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO todos (title, description, completed) VALUES (?, ?, ?)",
                   (todo.title, todo.description, todo.completed))
    conn.commit()
    conn.close()

def get_todos():
    conn = database_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM todos")
    todos = cursor.fetchall()
    conn.close()
    return todos


create_table()

print(get_todos())

@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.post("/todos/")
async def create_todo(todo: Todo):
    insert_todo(todo)

    return {"result": todo}


@app.get("/todos/")
async def read_todos():
    data = get_todos()
    todos = []
    for todo in data:
        todos.append({"id": todo[0], "title": todo[1], "description": todo[2], "completed": todo[3]})
    return {"result": todos}

@app.delete("/todos/")
async def delete_todo(todo_id: int):
    conn = database_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM todos WHERE id=?", (todo_id,))
    conn.commit()
    conn.close()
    return {"result": "todo deleted"}