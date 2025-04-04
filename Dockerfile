FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 755 /usr/src/app

RUN python3 -m venv mltbenv

COPY requirements.txt .
RUN mltbenv/bin/pip install --no-cache-dir -r requirements.txt

COPY . .

CMD mltbenv/bin/gunicorn app:app & mltbenv/bin/python3 update.py && mltbenv/bin/python3 -m bot
