from fastapi import FastAPI

import pandas as pd

app = FastAPI()

encoder = pd.read_pickle('encoder.pkl')
model = pd.read_pickle('knn_model.pkl')
scaler = pd.read_pickle('scaler.pkl')
@app.get("/predict")
async def predict(
    idade : float,
    renda : float,
    situacao_moradia: object,
    tempo_trabalhado: float,
    motivo_emprestimo: object,
    score: int,
    valor_emprestimo: float,
    taxa_juros: float,
    tempo_historico_credito: float,
    devedor: float
):
    # Create a dictionary with the input data
    input_data = {
        "idade": [idade],
        "renda": [renda],
        "situacao_moradia": [situacao_moradia],
        "tempo_trabalhado": [tempo_trabalhado],
        "motivo_emprestimo": [motivo_emprestimo],
        "score": [score],
        "valor_emprestimo": [valor_emprestimo],
        "taxa_juros": [taxa_juros],
        "tempo_historico_credito": [tempo_historico_credito],
        "devedor": [devedor]
    }
    
    # Convert the dictionary to a pandas dataframe
    input_df = pd.DataFrame.from_dict(input_data)
    
    # One-hot encode the categorical features
    input_encoded = encoder.transform(input_df)
    
    # Scale the features
    input_scaled = scaler.transform(input_encoded)
    
    # Make the prediction
    prediction = model.predict(input_scaled)[0]
    
    # Return the prediction as a dictionary
    return {'result': model.predict(input_scaled).tolist()[0],
            'Inadimplente': model.predict_proba(input_scaled).tolist()[0][0],
            'Não inadimplente': model.predict_proba(input_scaled).tolist()[0][1]}
