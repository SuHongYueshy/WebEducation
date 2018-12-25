package com.ethan.dao;

import com.ethan.entity.Dept;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public interface DeptDao {

    public List<Dept> allDeptList() throws SQLException;
}
