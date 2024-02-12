import uvicorn
from typing import List
from pydantic import BaseModel
from fastapi import FastAPI
from mylib import asari_async

app = FastAPI()

class Docs(BaseModel):
    docs: List[str]

@app.get("/ping")
async def ping(doc: str):
    return await asari_async.async_sonar_ping(doc)

@app.get("/ping_array")
@app.post("/ping_array")
async def ping_array(docs: Docs):
    return [await asari_async.async_sonar_ping(doc) for doc in docs.docs]

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
