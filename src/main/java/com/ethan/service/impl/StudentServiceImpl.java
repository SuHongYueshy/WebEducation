package com.ethan.service.impl;

import com.ethan.dao.StudentDao;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Student;
import com.ethan.factory.Factory;
import com.ethan.service.StudentService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class StudentServiceImpl implements StudentService {
    StudentDao studentDao = Factory.getStudentDaoInstance();

    @Override
    public List<AllEntity> allStudent(Student student, String bbirth, String ebirth, int page, int rows) throws SQLException {
        List<AllEntity> allstudents = null;
        allstudents = studentDao.allStudent(student,bbirth,ebirth,page,rows);

        return allstudents;
    }

    @Override
    public int addStudent(Student student) throws SQLException {
       int code = 0;
       code =  studentDao.addStudent(student);
        return code;
    }

    @Override
    public int deleteStudent(String ids) throws SQLException {
        int code =0;
        code = studentDao.deleteStudent(ids);
        return code;
    }

    @Override
    public int updateStudent(Student student) throws SQLException {
        int code = 0;
        code = studentDao.updateStudent(student);

        return code;
    }

    @Override
    public int stuCount(Student student, String bbirth, String ebirth) throws SQLException {
        int code =0;
        code =studentDao.stuCount(student, bbirth, ebirth);

        return code;
    }
}
