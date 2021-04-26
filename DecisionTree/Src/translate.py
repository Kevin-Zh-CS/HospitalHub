# 百度垂直领域翻译API,不包含词典、tts语音合成等资源，如有相关需求请联系translate_api@baidu.com
# 2020.07.28 更新，原url拼接错误，感谢热心网友指?
# coding=utf-8
import http.client
import hashlib
import urllib
import random
import json


class translate:
    def __init__(self, appid='20210301000712252', secretKey='8KrAHdnFG_3CMWQHXNll', myurl='http://api.fanyi.baidu.com/api/trans/vip/fieldtranslate') -> None:
        self.appid = appid  # 填写你的appid
        self.secretKey = secretKey  # 填写你的密钥
        self.httpClient = None
        self.myurl = myurl
        self.sign = None
        self.fromLang = None  # 原文语种
        self.toLang = None  # 译文语种
        self.salt = random.randint(32768, 65536)
        self.domain = 'medicine'
        self.lastResponse = None

    def go(self,sentence,fromLang,toLang):
        self.fromLang = fromLang
        self.toLang = toLang
        self.sign = self.appid + sentence + \
            str(self.salt) + self.domain + self.secretKey
        self.sign = hashlib.md5(self.sign.encode()).hexdigest()
        self.myurl = self.myurl + '?appid=' + self.appid + '&q=' + urllib.parse.quote(
            sentence) + '&from=' + self.fromLang + '&to=' + self.toLang + '&salt=' + str(self.salt) + '&domain=' + self.domain + '&sign=' + self.sign

        try:
            httpClient = http.client.HTTPConnection('api.fanyi.baidu.com')
            httpClient.request('GET', self.myurl)

            # response是HTTPResponse对象
            self.lastResponse = httpClient.getresponse()
            result_all = self.lastResponse.read().decode("utf-8")
            result = json.loads(result_all)
            return result['trans_result'][0]['dst']

        except Exception as e:
            print(e)
            return 'error'
        finally:
            if httpClient:
                httpClient.close()