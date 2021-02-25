package com.hospital.response;

public class CommonReturnType {

    public static final String CONTENT_TYPE_FROMED = "application/x-www-form-urlencoded";
    public static final String DEFAULT_PORTRAIT_URL = "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2561659095,299912888&fm=26&gp=0.jpg";
    public static final String DOCTOR = "doctor";
    public static final String PATIENT = "patient";

    private String status;
    private String tag;
    //如果status=success，则data内返回前端需要的json数据
    //如果status=fail，则data内使用通用的错误码格式
    private Object data;

    //定义一个通用的创建方法
    public static CommonReturnType create(String tag, Object result) {
        return CommonReturnType.create(result, tag, "success");
    }

    public static CommonReturnType create(Object result, String tag, String status) {
        CommonReturnType type = new CommonReturnType();
        type.setStatus(status);
        type.setTag(tag);
        type.setData(result);
        return type;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}
