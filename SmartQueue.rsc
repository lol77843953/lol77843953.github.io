# ---------------------------------------------------
# Script: Smart Bandwidth Distribution (PCQ)
# Author: lol77843953
# Description: Fairly distributes speed among active users
# ---------------------------------------------------

/queue type
add kind=pcq name=PCQ_Download pcq-classifier=dst-address pcq-rate=2M
add kind=pcq name=PCQ_Upload pcq-classifier=src-address pcq-rate=1M

/queue simple
add name="Total_Bandwidth_Control" target=192.168.88.0/24 \
    queue=PCQ_Upload/PCQ_Download comment="Distributed by lol77843953"
