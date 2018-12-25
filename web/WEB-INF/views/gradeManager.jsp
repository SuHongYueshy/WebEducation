<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 2018/12/6
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%
        // 权限验证
        if (session.getAttribute("currentUser") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    %>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/print.js"></script>

    <script type="text/javascript">
        var url;

        function count() {
            var rows=$("#dg").datagrid("getRows");
            var sum = 0;
            var average = 0;
            for (var i=0;i<rows.length;i++) {
                sum += rows[i]['grade_grade'];
            }
            average = sum/rows.length;
            $.messager.alert("平均分", "平均分为："+average);
        }

        function formatStudent(row) {
            return '<span class="item-text">' + row.stu_num + "--" + row.stu_name + '</span>';
        }
        function formatCourse(row) {
            return '<span class="item-text">' + row.course_num + "--" + row.course_name + '</span>';
        }


        function deleteGrade() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的数据！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].grade_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>条数据吗？", function (r) {
                if (r) {
                    $.post("grade", {delIds: ids, flagText: "delete"}, function (result) {
                        // var json = $.parseJSON(result);
                        if (result.success == "true") {
                            $.messager.alert("系统提示", "您已成功删除<font color=red>" + result.delNums + "</font>条数据！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert('系统提示', result.msg);
                        }
                    }, "json");
                }
            });
        }

        function searchGrade() {
            $('#dg').datagrid('load', {
                grade_stuId: $('#f_grade_stuId').combobox("getValue"),
                grade_courseId: $('#f_grade_courseId').combobox("getValue"),
                grade_itemId:$('#f_grade_itemId').combobox("getValue"),
                grade_grade:$('#f_grade_grade').combobox("getValue"),
                stu_sex:$('#f_stu_sex').combobox("getValue"),
                stu_deptId:$('#f_stu_deptId').combobox("getValue"),
            });
        }


        function openAddGradeDialog() {
            $('#grade_stuId').combobox({
                valueField:'stu_id',
                textField:'stu_num',
                url:'student?flagText=allStudentList'
            });
            $('#grade_courseId').combobox({
                valueField:'course_id',
                textField:'course_num',
                url:'course?flagText=allCourseList'
            });
            $("#dlg").dialog("open").dialog("setTitle", "添加选课成绩信息");
            resetValue();
            url = "grade?flagText=add";
        }

        function saveGrade() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {
                    if($('#grade_stuId').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择学生");
                        return false;
                    }

                    if($('#grade_courseId').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择课程");
                        return false;
                    }

                    if ($('#grade_itemId').combobox("getValue") == "" || $('#grade_itemId').combobox("getValue") == -1 ) {
                        $.messager.alert("系统提示", "请选择学期");
                        return false;
                    }

                    return $(this).form("validate");
                },

                success: function (result) {
                    var json = $.parseJSON(result);
                    console.info(json)
                    if (json.success == "false") {
                        $.messager.alert("系统提示", json.msg);
                        return;
                    } else {
                        $.messager.alert("系统提示", json.msg);
                        resetValue();
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("reload");
                    }
                }
            });
        }

        function resetValue() {
            $("#grade_stuId").combobox("setValue", "");
            $("#grade_courseId").combobox("setValue", "");
            $("#grade_itemId").combobox("setValue", "");
            $("#grade_grade").val("");
            $("#grade_explain").val("")
        }

        function closeDialog() {
            $("#dlg").dialog("close");
            resetValue();
        }

        function openUpdateGradeDialog() {
            $('#grade_stuId').combobox({
                valueField:'stu_id',
                textField:'stu_num',
                url:'student?flagText=allStudentList'
            });
            $('#grade_courseId').combobox({
                valueField:'course_id',
                textField:'course_num',
                url:'course?flagText=allCourseList'
            });
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一条要编辑的数据！");
                return;
            }
            var row = selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle", "编辑选课成绩信息");
            $("#fm").form("load", row);

            url = "grade?flagText=update&grade_id=" + row.grade_id;
        }
    </script>
