import jieba

def is_chinese(uchar):
    if u'\u4e00' <= uchar <= u'\u9fa5':
        return True
    else:
        return False


def filt(content):
    content_str = ''
    for i in content:
        if is_chinese(i):
            content_str += i
    return content_str


def dropStop(Tofilter):
    clean = []
    for i in Tofilter[0]:
        if i not in stopW:
            clean.append(i)
    return clean


def preProcess(fileContent):
    content = fileContent.split('\n')
    words_list = []
    for line in content:
        words_list.append(filt(line))
    words_list = list(map(lambda s: list(jieba.cut(s)), words_list))
    # words_list= list(words_list)
#     words_list = dropStop(words_list)
    return words_list


def compare(myList):
    return len(myList)