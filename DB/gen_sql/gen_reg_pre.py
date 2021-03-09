from gen_user import patient_data
from gen_user import doctor_data
from random import choice

prescription_detail_list = [
    '''
临床诊断： 社区获得性肺炎
R： 皮试阴性 阿莫西林胶囊 0.25×24粒
Sig： 0.5 q.8h p.o
阿奇霉素分散片 0.25×6片
Sig： 0.5 q.d p.o
社区获得性肺炎应选用能覆盖肺炎链球菌、流感嗜血杆菌的药物，如广谱青霉素类抗菌药阿莫西林，需要时加用对肺炎支原体、肺炎衣原体、军团菌属等细胞内病原体有效的药物 ,如大环内酯类抗菌药。
    ''',
    '''
临床诊断：胃癌晚期疼痛
R： 硫酸吗啡缓释片 30mg×30片
Sig： 30mg q.12h p.o
晚期癌症长期使用阿片类镇痛药(如吗啡)，无极量限制，即应根据个体对吗啡等阿片类镇痛药的耐受程度决定用药剂量，但应严密注意监控不良反应。注射剂处方1次不超过3日用量，控（缓）释制剂处方1次不超过15日剂量，其他剂型的吗最药品处方1次不超过7日用量。
    ''',
    '''
临床诊断：胃、十二指肠溃疡
处方1 R：奥美拉唑肠溶片 10mg×28片
Sig： 20mg q.d p.o
复方铝酸铋颗粒 1.3g×18包×2盒
Sig： 1.3g t.i.d p.o
克拉霉素缓释片 0.5g×3片×4盒
Sig： 0.5g q.d p.o
即：止酸剂（H2受体拮抗剂或质子泵抑制剂）+胃黏膜保护剂（如复方铝酸铋颗粒、枸橼酸铋钾胶囊） + 抗菌药（如甲硝唑、克拉霉素、阿莫西林等）。甲硝唑等应在餐后服用，以避免出现胃肠刺激症状；食物会延缓克拉霉素的吸收，因此在餐前空腹服用效果最佳；而阿莫西林不受食物影响，服用时间无限制。
处方1 R：奥美拉唑肠溶片 10mg×28片
Sig： 20mg q.d p.o
克拉霉素缓释片 0.5g×3片×4盒
Sig： 0.5g q.d p.o
甲硝唑片 0.2×72片
Sig： 0.4g t.i.d p.o
    ''',
    '''
临床诊断：急性出血性结膜炎（红眼病）
R： Inj N.S 500ml
Sig： 适量冲洗 一日四次
0.1%阿昔洛韦滴眼液 8ml
Sig： 2滴 q.2h O.U
0.25%氯霉素滴眼液 5ml
Sig： 2滴 q.2h O.U
急性出血性结膜炎常由病毒感染引起，眼部的分泌物为水样或浆液样，多合并角膜损害和耳前淋巴结肿大，并伴有结膜下出血。抗菌药滴眼剂与抗病毒药合用，以预防继发感染。
    ''',
    '''
临床诊断： 甲状腺亢进
R： 甲巯咪唑片 5mg×100片
Sig： 10mg t.i.d p.o
复合维生素B片 100片
Sig： 2片 t.i.d p.o
维生素B4片 10mg×50片
Sig： 10mg t.i.d p.o
    ''',
    '''
临床诊断：腹泻
R： Inj G.N.S 500ml
维生素C针 0.5×6 ×2
维生素B6针 0.1×3
Sig： i.v.gtt b.i.d
蒙脱石散 3g×6包
Sig： 3g t.i.d p.o
由病毒感染引起的腹泻主要症状是单纯水泻，没有脓血和大量粘液，显微镜下检查，也没有大量的白细胞和红细胞，治疗方法为：补液+止泻药。
由细菌感染引起的腹泻，大便中常含有大量的粘液，甚至脓血，显微镜下检查，也常有较多的白细胞和红细胞，治疗方法为：补液+抗菌药。
如是细菌性肠炎引起的腹泻，须尽快有针对性地使用抗菌药治疗，仅用收敛止泻药则会导致细菌毒素在肠道内难以排出，出现腹痛、高烧等症状。
    ''',
    '''
临床诊断：化脓性扁桃体炎
R： Inj N. S 100ml ×6
皮试阴性 注射用青霉素G钠 400万u
Sig： i.v.gtt q.12h.
8. 临床诊断：高血压
R： 贝尼地平片 2 mg×24片
Sig： 2mg q.d p.o
雷米普利片 2.5 mg×14片
Sig： 2.5mg q.d p.o
氢氯噻嗪片 25 mg×14片
Sig： 12.5mg q.d p.o
高血压伴冠心病，可联用倍他乐克片+依那普利片+肠溶阿司匹林片进行治疗，其中倍他乐克片除具有降压作用外，还具有预防冠心病、心绞痛及抗心律失常的作用；依那普利片主要用于预防高血压患者出现心室肥厚及高血压的其他并发症；肠溶阿司匹林片具有很好的抗血小板聚集的作用，主要用于预防心脑血管梗塞。
高血压病须根据发病的不同阶段、不同病症，分别采取个体化用药、联合用药的方法进行治疗。
    ''',
    '''
临床诊断：牙周炎
R： 替硝唑片 0.5×6片
Sig： 0.5 q.12h p.o
阿莫西林胶囊 0.25×24粒
Sig： 0.5 q.8h p.o
    ''',
    '''
临床诊断：食道癌晚期
R： Inj N. S 500ml
注射用顺铂 10mg×2支 ×5
氟尿嘧啶注射液 0.25×4支
Sig： i.v.gtt q.d.
临用前以0.9%氯化钠注射液溶解，氟尿嘧啶按1000mg/m2.d，顺铂按20mg/m2.d，连用5天。间隔3-4周可重复用药。为防止其肾脏毒性，在用药前后，可采用大量输液的水化疗法，以降低顺铂的血浆浓度，增加其肾脏清除率；并可加用甘露醇，以加速肾脏的排泄功能，减少顺铂在肾小管中的积聚。
    ''',
    '''
临床诊断：上呼吸道感染
R： 清热解毒软胶囊 20粒×2盒
用法： 2粒 一日三次 口服
急支糖浆 100毫升
用法：10毫升 一日三次 口服
    ''',
    '''
临床诊断：原发性肾病综合征
R： 黄 芪9 当 归6 白花蛇舌草9 穴 富3
生 地3 白 术3 山萸肉3 茯 苓6
白茅根6 川 芎6 丹 参3 红 花3
三 付
用 法：每日一付 水煎服.
草药处方的书写，须按照“君、臣、佐、使”的顺序排列；对调剂、煎煮的特殊要求的，应在药品右上方注明，并加括号，如布包、先煎、后下等；对饮片的产地、炮制有特殊要求的，要在药品名称之前写明；毒性中药饮片，在处方未注明“生用”的，应给付炮制品。
    '''
]

sql_wildcard = '''DO
$$
    DECLARE
        tmp_patient_id      INT;
        tmp_doctor_id       INT;
        tmp_hospital_id     INT;
        tmp_department_id   INT;
        tmp_registration_id TEXT;
    BEGIN
        SELECT patient_user.user_id, doctor_user.user_id, hospital_id, department_id
        INTO tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id
        FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user, doctor
        WHERE patient_user.username = '{patient_username}' AND doctor_user.username = '{doctor_username}' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id, prescription_detail) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id, '{prescription_detail}');
    END
$$;\n
'''


def gen(sql_file, n):
    sql_file.write("\n-- 初始化 registration\n")
    for it in range(n):
        sql_file.write(sql_wildcard.format(patient_username=choice(patient_data)[0],
                                           doctor_username=choice(doctor_data)[0],
                                           prescription_detail=choice(prescription_detail_list)))
        sql_file.write('\n')
