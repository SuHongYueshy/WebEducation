package com.ethan.entity;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class Dept {
    private int dept_id;
    private String dept_num;
    private String dept_name;
    private String dept_explain;

    public Dept() {
    }

    public Dept(int dept_id, String dept_num, String dept_name, String dept_explain) {
        this.dept_id = dept_id;
        this.dept_num = dept_num;
        this.dept_name = dept_name;
        this.dept_explain = dept_explain;
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

    @Override
    public String toString() {
        return "Dept{" +
                "dept_id=" + dept_id +
                ", dept_num='" + dept_num + '\'' +
                ", dept_name='" + dept_name + '\'' +
                ", dept_explain='" + dept_explain + '\'' +
                '}';
    }
}
