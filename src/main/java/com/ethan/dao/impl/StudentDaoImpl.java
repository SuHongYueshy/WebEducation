package com.ethan.dao.impl;

import com.ethan.dao.StudentDao;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Student;
import com.ethan.utils.StringUtil;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class StudentDaoImpl extends BaseDao implements StudentDao {
    @Override
    public List<AllEntity> allStudent(Student student, String bbirth, String ebirth, int page, int rows) throws SQLException {
        String sql = "select * from stu,dept where stu.stu_deptId=dept.dept_id ";
        if(StringUtil.isNotEmpty(student.getStu_num())){
            sql += " and stu.stu_num like '%" +student.getStu_num()+ "%'";
        }
        if(StringUtil.isNotEmpty(student.getStu_name())){
            sql += " and stu.stu_name like '%" +student.getStu_name()+ "%'";
        }
        if(StringUtil.isNotEmpty(student.getStu_sex())){
            sql +=" and stu.stu_sex='"+student.getStu_sex()+"'";
        }
        if(StringUtil.isNotEmpty(student.getStu_address())){
            sql +=" and stu.stu_address='"+student.getStu_address()+"'";
        }
        if(student.getStu_deptId()!= -1){
            sql +=" and stu.stu_deptId='"+student.getStu_deptId()+"'";
        }
        if(StringUtil.isNotEmpty(bbirth)){
            sql +=" and TO_DAYS(stu.stu_birth)>=TO_DAYS('"+bbirth+"')";
        }
        if(StringUtil.isNotEmpty(ebirth)){
            sql +=" and TO_DAYS(stu.stu_birth)<=TO_DAYS('"+ebirth+"')";
        }
        if (page > 0 && rows > 0) {
            sql += " limit " + (page - 1) * rows + "," + rows;
        }
        List<AllEntity> allstudents = queryRunner.query(sql,new BeanListHandler<AllEntity>(AllEntity.class));
        return allstudents;
    }

    @Override
    public int stuCount(Student student, String bbirth, String ebirth) throws SQLException {
        String sql = "select count(*) from stu,dept where stu.stu_deptId=dept.dept_id";
        if(StringUtil.isNotEmpty(student.getStu_num())){
            sql += " and stu.stu_num like '%" +student.getStu_num()+ "%'";
        }
        if(StringUtil.isNotEmpty(student.getStu_name())){
            sql += " and stu.stu_name like '%" +student.getStu_name()+ "%'";
        }
        if(StringUtil.isNotEmpty(student.getStu_sex())){
            sql +=" and stu.stu_sex='"+student.getStu_sex()+"'";
        }
        if(student.getStu_deptId()!=-1){
            sql +=" and stu.stu_deptId='"+student.getStu_deptId()+"'";
        }
        if(StringUtil.isNotEmpty(bbirth)){
            sql +=" and TO_DAYS(stu.stu_birth)>=TO_DAYS('"+bbirth+"')";
        }
        if(StringUtil.isNotEmpty(student.getStu_address())){
            sql +=" and stu.stu_address='"+student.getStu_address()+"'";
        }
        if(StringUtil.isNotEmpty(ebirth)){
            sql +=" and TO_DAYS(stu.stu_birth)<=TO_DAYS('"+ebirth+"')";
        }
        long  total = queryRunner.query(sql,new ScalarHandler<>());


        return  (int)total;
    }

    @Override
    public int addStudent(Student student) throws SQLException {

        String sql = "insert into stu (stu_num,stu_name,stu_sex,stu_birth,stu_address,stu_deptId,stu_type,stu_stay,stu_phone,stu_photo) values(?,?,?,?,?,?,?,?,?,?)";
        int code = queryRunner.update(sql,student.getStu_num(),student.getStu_name(),student.getStu_sex(),student.getStu_birth(),student.getStu_address(),student.getStu_deptId(),student.getStu_type(),student.getStu_stay(),student.getStu_phone(),student.getStu_photo());
        return code;
    }

    @Override
    public int deleteStudent(String ids) throws SQLException {
        String sql = "delete from stu where stu_id in("+ids+")";
        int code = queryRunner.execute(sql);
        return code;
    }

    @Override
    public int updateStudent(Student student) throws SQLException {
        String sql = "update stu set stu_num=?,stu_name=?,stu_sex=?,stu_birth=?,stu_address=?,stu_deptId=?,stu_type=?,stu_stay=?,stu_phone=?,stu_photo=? where stu_id=?";
        int code = queryRunner.update(sql,student.getStu_num(),student.getStu_name(),student.getStu_sex(),student.getStu_birth(),student.getStu_address(),student.getStu_deptId(),student.getStu_type(),student.getStu_stay(),student.getStu_phone(),student.getStu_photo(),student.getStu_id());
        return code;
    }
}
