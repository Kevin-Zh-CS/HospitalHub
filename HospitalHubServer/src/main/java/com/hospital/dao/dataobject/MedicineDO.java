package com.hospital.dao.dataobject;

public class MedicineDO {

    private Integer medicineId;

    private String medicineImageUrl;

    private String medicineName;

    private String packageQuantity;

    private Double medicinePrice;

    public Integer getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(Integer medicineId) {
        this.medicineId = medicineId;
    }

    public String getMedicineImageUrl() {
        return medicineImageUrl;
    }

    public void setMedicineImageUrl(String medicineImageUrl) {
        this.medicineImageUrl = medicineImageUrl == null ? null : medicineImageUrl.trim();
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName == null ? null : medicineName.trim();
    }


    public String getPackageQuantity() {
        return packageQuantity;
    }


    public void setPackageQuantity(String packageQuantity) {
        this.packageQuantity = packageQuantity == null ? null : packageQuantity.trim();
    }


    public Double getMedicinePrice() {
        return medicinePrice;
    }


    public void setMedicinePrice(Double medicinePrice) {
        this.medicinePrice = medicinePrice;
    }
}