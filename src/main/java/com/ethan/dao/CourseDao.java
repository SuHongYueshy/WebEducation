package com.ethan.dao;

import com.ethan.entity.Course;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public interface CourseDao {

    public List<Course> allCourse(Course course, int page, int rows) throws SQLException;

    public int courseCount(Course course) throws SQLException;

    public int addCourse(Course course) throws SQLException;

    public int deleteCourse(String ids) throws SQLException;

    public int updateCourse(Course course) throws SQLException;
}
