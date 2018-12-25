package com.ethan.service.impl;

import com.ethan.dao.TeachDao;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Teach;
import com.ethan.factory.Factory;
import com.ethan.service.TeachService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class TeachServiceImpl implements TeachService {
   TeachDao teachDao = Factory.getTeachDaoInstance();

    @Override
    public List<AllEntity> allTeach(Teach teach, int page, int rows) throws SQLException {
       List<AllEntity> allteachs = null;
        allteachs = teachDao.allTeach(teach, page, rows);

        return allteachs;
    }

    @Override
    public int teachCount(Teach teach) throws SQLException {
        int total = 0;
        total = teachDao.teachCount(teach);

        return total;
    }

    @Override
    public int addTeach(Teach teach) throws SQLException {
       int code = 0;
        code = teachDao.addTeach(teach);
        return code;
    }

    @Override
    public int deleteTeach(String ids) throws SQLException {
        int code = 0;
        code = teachDao.deleteTeach(ids);
        return code;
    }

    @Override
    public int updateTeach(Teach teach) throws SQLException {
        int code = 0;
        code = teachDao.updateTeach(teach);
        return code;
    }


}
