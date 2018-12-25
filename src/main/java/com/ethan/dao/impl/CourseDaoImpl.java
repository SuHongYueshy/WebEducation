package com.ethan.dao.impl;

import com.ethan.dao.CourseDao;
import com.ethan.entity.Course;
import com.ethan.utils.StringUtil;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class CourseDaoImpl extends BaseDao implements CourseDao {
    @Override
    public List<Course> allCourse(Course course, int page, int rows) throws SQLException {
        String sql = "select * from course where 1=1";
        if(StringUtil.isNotEmpty(course.getCourse_num())){
            sql += " and course_num like '%" +course.getCourse_num()+ "%'";
        }
        if(StringUtil.isNotEmpty(course.getCourse_name())){
            sql += " and course_name like '%" +course.getCourse_name()+ "%'";
        }
        if(StringUtil.isNotEmpty(course.getCourse_type())){
            sql +=" and course_type='"+course.getCourse_type()+"'";
        }
        if(StringUtil.isNotEmpty(course.getCourse_exam())){
            sql +=" and course_exam='"+course.getCourse_exam()+"'";
        }
        if (page > 0 && rows > 0) {
            sql += " limit " + (page - 1) * rows + "," + rows;
        }
        List<Course> allCourses = queryRunner.query(sql ,new BeanListHandler<Course>(Course.class));
       return allCourses;
    }

    @Override
    public int courseCount(Course course) throws SQLException {
        String sql = "select count(*) from course where 1=1";
        if(StringUtil.isNotEmpty(course.getCourse_num())){
            sql += " and course.course_num like '%" +course.getCourse_num()+ "%'";
        }
        if(StringUtil.isNotEmpty(course.getCourse_name())){
            sql += " and course.course_name like '%" +course.getCourse_name()+ "%'";
        }
        if(StringUtil.isNotEmpty(course.getCourse_type())){
            sql +=" and course.course_type='"+course.getCourse_type()+"'";
        }
        if(StringUtil.isNotEmpty(course.getCourse_exam())){
            sql +=" and course.course_exam='"+course.getCourse_exam()+"'";
        }
       long total = queryRunner.query(sql,new ScalarHandler<>());
        return (int)total;
    }

    @Override
    public int addCourse(Course course) throws SQLException {
        String sql = "insert into course (course_num,course_name,course_type,course_exam,course_credit,course_explain) values(?,?,?,?,?,?)";
        int code = queryRunner.update(sql,course.getCourse_num(),course.getCourse_name(),course.getCourse_type(),course.getCourse_exam(),course.getCourse_credit(),course.getCourse_explain());
        return code;
    }

    @Override
    public int deleteCourse(String ids) throws SQLException {
        String sql = "delete from course where course_id in("+ids+")";
        int code = queryRunner.execute(sql);
        return code;

    }

    @Override
    public int updateCourse(Course course) throws SQLException {
        String sql = "update course set course_num=?,course_name=?,course_type=?,course_exam=?,course_credit=?,course_explain=? where course_id=?";
        int code = queryRunner.update(sql,course.getCourse_num(),course.getCourse_name(),course.getCourse_type(),course.getCourse_exam(),course.getCourse_credit(),course.getCourse_explain(),course.getCourse_id());
        return code;
    }
}
