FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python generate_html.py > index.html

# Using alpine (non -slim) because I want curl for the healthcheck
FROM nginx:alpine
COPY --from=0 /usr/src/app/index.html /usr/share/nginx/html/index.html

HEALTHCHECK CMD curl http://localhost
