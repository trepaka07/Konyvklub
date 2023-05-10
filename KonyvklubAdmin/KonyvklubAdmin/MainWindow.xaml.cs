using KonyvklubAdmin.Pages;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace KonyvklubAdmin
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            mainFrame.Content = new LoginPage();
            this.ResizeMode = ResizeMode.CanMinimize;
        }

        private void Menu_Click(object sender, RoutedEventArgs e)
        {
            foreach (Button btn in navbar.Children.OfType<Button>())
            {
                if (btn == sender as Button)
                {
                    btn.BorderBrush = Brushes.DodgerBlue;
                    mainFrame.Content = PageByIndex(btn.TabIndex);
                }
                else
                {
                    btn.BorderBrush = Brushes.Transparent;
                }
            }
        }

        private void Navbar_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (mainFrame.Content.GetType() != typeof(LoginPage)) return;
            mainFrame.Content = new UsersPage();
            this.ResizeMode = ResizeMode.CanResize;
            this.Width = 1024;
            this.Height = 512;
            this.MinWidth = 670;
            CenterWindow();
        }

        private void CenterWindow()
        {
            double screenWidth = SystemParameters.PrimaryScreenWidth;
            double screenHeight = SystemParameters.PrimaryScreenHeight;
            this.Left = (screenWidth / 2) - (this.Width / 2);
            this.Top = (screenHeight/ 2) - (this.Height / 2);
        }

        private dynamic PageByIndex(int index)
        {
            if (index == 0) return new UsersPage();
            if (index == 1) return new OrdersPage();
            return new ProductsPage();
        }

        private void Page_Rendered(object sender, EventArgs e)
        {
            this.Title = $"Könyvklub - {((Page)mainFrame.Content).Title}";
        }
    }
}
