package com.ethan.dao.impl;

import com.ethan.dao.TeachDao;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Teach;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class TeachDaoImpl extends BaseDao implements TeachDao {
    @Override
    public List<AllEntity> allTeach(Teach teach, int page, int rows) throws SQLException {
        String sql = "select * from teach,course,teacher,item where teach.teach_teacherId=teacher.teacher_id and teach.teach_courseId=course.course_id and teach.teach_itemId=item.item_id ";

        if(teach.getTeach_teacherId()!=-1){
            sql +=" and teach.teach_teacherId='"+teach.getTeach_teacherId()+"'";
        }

        if(teach.getTeach_courseId()!=-1){
            sql +=" and teach.teach_courseId='"+teach.getTeach_courseId()+"'";
        }

        if(teach.getTeach_itemId()!=-1){
            sql +=" and teach.teach_itemId='"+teach.getTeach_itemId()+"'";
        }

        if (page > 0 && rows > 0) {
            sql += " limit " + (page - 1) * rows + "," + rows;
        }

        List<AllEntity> allteachs = queryRunner.query(sql,new BeanListHandler<AllEntity>(AllEntity.class));
        return allteachs;
    }

    @Override
    public int teachCount(Teach teach) throws SQLException {
        String sql = "select count(*) from teach,course,teacher,item where teach.teach_teacherId=teacher.teacher_id and teach.teach_courseId=course.course_id and teach.teach_itemId=item.item_id";

        if(teach.getTeach_teacherId()!=-1){
            sql +=" and teach.teach_teacherId='"+teach.getTeach_teacherId()+"'";
        }

        if(teach.getTeach_courseId()!=-1){
            sql +=" and teach.teach_courseId='"+teach.getTeach_courseId()+"'";
        }

        if(teach.getTeach_itemId()!=-1){
            sql +=" and teach.teach_itemId='"+teach.getTeach_itemId()+"'";
        }


        long total = queryRunner.query(sql,new ScalarHandler<>());
        return (int)total;
    }

    @Override
    public int addTeach(Teach teach) throws SQLException {
        String sql = "insert into teach(teach_teacherId,teach_courseId,teach_itemId) values(?,?,?)";
        int code = queryRunner.update(sql,teach.getTeach_teacherId(),teach.getTeach_courseId(),teach.getTeach_itemId());

        return code;
    }

    @Override
    public int deleteTeach(String ids) throws SQLException {
        String sql = "delete from teach where teach_id in(" + ids + ")";
        int code = queryRunner.execute(sql);
        return code;
    }

    @Override
    public int updateTeach(Teach teach) throws SQLException {
        String sql = "update teach set teach_teacherId=?,teach_courseId=?,teach_itemId=? where teach_id=?";
        int code = queryRunner.update(sql,teach.getTeach_teacherId(),teach.getTeach_courseId(),teach.getTeach_itemId(),teach.getTeach_id());
        return code;
    }
}
