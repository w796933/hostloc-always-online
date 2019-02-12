FROM python:2.7

MAINTAINER IV8<admin@256.cloud>

ENV UID=uid\
 UPWD=upwd\
 SMIN=300\
 SMAX=600

RUN apt-get -y -qq update &&\
 pip install --upgrade pip &&  pip install requests BeautifulSoup beautifulsoup4 &&\
 mkdir /root/hostloc

COPY run.py /root/hostloc/run.py

WORKDIR /root/hostloc

CMD sed -i "s|useruid|$UID|" /root/hostloc/run.py &&\
 sed -i "s|userpwd|$UPWD|" /root/hostloc/run.py &&\
 sed -i "s|time1|$SMIN|" /root/hostloc/run.py &&\
 sed -i "s|time2|$SMAX|" /root/hostloc/run.py &&\
 python -u /root/hostloc/run.py
