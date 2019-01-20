<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="PlatformManage.Backstage.child.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>搜索</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery.min.js" charset="UTF-8"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <style>
        #search {
            width: 80%;
            margin: 0 auto;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section id="search">
            <div class="input-group">
                <input id="search_text" name="search_text" type="text" class="form-control input-lg" placeholder="请输入搜索内容" runat="server" />
                <asp:Button ID="SearchButton" Text="查询" CssClass="btn btn-primary btn-sm glyphicon glyphicon-search" runat="server" OnClick="SearchButton_Click" />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="GridView1_PageIndexChanging">
                </asp:GridView>
            </div>
        </section>
    </form>
</body>
</html>
