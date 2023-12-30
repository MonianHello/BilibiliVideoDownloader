import requests
import qrcode
import time

# 申请二维码
def apply_qrcode():
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
    }

    response = requests.get('https://passport.bilibili.com/x/passport-login/web/qrcode/generate', headers=headers)
    
    if response.status_code != 200:
        print(f"请求二维码失败。状态码: {response.status_code}")
        return None, None
    
    data = response.json()['data']
    url = data['url']
    qrcode_key = data['qrcode_key']
    return qrcode_key, url

# 生成二维码
def generate_qrcode(url):
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(url)
    qr.make(fit=True)

    img = qr.make_image(fill_color="black", back_color="white")
    img.show()

# 扫码登录
def scan_login(qrcode_key):
    while True:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
        }

        response = requests.get(f'https://passport.bilibili.com/x/passport-login/web/qrcode/poll?qrcode_key={qrcode_key}', headers=headers)
        data = response.json()['data']
        code = data['code']

        if code == 0:  # 登录成功
            print('登录成功')
            cookie = response.cookies.get_dict()
            print('Cookie:', cookie)
            return cookie
        elif code == 86101:  # 未扫描
            time.sleep(0.5)
            continue
        elif code == 86038:  # 二维码失效
            print('二维码已失效')
            break
        elif code == 86090:  # 二维码已扫描未确认
            # print('二维码已扫描未确认')
            time.sleep(0.5)
        else:
            print('未知的状态码:', code)
            break

if __name__ == "__main__":
    qrcode_key, url = apply_qrcode()
    generate_qrcode(url)
    scan_login(qrcode_key)
