package com.ethan.controller.dept;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Dept;
import com.ethan.entity.Student;
import com.ethan.factory.Factory;
import com.ethan.service.DeptService;
import com.ethan.service.StudentService;
import com.ethan.utils.DateUtil;
import com.ethan.utils.ResponseUtil;
import com.ethan.utils.StringUtil;

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

@WebServlet("/dept")
public class DeptServlet extends HttpServlet {
    Dept dept = Factory.getDept();
    DeptService deptService = Factory.getDeptServiceInstance();
    Map<String, Object> map = new HashMap<String, Object>();
    String result = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 接收客户端信息

        String flagText = request.getParameter("flagText");

        if (flagText != null && flagText.equals("allDeptList")) {
            List<Dept> depts = null;
            try {
                depts = deptService.allDeptList();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            dept.setDept_id(-1);
            dept.setDept_name("");

            depts.add(0, dept);

            result = JSON.toJSONString(depts);
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
