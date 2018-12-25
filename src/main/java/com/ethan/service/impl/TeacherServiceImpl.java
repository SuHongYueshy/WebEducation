package com.ethan.service.impl;

import com.ethan.dao.TeacherDao;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Teacher;
import com.ethan.factory.Factory;
import com.ethan.service.TeacherService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class TeacherServiceImpl implements TeacherService {
    TeacherDao teacherDao = Factory.getTeacherDaoInstance();

    @Override
    public List<AllEntity> allTeacher(Teacher teacher, int page, int rows) throws SQLException {
       List<AllEntity> allTeachers = null;
        allTeachers = teacherDao.allTeacher(teacher, page, rows);
        return allTeachers;
    }

    @Override
    public int teacherCount(Teacher teacher) throws SQLException {
       int code =0;
        code = teacherDao.teacherCount(teacher);

        return code;
    }

    @Override
    public int updateTea(Teacher teacher) throws SQLException {
       int code = 0;
        code = teacherDao.updateTea(teacher);

        return code;
    }

    @Override
    public int deleteTea(String ids) throws SQLException {
        int code = 0;
        code = teacherDao.deleteTea(ids);

        return code;
    }

    @Override
    public int addTea(Teacher teacher) throws SQLException {
        int code = 0;
        code = teacherDao.addTea(teacher);
        return code;
    }
}
