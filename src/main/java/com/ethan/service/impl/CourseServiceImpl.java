package com.ethan.service.impl;

import com.ethan.dao.CourseDao;
import com.ethan.entity.Course;
import com.ethan.factory.Factory;
import com.ethan.service.CourseService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class CourseServiceImpl implements CourseService {
    CourseDao courseDao = Factory.getCourseDaoInstance();

    @Override
    public List<Course> allCourse(Course course, int page, int rows) throws SQLException {
        List<Course> allCourses = null;
        allCourses = courseDao.allCourse(course, page, rows);

        return allCourses;
    }

    @Override
    public int courseCount(Course course) throws SQLException {
        int total = 0;
        total = courseDao.courseCount(course);

        return total;
    }

    @Override
    public int addCourse(Course course) throws SQLException {
        int code = 0;
        code = courseDao.addCourse(course);
        return code;
    }

    @Override
    public int deleteCourse(String ids) throws SQLException {
        int code = 0;
        code = courseDao.deleteCourse(ids);
        return code;
    }

    @Override
    public int updateCourse(Course course) throws SQLException {
        int code = 0;
        code = courseDao.updateCourse(course);
        return code;
    }
}
