package com.ethan.service;

import com.ethan.entity.AllEntity;
import com.ethan.entity.Student;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public interface StudentService {

    public List<AllEntity> allStudent(Student student, String bbirth, String ebirth, int page, int rows) throws SQLException;


    public int addStudent(Student student) throws SQLException;


    public int deleteStudent(String ids) throws SQLException;

    public int updateStudent(Student student) throws  SQLException;

    public int stuCount(Student student, String bbirth, String ebirth) throws SQLException;
}
