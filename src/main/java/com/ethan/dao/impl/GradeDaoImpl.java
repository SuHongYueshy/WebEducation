package com.ethan.dao.impl;

import com.ethan.dao.GradeDao;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Grade;
import com.ethan.entity.Student;
import com.ethan.utils.StringUtil;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class GradeDaoImpl extends BaseDao implements GradeDao {
    @Override
    public List<AllEntity> allGrade(Grade grade, Student student, int page, int rows) throws SQLException {
        String sql = "select * from grade,stu,course,item where grade.grade_stuId=stu.stu_id and grade.grade_courseId=course.course_id and grade.grade_itemId=item.item_id";

        if(grade.getGrade_stuId()!=-1){
            sql +=" and grade.grade_stuId='"+grade.getGrade_stuId()+"'";
        }

        if(grade.getGrade_courseId()!=-1){
            sql +=" and grade.grade_courseId='"+grade.getGrade_courseId()+"'";
        }

        if(grade.getGrade_itemId()!=-1){
            sql +=" and grade.grade_itemId='"+grade.getGrade_itemId()+"'";
        }

        if(grade.getGrade_grade()!=-1){
            sql +=" and grade.grade_grade <'"+grade.getGrade_grade()+"'";
        }

        if(student.getStu_deptId()!=-1){
            sql +=" and stu.stu_deptId='"+student.getStu_deptId()+"'";
        }

        if(StringUtil.isNotEmpty(student.getStu_sex())){
            sql +=" and stu.stu_sex= '"+student.getStu_sex()+"'";
        }

        if (page > 0 && rows > 0) {
            sql += " limit " + (page - 1) * rows + "," + rows;
        }

        List<AllEntity> allgrades = queryRunner.query(sql,new BeanListHandler<AllEntity>(AllEntity.class));
        return allgrades;
    }

    @Override
    public int gradeCount(Grade grade) throws SQLException {
        String sql = "select count(*) from grade,stu,course,item where grade.grade_stuId=stu.stu_id and grade.grade_courseId=course.course_id and grade.grade_itemId=item.item_id";

        if(grade.getGrade_stuId()!=-1){
            sql +=" and grade.grade_stuId='"+grade.getGrade_stuId()+"'";
        }

        if(grade.getGrade_courseId()!=-1){
            sql +=" and grade.grade_courseId='"+grade.getGrade_courseId()+"'";
        }

        if(grade.getGrade_itemId()!=-1){
            sql +=" and grade.grade_itemId='"+grade.getGrade_itemId()+"'";
        }

        long total = queryRunner.query(sql,new ScalarHandler<>());
        return (int)total;
    }

    @Override
    public int addGrade(Grade grade) throws SQLException {
        String sql = "insert into grade(grade_stuId,grade_courseId,grade_grade,grade_itemId,grade_explain) values(?,?,?,?,?)";
        int code = 0;
        code =queryRunner.update(sql,grade.getGrade_stuId(),grade.getGrade_courseId(),grade.getGrade_grade(),grade.getGrade_itemId(),grade.getGrade_explain());
        return code;
    }

    @Override
    public int deleteGrade(String ids) throws SQLException {
        String sql = "delete from grade where grade_id in(" + ids + ")";
        int code=0;
        code = queryRunner.execute(sql);

        return code;
    }

    @Override
    public int updateGrade(Grade grade) throws SQLException {
       String sql = "update grade set grade_stuId=?,grade_courseId=?,grade_grade=?,grade_itemId=?,grade_explain=? where grade_id=?";
        int code = 0;
        code = queryRunner.update(sql,grade.getGrade_stuId(),grade.getGrade_courseId(),grade.getGrade_grade(),grade.getGrade_itemId(),grade.getGrade_explain(),grade.getGrade_id());
        return code;
    }
}
