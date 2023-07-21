from flask import Flask, request, jsonify

app = Flask(__name__)

# Dummy database to store registered users
users = []

# Signup API
@app.route('/signup', methods=['POST'])
def signup():
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')
    password = data.get('password')

    if not name or not email or not password:
        return jsonify({"message": "All fields are required"}), 400

    # Check if the user already exists
    for user in users:
        if user['email'] == email:
            return jsonify({"message": "Email already exists"}), 409

    new_user = {
        "name": name,
        "email": email,
        "password": password
    }

    users.append(new_user)
    return jsonify({"message": "User registered successfully"}), 200

# Login API
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    if not email or not password:
        return jsonify({"message": "Email and password are required"}), 400

    # Check if the user exists and credentials match
    for user in users:
        if user['email'] == email and user['password'] == password:
            return jsonify({"message": "Login successful"}), 200

    return jsonify({"message": "Invalid email or password"}), 401

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
