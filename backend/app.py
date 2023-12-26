# devfest_backend/app.py

from flask import Flask, request, jsonify
from aimodels.nlp import ContentModerationModel
from aimodels.imagerecognition import generate_caption
from aimodels.imagerecognition import generate_story

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



@app.route('/generate_story', methods=['POST'])
def generate_story_route():
    if 'image' not in request.files:
        return jsonify({'error': 'No image provided'}), 400

    image = request.files['image']
    caption = generate_caption(image)
    full_story = generate_story(caption)

    return jsonify({'caption': caption, 'full_story': full_story})



@app.route('/create_post', methods=['POST'])
def create_post():
    # Extract text and optional image from the request
    text = request.form.get('text', '')
    image = request.files.get('image')

    # Your logic to process the post (e.g., save to a database)
    # This is a placeholder logic; replace it with your actual logic
    post_id = save_post_to_database(text, image)

    # Optionally, generate a caption and story for the post
    if image:
        caption = generate_caption(image)
        full_story = generate_story(caption)
    else:
        caption = "No image provided"
        full_story = generate_story("No image provided")

    return jsonify({'post_id': post_id, 'text': text, 'image_caption': caption, 'full_story': full_story})



# Run the Flask application
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
