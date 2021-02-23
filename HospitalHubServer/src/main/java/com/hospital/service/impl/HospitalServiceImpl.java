package com.hospital.service.impl;

import com.hospital.dao.HospitalDOMapper;
import com.hospital.dao.PatientDOMapper;
import com.hospital.dao.dataobject.HospitalDO;
import com.hospital.service.HospitalService;
import com.hospital.service.model.DepartmentModel;
import com.hospital.service.model.HospitalModel;
import com.hospital.service.model.UserModel;
import net.sf.json.JSONObject;
import org.gavaghan.geodesy.Ellipsoid;
import org.gavaghan.geodesy.GeodeticCalculator;
import org.gavaghan.geodesy.GlobalCoordinates;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class HospitalServiceImpl implements HospitalService {

    /**
     * http://lbsyun.baidu.com/apiconsole/key
     * <百度开发者>用户申请注册的key，自v2开始参数修改为“ak”，之前版本参数为“key” 申请ak
     */
    final static String AK = "k6kbDxaYrYiK1fxXPOEtzH2GtBXQdKVp";


    /**
     * 地理编码 URL
     */
    final static String ADDRESS_TO_LONGITUDEA_URL = "http://api.map.baidu.com/geocoding/v3/?output=json&location=showLocation";


    @Autowired
    private HospitalDOMapper hospitalDOMapper;

    @Autowired
    private PatientDOMapper patientDOMapper;

    @Override
    public List<HospitalDO> getHospitalList() {
        return hospitalDOMapper.getHospitalList();
    }

    @Override
    public List<Integer> getDepartmentIdList(Integer hospitalId) {
        return hospitalDOMapper.getDepartmentIdList(hospitalId);
    }

    @Override
    public List<DepartmentModel> getDepartmentList(List<Integer> departmentIdList) {
        List<DepartmentModel> departmentModelList = departmentIdList.stream().map(departmentId->{
            DepartmentModel departmentModel = new DepartmentModel();


            return departmentModel;
        }).collect(Collectors.toList());
        return departmentModelList;
    }

    @Override
    public List<HospitalModel> getHospitalModelList(UserModel userModel) {
        String user_address = patientDOMapper.selectByUserId(userModel.getUserId()).getPatientAddress();
        List<HospitalDO> hospitalList = hospitalDOMapper.getHospitalList();
        List<HospitalModel> hospitalModelList = hospitalList.stream().map(hospitalDO -> {
            HospitalModel hospitalModel = new HospitalModel();
            BeanUtils.copyProperties(hospitalDO, hospitalModel);
            if(user_address == null){
                return hospitalModel;
            }
            String hospital_address = hospitalDO.getHospitalAddress();
            String user_url = ADDRESS_TO_LONGITUDEA_URL + "&ak=" + AK + "&address="+ user_address;
            String hospital_url = ADDRESS_TO_LONGITUDEA_URL + "&ak=" + AK + "&address="+ hospital_address;
            try {
                String user_json = loadJSON(user_url);
                String hospital_json = loadJSON(hospital_url);
                JSONObject user_obj = JSONObject.fromObject(user_json);
                JSONObject hospital_obj = JSONObject.fromObject(hospital_json);
                double user_lng = user_obj.getJSONObject("result").getJSONObject("location").getDouble("lng");
                double user_lat = hospital_obj.getJSONObject("result").getJSONObject("location").getDouble("lat");
                double hospital_lng = user_obj.getJSONObject("result").getJSONObject("location").getDouble("lng");
                double hospital_lat = user_obj.getJSONObject("result").getJSONObject("location").getDouble("lat");
                Double distance = getDistance(user_lng, user_lat, hospital_lng, hospital_lat);
                hospitalModel.setDistance(distance/1000);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return hospitalModel;
        }).collect(Collectors.toList());
        return hospitalModelList;
    }

    private Double getDistance(double user_lng, double user_lat, double hospital_lng, double hospital_lat) {
        GlobalCoordinates source = new GlobalCoordinates(user_lat, user_lng);
        GlobalCoordinates target = new GlobalCoordinates(hospital_lat, hospital_lng);
        return new GeodeticCalculator().calculateGeodeticCurve(Ellipsoid.Sphere, source, target).getEllipsoidalDistance();
    }

    private String loadJSON(String user_url) throws IOException {
        StringBuilder json = new StringBuilder();
            URL oracle = new URL(user_url);
            URLConnection yc = oracle.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
            String inputLine = null;
            while ((inputLine = in.readLine()) != null)
            {
                json.append(inputLine);
            }
            in.close();
        return json.toString();
    }

}

