FROM python:3.10-alpine

WORKDIR /app

COPY requirements.txt /tmp/requirements.txt

RUN apk add --no-cache gcc musl-dev libffi-dev \
    && pip install --no-cache-dir -r /tmp/requirements.txt \
    && apk del gcc musl-dev libffi-dev

COPY ./app /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
