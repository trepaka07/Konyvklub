   M S B A M L   `   `   `  ���� I  EKonyvklubAdmin, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:KonyvklubAdmin.DialogsKonyvklubAdmin.Dialogs  (    "KonyvklubAdmin.Dialogs.AdminDialog   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6local$clr-namespace:KonyvklubAdmin.Dialogs       � Title$  Admin kezelés��$	��400��$	��250�� � SizeToContent$ Height=� � 
ResizeMode$ NoResize=� � WindowStartupLocation$ CenterScreen=�.���� .+��� $��Adminisztrátorok��$��Center=�$��10q�$��15(�&   System.Windows.Controls.DataGrid  -     Name$ 
adminsGrid��$��0 0 0 50q�$
��10 0q�   AutoGenerateColumns$ False��   CanUserAddRows$ False��   CanUserDeleteRows$ False��   RowHeaderWidth$ 0Q�	   
IsReadOnly$
	 True��$
   HorizontalScrollBarVisibility$
 Disabled=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Felhasználónév��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *
username+4  .System.Windows.Controls.DataGridTemplateColumn  $
 auto    CellTemplate �� .R��� -    � Cursor$
 Hand��
������ $��0q� � ToolTip$ Törlés������ $��/Img/delete32.png��$��12���� -    ��Name$ btnAdd��$��Új admin hozzáadása��$��Center=�$��10q�$
��30 3q�
������ $
 Hand�� � 	Resources  �� 
TargetType �� Property �� Value��%:   '��       �� " ��.���  �@��CornerRadius$ 10��