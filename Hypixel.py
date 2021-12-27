#Auto terminate your minecraft client when you are online but not on your private island (python)
import requests as rq
import json
import time
from datetime import datetime
import os

UserName = ""
HypixelApiKey = ""
CheckTime = 2

urlMojang = "https://api.mojang.com/users/profiles/minecraft/"
urlHypixel = "https://api.hypixel.net/status?uuid="

def GetCurrentTimenDate():
    return datetime.today().strftime("%d/%m/%Y")+" "+datetime.now().strftime("%H:%M:%S")

def GetUUID(username):
    r=rq.get(urlMojang+username)
    listA=json.loads(r.text)
    return listA["id"]
def CloseMinecraft():
    os.system("taskkill /f /im  javaw.exe")
def GetStatus(UUID):
    r=rq.get(urlHypixel+UUID+"&key="+HypixelApiKey)
    listA=json.loads(r.text)
    if any("success"in s for s in listA) and listA["success"]==True:
        if listA["session"]["online"]==True:
            if listA["session"]["gameType"] == "SKYBLOCK" and listA["session"]["mode"] == "dynamic":
                return False,"In Private Island"
            else: 
                return True,"Not In Private Island"
        else:
            return False,"Not Online"
    else:
        return False,"Api Request Failed"
UUID = GetUUID(UserName)
while True:
    time.sleep(CheckTime)
    Close,Status = GetStatus(UUID)
    print(GetCurrentTimenDate()+" : "+Status)
    if Close==True:
        CloseMinecraft()
        break
