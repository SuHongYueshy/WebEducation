package com.ethan.dao.impl;

import com.ethan.dao.ItemDao;
import com.ethan.entity.Item;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class ItemDaoImpl extends BaseDao implements ItemDao {
    @Override
    public List<Item> allItemList() throws SQLException {
        String sql = "select * from item where 1=1";
        List<Item> items = queryRunner.query(sql,new BeanListHandler<Item>(Item.class));
        return items;
    }
}
