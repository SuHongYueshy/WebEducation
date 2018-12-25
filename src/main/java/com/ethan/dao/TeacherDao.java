package com.ethan.dao;

import com.ethan.entity.AllEntity;
import com.ethan.entity.Teacher;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public interface TeacherDao {

    public List<AllEntity> allTeacher(Teacher teacher, int page, int rows) throws SQLException;

    public int teacherCount(Teacher teacher) throws SQLException;

    public int updateTea(Teacher teacher) throws SQLException;

    public  int deleteTea(String ids) throws SQLException;

    public  int addTea(Teacher teacher) throws SQLException;
}
