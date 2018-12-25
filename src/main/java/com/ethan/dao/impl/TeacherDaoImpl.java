package com.ethan.dao.impl;

import com.ethan.dao.TeacherDao;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Teacher;
import com.ethan.utils.StringUtil;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class TeacherDaoImpl extends BaseDao implements TeacherDao {
    @Override
    public List<AllEntity> allTeacher(Teacher teacher, int page, int rows) throws SQLException {
        String sql = "select * from teacher,dept where teacher.teacher_deptId=dept.dept_id";
        if(StringUtil.isNotEmpty(teacher.getTeacher_num())){
            sql +=" and teacher.teacher_num like '%" +teacher.getTeacher_num()+ "%'";
        }
        if(StringUtil.isNotEmpty(teacher.getTeacher_name())){
            sql +=" and teacher.teacher_name like '%"+teacher.getTeacher_name()+"%'";
        }
        if(StringUtil.isNotEmpty(teacher.getTeacher_sex())){
            sql +=" and teacher.teacher_sex ='"+teacher.getTeacher_sex()+"'";
        }

        if(StringUtil.isNotEmpty(teacher.getTeacher_pro())){
            sql +=" and teacher.teacher_pro ='"+teacher.getTeacher_pro()+"'";
        }

        if(teacher.getTeacher_deptId()!=-1 ){
            sql +=" and teacher.teacher_deptId='"+teacher.getTeacher_deptId()+"'";
        }
        if (page > 0 && rows > 0) {
            sql += " limit " + (page - 1) * rows + "," + rows;
        }
        List<AllEntity> allTeachers = queryRunner.query(sql,new BeanListHandler<AllEntity>(AllEntity.class));
        return allTeachers;
    }

    @Override
    public int teacherCount(Teacher teacher) throws SQLException {
        String sql = "select count(*) from teacher,dept where teacher.teacher_deptId=dept.dept_id";
        if(StringUtil.isNotEmpty(teacher.getTeacher_num())){
            sql +=" and teacher.teacher_num like '%" +teacher.getTeacher_num()+ "%'";
        }
        if(StringUtil.isNotEmpty(teacher.getTeacher_name())){
            sql +=" and teacher.teacher_name like '%"+teacher.getTeacher_name()+"%'";
        }
        if(StringUtil.isNotEmpty(teacher.getTeacher_sex())){
            sql +=" and teacher.teacher_sex ='"+teacher.getTeacher_sex()+"'";
        }
        if(StringUtil.isNotEmpty(teacher.getTeacher_pro())){
            sql +=" and teacher.teacher_pro ='"+teacher.getTeacher_pro()+"'";
        }
        if(teacher.getTeacher_deptId()!=-1){
            sql +=" and teacher.teacher_deptId='"+teacher.getTeacher_deptId()+"'";
        }
        long count =queryRunner.query(sql,new ScalarHandler<>());
        return (int)count;
    }

    @Override
    public int updateTea(Teacher teacher) throws SQLException {
        String sql = "update teacher set teacher_num=?,teacher_name=?,teacher_sex=?,teacher_pro=?,teacher_deptId=? where teacher_id=?";
        int code = queryRunner.update(sql,teacher.getTeacher_num(),teacher.getTeacher_name(),teacher.getTeacher_sex(),teacher.getTeacher_pro(),teacher.getTeacher_deptId(),teacher.getTeacher_id());
        return code;
    }

    @Override
    public int deleteTea(String ids) throws SQLException {
        String sql = "delete from teacher where teacher_id in("+ids+")";
        int code = queryRunner.execute(sql);
        return code;
    }

    @Override
    public int addTea(Teacher teacher) throws SQLException {
       String sql = "insert into teacher(teacher_num,teacher_name,teacher_sex,teacher_pro,teacher_deptId) values(?,?,?,?,?)";
       int code = queryRunner.update(sql,teacher.getTeacher_num(),teacher.getTeacher_name(),teacher.getTeacher_sex(),teacher.getTeacher_pro(),teacher.getTeacher_deptId());
        return code;
    }

}
