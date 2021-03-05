# coding:utf-8
import string
import random
import csv


def rand_phone_num():
    num_start = ['134', '135', '136', '137', '138', '139', '150', '151', '152', '158', '159', '157', '182', '187',
                 '188', '147', '130', '131', '132', '155', '156', '185', '186', '133', '153', '180', '189']
    start = random.choice(num_start)
    end = ''.join(random.sample(string.digits, 8))
    num = start + end
    return num


def rand_password():
    pw = random.sample(string.digits + string.ascii_lowercase +
                       string.ascii_uppercase, random.randint(6, 12))
    random.shuffle(pw)
    password = ''.join(pw)
    return password


def rand_email():
    start = random.sample(string.digits + string.ascii_lowercase + string.ascii_uppercase, random.randint(5, 9))
    end = random.sample(string.digits + string.ascii_lowercase + string.ascii_uppercase, random.randint(2, 3))
    random.shuffle(start)
    random.shuffle(end)
    email = ''.join(start) + '@' + ''.join(end) + '.com'
    return email


def GBK2312():
    head = random.randint(0xb0, 0xf7)
    body = random.randint(0xa1, 0xf9)  # 在head区号为55的那一块最后5个汉字是乱码,为了方便缩减下范围
    val = f'{head:x}{body:x}'
    str = bytes.fromhex(val).decode('gb2312')
    return str


def rand_name():
    last_names = ['赵', '钱', '孙', '李', '周', '吴', '郑', '王', '冯', '陈', '褚', '卫', '蒋', '沈', '韩', '杨', '朱', '秦', '尤', '许',
                  '姚', '邵', '堪', '汪', '祁', '毛', '禹', '狄', '米', '贝', '明', '臧', '计', '伏', '成', '戴', '谈', '宋', '茅', '庞',
                  '熊', '纪', '舒', '屈', '项', '祝', '董', '梁']
    last_name = random.choice(last_names)
    first_names = []
    for i in range(10):
        first_names.append(bytes.fromhex(
            f'{random.randint(0xb0, 0xf7):x}{random.randint(0xa1, 0xf9):x}').decode('gb2312'))
    first_name = random.sample(first_names, random.randint(1, 2))
    name = ''.join(last_name) + ''.join(first_name)
    return name


def rand_attendance():
    att = []
    for i in range(7):
        b = random.randint(0, 1)
        if b == 0:
            att.append('false')
        else:
            att.append('true')
    return '{' + ','.join(att) + '}'


def rand_school():
    with open("schools.csv", 'r', encoding="utf-8") as f:
        reader = csv.reader(f)
        column = [row[0] for row in reader]
        school = random.choice(column)
        degree = ['本科', '硕士', '博士']
        if school.find('专科') != -1:
            school += '专科毕业'
        else:
            school += random.choice(degree) + '毕业'
        return school


def rand_hospital():
    with open("hospitals.csv", 'r', encoding="utf-8") as f:
        reader = csv.reader(f)
        column = [row[2] for row in reader]
        return '在' + random.choice(column) + '工作'


departments = ['内科', '外科', '儿科', '妇科', '眼科', '耳鼻喉科', '口腔科', '皮肤科', '中医科', '针灸推拿科', '心理咨询室', '呼吸内科', '消化内科', '泌尿内科',
               '心内科', '血液科', '内分泌科', '神经内科', '小儿科', '感染科', '普外科', '骨科', '神经外科',
               '肝胆外科', '泌尿外科', '烧伤科', '妇科', '产科', '血透室', '内科', '外科', '妇产科', '儿科等。药房：门诊药房', '急诊药房', '住院药房', '门诊收费窗口',
               '住院收费窗口', '急诊收费窗口', '生化室', '检验室', '病理室', '拍片室', 'CT室', '透视室', '磁共振室', 'ECT室']

doctors = []
for i in range(0, 100):
    doctors.append(
        [rand_phone_num(), rand_password(), rand_email(), rand_name(), random.randint(35, 60), 'male',
         rand_attendance(), rand_hospital(), rand_school()])
    age = doctors[i][4] - 18 - 4
    if doctors[i][8].find('专科') != -1:
        age -= 3
    elif doctors[i][8].find('本科') != -1:
        age -= 5
    elif doctors[i][8].find('硕士') != -1:
        age -= 7
    else:
        age -= 8
    age -= random.randint(0, 3)
    doctors[i][7] += str(age) + '年'
