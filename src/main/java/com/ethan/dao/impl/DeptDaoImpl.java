package com.ethan.dao.impl;

import com.ethan.dao.DeptDao;
import com.ethan.entity.Dept;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class DeptDaoImpl extends BaseDao implements DeptDao {
    @Override
    public List<Dept> allDeptList() throws SQLException {
        String sql = "select * from dept where 1=1";
        List<Dept> dept = queryRunner.query(sql,new BeanListHandler<Dept>(Dept.class));
        return dept;
    }
}
