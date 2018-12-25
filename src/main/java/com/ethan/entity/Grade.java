package com.ethan.entity;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class Grade {
    private int grade_id;
    private int grade_stuId;
    private int grade_courseId;
    private float grade_grade;
    private int grade_itemId;
    private String grade_explain;

    public Grade() {
    }

    public Grade(int grade_id, int grade_stuId, int grade_courseId, float grade_grade, int grade_itemId, String grade_explain) {
        this.grade_id = grade_id;
        this.grade_stuId = grade_stuId;
        this.grade_courseId = grade_courseId;
        this.grade_grade = grade_grade;
        this.grade_itemId = grade_itemId;
        this.grade_explain = grade_explain;
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

    public int getGrade_itemId() {
        return grade_itemId;
    }

    public void setGrade_itemId(int grade_itemId) {
        this.grade_itemId = grade_itemId;
    }

    public String getGrade_explain() {
        return grade_explain;
    }

    public void setGrade_explain(String grade_explain) {
        this.grade_explain = grade_explain;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "grade_id=" + grade_id +
                ", grade_stuId=" + grade_stuId +
                ", grade_courseId=" + grade_courseId +
                ", grade_grade=" + grade_grade +
                ", grade_itemId=" + grade_itemId +
                ", grade_explain='" + grade_explain + '\'' +
                '}';
    }
}
