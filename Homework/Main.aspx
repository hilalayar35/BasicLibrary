<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Homework.Main" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Text1 {
            width: 205px;
        }
    </style>
</head>
<body>
    <form id="MainForm" runat="server">
        <div>
            <asp:Panel ID="GridPanel" runat="server">
                <br />
                <br />
                <asp:GridView ID="gvMsql" runat="server" AutoGenerateColumns="False" DataKeyNames="BookId">
                    <Columns>
                        <asp:TemplateField HeaderText="Book Id">
                            <ItemTemplate>
                                <asp:Label ID="LblBookId" runat="server" Text='<%# Eval("BookId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Book Name">
                            <ItemTemplate>
                                <asp:Label ID="LblBookName" runat="server" Text='<%# Eval("BookName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Author">
                            <ItemTemplate>
                                <asp:Label ID="LblAuthor" runat="server" Text='<%# Eval("Author") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Publisher">
                            <ItemTemplate>
                                <asp:Label ID="LblPublisher" runat="server" Text='<%# Eval("Publisher") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="LblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ISBN">
                            <ItemTemplate>
                                <asp:Label ID="LblISBN" runat="server" Text='<%# Eval("ISBN") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            <br />
            <br />
            <br />
            <br />
            <asp:Panel ID="DropDownListPanel" runat="server">
                <asp:Label ID="SelectBook" runat="server" Text="Select Book: "></asp:Label>
                &nbsp;
                <asp:DropDownList ID="ddlBook" runat="server" AutoPostBack="True" OnSelectedIndexChanged="onSelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="LblAuthorIs" runat="server" Text="The Author is:"></asp:Label>
                &nbsp;<asp:Label ID="LblAuthor" runat="server"></asp:Label>
                <br />
            </asp:Panel>

            <br />
            <br />
            <br />
            <br />
            <asp:Panel ID="DropDownListDeletePanel" runat="server">
                <asp:Label ID="DeleteBook" runat="server" Text="Select ISBN: "></asp:Label>
                &nbsp;
                <asp:DropDownList ID="ddlISBN" runat="server" AutoPostBack="True" OnSelectedIndexChanged="onSelectedIndexDeleted">

                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="LblResponse" runat="server" Text=""></asp:Label>
                <br />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
