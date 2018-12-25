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
    <%--<script type="text/javascript">--%>
    <%--</script>--%>
    <script type="text/javascript">
        var url;

        function deleteCourse() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的数据！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].course_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>条数据吗？", function (r) {
                if (r) {
                    $.post("course", {delIds: ids, flagText: "delete"}, function (result) {
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

        function searchCourse() {
            $('#dg').datagrid('load', {
                course_num: $('#f_course_num').val(),
                course_name: $('#f_course_name').val(),
                course_type:$('#f_course_type').combobox("getValue"),
                course_exam:$('#f_course_exam').combobox("getValue"),
            });
        }


        function openAddCourseDialog() {
            $("#dlg").dialog("open").dialog("setTitle", "添加课程");
            resetValue();
            url = "course?flagText=add";
        }

        function saveCourse() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {
                    if($('#course_type').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择课程类型");
                        return false;
                    }

                    if($('#course_exam').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择考核方式");
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
            $("#course_num").val("");
            $("#course_name").val("");
            $("#course_type").combobox("setValue", "");
            $("#course_exam").combobox("setValue", "");
            $("#course_credit").val("");
            $("#course_explain").val("");
        }

        function closeDialog() {
            $("#dlg").dialog("close");
            resetValue();
        }

        function openUpdateCourseDialog() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一条要编辑的数据！");
                return;
            }
            var row = selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle", "编辑课程信息");
            $("#fm").form("load", row);

            url = "course?flagText=update&course_id=" + row.course_id;
        }
    </script>
</head>
<body>
<table id="dg" title="课程信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" url="course?flagText=allCourse" fit="true"  toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="course_id" width="50" align="center" hidden="true">编号</th>
        <th field="course_num" width="50" align="center">课程编号</th>
        <th field="course_name" width="50" align="center">课程名称</th>
        <th field="course_type" width="50" align="center">课程类型</th>
        <th field="course_exam" width="50" align="center">考核方式</th>
        <th field="course_credit" width="50" align="center">学分</th>
        <th field="course_explain" width="100" align="center">备注</th>
    </tr>
    </thead>
</table>

<div id="tb" align="center">
    <div>
        <a href="javascript:openAddCourseDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加课程</a>
        <a href="javascript:openUpdateCourseDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改课程</a>
        <a href="javascript:deleteCourse()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除课程</a>
        <a href="javascript:(0)" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="CreateFormPage('打印课程',$('#dg'),'课程打印')">统计打印</a>
    </div>
    <div>&nbsp;课程编号：&nbsp;<input type="text" name="f_course_num" id="f_course_num" size="10"/>
        &nbsp;课程名称：&nbsp;<input type="text" name="f_course_name" id="f_course_name" size="10"/>
        &nbsp;课程类型：&nbsp;
        <select class="easyui-combobox" id="f_course_type" name="f_course_type" editable="false" panelHeight="auto" size="15">
            <option value="">请选择...</option>
            <option value="任选">任选</option>
            <option value="限选">限选</option>
            <option value="必修">必修</option>
        </select>
        &nbsp;考核方式：&nbsp;
        <select class="easyui-combobox" id="f_course_exam" name="f_course_exam" editable="false" panelHeight="auto" size="15">
            <option value="">请选择...</option>
            <option value="考查">考查</option>
            <option value="考试">考试</option>
        </select>
        <a href="javascript:searchCourse()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 650px;height: 350px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="10px;">
            <tr>
                <td>课程编号：</td>
                <td><input type="text" name="course_num" id="course_num" class="easyui-validatebox" required="true"/></td>
                <td>课程名称：</td>
                <td><input type="text" name="course_name" id="course_name" class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>课程类型：</td>
                <td><select class="easyui-combobox" id="course_type" name="course_type" editable="false" panelHeight="auto">
                    <option value="">请选择...</option>
                    <option value="任选">任选</option>
                    <option value="限选">限选</option>
                    <option value="必修">必修</option>
                </select></td>
                <td>考核方式：</td>
                <td><select class="easyui-combobox" id="course_exam" name="course_exam" editable="false" panelHeight="auto" >
                    <option value="">请选择...</option>
                    <option value="考查">考查</option>
                    <option value="考试">考试</option>
                </select></td>
            </tr>
            <tr>
                <td>学分：</td>
                <td><input type="number" name="course_credit" id="course_credit" class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td valign="top">备注：</td>
                <td><textarea class="easyui-validatebox" name="course_explain" id="course_explain"
                              style="width: 173px;height:100px;resize: none" ></textarea></td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveCourse()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>
