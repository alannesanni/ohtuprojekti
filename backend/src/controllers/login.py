from flask import Blueprint, request, jsonify
from models.user import User
from werkzeug.security import check_password_hash
import jwt
import os

login_blueprint = Blueprint('login_blueprint', __name__)

@login_blueprint.route('/api/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data['username']
    password = data['password']

    user = User.query.filter_by(username=username).first()

    if user and check_password_hash(user.password, password):
        user_info = {"username": user.username, "id": user.id}
        token = jwt.encode(user_info, os.environ.get('SECRET'), algorithm='HS256')
        return jsonify({"token": token, "username": user.username}), 200
    else:
        return jsonify({"error": "invalid username or password"}), 401