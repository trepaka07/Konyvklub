using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace KonyvklubAdmin.Pages
{
    /// <summary>
    /// Interaction logic for LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
            this.KeyDown += TbPassword_KeyDown;
        }

        private void TbPassword_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                BtnLogin_Click(sender, e);
            }
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            if (!IsEverythingFilled())
            {
                Globals.Alert("Nincs kitöltve minden mező!", "Bejelentkezés", MessageBoxImage.Error);
                return;
            }
            if (AdminHandler.Login(tbUser.Text, tbPassword.Password))
            {
                LoginProcess();
            }
        }

        private bool IsEverythingFilled()
        {
            if (string.IsNullOrWhiteSpace(tbUser.Text) || string.IsNullOrWhiteSpace(tbPassword.Password))
            {
                return false;
            }
            return true;
        }

        private async void LoginProcess()
        {
            loadBar.Visibility = Visibility.Visible;
            loadBar.IsIndeterminate = true;
            btnLogin.IsHitTestVisible = false;
            await Task.Delay(2000);
            ((MainWindow)App.Current.MainWindow).navbar.Visibility = Visibility.Visible;
            AdminHandler.Admin = tbUser.Text;
            tbPassword.Password = "";
        }
    }
}
