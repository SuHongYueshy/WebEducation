package com.ethan.service.impl;

import com.ethan.dao.GradeDao;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Grade;
import com.ethan.entity.Student;
import com.ethan.factory.Factory;
import com.ethan.service.GradeService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class GradeServiceImpl implements GradeService {
    GradeDao gradeDao = Factory.getGradeDaoInstance();

    @Override
    public List<AllEntity> allGrade(Grade grade, Student student, int page, int rows) throws SQLException {
        List<AllEntity> allgrades = null;
        allgrades = gradeDao.allGrade(grade,student, page, rows);

        return allgrades;
    }

    @Override
    public int gradeCount(Grade grade) throws SQLException {
        int total = 0;
        total = gradeDao.gradeCount(grade);

        return total;
    }

    @Override
    public int addGrade(Grade grade) throws SQLException {
        int code = 0;
        code = gradeDao.addGrade(grade);

        return code;
    }

    @Override
    public int deleteGrade(String ids) throws SQLException {
        int code = 0;
        code = gradeDao.deleteGrade(ids);

        return code;
    }

    @Override
    public int updateGrade(Grade grade) throws SQLException {
        int code = 0;
        code = gradeDao.updateGrade(grade);

        return code;
    }
}
