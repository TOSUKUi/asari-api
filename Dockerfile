FROM python:3.10.13-slim-bullseye

RUN pip3 install --upgrade pip \
    && pip3 install pdm

WORKDIR /app

COPY ./ ./
RUN pdm install --prod

CMD ["pdm", "run", "python", "src/asari_api/main.py"]
