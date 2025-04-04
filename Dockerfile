
FROM mysterysd/wzmlx:latest
 
 WORKDIR /usr/src/app
 RUN chmod 777 /usr/src/app
 
 COPY requirements.txt .
 RUN pip3 install --upgrade setuptools wheel
 RUN pip3 install --no-cache-dir -r requirements.txt
 
 COPY . .
 
 CMD gunicorn app:app & python3 update.py && python3 -m bot
