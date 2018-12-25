package com.ethan.controller.item;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.Dept;
import com.ethan.entity.Item;
import com.ethan.factory.Factory;
import com.ethan.service.DeptService;
import com.ethan.service.ItemService;
import com.ethan.utils.ResponseUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/item")
public class ItemServlet extends HttpServlet {
    Item item = Factory.getItem();
    ItemService itemService = Factory.getItemServiceInstance();
    Map<String, Object> map = new HashMap<String, Object>();
    String result = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 接收客户端信息

        String flagText = request.getParameter("flagText");

        if (flagText != null && flagText.equals("allItemList")) {
            List<Item> items = null;
            try {
                items = itemService.allItemList();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            item.setItem_id(-1);
            item.setItem_name("");

            items.add(0, item);

            result = JSON.toJSONString(items);
            if (result != null) {
                try {
                    ResponseUtil.write(response, result);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            return;

        } else {
            response.sendRedirect("error");
        }

        result = JSON.toJSONString(map);
        map.clear();
        if (result != null) {
            try {
                ResponseUtil.write(response, result);
                result = null;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return;

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
