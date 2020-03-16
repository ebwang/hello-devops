import os, pika
from flask import Flask, request, jsonify

app = Flask(__name__)

hostA = os.getenv("RABBITMQ_HOST", "hello-rabbit")
portA = os.getenv("RABBITMQ_PORT", 5672)
queueA = os.getenv("RABBITMQ_QUEUE", "hello")

html = """ 
<br>Type your favourite <i>pudim</i> flavour: 
<br>
<form method='POST' action='/'>
    <input type='text' name='flavour'>
    <input type='submit'>
</form>
"""


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        v = request.form.get("flavour")
        app.logger.info(str(v))
        enqueue(str(v))
    return html


@app.route('/health', methods=['GET'])
def health():
    return jsonify({"status": "ok"})


def enqueue(value):
    app.logger.info("Received message: %s", value)
    params = pika.ConnectionParameters(host=hostA, port=portA)
    connection = pika.BlockingConnection(params)
    channel = connection.channel()
    channel.queue_declare(queue=queueA)
    channel.basic_publish(exchange='', routing_key=queueA, body=value)
    connection.close()
    app.logger.info("Enqueued message on host %s:%s queue %s: %s", hostA, portA,
                    queueA, value)


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8000)
