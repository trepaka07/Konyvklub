   M S B A M L   `   `   `  ���� I  EKonyvklubAdmin, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:KonyvklubAdmin.DialogsKonyvklubAdmin.Dialogs  '    !KonyvklubAdmin.Dialogs.UserDialog   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6local$clr-namespace:KonyvklubAdmin.Dialogs       � Title$  Felhasználók��$	��450��$	��400�� � WindowStartupLocation$ CenterScreen=� � SizeToContent$ Height=� � 
ResizeMode$ CanMinimize=�.���� .+��� -    ��Name$ tblTitle��$��Adatok módosítása��$��
10 10 10 5q�$��22(�$��Center=�� -    �Name$ formGrid��$��
15 10 15 5q� � ColumnDefinitions �� $��1* ��� $��3* � � RowDefinitions �� �� �� �� �� .+��� $��0��$��0��$��Email:��$��0 0 5 3q�$
��Left=�$��13(��� -    ��Name$ tbEmail��$��1��$��0��$��0 0 0 10q�	 �� 
IsReadOnly$
	 True���� $��0��$��1��$��Vezetéknév:��$��0 0 5 3q�$
��Left=�$��13(��� -   $ 
tbLastname��$��1��$��1��$��0 0 0 10q��� $��0��$��2��$��Keresztnév:��$��0 0 5 3q�$
��Left=�$��13(��� -   $ tbFirstname��$��1��$��2��$��0 0 0 10q��� $��0��$��3��$��Cím:��$��0 0 5 3q�$
��Left=�$��13(��� -   $ 	tbAddress��$��1��$��3��$��0 0 0 10q��� $��0��$��4��$��Telefonszám:��$��0 0 5 3q�$
��Left=�$��13(��� -   $ tbPhone��$��1��$��4��$��0 0 0 10q��� -   
 ��Name$
 btnOK��$��OK��
�������$��24��$��
10 0 10 15q�$
��40 0q�
���   �$��1q� � Cursor$
 Hand��$��Center=�$��Center=� � 	Resources  �� 
TargetType �� Property �� Value��%:   '��       �� " ��.���  �@��CornerRadius$ 10��