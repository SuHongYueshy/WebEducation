package com.ethan.dao;

import com.ethan.entity.AllEntity;
import com.ethan.entity.Grade;
import com.ethan.entity.Student;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public interface GradeDao {

    public List<AllEntity> allGrade(Grade grade, Student student, int page, int rows) throws SQLException;

    public int gradeCount(Grade grade) throws SQLException;

    public int addGrade(Grade grade) throws SQLException;

    public int deleteGrade(String ids) throws SQLException;

    public int updateGrade(Grade grade)throws SQLException;

}
