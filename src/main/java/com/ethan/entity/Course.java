package com.ethan.entity;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class Course {
    private int course_id;
    private  String course_num;
    private  String course_name;
    private  String course_type;
    private  String course_exam;
    private  float course_credit;
    private  String course_explain;

    public Course() {
    }

    public Course(int course_id, String course_num, String course_name, String course_type, String course_exam, float course_credit, String course_explain) {
        this.course_id = course_id;
        this.course_num = course_num;
        this.course_name = course_name;
        this.course_type = course_type;
        this.course_exam = course_exam;
        this.course_credit = course_credit;
        this.course_explain = course_explain;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getCourse_num() {
        return course_num;
    }

    public void setCourse_num(String course_num) {
        this.course_num = course_num;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCourse_type() {
        return course_type;
    }

    public void setCourse_type(String course_type) {
        this.course_type = course_type;
    }

    public String getCourse_exam() {
        return course_exam;
    }

    public void setCourse_exam(String course_exam) {
        this.course_exam = course_exam;
    }

    public float getCourse_credit() {
        return course_credit;
    }

    public void setCourse_credit(float course_credit) {
        this.course_credit = course_credit;
    }

    public String getCourse_explain() {
        return course_explain;
    }

    public void setCourse_explain(String course_explain) {
        this.course_explain = course_explain;
    }
}
