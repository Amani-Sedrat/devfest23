# image_recognition_model.py

import tensorflow as tf
import tensorflow_hub as hub
from PIL import Image
import numpy as np

class ImageRecognitionModel:
    def __init__(self):
        # Load the MobileNetV2 model from TensorFlow Hub
        self.model = hub.load("https://tfhub.dev/google/tf2-preview/mobilenet_v2/classification/4")

    def preprocess_image(self, image_path):
        # Load and preprocess the image
        image = Image.open(image_path)
        image = image.resize((224, 224))  # MobileNetV2 input size
        image = np.array(image) / 255.0  # Normalize pixel values
        image = image[np.newaxis, ...]  # Add batch dimension
        return image

    def predict(self, image_path):
        # Preprocess the image
        image = self.preprocess_image(image_path)

        # Make predictions using the model
        predictions = self.model(image)

        # Decode and return the top prediction
        decoded_predictions = tf.keras.applications.mobilenet_v2.decode_predictions(predictions.numpy())
        top_prediction = decoded_predictions[0][0]
        label, confidence = top_prediction[1], top_prediction[2]

        return f"Predicted Label: {label}, Confidence: {confidence:.2f}"

# Example usage:
# image_recognition_model = ImageRecognitionModel()
# result = image_recognition_model.predict("path/to/your/image.jpg")
# print(result)
