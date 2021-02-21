import time
import requests
import re
import os
from bs4 import BeautifulSoup

url_base = 'https://dxy.com/diseases'
url_gen = 'https://dxy.com/disease/{disease_id}/detail'

disease_id_list = []
dealt_id_list = []
rst = []


def prepare():
    if os.path.exists('./rst.txt'):
        rst_file = open('./rst.txt', 'r')
        for line in rst_file.readlines():
            line_split = line.split()
            dealt_id_list.append(int(line_split[0]))
            rst.append(line_split[1:4])
        rst_file.close()


def get_all_id():
    html_diseases = requests.get(url_base)
    for rst in re.findall('"tag_id":([0-9]+),', html_diseases.text):
        disease_id_list.append(int(rst))


def get_diseases(iter_id, output):
    html_disease = requests.get(url_gen.format(disease_id=iter_id))
    time.sleep(1.5)
    soup_disease = BeautifulSoup(html_disease.text, 'html.parser')

    name = soup_disease.find('div', class_="high-light tag-content-title")
    section = soup_disease.find('div', class_="tag-content-section")
    detail = soup_disease.find('div', class_="high-light tag-content-detail")

    if all(v is not None for v in [name, section, detail]):
        name_replace = name.text.replace(' ', '')
        section_replace = section.text.replace('就诊科室：', '')
        detail_replace = detail.text.replace('‧', '').replace('·', '').replace(' ', '')
        dealt_id_list.append(int(iter_id))
        rst.append([name_replace, section_replace, detail_replace])
        print("%d\t%d\t%s\t%s\t\t%s\t\t" % (len(rst), iter_id, name_replace, section_replace, detail_replace))
        output.write("%d\t%s\t%s\t%s\t\n" % (iter_id, name_replace, section_replace, detail_replace))


if __name__ == '__main__':
    print("\n--- Stage 1: Prepare Data ---")
    prepare()

    print("\n--- Stage 2: Get All Disease IDs ---")
    get_all_id()

    print("\n--- Stage 3: Get All Disease Details ---")
    print("\n 疾病ID\t\t疾病名称\t\t就诊科室\t\t疾病详情")

    f = open('./rst.txt', 'a')

    diff = list(set(disease_id_list).difference(dealt_id_list))
    while diff:
        for i in diff:
            get_diseases(i, f)
        diff = list(set(disease_id_list).difference(dealt_id_list))

    f.close()
