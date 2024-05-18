FROM python:3.10.13-slim-bullseye

RUN apt update && apt install -y locales locales-all && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip \
    && pip3 install --no-cache-dir pdm

WORKDIR /app

COPY ./pdm.lock ./
COPY ./pyproject.toml ./
COPY ./src ./src
RUN pdm install --prod && pdm cache clear

CMD ["pdm", "run", "python", "src/asari_api/main.py"]
