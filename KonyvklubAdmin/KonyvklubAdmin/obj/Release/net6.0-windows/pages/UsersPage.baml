   M S B A M L   `   `   `  ���� I  EKonyvklubAdmin, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:KonyvklubAdmin.PagesKonyvklubAdmin.Pages  $    KonyvklubAdmin.Pages.UsersPage   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     4local"clr-namespace:KonyvklubAdmin.Pages       N� Title$  Felhasználók��.���  � RowDefinitions �� $
��auto ��� .+� � -     �Name$ headerFrame��  � NavigationUIVisibility$ Hidden=�&   System.Windows.Controls.DataGrid  -     Name$ 	usersGrid��$��1��   AutoGenerateColumns$ False��   CanUserAddRows$ False��   CanUserDeleteRows$ False��   ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 	   RowHeaderWidth$	 0Q�
   
IsReadOnly$

 True��$   HorizontalScrollBarVisibility$ Disabled=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Email��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *email+  $ Vezetéknév�� �� *
lastname+  $ Keresztnév�� �� *	firstname+  $
 Cím�� �� *	address+  $ Telefon�� �� *phone+4  .System.Windows.Controls.DataGridTemplateColumn     Width$
 auto    CellTemplate �� .R��� -    � Cursor$
 Hand��
������ $��0q� � ToolTip$ Módosítás������ $��/Img/modify32.png��$��15��  $
 auto  �� .R��� -   $
 Hand��
������ $��0q�$ Törlés������ $��/Img/delete32.png��$��12��