</head>
<body>
<table id="dg" title="选课及成绩信息" class="easyui-datagrid" fitColumns="true"  rownumbers="true"
        url="grade?flagText=allGrade" fit="true"  toolbar="#tb" >
    <%--pagination="true"--%>
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="grade_id" width="50" align="center"  hidden="true">编号</th>
        <th field="grade_stuId" width="50" align="center"  hidden="true">学生编号</th>
        <th field="stu_num" width="50" align="center" >学号</th>
        <th field="stu_name" width="50" align="center" >姓名</th>
        <th field="stu_sex" width="50" align="center" hidden="true">性别</th>
        <th field="grade_courseId" width="50" align="center"  hidden="true">课程编号</th>
        <th field="course_num" width="50" align="center">课程编号</th>
        <th field="course_name" width="50" align="center">课程名称</th>
        <th field="grade_itemId" width="50" align="center" hidden="true">学期编号</th>
        <th field="item_name" width="50" align="center">学期</th>
        <th field="grade_grade" width="50" align="center">分数</th>
        <th field="grade_explain" width="50" align="center">备注</th>
    </tr>
    </thead>
</table>

<div id="tb" align="center">
    <div>
        <a href="javascript:openAddGradeDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加信息</a>
        <a href="javascript:openUpdateGradeDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改信息</a>
        <a href="javascript:deleteGrade()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除信息</a>
        <a href="javascript:count()" class="easyui-linkbutton" iconCls="icon-large-chart" plain="true">统计平均分</a>
        <a href="javascript:(0)" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="CreateFormPage('打印成绩',$('#dg'),'成绩打印')">统计打印</a>
    </div>
    <div>
        &nbsp;学号：&nbsp;
        <input class="easyui-combobox" name="f_grade_stuId" id="f_grade_stuId" size="15"
               data-options="panelHeight:'auto',valueField:'stu_id',textField:'stu_num',url:'student?flagText=allStudentList',formatter:formatStudent"/>
        &nbsp;性别：&nbsp;
        <select class="easyui-combobox" id="f_stu_sex" name="f_stu_sex" editable="false" panelHeight="auto" size="15">
            <option value="">请选择...</option>
            <option value="男">男</option>
            <option value="女">女</option>
        </select>
        &nbsp;院系：&nbsp;<input class="easyui-combobox" name="f_stu_deptId" id="f_stu_deptId" size="15"
                              data-options="panelHeight:'auto',editable:false,valueField:'dept_id',textField:'dept_name',url:'dept?flagText=allDeptList'"/>
        &nbsp;课程：&nbsp;
        <input class="easyui-combobox" name="f_grade_courseId" id="f_grade_courseId" size="15"
               data-options="panelHeight:'auto' , valueField:'course_id',textField:'course_num',url:'course?flagText=allCourseList',formatter:formatCourse"/>
        &nbsp;学期：&nbsp;<input class="easyui-combobox" name="f_grade_itemId" id="f_grade_itemId" size="15"
                              data-options="panelHeight:'auto',editable:false,valueField:'item_id',textField:'item_name',url:'item?flagText=allItemList'"/>
        &nbsp;分数：&nbsp;
        <select class="easyui-combobox" id="f_grade_grade" name="f_grade_grade" editable="false" panelHeight="auto" size="15">
            <option value="">请选择...</option>
            <option value="60">不及格</option>
        </select>
        <a href="javascript:searchGrade()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 650px;height: 350px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="10px;">
            <tr>
                <td>学号：</td>
                <td><input class="easyui-combobox" name="grade_stuId" id="grade_stuId" size="20"
                       data-options="panelHeight:'auto',valueField:'stu_id',textField:'stu_num',url:'student?flagText=allStudentList',formatter:formatStudent"/>
                </td>
                <td>课程：</td>
                <td><input class="easyui-combobox" name="grade_courseId" id="grade_courseId" size="20"
                           data-options="panelHeight:'auto' , valueField:'course_id',textField:'course_num',url:'course?flagText=allCourseList',formatter:formatCourse"/>
                </td>
            </tr>
            <tr>
                <td>成绩：</td>
                <td><input type="number" name="grade_grade" id="grade_grade" class="easyui-validatebox" required="true"/></td>
                <td>学期：</td>
                <td><input class="easyui-combobox" name="grade_itemId" id="grade_itemId" size="20"
                           data-options="panelHeight:'auto',editable:false,valueField:'item_id',textField:'item_name',url:'item?flagText=allItemList'"/>
                </td>
            </tr>
            <tr>
                <td valign="top">备注：</td>
                <td><textarea class="easyui-validatebox" name="grade_explain" id="grade_explain"
                              style="width: 173px;height:100px;resize: none"></textarea></td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveGrade()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>
