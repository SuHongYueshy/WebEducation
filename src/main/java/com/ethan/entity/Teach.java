package com.ethan.entity;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class Teach {
    private int teach_id;
    private int teach_teacherId;
    private int teach_courseId;
    private int teach_itemId;

    public Teach() {
    }

    public Teach(int teach_id, int teach_teacherId, int teach_courseId, int teach_itemId) {
        this.teach_id = teach_id;
        this.teach_teacherId = teach_teacherId;
        this.teach_courseId = teach_courseId;
        this.teach_itemId = teach_itemId;
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
}
