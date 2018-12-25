package com.ethan.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/**
 * Created by zhangwenyu on 2018/12/8.
 */
public class AllEntity {
    private int course_id;
    private  String course_num;
    private  String course_name;
    private  String course_type;
    private  String course_exam;
    private  float course_credit;
    private  String course_explain;

    private int dept_id = -1;
    private String dept_num;
    private String dept_name;
    private String dept_explain;

    private int grade_id;
    private int grade_stuId;
    private int grade_courseId;
    private float grade_grade;
    private String grade_itemId;
    private String grade_explain;

    private int item_id =-1;
    private String item_name;

    private int stu_id;
    private String stu_num;
    private String stu_name;
    private String stu_sex;
    @JSONField(format = "yyyy-MM-dd")
    private Date stu_birth;
    private String stu_address;
    private int stu_deptId;
    private  String stu_type;
    private String stu_stay;
    private  String stu_phone;
    private String stu_photo;

    private int teach_id;
    private int teach_teacherId;
    private int teach_courseId;
    private int teach_itemId;

    private int teacher_id;
    private String teacher_num;
    private String teacher_name;
    private String teacher_sex;
    private String teacher_pro;
    private int teacher_deptId;

    private int user_id;
    private String user_name;
    private String user_password;


    public AllEntity() {
    }

    public AllEntity(int course_id, String course_num, String course_name, String course_type, String course_exam, float course_credit, String course_explain, int dept_id, String dept_num, String dept_name, String dept_explain, int grade_id, int grade_stuId, int grade_courseId, float grade_grade, String grade_itemId, String grade_explain, int item_id, String item_name, int stu_id, String stu_num, String stu_name, String stu_sex, Date stu_birth, String stu_address, int stu_deptId, String stu_type, String stu_stay, String stu_phone, String stu_photo, int teach_id, int teach_teacherId, int teach_courseId, int teach_itemId, int teacher_id, String teacher_num, String teacher_name, String teacher_sex, String teacher_pro, int teacher_deptId, int user_id, String user_name, String user_password) {
        this.course_id = course_id;
        this.course_num = course_num;
        this.course_name = course_name;
        this.course_type = course_type;
        this.course_exam = course_exam;
        this.course_credit = course_credit;
        this.course_explain = course_explain;
        this.dept_id = dept_id;
        this.dept_num = dept_num;
        this.dept_name = dept_name;
        this.dept_explain = dept_explain;
        this.grade_id = grade_id;
        this.grade_stuId = grade_stuId;
        this.grade_courseId = grade_courseId;
        this.grade_grade = grade_grade;
        this.grade_itemId = grade_itemId;
        this.grade_explain = grade_explain;
        this.item_id = item_id;
        this.item_name = item_name;
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
        this.teach_id = teach_id;
        this.teach_teacherId = teach_teacherId;
        this.teach_courseId = teach_courseId;
        this.teach_itemId = teach_itemId;
        this.teacher_id = teacher_id;
        this.teacher_num = teacher_num;
        this.teacher_name = teacher_name;
        this.teacher_sex = teacher_sex;
        this.teacher_pro = teacher_pro;
        this.teacher_deptId = teacher_deptId;
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_password = user_password;
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

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }

    public String getDept_num() {
        return dept_num;
    }

    public void setDept_num(String dept_num) {
        this.dept_num = dept_num;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    public String getDept_explain() {
        return dept_explain;
    }

    public void setDept_explain(String dept_explain) {
        this.dept_explain = dept_explain;
    }

    public int getGrade_id() {
        return grade_id;
    }

    public void setGrade_id(int grade_id) {
        this.grade_id = grade_id;
    }

    public int getGrade_stuId() {
        return grade_stuId;
    }

    public void setGrade_stuId(int grade_stuId) {
        this.grade_stuId = grade_stuId;
    }

    public int getGrade_courseId() {
        return grade_courseId;
    }

    public void setGrade_courseId(int grade_courseId) {
        this.grade_courseId = grade_courseId;
    }

    public float getGrade_grade() {
        return grade_grade;
    }

    public void setGrade_grade(float grade_grade) {
        this.grade_grade = grade_grade;
    }

    public String getGrade_itemId() {
        return grade_itemId;
    }

    public void setGrade_itemId(String grade_itemId) {
        this.grade_itemId = grade_itemId;
    }

    public String getGrade_explain() {
        return grade_explain;
    }

    public void setGrade_explain(String grade_explain) {
        this.grade_explain = grade_explain;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
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

    public int getTeach_id() {
        return teach_id;
    }

    public void setTeach_id(int teach_id) {
        this.teach_id = teach_id;
    }

    public int getTeach_teacherId() {
        return teach_teacherId;
    }

    public void setTeach_teacherId(int teach_teacherId) {
        this.teach_teacherId = teach_teacherId;
    }

    public int getTeach_courseId() {
        return teach_courseId;
    }

    public void setTeach_courseId(int teach_courseId) {
        this.teach_courseId = teach_courseId;
    }

    public int getTeach_itemId() {
        return teach_itemId;
    }

    public void setTeach_itemId(int teach_itemId) {
        this.teach_itemId = teach_itemId;
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

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }
}
