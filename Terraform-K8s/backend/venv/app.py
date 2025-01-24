from flask import Flask, jsonify
import pika
import psycopg2
import os

app = Flask(__name__)

# Database connection
def get_db_connection():
    conn = psycopg2.connect(
        host=os.getenv('DB_HOST', 'postgres-service'),
        database=os.getenv('DB_NAME', 'game_db'),
        user=os.getenv('DB_USER', 'postgres'),
        password=os.getenv('DB_PASSWORD', 'password')
    )
    return conn

# Event producer
def send_event(event):
    connection = pika.BlockingConnection(pika.ConnectionParameters('rabbitmq-service'))
    channel = connection.channel()
    channel.queue_declare(queue='game_events')
    channel.basic_publish(exchange='', routing_key='game_events', body=event)
    connection.close()

@app.route('/api/game', methods=['GET'])
def get_game_data():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM game_data;')
    data = cur.fetchone()
    cur.close()
    conn.close()
    return jsonify(data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)