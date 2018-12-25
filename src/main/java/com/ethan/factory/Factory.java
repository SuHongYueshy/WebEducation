package com.ethan.factory;

import com.ethan.dao.*;
import com.ethan.dao.impl.*;
import com.ethan.dbc.C3P0Util;
import com.ethan.entity.*;
import com.ethan.service.impl.*;
import org.apache.commons.dbutils.QueryRunner;

public class Factory {
    /**
     * 获取一个QueryRunner实例
     * @return QueryRunner
     */
    public static QueryRunner getQueryRunnerInstance() {
        return new QueryRunner(C3P0Util.getDataSource());
    }

    /**
     * 获取一个User实例
     *
     * @return User
     */
    public static User getUser() {
        return new User();
    }
    /**
     * 获取一个UserDaoImpl实例
     * @return UserDaoImpl
     */
    public static UserDao getUserDaoInstance() {
        return new UserDaoImpl();
    }


    /**
     * 获取一个UserServiceImpl实例
     * @return UserServiceImpl
     */
    public static UserServiceImpl getUserServiceInstance() {
        return new UserServiceImpl();
    }


    /**
     *
     * @return
     */
        public static Student getStudent() {
        return new Student();
    }
    public static StudentDao getStudentDaoInstance() {
        return new StudentDaoImpl();
    }
    public static StudentServiceImpl getStudentServiceInstance() {
        return new StudentServiceImpl();
    }


    public static Dept getDept() {
        return new Dept();
    }
    public static DeptDao getDeptDaoInstance() {
        return new DeptDaoImpl();
    }
    public static DeptServiceImpl getDeptServiceInstance() {
        return new DeptServiceImpl();
    }



    public static Teacher getTeacher() {
        return new Teacher();
    }
    public static TeacherDao getTeacherDaoInstance() {
        return new TeacherDaoImpl();
    }
    public static TeacherServiceImpl getTeacherServiceInstance() {
        return new TeacherServiceImpl();
    }



    public static Item getItem() {
        return new Item();
    }
    public static ItemDao getItemDaoInstance() {
        return new ItemDaoImpl();
    }
    public static ItemServiceImpl getItemServiceInstance() {
        return new ItemServiceImpl();
    }



    public static Course getCourse() {
        return new Course();
    }
    public static CourseDao getCourseDaoInstance() {
        return new CourseDaoImpl();
    }
    public static CourseServiceImpl getCourseServiceInstance() {
        return new CourseServiceImpl();
    }



    public static Teach getTeach() {
        return new Teach();
    }
    public static TeachDao getTeachDaoInstance() {
        return new TeachDaoImpl();
    }
    public static TeachServiceImpl getTeachServiceInstance() {
        return new TeachServiceImpl();
    }


    public static Grade getGrade() {
        return new Grade();
    }
    public static GradeDao getGradeDaoInstance() {
        return new GradeDaoImpl();
    }
    public static GradeServiceImpl getGradeServiceInstance() {
        return new GradeServiceImpl();
    }
}
