   M S B A M L   `   `   `  ���� I  EKonyvklubAdmin, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:KonyvklubAdminKonyvklubAdmin      KonyvklubAdmin.MainWindow   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:KonyvklubAdmin       � Title$!  Könyvklub - Bejelentkezés��$	��230��$	��500��$	��175�� � WindowStartupLocation$ CenterScreen=�.���  � RowDefinitions �� $
��auto ��� .+�� -    �Name$ navbar��$��0��$y�	Collapsed=� � ColumnDefinitions �� �� �� .+��� -    ��Name$ 	menuUsers��$��0��$��Felhasználók��$	��0 7q�
�������$��0 0 2.5 2.5q�
������ � Cursor$
 Hand��$��0���� -   $ 
menuOrders��$��1��$��Rendelések��$	��0 7q�
�������$��2.5 0 2.5 2.5q�
������ $
 Hand��$��1���� -   $ menuProducts��$��2��$��	Termékek��$	��0 7q�
�������$��2.5 0 0 2.5q�
������ $
 Hand��$��2�� � -     �Name$ 	mainFrame��$��1��$��10q�  � NavigationUIVisibility$ Hidden=