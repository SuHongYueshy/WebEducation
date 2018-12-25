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

        function deleteTeacher() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的数据！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].teacher_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>条数据吗？", function (r) {
                if (r) {
                    $.post("teacher", {delIds: ids, flagText: "delete"}, function (result) {
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

        function searchTeacher() {
            $('#dg').datagrid('load', {
                teacher_num: $('#f_teacher_num').val(),
                teacher_name: $('#f_teacher_name').val(),
                teacher_sex:$('#f_teacher_sex').combobox("getValue"),
                teacher_pro:$('#f_teacher_pro').combobox("getValue"),
                teacher_deptId:$('#f_teacher_deptId').combobox("getValue")
            });
        }


        function openAddTeacherDialog() {
            $('#teacher_deptId').combobox({
                valueField:'dept_id',
                textField:'dept_name',
                url:'dept?flagText=allDeptList'
            });
            $("#dlg").dialog("open").dialog("setTitle", "添加教师");
            resetValue();
            url = "teacher?flagText=add";
        }

        function saveTeacher() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {
                    if($('#teacher_sex').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择性别");
                        return false;
                    }

                    if($('#teacher_pro').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择职称");
                        return false;
                    }

                    if ($('#teacher_deptId').combobox("getValue") == "" || $('#teacher_deptId').combobox("getValue") == -1 ) {
                        $.messager.alert("系统提示", "请选择院系");
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
            $("#teacher_num").val("");
            $("#teacher_name").val("");
            $("#teacher_sex").combobox("setValue", "");
            $("#teacher_deptId").combobox("setValue", "");
            $("#teacher_pro").combobox("setValue", "");
        }

        function closeDialog() {
            $("#dlg").dialog("close");
            resetValue();
        }

        function openUpdateTeacherDialog() {
            $('#teacher_deptId').combobox({
                valueField:'dept_id',
                textField:'dept_name',
                url:'dept?flagText=allDeptList'
            });
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一条要编辑的数据！");
                return;
            }
            var row = selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle", "编辑教师信息");
            $("#fm").form("load", row);

            url = "teacher?flagText=update&teacher_id=" + row.teacher_id;
        }
    </script>
</head>
<body>
<table id="dg" title="教师信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" url="teacher?flagText=allTeacher" fit="true"  toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="teacher_id" width="50" align="center" hidden="true">编号</th>
        <th field="teacher_num" width="50" align="center">编号</th>
        <th field="teacher_name" width="50" align="center">姓名</th>
        <th field="teacher_sex" width="50" align="center">性别</th>
        <th field="teacher_pro" width="50" align="center">职称</th>
        <th field="teacher_deptId" width="50" align="center" hidden="true">院系编号</th>
        <th field="dept_name" width="50" align="center">院系</th>
    </tr>
    </thead>
</table>

<div id="tb" align="center">
    <div>
        <a href="javascript:openAddTeacherDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加教师</a>
        <a href="javascript:openUpdateTeacherDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改教师</a>
        <a href="javascript:deleteTeacher()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除教师</a>
        <a href="javascript:(0)" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="CreateFormPage('打印教师',$('#dg'),'教师打印')">统计打印</a>
    </div>
    <div>&nbsp;编号：&nbsp;<input type="text" name="f_teacher_num" id="f_teacher_num" size="10"/>
        &nbsp;姓名：&nbsp;<input type="text" name="f_teacher_name" id="f_teacher_name" size="10"/>
        &nbsp;性别：&nbsp;
        <select class="easyui-combobox" id="f_teacher_sex" name="f_teacher_sex" editable="false" panelHeight="auto" size="15">
            <option value="">请选择...</option>
            <option value="男">男</option>
            <option value="女">女</option>
        </select>
        &nbsp;职称：&nbsp;
        <select class="easyui-combobox" id="f_teacher_pro" name="f_teacher_pro" editable="false" panelHeight="auto" size="15">
            <option value="">请选择...</option>
            <option value="讲师">讲师</option>
            <option value="副教授">副教授</option>
            <option value="教授">教授</option>
        </select>
        &nbsp;院系：&nbsp;<input class="easyui-combobox" name="f_teacher_deptId" id="f_teacher_deptId" size="15"
                              data-options="panelHeight:'auto',editable:false,valueField:'dept_id',textField:'dept_name',url:'dept?flagText=allDeptList'"/>
        <a href="javascript:searchTeacher()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 650px;height: 350px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="10px;">
            <tr>
                <td>编号：</td>
                <td><input type="text" name="teacher_num" id="teacher_num" class="easyui-validatebox" required="true"/></td>
                <td>姓名：</td>
                <td><input type="text" name="teacher_name" id="teacher_name" class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><select class="easyui-combobox" id="teacher_sex" name="teacher_sex" editable="false" panelHeight="auto" style="width: 155px"  required="true">
                    <option value="">请选择...</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select></td>
                <td>职称：</td>
                <td><select class="easyui-combobox" id="teacher_pro" name="teacher_pro" editable="false" panelHeight="auto" style="width: 155px"  required="true">
                    <option value="">请选择...</option>
                    <option value="讲师">讲师</option>
                    <option value="副教授">副教授</option>
                    <option value="教授">教授</option>
                </select></td>
            </tr>
            <tr>
                <td>院系：</td>
                <td><input class="easyui-combobox" name="teacher_deptId" id="teacher_deptId" size="15"  required="true"
                           data-options="panelHeight:'auto',editable:false,valueField:'dept_id',textField:'dept_name',url:'dept?flagText=allDeptList'"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveTeacher()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>
