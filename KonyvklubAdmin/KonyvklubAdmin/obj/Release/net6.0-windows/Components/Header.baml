   M S B A M L   `   `   `  ���� I  EKonyvklubAdmin, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:KonyvklubAdmin.ComponentsKonyvklubAdmin.Components  &     KonyvklubAdmin.Components.Header   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     9local'clr-namespace:KonyvklubAdmin.Components       N� Title$  Header��.���  � ColumnDefinitions �� $
��auto ��� �� $
��auto �.+���  �� Orientation$ 
Horizontal=�$��0 0 0 10q�.+�o� -    o�Name$ menuAdd��$��0 0 10 0q�$y�	Collapsed=� � 	Resources  �� 
TargetType �� Property �� Value��%:   '��       �� " ��.���  �@��CornerRadius$ 10��.@�m� $��Hozzáadás��
�������$��23��$
��10 0q�
���   �$��1q� � Cursor$
 Hand��$��Center=� ��%:   '��       �� " ��.���  �@��CornerRadius$ 10��.@�m� -   	 m�Name$	 menuAddManual��$��Hozzáadás manuálisan��$
 Hand��$	��0 5q�
 m� Icon
 �� $��/Img/manual.png�� ��%:   '��       �� " ��.���  �@��CornerRadius$ 10��m� -   $	 menuAddFile��$��Hozzáadás fájlból��$
 Hand��$	��0 5q�
 �� $��/Img/file.png�� ��%:   '��       �� " ��.���  �@��CornerRadius$ 10���� -    ��Name$ tbSearch��$	��120��
�������$��Keresés��$��23��$	��7 0q� K� ZIndex$ 1��
���   �$��1q�$��Center=�.�� ��%:   '��       �� " ��.���  �@��CornerRadius$ 10��.���� -    ��Name$ 	btnSearch��$��23��$��50��$��	-20 0 5 0q�$��21 0 5 0q�
����� �$
 Hand��
���   �$��1q����� $��/Img/search32.png��$��15�� ��%:   '��       �� " ��.���  �@��CornerRadius$ 10���� -   $ btnReset��$��Reset��
�������$��23��$��5 0 10 0q�$
��10 0q�
���   �$��1q�$
 Hand��$��Center=� � ToolTip$ Visszaállítás�� ��%:   '��       �� " ��.���  �@��CornerRadius$ 10���� -    ��Name$ 	tblStatus��$��1��
���   �$*��$Hibás felhsználónév vagy jelszó��$��Center=�$��Center=�$��5 0 5 10q�$y�	Collapsed=��� -   $ btnAdmin��$��2��$��Admin kezelés��
�������$��23��$��	5 0 10 10q�$
��10 0q�
���   �$��1q�$
 Hand��$��Center=�$��Right=� ��%:   '��       �� " ��.���  �@��CornerRadius$ 10��