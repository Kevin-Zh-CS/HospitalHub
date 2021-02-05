# Model设计</br>


#### Hospital（这是数据库的一张表，实际上没有这个model，系统管理员维护）</br>

hospital_id: String</br>
hospital_name: String //医院名称</br>
hospital_address: String //医院位置，订单系统要用</br>
department_id_list: ArrayList<String> //科室id列表</br>
</br>

#### DoctorModel:</br>

user_id: String </br>
username: String //业务中这里是电话号码</br>
password: String //数据库中需密文存储</br>
email: String</br>
balance: Integer</br>
portrait_url: String //头像url，找网络图或将本地照片上传云端</br>
order_id_list: ArrayList<String> //订单id列表</br>
tag: String //身份标识，极为重要</br>
true_name: String //医生需实名</br>
gender: String //性别</br>
age: Integer //年龄</br>
department_name: String //所属科室名 </br>
major: String //主治哪个方向</br>
hospital_name: String //所属医院名，foreign key </br>
experience: String //工作经历</br>
education: String //学历</br>
arrangement: ArrayList<DataTime> //排班信息，数据库中有datetime这个数据类型，java中也有这个类</br>
score: //类型待确定</br>
commen_id: ArrayList<String> //患者评价</br>
doctor_status: Boolean //在岗/不在岗</br>
type: String//专家医生或普通医生</br>
capacity: Integer //医生当日最大容量</br>
finish: Integer  //医生当日已经看完的病人数</br>
</br>

#### PatientModel:
user_id: String </br>
username: String</br>
password: String</br>
email: String</br>
balance: Integer</br>
portrait_url: String</br>
order_id_list: ArrayList<String></br>
tag: String //身份标识，极为重要</br>
true_name: String //患者需实名，注册的时候加上这一个</br>
gender: String //性别</br>
age: Integer //年龄</br>
registration_id_list: ArrayList<String> //挂号单id列表</br>
history: String //病史</br>
patient_address: String //家庭住址，订单系统要用</br>
</br>


#### RegistrationModel
registration_id: String //挂号单id，按照一定的规则生成20210204xxxx</br>
true_name: String</br>
gender: String</br>
age: Integer</br>
hospital_name: String //所属医院名，foreign key </br>
registration_time: DateTime //挂号时间</br>
department: String //科室名</br>
</br>

#### DepartmentModel

hospital_id: String</br>
department_id: String</br>
department_name: String</br>
doctor_id_list: ArrayList<String> //医生id列表</br>
remain: Integer //当日余量，最大容量是把本科室的医生个人余量求和</br>
waiting: Integer //还在等待的人数</br>

</br>


#### ProcessModel

registration_id: String //挂号单id，按照一定的规则生成20210204xxxx</br>
step_id: int //一次问诊中的第几步（第一个行程，第二个行程……</br>
doctor_id: String// 添加此行程的医生的user_id</br>
description: String// 医生对此行程的描述（去x楼xx房间do sth (拍片子...</br>
// 不一定要</br>
target_floor: int </br>
target_room: int</br>
accessory_name: String //附件名称</br>
accessory_url: String //可能并不需要（根据名称加其它信息如挂号单等可以推导出来</br>
state: bool // 行程状态，已经完成的为true，正在进行中的是false</br>
   // 只有正在进行中的那个行程允许编辑和删除</br>


</br>



#### OrderModel（就是处方）
order_id: String</br>
registration_id: String //挂号单id，按照一定的规则生成20210204xxxx</br>
patient_id: String //其实是PatientModel的user_id</br>
doctor_id: String //其实是DoctorModel的user_id</br>
medicine_id: String //药品id</br>
total_price: Integer //药品总价</br>
status: Integer //三种状态：未支付，已支付，已送达</br>
prescription: String //医生的处方建议</br>
order_time: DateTime //订单时间 </br>
patient_address: String //患者家庭住址（其实是冗余的）</br>
hospital_address: String //医院位置，订单系统要用（其实是冗余的）</br>
true_name: String //患者实名（其实是冗余的）</br>




#### CommentModel
comment_id: String //在DoctorModel中被引用</br>
patient_id: String //其实是PatientModel的user_id</br>
doctor_id: String //其实是DoctorModel的user_id</br>
content: String //内容</br>
publish_time: DateTime //发表时间</br>
</br>





#### ChatModel（聊天模型待探讨）
sender_id: String //发送者id</br>
reciever_id: String //接受者id</br>
content: Stirng //暂时只支持文本内容</br>
timestamp: Datetime //时间戳</br>
registration_id: String // 哪一个诊疗中的记录</br>




几点说明：</br>

1. 命名问题：本model层全都采用小写和下划线命名，在实际代码中都是驼峰命名，如nickName，portraitUrl,此处全部小写是方便数据库设计。在数据库设计中全部使用小写+下划线命名。</br>
2. 数据库分表注意规范，比如在PatientModel中，因为有多元属性registration_id_list，解决方案是单独建立一张user_id和registration_id的关系表，二者是一对多的关系</br>
3. 聊天记录的所需属性没有加进去，需讨论解决</br>
4. 聊天记录数据库设计参考：[https://blog.csdn.net/weixin_34198797/article/details/85995488?utm_medium=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-1.nonecase&depth_1-utm_source=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-1.nonecase](https://blog.csdn.net/weixin_34198797/article/details/85995488?utm_medium=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-1.nonecase&depth_1-utm_source=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-1.nonecase)</br>



