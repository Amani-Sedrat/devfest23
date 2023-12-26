from transformers import BertTokenizer, BertModel

tokenizer = BertTokenizer.from_pretrained('savasy/tti21_sat')
model = BertModel.from_pretrained('savasy/tti21_sat')


from PIL import Image
import torchvision.transforms as transforms

def generate_caption(image_path):
    # Load and preprocess the image
    image = Image.open(image_path)
    preprocess = transforms.Compose([
        transforms.Resize(256),
        transforms.CenterCrop(224),
        transforms.ToTensor(),
    ])
    input_tensor = preprocess(image)
    input_batch = input_tensor.unsqueeze(0)

    # Run the image through the SAT model
    with torch.no_grad():
        outputs = model(input_batch)

    # Get the caption from the output
    caption = tokenizer.decode(outputs['input_ids'][0], skip_special_tokens=True)
    return caption


def generate_story(caption):
    # Your creative story generation logic here
    story = f" {caption.lower()}. "

    return story
