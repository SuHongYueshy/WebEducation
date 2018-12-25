package com.ethan.controller.student;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Grade;
import com.ethan.entity.Student;
import com.ethan.entity.Teach;
import com.ethan.factory.Factory;
import com.ethan.service.GradeService;
import com.ethan.service.TeachService;
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

@WebServlet("/grade")
public class GradeServlet extends HttpServlet {
    Grade grade = Factory.getGrade();
    GradeService gradeService = Factory.getGradeServiceInstance();
    Map<String, Object> map = new HashMap<String, Object>();
    String result = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 接收客户端信息

        String flagText = request.getParameter("flagText");

        if (flagText != null && flagText.equals("allGrade")) {
            String grade_stuId=request.getParameter("grade_stuId");
            String grade_courseId=request.getParameter("grade_courseId");
            String grade_itemId=request.getParameter("grade_itemId");
            String grade_grade=request.getParameter("grade_grade");

            String stu_deptId=request.getParameter("stu_deptId");
            String stu_sex=request.getParameter("stu_sex");

            Student student = new Student();

            if(StringUtil.isNotEmpty(stu_deptId)) {
                student.setStu_deptId(Integer.parseInt(stu_deptId));
            } else {
                student.setStu_deptId(-1);
            }
            student.setStu_sex(stu_sex);

            if(StringUtil.isNotEmpty(grade_stuId)) {
                grade.setGrade_stuId(Integer.parseInt(grade_stuId));
            } else {
                grade.setGrade_stuId(-1);
            }

            if(StringUtil.isNotEmpty(grade_courseId)) {
                grade.setGrade_courseId(Integer.parseInt(grade_courseId));
            } else {
                grade.setGrade_courseId(-1);
            }

            if(StringUtil.isNotEmpty(grade_itemId)) {
                grade.setGrade_itemId(Integer.parseInt(grade_itemId));
            } else {
                grade.setGrade_itemId(-1);
            }

            if(StringUtil.isNotEmpty(grade_grade)) {
                grade.setGrade_grade(Float.parseFloat(grade_grade));
            } else {
                grade.setGrade_grade(-1);
            }

            String page=request.getParameter("page");
            String rows=request.getParameter("rows");

            page="0";
            rows="0";

            List<AllEntity> allEntity = null;
            int total = 0;

            try {
                allEntity = gradeService.allGrade(grade,student,Integer.parseInt(page),Integer.parseInt(rows));
                total = gradeService.gradeCount(grade);
            } catch (SQLException e) {
                e.printStackTrace();
            }


            map.put("rows", allEntity);
            map.put("total", total);


        } else if (flagText != null && flagText.equals("add")) {
            String grade_stuId=request.getParameter("grade_stuId");
            String grade_courseId=request.getParameter("grade_courseId");
            String grade_grade=request.getParameter("grade_grade");
            String grade_itemId=request.getParameter("grade_itemId");
            String grade_explain=request.getParameter("grade_explain");

            grade = new Grade(-1,Integer.parseInt(grade_stuId),Integer.parseInt(grade_courseId),Float.valueOf(grade_grade),Integer.parseInt(grade_itemId),grade_explain);
            int code =0;

            try {
                code = gradeService.addGrade(grade);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (code > 0) {
                map.put("success", "true");
                map.put("msg", "添加成功！");
            } else {
                map.put("success", "false");
                map.put("msg", "添加失败，请重试！");
            }


        } else if (flagText != null && flagText.equals("update")) {
            String grade_id=request.getParameter("grade_id");
            String grade_stuId=request.getParameter("grade_stuId");
            String grade_courseId=request.getParameter("grade_courseId");
            String grade_grade=request.getParameter("grade_grade");
            String grade_itemId=request.getParameter("grade_itemId");
            String grade_explain=request.getParameter("grade_explain");


            grade = new Grade(Integer.parseInt(grade_id),Integer.parseInt(grade_stuId),Integer.parseInt(grade_courseId),Float.valueOf(grade_grade),Integer.parseInt(grade_itemId),grade_explain);
            int code =0;

            try {
                code = gradeService.updateGrade(grade);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (code > 0) {
                map.put("success", "true");
                map.put("msg", "修改成功！");
            } else {
                map.put("success", "false");
                map.put("msg", "修改失败，请重试！");
            }

        } else if (flagText != null && flagText.equals("delete")) {
            String delIds = request.getParameter("delIds");

            int delNums = 0;

            try {
                delNums = gradeService.deleteGrade(delIds);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (delNums > 0) {
                map.put("success", "true");
                map.put("msg", "删除成功！");
                map.put("delNums", delNums);
            } else {
                map.put("success", "false");
                map.put("msg", "删除失败，请重试！");
            }

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
