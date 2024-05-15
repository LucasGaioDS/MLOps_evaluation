from fastapi import FastAPI
from models.model import load_model  # Ajustez le chemin d'importation selon l'organisation de votre projet

app = FastAPI()

model = load_model()

@app.get("/predict/")
async def predict(features: str):
    prediction = model.predict([features])
    return {"prediction": prediction}
