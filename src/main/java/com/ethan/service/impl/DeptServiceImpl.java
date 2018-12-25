package com.ethan.service.impl;

import com.ethan.dao.DeptDao;
import com.ethan.entity.Dept;
import com.ethan.factory.Factory;
import com.ethan.service.DeptService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class DeptServiceImpl implements DeptService {
    DeptDao deptDao = Factory.getDeptDaoInstance();
    @Override
    public List<Dept> allDeptList() throws SQLException {
       List<Dept> dept = deptDao.allDeptList();

        return dept;
    }
}