print(doctors)

var = [['13391786245', 'lj8XLTx4UI1', 'FDbd3KWc@Wk.com', '王喁', 56, 'male', '{false,false,false,true,true,false,true}',
        '在来安县中医院工作27年', '贵阳护理职业学院本科毕业'],
       ['18503641927', 'zKlICOhZrwE', '1KfOtq3@u3.com', '贝飞', 36, 'male', '{false,false,false,true,true,true,true}',
        '在牡丹江市肿瘤医院牡丹江市结核病防治院工作7年', '湖南师范大学医学院硕士毕业'],
       ['13715863029', 'ylw4LVUb0DPu', 'eEKyhIOqD@ta.com', '吴换', 49, 'male', '{true,false,false,true,true,false,false}',
        '在濮阳市人民医院工作18年', '江苏建康职业学院博士毕业'],
       ['15920538971', 'LGWesT', 'LlDpXHn@YB.com', '朱捎勋', 43, 'male', '{true,true,false,true,false,false,true}',
        '在门头沟区色树坟中心卫生院工作14年', '江西卫生职业学院硕士毕业'],
       ['13191405276', 'Mka8IEw', 'xsHbYUmKA@Fl.com', '邵稆', 42, 'male', '{true,true,false,true,true,true,false}',
        '在河南省第一监狱医院工作11年', '武汉大学口腔医学院博士毕业'],
       ['15680761592', 'JctxYPh', 'UlcnkBMV8@vGb.com', '沈醪', 57, 'male', '{true,false,true,true,true,true,true}',
        '在雄县中医院工作28年', '西北民族大学本科毕业'],
       ['13250637142', '8E3lBSmOV', '4dPVY0iD@0Pq.com', '屈虱齿', 41, 'male', '{true,false,false,true,false,false,true}',
        '在商丘市第一人民医院工作12年', '兰州大学医学院硕士毕业'],
       ['13289310254', '6Qyouw4ZNSRJ', 'J4TR70q3@Qi.com', '汪琪', 40, 'male', '{false,false,true,false,true,false,false}',
        '在陕西省红十字医院工作15年', '湘南医学高等专科学校专科毕业'],
       ['15172851496', 'EOUInm', 'V0x7BqtbH@YV.com', '禹裨', 46, 'male', '{false,false,false,true,false,true,false}',
        '在神木县妇幼保健站工作19年', '湖南中医药大学湘杏学院本科毕业'],
       ['18903471592', 'NXiOzgdI9STh', 'Ivh8jxrG@3cW.com', '贝喷饧', 43, 'male', '{false,true,false,true,true,true,true}',
        '在义乌市新法风湿病医院工作14年', '河北联合大学冀唐学院硕士毕业'],
       ['15914739058', 'ZP6oQye', '5zVQaY@Tz1.com', '杨燮', 45, 'male', '{true,true,true,false,true,true,true}',
        '在克拉玛依市金龙医院工作19年', '湖北中医药高等专科学校专科毕业'],
       ['18274310928', 'EMhGm90', '4LgEFMPy@px.com', '祁魇', 49, 'male', '{true,true,true,true,false,false,true}',
        '在西平县人民医院工作20年', '西北民族大学本科毕业'],
       ['13402847163', '2KQIeZpq', 'ELAbwCy@nm.com', '沈典', 53, 'male', '{false,false,true,true,false,true,true}',
        '在鸡西市城子河区人民医院工作21年', '南京大学医学院硕士毕业'],
       ['15706394271', '3Q7ZRMvS4', '6eGHj@sRf.com', '汪苈', 52, 'male', '{false,true,false,false,false,false,true}',
        '在阿克苏市兵团农一师九团职工医院工作27年', '沧州医学高等专科学校专科毕业'],
       ['18058342176', '4AiI3XQFKBoz', 'knOIoj@LIp.com', '卫逶输', 40, 'male', '{true,true,false,false,false,true,false}',
        '在亳州市恒康医院工作8年', '泰山医学院硕士毕业'],
       ['15235876294', 'VPGE7e9g6', 'Duph5Ol@xUe.com', '熊苟坎', 60, 'male', '{false,false,true,true,true,true,false}',
        '在温州市中西医结合医院工作30年', '甘肃卫生职业学院本科毕业'],
       ['15261850479', 'eC3H0FnawSYp', 'N6hKdV@NUS.com', '纪铠奕', 37, 'male', '{false,true,true,true,false,false,true}',
        '在盘县特区中医院工作9年', '遵义医药高等专科学校专科毕业'],
       ['13275241603', '3Nval6', '7MUOEjKdg@3xw.com', '钱逶', 51, 'male', '{true,false,true,true,false,false,false}',
        '在辽阳县中医院工作24年', '四川医科大学本科毕业'],
       ['18214260983', 'gLla4UQ1p9', '07YILy9q@fL.com', '宋襦', 44, 'male', '{false,false,false,false,false,false,false}',
        '在九台市铁北医院工作13年', '皖西卫生职业学院博士毕业'], ['18298670521', 'OHRnqMy6aKdB', 'Z6zPhqQx3@dIo.com', '朱毫藤', 50, 'male',
                                           '{true,false,false,true,false,true,true}', '在内蒙古平计矿务局总医院工作18年',
                                           '贵阳市卫生学校硕士毕业'],
       ['15853482169', 'xEkoV8OU', '5bzyF@XC.com', '戴噎', 60, 'male', '{false,true,false,true,true,false,true}',
        '在成都口腔医院工作31年', '沈阳医学院本科毕业'],
       ['18019368750', 'rZme0nUPVL', 'TAm0jEhe@LpM.com', '计擦', 52, 'male', '{true,false,true,true,false,true,false}',
        '在陆良县妇幼保健院工作20年', '华中科技大学同济医学院硕士毕业'],
       ['13930786491', 'MeoUKxBuANl', 'XBK2PIs@p5.com', '蒋亦俯', 57, 'male', '{false,false,true,true,false,false,true}',
        '在井陉矿务局医院工作28年', '云南大学医学院本科毕业'],
       ['18518207469', 'UIzEphd', 'jYCp0mWNz@o1.com', '计拽', 54, 'male', '{true,true,false,true,false,false,false}',
        '在津市市中医院工作23年', '广东药学院硕士毕业'],
       ['13584930712', 'VmXNZEB', 'ordKWBf@brs.com', '毛哨灰', 45, 'male', '{false,false,true,true,true,false,false}',
        '在沈阳市房天职工医院工作18年', '安徽医学高等专科学校专科毕业'],
       ['15914723605', '9MmGEi3L7plr', 'yZo8gQwA@41.com', '宋蝣嚼', 47, 'male', '{true,true,true,true,true,false,true}',
        '在三门县妇幼保健站工作19年', '大庆医学高等专科学校专科毕业'],
       ['15234276081', 'ORPpi8cZqBmM', 'PGHEZF@bu.com', '明蛄', 54, 'male', '{false,false,true,true,false,false,true}',
        '在封开县第二人民医院工作23年', '天津第二医学院硕士毕业'],
       ['15540163982', '7tkBuFvAwD', 'KnMEm@c9.com', '纪饭帮', 39, 'male', '{true,false,true,false,true,true,false}',
        '在永和县人民医院工作12年', '三峡大学医学院本科毕业'],
       ['15664208195', 'rnbaCPluKOs', 'FCPQjM@cQn.com', '陈澜', 46, 'male', '{false,false,true,false,true,false,true}',
        '在中国人民解放军总后勤部第三职工医院工作17年', '包头医学院硕士毕业'],
       ['13095832407', 'TLPYblxuro6A', 'i16rlZg@cCX.com', '熊倍', 43, 'male', '{false,false,false,true,true,true,false}',
        '在中国人民解放军第二一五医院工作11年', '贵阳中医学院博士毕业'],
       ['15251392864', 'pi0vu3KNJ7', 'Zvj6RpP@Ve.com', '计瞳', 50, 'male', '{false,true,true,true,true,true,true}',
        '在中国中医研究院眼科医院工作19年', '南通大学医学院博士毕业'],
       ['18242681790', 'qTpOrbMD2fA', 'qsetpzvRc@03L.com', '尤皓', 39, 'male', '{true,true,true,true,false,true,true}',
        '在云梦县中医院工作7年', '济宁医学院博士毕业'],
       ['15632809475', 'wRWGqg1cYyp', 'VeRpzOo7@Efd.com', '吴桷千', 59, 'male', '{false,false,false,true,false,true,true}',
        '在盘锦市兴隆台区人民医院工作31年', '浙江医药高等专科学校专科毕业'],
       ['15562801937', 'pozAre', '1ElstH@Rt.com', '杨璇靳', 51, 'male', '{false,true,false,false,false,true,false}',
        '在怀化市精神病医院工作20年', '惠州卫生职业技术学院博士毕业'],
       ['18640128356', 'KoJQLfBOGyn7', 'JTxr8XyO@bYO.com', '熊嚼蚩', 56, 'male', '{true,true,false,true,true,false,true}',
        '在昌乐县中医院工作26年', '上海健康职业技术学院本科毕业'],
       ['13752431086', 'N6soF9kXrj0', '3WofTY8d@aoB.com', '戴塬拶', 59, 'male', '{true,false,false,false,true,false,true}',
        '在北安市结核病医院工作27年', '中国人民解放军白求恩军医学院博士毕业'],
       ['15376982430', '9r4tsgxLvD', 'AYPdD3@Hk.com', '李摘', 52, 'male', '{false,false,true,false,false,true,false}',
        '在西吉县妇幼保健所工作24年', '鸡西煤炭医学高等专科学校专科毕业'],
       ['15379436285', 'lMVYdsX', 'Y2O7iGJ@l6z.com', '陈奚', 46, 'male', '{false,false,false,false,false,false,true}',
        '在晴隆县人民医院工作13年', '中国医科大学临床医药学院博士毕业'],
       ['13628476130', '41xOdL', 'mG8E7B@SB.com', '周膀浩', 49, 'male', '{true,true,false,false,true,false,true}',
        '在韶关市福康医院工作19年', '南通大学医学院博士毕业'],
       ['18701762349', '1IRbtQf', 'v3NZz@sm.com', '褚卫忝', 51, 'male', '{false,false,false,true,false,false,true}',
        '在长宁区同仁医院工作21年', '山东大学口腔医学院博士毕业'],
       ['13307651894', 'W4cA9f0w', 'XhaWPSq@3zv.com', '沈犬霈', 50, 'male', '{false,true,true,false,false,false,true}',
        '在常德市鼎城区肿瘤医院工作19年', '西藏藏医学院硕士毕业'],
       ['18913479286', 'HFgqWTN', 'E0huNv@g2T.com', '戴摆鸲', 47, 'male', '{true,true,true,true,false,false,false}',
        '在安化县联合医院工作15年', '山东大学齐鲁医学部硕士毕业'],
       ['15332649715', 'uyPlHC', 'mHWoOVZ2z@2MB.com', '祁暧', 51, 'male', '{false,false,true,false,false,false,true}',
        '在石家庄市第五医院（原石家庄市传染病医院）工作20年', '第二军医大学博士毕业'],
       ['18594102835', 'PUBvWs5', 'CZySn@qf.com', '宋戗之', 51, 'male', '{true,true,false,true,false,false,true}',
        '在衡水市远大集团友谊医院(原衡水市棉纺厂职工医院)工作20年', '首都医科大学博士毕业'],
       ['14791473826', 'L2voN4Tiqbxy', 'AxGjCa@HI.com', '秦诙', 37, 'male', '{false,false,true,false,true,true,true}',
        '在库伦旗蒙医医院工作12年', '菏泽医学专科学校专科毕业'],
       ['13467358921', 'oEPCtJ6Ga4W', '1nTINpdAg@GVN.com', '孙怏', 46, 'male', '{false,false,true,false,true,false,true}',
        '在汨罗市第二人民医院工作16年', '辽宁医学院医疗学院本科毕业'],
       ['13917690534', '7jKLRwYf0', '65WXER@lh.com', '尤婉', 39, 'male', '{false,true,true,true,true,true,true}',
        '在永胜县妇幼保健院工作8年', '北华大学护理学院硕士毕业'],
       ['18843125869', '4bE2Kp9j', 'YLiJv4Cc@we.com', '吴蕲', 60, 'male', '{false,true,false,false,true,false,true}',
        '在新疆伊宁市痔瘘医院工作30年', '河北联合大学冀唐学院本科毕业'],
       ['15215730682', 'i3n4msZ9T', 'y7pGoMbKD@Qv.com', '赵禅', 49, 'male', '{false,true,true,false,false,false,true}',
        '在滨州市结核医院滨州市肿瘤医院工作17年', '盐城卫生职业技术学院硕士毕业'],
       ['18080294516', 'gUpzLNXtCT', 'Yvlgi5wd2@yw.com', '褚艴', 49, 'male', '{true,true,false,true,true,true,false}',
        '在睢宁县传染病院工作18年', '江苏大学医学院博士毕业'],
       ['13938549216', 'wVONKrSzLTt', 'd0FQ8@9Y.com', '祁啧凋', 48, 'male', '{false,true,true,true,true,true,false}',
        '在呼市妇幼保健院工作16年', '甘肃中医药大学硕士毕业'],
       ['13071368590', 'xkgqVfrl', 'e0IwUVuvg@Zhz.com', '舒楞', 51, 'male', '{true,true,false,false,true,false,true}',
        '在察右后旗蒙医院工作24年', '牡丹江医学院本科毕业'],
       ['15536927145', 'fSqpnAjET', 'wfgDz@N0b.com', '舒甍', 37, 'male', '{false,true,false,false,false,false,false}',
        '在安阳市灯塔医院工作6年', '重庆医科大学博士毕业'],
       ['15115674329', 'gFG23mWox5jn', '1QhuO@jX3.com', '杨嗥', 59, 'male', '{false,true,false,false,false,true,true}',
        '在保靖县妇幼保健站工作32年', '邢台医学高等专科学校专科毕业'],
       ['15020159768', 'XBF84O0xscN', 'UH1Ww3xO@gx.com', '郑淳肥', 55, 'male', '{true,false,true,false,true,false,true}',
        '在铁岭市银州区中西医结合医院工作28年', '大连医科大学本科毕业'],
       ['15603928476', 'lsW2Ui804r', 'lcA6HMshF@ncG.com', '伏壤砒', 39, 'male', '{false,true,false,false,true,true,false}',
        '在烟台桃村中心医院(原：栖霞市第二人民医院)工作7年', '第二军医大学南京军医学院博士毕业'],
       ['13568102573', 'H2JwgZ', 'rM8o69@Ou.com', '计席瞌', 39, 'male', '{true,true,true,true,false,false,true}',
        '在房山区燕山医院工作6年', '南方医科大学博士毕业'],
       ['13186219307', 'LmHc4UOh', 'XOAaY0KV@LdJ.com', '舒墟', 40, 'male', '{true,true,true,true,true,false,false}',
        '在新疆疏附县人民医院工作14年', '柳州医学高等专科学校专科毕业'],
       ['18775480236', 'rCmIEKv8VLP', 'X40hKc@NY.com', '熊班泶', 54, 'male', '{false,false,false,true,true,false,true}',
        '在江津市工人医院工作28年', '江西中医药高等专科学校专科毕业'],
       ['13637025698', 'Yqv9T1tZrm', 'HxeuO@i5X.com', '邵交', 52, 'male', '{true,false,true,true,true,false,true}',
        '在方城县公疗医院工作23年', '辽宁中医药大学杏林学院硕士毕业'],
       ['18228091734', 'P9yYGhU', 'eM3Z9KsXC@hI.com', '毛侨', 45, 'male', '{true,false,false,false,false,true,false}',
        '在黑龙江省亚布力林业局职工医院工作15年', '遵义医学院本科毕业'],
       ['15880214693', 'p7m9zX', 'b3ZJY0H@ca.com', '项疽纵', 37, 'male', '{true,true,false,true,true,true,false}',
        '在哈尔滨市道里区公费医疗医院工作6年', '广西中医药大学博士毕业'], ['18226073984', '0mF5l8M7xSf', '89EQgFvzs@2J.com', '项旷', 46, 'male',
                                               '{false,false,false,false,false,true,false}', '在大渡口区人民医院工作17年',
                                               '西北民族大学硕士毕业'],
       ['15238574160', 'DVsbGfk7oXhJ', 'QMDukLwq@5IJ.com', '朱百翅', 43, 'male', '{true,false,true,true,true,true,true}',
        '在安达市妇幼保健院工作15年', '白城医学高等专科学校专科毕业'],
       ['15549625187', 'nvzZIiXg', 'rAgwu1pmN@gan.com', '郑枯谝', 50, 'male', '{true,false,false,false,false,false,true}',
        '在宁波市保黎医院宁波市第四医院工作17年', '皖南医学院博士毕业'],
       ['18832967508', 'cYxH7C', 'hkvyNrzep@N2b.com', '舒旄', 56, 'male', '{true,false,true,true,false,true,false}',
        '在十八站林业局职工医院工作24年', '山西医科大学晋祠学院硕士毕业'],
       ['14735162490', 'SrtpcF', 'zYWIws@wa.com', '董棘', 57, 'male', '{true,true,true,false,true,true,false}',
        '在南海市南庄医院工作25年', '湖南师范大学医学院博士毕业'],
       ['15930259176', 'HGfUkx', '1h6nZv0si@JT.com', '屈事金', 58, 'male', '{true,false,true,true,true,false,true}',
        '在长沙市骨质增生病专科医院工作31年', '邵阳医学高等专科学校专科毕业'],
       ['13721980735', 'tCXVrSJ4', 'J2z6IsNZr@w2.com', '卫穿', 45, 'male', '{true,true,false,false,false,false,true}',
        '在绍兴市中医院工作13年', '福建医科大学博士毕业'],
       ['15130785146', 'W9oyx8Xt', 'ucoSa@Dn.com', '贝鲲', 44, 'male', '{true,true,false,true,true,true,true}',
        '在刚察县人民医院工作12年', '华中科技大学同济医学院博士毕业'],
       ['18751860429', 'TVnDWu0Y', 'TmQtYhx@DI.com', '冯啮', 39, 'male', '{true,false,true,false,false,false,false}',
        '在周口市皮肤病医院工作8年', '山东大学医学院硕士毕业'], ['18908197653', 'hq82TAEUa9Pe', 'kY4jpMlVG@wFe.com', '毛赕', 55, 'male',
                                          '{false,false,false,false,true,false,false}', '在东莞市工人医院工作27年',
                                          '中国人民武装警察部队医学院本科毕业'],
       ['18587562301', 'pqHDi0vwjS', 'n65Mf0L@Ss.com', '计搜', 56, 'male', '{false,false,false,false,true,true,true}',
        '在大洼县妇幼保健站工作25年', '兰州大学医学院硕士毕业'], ['13387610534', 'uLpvIO4gwayQ', 'bNtCnxwjT@uf.com', '尤蹑', 53, 'male',
                                           '{false,false,false,false,false,false,false}', '在文登市肿瘤医院工作25年', '广东医学院本科毕业'],
       ['15798705624', 'FIHEea6riP', 'zQZmft@w4v.com', '董瓦斟', 48, 'male', '{false,true,true,true,true,true,true}',
        '在赤峰市元宝山区第一医院工作18年', '哈尔滨医科大学博士毕业'],
       ['18010542983', 'YVFhnGaNQCZO', '2kLPwx@SAn.com', '秦烛距', 59, 'male', '{true,false,true,false,false,false,true}',
        '在綦江县肿瘤康复医院工作26年', '承德护理职业学院博士毕业'],
       ['13789250374', 'xPcKBoIhNztY', '95dTe@HB.com', '许襞', 46, 'male', '{true,false,false,true,false,false,false}',
        '在枣庄市峄城区人民医院工作17年', '汕头大学医学院本科毕业'],
       ['18756972148', 'xWN8ze', 'WkgEiT6@bDI.com', '纪钲目', 39, 'male', '{false,false,true,true,true,true,false}',
        '在临县第二人民医院工作14年', '邢台医学高等专科学校专科毕业'],
       ['18871284095', 'M5W1D6Q7N', 'mWxa1bP@waS.com', '沈范', 58, 'male', '{false,false,false,false,true,false,true}',
        '在黑水县妇幼保健站工作32年', '上海医药高等专科学校专科毕业'],
       ['15896407832', 'WkNEQCrp', '3N4ISK0tC@0JP.com', '禹獠', 57, 'male', '{false,true,false,true,false,false,true}',
        '在朔州复退军人精神病院工作25年', '湖北理工学院医学院博士毕业'],
       ['15023690845', 'a9CSrBQR3', 'rU7ce@nDK.com', '项荣', 55, 'male', '{true,false,true,true,true,false,false}',
        '在南乐县精神病医院工作24年', '皖南医学院硕士毕业'],
       ['15017584639', 'HhL2u89ywNj', 'OUZClijM@wve.com', '秦悱爬', 48, 'male', '{true,true,true,false,false,true,false}',
        '在中国人民解放军空军水上村医院工作18年', '深圳大学医学部本科毕业'],
       ['18831087429', 'bfsL5KnZ2', 'YOrCRda@xJ.com', '舒廿', 44, 'male', '{false,true,true,false,true,true,true}',
        '在庐江县中医院工作14年', '深圳大学医学部博士毕业'],
       ['15683507412', 'YOUrfhDNt', 'drQ12@LYz.com', '祝咧诌', 50, 'male', '{false,false,true,false,false,false,false}',
        '在淮阳县中医院工作19年', '南通大学医学院硕士毕业'],
       ['18648239715', 'PDo9wNRLBWv', 'Hb7SF0Kl@Kv.com', '冯伪', 58, 'male', '{true,false,true,false,false,false,true}',
        '在莆田市肿瘤防治院工作31年', '南通大学医学院本科毕业'],
       ['18657689321', 'vucod8yCPB9X', 'OADus0JG@plZ.com', '祁陪', 50, 'male', '{true,false,false,true,false,false,true}',
        '在合肥市第二人民医院工作18年', '四川护理职业学院硕士毕业'],
       ['13591324508', '2nOmpKLy', 'Axw0uJ1@pC.com', '熊螫', 50, 'male', '{true,false,false,true,false,true,false}',
        '在沂南县中医院工作24年', '柳州医学高等专科学校专科毕业'],
       ['18268702143', '5UKRJY72', 'VaBtmT@67e.com', '秦彬蛉', 35, 'male', '{false,true,false,true,false,false,true}',
        '在许昌市第二人民医院工作8年', '大同医学高等专科学校专科毕业'],
       ['18039157028', 'Bb2oVDMmxkW', 'XEVzYQ@hm.com', '李挛', 54, 'male', '{true,true,true,true,true,true,false}',
        '在克拉玛依市人民医院工作29年', '新疆维吾尔医学专科学校专科毕业'],
       ['15328965143', 'huiIS35', 'nohs8fdX@9I.com', '赵嗥', 54, 'male', '{true,true,true,true,false,false,false}',
        '在东北制药总厂职工医院工作24年', '四川大学本科毕业'],
       ['15525679830', '5EGprlRb1AI', 'EVriq@9pK.com', '孙终裘', 58, 'male', '{true,false,true,false,false,true,true}',
        '在河东区中医院工作27年', '北华大学医学院博士毕业'],
       ['18672516904', 'RPdKjCTzlF0', '7GHOwR@bhH.com', '梁臧', 51, 'male', '{false,false,false,false,true,true,false}',
        '在宁安县人民医院工作23年', '南京海军医学高等专科学校专科毕业'],
       ['15385136074', '4hYXS7vA', 'vT78m@1CX.com', '贝口', 53, 'male', '{true,true,true,false,true,true,true}',
        '在新乡医学院第一附属医院工作26年', '安徽中医药高等专科学校专科毕业'],
       ['13525749813', '1MWc6qg9', 'YqiAHosP@Rc.com', '毛常相', 43, 'male', '{true,true,false,true,true,false,true}',
        '在藁城市糖尿病医院工作14年', '辽宁医药职业学院本科毕业'],
       ['15367589142', 'fwKgvn0', 'mjGQKZL@rZt.com', '尤舜', 56, 'male', '{true,false,false,true,false,false,true}',
        '在新丰县中医院工作26年', '湘南学院硕士毕业'],
       ['18667185249', 'fDhaLkji', 'tlzEhr1S@8J.com', '郑诤殿', 35, 'male', '{false,false,false,false,true,true,false}',
        '在漂塘钨矿职工医院工作4年', '江苏建康职业学院博士毕业'],
       ['13370564189', 'o1BcaCNuqAhJ', 'cyVJB@MEv.com', '明锶', 60, 'male', '{false,true,true,false,false,false,true}',
        '在江永县中医院工作32年', '湖北民族学院医学院本科毕业'],
       ['13261894237', 'md2uW9', 'Ay7q1I@m7.com', '项湔荪', 52, 'male', '{false,false,false,false,false,false,false}',
        '在瓦房店市第五人民医院工作22年', '南方医科大学博士毕业'],
       ['13532097481', 'zdbOu2NZr6W', 'yN5jXcuB@CNQ.com', '禹仨', 59, 'male', '{false,true,true,false,false,true,false}',
        '在重庆沙坪坝区井口医院工作28年', '四川护理职业学院博士毕业'],
       ['15627341856', 'ypMS5YPBw', '7EOzD@AM.com', '邵牢脱', 42, 'male', '{true,true,true,true,true,true,true}',
        '在河南省第六建筑工程公司职工医院工作9年', '四川医科大学博士毕业']
       ]
