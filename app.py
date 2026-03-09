from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
from datetime import datetime

app = Flask(__name__)
app.secret_key = "supersecret"

# MySQL Configuration
app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
# CHANGE THE LINE BELOW TO YOUR MYSQL PASSWORD
app.config["MYSQL_PASSWORD"] = "mymas123"
app.config["MYSQL_DB"] = "cloud_gpu"

mysql = MySQL(app)

@app.route("/")
def home():
    # Points to your login page
    return render_template("login.html")

@app.route("/login", methods=["POST"])
def login():
    email = request.form["email"]
    password = request.form["password"]

    cur = mysql.connection.cursor()
    # Checks the Users table Evana created
    cur.execute("SELECT * FROM Users WHERE email=%s AND password=%s", (email, password))
    user = cur.fetchone()
    cur.close()

    if user:
        session["user_id"] = user[0]
        session["role"] = user[4]
        return redirect(url_for("marketplace"))
    else:
        return "Invalid Credentials - Check your SQL data"

@app.route("/marketplace")
def marketplace():
    cur = mysql.connection.cursor()
    # Fetches the GPUs you injected via CLI
    cur.execute("SELECT * FROM Hardware WHERE status='Available'")
    gpus = cur.fetchall()
    cur.close()
    # Sends data to your professional grid
    return render_template("marketplace.html", gpus=gpus)

@app.route("/rent/<int:hardware_id>")
def rent(hardware_id):
    if "user_id" not in session:
        return redirect(url_for("home"))

    user_id = session["user_id"]
    cur = mysql.connection.cursor()

    # Records the rental in the database
    cur.execute("""
        INSERT INTO Rentals (user_id, hardware_id, start_time, total_cost)
        VALUES (%s, %s, %s, %s)
    """, (user_id, hardware_id, datetime.now(), 0.00))

    # Updates status so it disappears from marketplace
    cur.execute("UPDATE Hardware SET status='Busy' WHERE hardware_id=%s", (hardware_id,))

    mysql.connection.commit()
    cur.close()
    return redirect(url_for("marketplace"))

@app.route("/provider_dashboard")
def provider_dashboard():
    # Points to your hardware listing form
    return render_template("provider_dashboard.html")

@app.route("/add_hardware", methods=["POST"])
def add_hardware():
    if "user_id" not in session:
        return redirect(url_for("home"))
        
    provider_id = session["user_id"]
    gpu_model = request.form["gpu_model"]
    vram = request.form["vram"]
    price = request.form["price"]

    cur = mysql.connection.cursor()
    cur.execute("""
        INSERT INTO Hardware (provider_id, gpu_model, vram, base_price_per_hour, status)
        VALUES (%s, %s, %s, %s, 'Available')
    """, (provider_id, gpu_model, vram, price))

    mysql.connection.commit()
    cur.close()
    return redirect(url_for("marketplace"))

if __name__ == "__main__":

    app.run(debug=True)
