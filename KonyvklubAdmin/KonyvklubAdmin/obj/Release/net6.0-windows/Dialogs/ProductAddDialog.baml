   M S B A M L   `   `   `  ���� I  EKonyvklubAdmin, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:KonyvklubAdmin.DialogsKonyvklubAdmin.Dialogs  -    'KonyvklubAdmin.Dialogs.ProductAddDialog   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6local$clr-namespace:KonyvklubAdmin.Dialogs       � Title$  	Termékek��$	��450��$	��400�� � WindowStartupLocation$ CenterScreen=� � SizeToContent$ Height=� � 
ResizeMode$ CanMinimize=�.���� .+��� -    ��Name$ tblTitle��$��Új termék felvétele��$��
10 10 10 5q�$��22(�$��Center=�� -    �Name$ formGrid��$��
15 10 15 5q� � ColumnDefinitions �� $��1* ��� $��4* � � RowDefinitions �� �� �� �� �� �� �� �� �� .+��� $��0��$��0��$��ISBN:��$��0 0 5 3q�$
��Left=�$��13(��� -    ��Name$ tbIsbn��$��1��$��0��$��0 0 0 10q��� $��0��$��1��$��Cím:��$��0 0 5 3q�$
��Left=�$��13(��� -   $ tbTitle��$��1��$��1��$��0 0 0 10q��� $��0��$��2��$��Író:��$��0 0 5 3q�$
��Left=�$��13(��� -   $ tbAuthor��$��1��$��2��$��0 0 0 10q��� $��0��$��3��$��	Leírás:��$��0 0 5 3q�$
��Left=�$��13(��� -   	 ��Name$	 rtbDesc��$��1��$��3��$��0 0 0 10q�$��0 2 0 5q�$��62��"
 �� VerticalScrollBarVisibility$

 Auto=�. �/� -    /�Name$ rtbDoc�� /� 
LineHeight$ 2���� $��0��$��4��$��Kategória:��$��0 0 5 3q�$
��Left=�$��13(��� -    ��Name$ 
cbCategory��$��1��$��4��$��0 0 0 10q� �� SelectedValuePath$ Content�� � ToolTip$= 7Válassz a listából, vagy adj meg egy kategóriát...�� �� 
IsEditable$
 True���� $��0��$��5��$
��Ár:��$��0 0 5 3q�$
��Left=�$��13(��� -	   $ tbPrice��$��1��$��5��$��0 0 0 10q��� $��0��$��6��$��Készleten:��$��0 0 5 3q�$
��Left=�$��13(��� -
   $ tbStock��$��1��$��6��$��0 0 0 10q��� $��0��$��7��$��Rendelések:��$��0 0 5 3q�$
��Left=�$��13(��� -   $ 	tbOrdered��$��1��$��7��$��0 0 0 10q�$��0�� �� 
IsReadOnly$
 True���� $��0��$��8��$��Kép:��$��0 0 5 3q�$
��Left=�$��13(��� -   $ tbImage��$��1��$��8��$��0 0 0 10q��� -    ��Name$ btnOK��$��OK��
�������$��24��$��
10 0 10 15q�$
��40 0q�
���   �$��1q� � Cursor$
 Hand��$��Center=�$��Center=� � 	Resources  �� 
TargetType �� Property �� Value��%:   '��       �� " ��.���  �@��CornerRadius$ 10��