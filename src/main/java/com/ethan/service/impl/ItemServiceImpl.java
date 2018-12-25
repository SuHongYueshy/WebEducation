package com.ethan.service.impl;

import com.ethan.dao.ItemDao;
import com.ethan.entity.Item;
import com.ethan.factory.Factory;
import com.ethan.service.ItemService;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public class ItemServiceImpl implements ItemService {
    ItemDao itemDao = Factory.getItemDaoInstance();
    @Override
    public List<Item> allItemList() throws SQLException {
        List<Item> items = itemDao.allItemList();
        return items;
    }
}
