package com.ethan.entity;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class Teacher {
    private int teacher_id;
    private String teacher_num;
    private String teacher_name;
    private String teacher_sex;
    private String teacher_pro;
    private int teacher_deptId =-1;

    public Teacher() {
    }

    public Teacher(int teacher_id, String teacher_num, String teacher_name, String teacher_sex, String teacher_pro, int teacher_deptId) {
        this.teacher_id = teacher_id;
        this.teacher_num = teacher_num;
        this.teacher_name = teacher_name;
        this.teacher_sex = teacher_sex;
        this.teacher_pro = teacher_pro;
        this.teacher_deptId = teacher_deptId;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTeacher_num() {
        return teacher_num;
    }

    public void setTeacher_num(String teacher_num) {
        this.teacher_num = teacher_num;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public String getTeacher_sex() {
        return teacher_sex;
    }

    public void setTeacher_sex(String teacher_sex) {
        this.teacher_sex = teacher_sex;
    }

    public String getTeacher_pro() {
        return teacher_pro;
    }

    public void setTeacher_pro(String teacher_pro) {
        this.teacher_pro = teacher_pro;
    }

    public int getTeacher_deptId() {
        return teacher_deptId;
    }

    public void setTeacher_deptId(int teacher_deptId) {
        this.teacher_deptId = teacher_deptId;
    }
}
