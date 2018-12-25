package com.ethan.service;

import com.ethan.entity.Dept;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public interface DeptService {
    public List<Dept> allDeptList() throws SQLException;
}
