FROM public.ecr.aws/docker/library/python:3.12-slim

ARG CONTAINER_PORT=8000
ENV CONTAINER_PORT=${CONTAINER_PORT}

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE ${CONTAINER_PORT}

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
