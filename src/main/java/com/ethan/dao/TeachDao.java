package com.ethan.dao;

import com.ethan.entity.AllEntity;
import com.ethan.entity.Teach;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public interface TeachDao {
    public List<AllEntity> allTeach(Teach teach, int page, int rows) throws SQLException;

    public int teachCount(Teach teach) throws SQLException;

    public int addTeach(Teach teach) throws SQLException;

    public int deleteTeach(String ids) throws SQLException;

    public int updateTeach(Teach teach) throws SQLException;

}
