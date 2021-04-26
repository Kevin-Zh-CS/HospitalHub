from gen_hospital import hospital_data
from gen_department import department_data
from random import choice
from random import uniform

#   手机号          密码        邮箱                    姓名     年龄  性别     一周七天的值班情况                      医生的科属          工作经历            教育经历
doctor_data = [
    ['13391786245', 'lj8XLTx4UI1', 'FDbd3KWc@Wk.com', '王喁', 56, 'male', '{false,false,false,true,true,false,true}',
     '在来安县中医院工作27年', '贵阳护理职业学院本科毕业'],
    ['18503641927', 'zKlICOhZrwE', '1KfOtq3@u3.com', '贝飞', 36, 'male', '{false,false,false,true,true,true,true}',
     '在牡丹江市肿瘤医院牡丹江市结核病防治院工作7年', '湖南师范大学医学院硕士毕业'],
    ['13715863029', 'ylw4LVUb0DPu', 'eEKyhIOqD@ta.com', '吴欢', 49, 'male', '{true,false,false,true,true,false,false}',
     '在濮阳市人民医院工作18年', '江苏建康职业学院博士毕业'],
    ['15920538971', 'LGWesT', 'LlDpXHn@YB.com', '朱勋', 43, 'male', '{true,true,false,true,false,false,true}',
     '在门头沟区色树坟中心卫生院工作14年', '江西卫生职业学院硕士毕业'],
    ['13191405276', 'Mka8IEw', 'xsHbYUmKA@Fl.com', '邵可', 42, 'male', '{true,true,false,true,true,true,false}',
     '在河南省第一监狱医院工作11年', '武汉大学口腔医学院博士毕业'],
    ['15680761592', 'JctxYPh', 'UlcnkBMV8@vGb.com', '沈醪', 57, 'male', '{true,false,true,true,true,true,true}',
     '在雄县中医院工作28年', '西北民族大学本科毕业'],
    ['13250637142', '8E3lBSmOV', '4dPVY0iD@0Pq.com', '屈林', 41, 'male', '{true,false,false,true,false,false,true}',
     '在商丘市第一人民医院工作12年', '兰州大学医学院硕士毕业'],
    ['13289310254', '6Qyouw4ZNSRJ', 'J4TR70q3@Qi.com', '汪琪', 40, 'male', '{false,false,true,false,true,false,false}',
     '在陕西省红十字医院工作15年', '湘南医学高等专科学校专科毕业'],
    ['15172851496', 'EOUInm', 'V0x7BqtbH@YV.com', '禹裨', 46, 'male', '{false,false,false,true,false,true,false}',
     '在神木县妇幼保健站工作19年', '湖南中医药大学湘杏学院本科毕业'],
    ['18903471592', 'NXiOzgdI9STh', 'Ivh8jxrG@3cW.com', '贝鹏', 43, 'male', '{false,true,false,true,true,true,true}',
     '在义乌市新法风湿病医院工作14年', '河北联合大学冀唐学院硕士毕业'],
    ['15914739058', 'ZP6oQye', '5zVQaY@Tz1.com', '杨燮', 45, 'male', '{true,true,true,false,true,true,true}',
     '在克拉玛依市金龙医院工作19年', '湖北中医药高等专科学校专科毕业'],
    ['18274310928', 'EMhGm90', '4LgEFMPy@px.com', '祁辛', 49, 'male', '{true,true,true,true,false,false,true}',
     '在西平县人民医院工作20年', '西北民族大学本科毕业'],
    ['13402847163', '2KQIeZpq', 'ELAbwCy@nm.com', '沈典', 53, 'male', '{false,false,true,true,false,true,true}',
     '在鸡西市城子河区人民医院工作21年', '南京大学医学院硕士毕业'],
    ['15706394271', '3Q7ZRMvS4', '6eGHj@sRf.com', '汪陵', 52, 'male', '{false,true,false,false,false,false,true}',
     '在阿克苏市兵团农一师九团职工医院工作27年', '沧州医学高等专科学校专科毕业'],
    ['18058342176', '4AiI3XQFKBoz', 'knOIoj@LIp.com', '卫逶输', 40, 'male', '{true,true,false,false,false,true,false}',
     '在亳州市恒康医院工作8年', '泰山医学院硕士毕业'],
    ['15235876294', 'VPGE7e9g6', 'Duph5Ol@xUe.com', '熊卫龙', 60, 'male', '{false,false,true,true,true,true,false}',
     '在温州市中西医结合医院工作30年', '甘肃卫生职业学院本科毕业'],
    ['15261850479', 'eC3H0FnawSYp', 'N6hKdV@NUS.com', '纪铠奕', 37, 'male', '{false,true,true,true,false,false,true}',
     '在盘县特区中医院工作9年', '遵义医药高等专科学校专科毕业'],
    ['13275241603', '3Nval6', '7MUOEjKdg@3xw.com', '钱逶', 51, 'male', '{true,false,true,true,false,false,false}',
     '在辽阳县中医院工作24年', '四川医科大学本科毕业'],
    ['18214260983', 'gLla4UQ1p9', '07YILy9q@fL.com', '宋襦', 44, 'male', '{false,false,false,false,false,false,false}',
     '在九台市铁北医院工作13年', '皖西卫生职业学院博士毕业'], ['18298670521', 'OHRnqMy6aKdB', 'Z6zPhqQx3@dIo.com', '朱毫藤', 50, 'male',
                                        '{true,false,false,true,false,true,true}', '在内蒙古平计矿务局总医院工作18年', '贵阳市卫生学校硕士毕业'],
    ['15853482169', 'xEkoV8OU', '5bzyF@XC.com', '戴噎', 60, 'male', '{false,true,false,true,true,false,true}',
     '在成都口腔医院工作31年', '沈阳医学院本科毕业'],
    ['18019368750', 'rZme0nUPVL', 'TAm0jEhe@LpM.com', '计思文', 52, 'male', '{true,false,true,true,false,true,false}',
     '在陆良县妇幼保健院工作20年', '华中科技大学同济医学院硕士毕业'],
    ['13930786491', 'MeoUKxBuANl', 'XBK2PIs@p5.com', '蒋亦俯', 57, 'male', '{false,false,true,true,false,false,true}',
     '在井陉矿务局医院工作28年', '云南大学医学院本科毕业'],
    ['18518207469', 'UIzEphd', 'jYCp0mWNz@o1.com', '朱昱铭', 54, 'male', '{true,true,false,true,false,false,false}',
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
    ['15603928476', 'lsW2Ui804r', 'lcA6HMshF@ncG.com', '伏壤习', 39, 'male', '{false,true,false,false,true,true,false}',
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
    ['18832967508', 'cYxH7C', 'hkvyNrzep@N2b.com', '舒纬', 56, 'male', '{true,false,true,true,false,true,false}',
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
    ['13261894237', 'md2uW9', 'Ay7q1I@m7.com', '项前荪', 52, 'male', '{false,false,false,false,false,false,false}',
     '在瓦房店市第五人民医院工作22年', '南方医科大学博士毕业'],
    ['13532097481', 'zdbOu2NZr6W', 'yN5jXcuB@CNQ.com', '禹仨', 59, 'male', '{false,true,true,false,false,true,false}',
     '在重庆沙坪坝区井口医院工作28年', '四川护理职业学院博士毕业'],
    ['15627341856', 'ypMS5YPBw', '7EOzD@AM.com', '邵牢脱', 42, 'male', '{true,true,true,true,true,true,true}',
     '在河南省第六建筑工程公司职工医院工作9年', '四川医科大学博士毕业'],
    ['15512430968', 'CkjrDfz8', '7c84yKNm@j9x.com', '李拚漯', 48, 'male', '{true,false,true,false,true,true,true}',
     '在西安华厦医院工作16年', '浙江中医药大学滨江学院硕士毕业'],
    ['17403957784', 'DK+xR5D*', 'vfero.maly@cronx.com', '邓俊智', 33, 'male', '{false,false,true,true,true,true,false}',
     '任浙江省第一医院医师5年', '浙江大学医学院博士毕业'],
    ['15618362709', '0iUJSaCp', 'N97ig2G@r7.com', '舒管', 36, 'female', '{true,true,false,true,false,false,false}',
     '在青海省中医院青海省中西医结合医院工作4年', '苏州大学医学部硕士毕业'],
    ['15767314809', 'X6gFOTwh3', 'DXjWPV5@guM.com', '明鍪', 40, 'female', '{true,true,true,false,true,true,true}',
     '在哈尔滨市老年病医院工作11年', '运城护理职业学院硕士毕业'],
    ['15325913407', 'k4rKiVNq', 'lypPZUJ@Zi.com', '冯学暗', 44, 'male', '{false,false,true,true,false,true,false}',
     '在万州区侨康医院工作12年', '沈阳药科大学硕士毕业'],
    ['15201724695', 'mR5rkq4VS', 'o6EUa@HP.com', '臧旃', 42, 'female', '{true,true,true,false,true,false,true}',
     '在盈江县妇幼保健站工作12年', '深圳大学医学部本科毕业'],
    ['15604153672', 'tJCELAx3Mo', 'UWCH0AQOL@37.com', '明系入', 57, 'male', '{true,false,false,false,false,false,true}',
     '在鞍山市第四医院鞍山市肿瘤医院工作27年', '贵阳市卫生学校博士毕业'],
    ['13381692453', 'pINqyx0tn6uA', 'tdcvjIAZP@NyR.com', '孙平风', 58, 'male', '{false,true,false,false,true,false,false}',
     '在临汾铁路医院工作31年', '中国人民解放军福州医学高等专科学校专科毕业'],
    ['18505976812', 'Cc3AX2JHYP', 'PMuGhnN@qG.com', '祝青', 58, 'female', '{true,false,true,true,false,true,false}',
     '在兴化市第二人民医院工作26年', '广西中医药大学硕士毕业'],
    ['15525361849', '9PShaC', 'lb6VfvHs@mw.com', '宋循', 40, 'male', '{false,false,true,false,true,true,false}',
     '在海伦市结核病防治所工作9年', '山西医科大学博士毕业'],
    ['15836508412', 'aAVXkcWCt0', 'XdTgef@93.com', '禹仞凉', 48, 'male', '{false,false,true,false,true,false,false}',
     '在江浦县人民医院工作23年', '揭阳医学高等专科学校专科毕业'],
    ['15890153287', '2x9p8YM', 'x9KLCt@V5K.com', '李篦', 59, 'female', '{false,false,true,true,false,true,false}',
     '在伊克昭盟妇幼保健院工作27年', '运城护理职业学院硕士毕业'],
    ['18960289437', 'kKOHp5bA', 'CW2T6kwO@UX.com', '褚婧童', 36, 'female', '{false,true,false,true,true,false,true}',
     '在宿州市妇幼保健站工作6年', '成都中医药大学硕士毕业'],
    ['13935784962', '9yjk4pFos', '6ry2WX@nbx.com', '陈霄', 53, 'female', '{true,false,true,false,false,false,true}',
     '在邗江县中医院工作25年', '中国医科大学临床医药学院本科毕业'],
    ['15269240735', '9yZtU3puGL', 'wgf7VCZPj@doe.com', '项隆', 36, 'male', '{false,false,false,false,false,false,true}',
     '在安康市中医院工作9年', '井冈山大学临床医学院本科毕业'],
    ['18803194258', '0cHqSbVgnR', '4MmOqdIZ@b4.com', '杨逞', 43, 'male', '{true,true,false,false,false,false,true}',
     '在西安市眼科医院工作12年', '甘肃医学院博士毕业'],
    ['13310368794', '73ZO8HWh', 'U0a4MsXOj@MLA.com', '姚鲷', 43, 'female', '{false,false,false,false,true,false,true}',
     '在清涧县妇幼保健站工作12年', '中国医科大学临床医药学院硕士毕业']
]

patient_data = [
    ['16741957248', '4j$^Y3Pf', 'wstylo.bleu02@customright.com', '吕才艺', 82, 'male'],
    ['17404133919', '-R6Zr#<U', '8secreta@alibaba.cd', '陈婧', 14, 'female'],
    ['14749815233', 'R8v{]qkx', 'tsaefho64i@kittiza.com', '范思楠', 19, 'male'],
    ['17400217949', 'a9Sh}hYF', '8ibrahim.kha@bookstorage.site', '蔡依玉', 20, 'female'],
    ['15280924959', '57R4W#qc', 'nleonardo.b@activelywell.com', '蒋勰', 34, 'male']
]

sql_doctor_wildcard = '''DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('{username}', 
        crypt('{password}', gen_salt('bf')), '{email}', 'doctor', '{true_name}', {age}, '{gender}')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '{department}'
          AND hospital_name = '{hospital}'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{arrangement}', '{department}', '{experience}', '{education}', {score}, {capacity});

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;\n'''

sql_patient_wildcard = '''
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('{username}', 
        crypt('{password}', gen_salt('bf')), '{email}', 'patient', '{true_name}', {age}, '{gender}');
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = '{email}';
'''


def gen(sql_file):
    sql_file.write("\n-- 初始化 doctor\n")
    for row in doctor_data:
        sql_file.write(
            sql_doctor_wildcard.format(username=row[0], password=row[1], email=row[2], true_name=row[3], age=row[4],
                                       gender=row[5], arrangement=row[6], department=choice(department_data),
                                       hospital=choice(hospital_data)[0], experience=row[7], education=row[8], score=uniform(1.0, 10.0), capacity=10))

    sql_file.write("\n-- 初始化 patient\n")
    for row in patient_data:
        sql_file.write(sql_patient_wildcard.format(username=row[0], password=row[1], email=row[2], true_name=row[3], age=row[4], gender=row[5]))