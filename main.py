import requests
import os
import json
import login

COOKIE_FILE_PATH = "cookie.json"

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
}

def load_cookie():
    cookies = None
    if os.path.exists(COOKIE_FILE_PATH):
        with open(COOKIE_FILE_PATH, 'r') as file:
            cookies = json.load(file)
            url = 'https://api.bilibili.com/x/web-interface/nav'
            response = requests.get(url,headers=headers, cookies=cookies)
            if response.status_code == 200:
                result = response.json()
                if result['code'] == 0:
                    print(f"{result['data']['uname']}已登录")
                    return cookies
                else:
                    print("cookie已失效，请重新登录")
                    cookies = None
            else:
                print("网络错误")
    if cookies is None:
        print('请使用手机端APP扫码登录')
        qrcode_key, url = login.apply_qrcode()
        login.generate_qrcode(url)
        cookies = login.scan_login(qrcode_key)
        with open(COOKIE_FILE_PATH, 'w') as file:
            json.dump(cookies, file)

    return cookies

def get_pagelist(aid=None, bvid=None):
    url = 'https://api.bilibili.com/x/player/pagelist'
    params = {
            'aid': aid, 
            'bvid': bvid,
            'qn':112
              }
    
    response = requests.get(url, params=params, headers=headers, cookies=cookies)
    
    if response.status_code == 200:
        result = response.json()
        if result['code'] == 0:
            return result['data']
        else:
            print(f"Error: {result['message']}")
    else:
        print(f"Error: Unable to fetch data (Status code: {response.status_code})")

def cid2url(aid=None, bvid=None, cid=None):
    url = 'https://api.bilibili.com/x/player/wbi/playurl'
    params = {'aid': aid, 'bvid': bvid, 'cid':cid}
    
    response = requests.get(url, params=params, headers=headers, cookies=cookies)
    
    if response.status_code == 200:
        result = response.json()
        if result['code'] == 0:
            return result['data']
        else:
            print(f"Error: {result}")
    else:
        print(f"Error: Unable to fetch data (Status code: {response.status_code})")


def getdownloadurl(aid=None, bvid=None):
    result = get_pagelist(aid=aid) if aid else get_pagelist(bvid=bvid)
    urls = []
    if result:
        for item in result:
            print(f"Page {item['page']}: {item['part']}, CID: {item['cid']}")
            url_result = cid2url(aid=aid, bvid=bvid, cid=item['cid'])
            print(f"Url:{url_result['durl'][0]['url']}")
            urls.append([item['page'],item['part'],url_result['durl'][0]['url']])
    return urls

if __name__ == "__main__":
    global cookies
    cookies = load_cookie()
    while True:
        urls = getdownloadurl(bvid=input("请输入BV号(包含'BV'):"))#可传入av号，avid=...
        print("直链有效时间为120分钟")
    #todo:urls -> aria2c
