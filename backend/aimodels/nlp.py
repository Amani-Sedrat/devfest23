
import spacy

class ContentModerationModel:
    def __init__(self):
        # Load the spaCy NLP model for content moderation with multilingual support
        self.nlp = spacy.load("xx_ent_wiki_sm")

        self.accepted_keywords = {
            # English keywords
            "accident", "disaster", "danger", "death", "maiming", "paralysis",
            "fatality", "catastrophe", "peril", "mortality", "maiming",
            "paralysis", "expiration", "wound", "demise", "trauma",
            "grief", "crippling", "permanence", "lethal", "agony",
            "ruination", "disintegration", "incurable", "ruin", "suffering",
            "ruinous", "decimation", "debilitation", "devastation", "disfigurement",
            "grave", "cataclysm", "extinction", "ruinous", "harrowing",
            "irreparable", "terminal", "annihilation", "expiry", "debilitating",
            "vanquishment", "inevitable", "havoc", "causality", "euthanasia",
            "debility", "ravaging", "obsequies", "extinguishment", "grievous",
            "irrevocable", "annihilation", "endurance", "cataclysmic",
            
            # Arabic keywords
            "حادث",
            "فاجعة", "كارثة", "خطر", "الوفاة", "تشويه", "شلل", "انتهاء", "جرح", "وفاة", "صدمة",
            "حزن", "شلل", "دائمية", "قاتل", "عذاب", "خراب", "تفكك", "غير قابل للعلاج", "خراب", "معاناة",
            "مدمر", "تدمير", "ضعف", "دمار", "تشويه", "قبر", "كارثة", "انقراض", "خراب", "مروع",
            "لا يمكن إصلاحه", "نهائي", "الإبادة", "انتهاء الصلاحية", "مستعر", "هزيمة", "حتمي", "خراب",
            "سببية", "الموت الرحيم", "ضعف", "تدمير", "جنازة", "اطفاء", "خطير", "لا رجعة فيه", "تحمل", "كارثي"
        }

    def preprocess_text(self, text):
        # Tokenize and preprocess the text using the spaCy model
        doc = self.nlp(text)
        
        # Debugging: Print original tokens and lemmatized forms
        tokens_and_lemmas = [(token.text, token.lemma_) for token in doc]
        print("Original Tokens and Lemmas:", tokens_and_lemmas)

        tokens = [token.lemma_ for token in doc if token.is_alpha and not token.is_stop]
        return "".join(tokens)

    def predict(self, text):
        # Preprocess the text
        preprocessed_text = self.preprocess_text(text)

        # Debugging: Print the preprocessed text
        print("Preprocessed Text:", preprocessed_text)

        # Check if the text is too short
        if len(preprocessed_text.split()) < 8:
            return "Rejected content: Text is too short"

        # Check for the presence of at least 7 accepted keywords
        count_keywords = sum(keyword in preprocessed_text for keyword in self.accepted_keywords)
        if count_keywords >= 7:
            return "Accepted content"
        else:
            return "Rejected content: Does not contain enough accepted keywords"
