package com.ethan.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class Student {
    private int stu_id;
    private String stu_num;
    private String stu_name;
    private String stu_sex;
    @JSONField(format = "yyyy-MM-dd")
    private Date stu_birth;
    private String stu_address;
    private int stu_deptId =-1;
    private  String stu_type;
    private String stu_stay;
    private  String stu_phone;
    private String stu_photo;

    public Student() {
    }

    public Student(int stu_id, String stu_num, String stu_name, String stu_sex, Date stu_birth, String stu_address, int stu_deptId, String stu_type, String stu_stay, String stu_phone, String stu_photo) {
        this.stu_id = stu_id;
        this.stu_num = stu_num;
        this.stu_name = stu_name;
        this.stu_sex = stu_sex;
        this.stu_birth = stu_birth;
        this.stu_address = stu_address;
        this.stu_deptId = stu_deptId;
        this.stu_type = stu_type;
        this.stu_stay = stu_stay;
        this.stu_phone = stu_phone;
        this.stu_photo = stu_photo;
    }

    public int getStu_id() {
        return stu_id;
    }

    public void setStu_id(int stu_id) {
        this.stu_id = stu_id;
    }

    public String getStu_num() {
        return stu_num;
    }

    public void setStu_num(String stu_num) {
        this.stu_num = stu_num;
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name;
    }

    public String getStu_sex() {
        return stu_sex;
    }

    public void setStu_sex(String stu_sex) {
        this.stu_sex = stu_sex;
    }

    public Date getStu_birth() {
        return stu_birth;
    }

    public void setStu_birth(Date stu_birth) {
        this.stu_birth = stu_birth;
    }

    public String getStu_address() {
        return stu_address;
    }

    public void setStu_address(String stu_address) {
        this.stu_address = stu_address;
    }

    public int getStu_deptId() {
        return stu_deptId;
    }

    public void setStu_deptId(int stu_deptId) {
        this.stu_deptId = stu_deptId;
    }

    public String getStu_type() {
        return stu_type;
    }

    public void setStu_type(String stu_type) {
        this.stu_type = stu_type;
    }

    public String getStu_stay() {
        return stu_stay;
    }

    public void setStu_stay(String stu_stay) {
        this.stu_stay = stu_stay;
    }

    public String getStu_phone() {
        return stu_phone;
    }

    public void setStu_phone(String stu_phone) {
        this.stu_phone = stu_phone;
    }

    public String getStu_photo() {
        return stu_photo;
    }

    public void setStu_photo(String stu_photo) {
        this.stu_photo = stu_photo;
    }
}
