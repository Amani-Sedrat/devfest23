# devfest_backend/app.py

from flask import Flask, request, jsonify
from aimodels.nlp import ContentModerationModel

app = Flask(__name__)

# Instantiate the ContentModerationModel
content_moderation_model = ContentModerationModel()

# Define a route for content moderation
@app.route('/moderate-content', methods=['POST'])
def moderate_content():
    data = request.json
    text = data.get('text', '')

    # Use the content moderation model to predict
    prediction = content_moderation_model.predict(text)

    # Return the prediction as JSON
    return jsonify({'prediction': prediction})

# Run the Flask application
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
