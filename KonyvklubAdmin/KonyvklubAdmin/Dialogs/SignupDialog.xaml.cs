using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace KonyvklubAdmin.Dialogs
{
    /// <summary>
    /// Interaction logic for SignupDialog.xaml
    /// </summary>
    public partial class SignupDialog : Window
    {
        public SignupDialog()
        {
            InitializeComponent();
        }

        private void BtnSignup_Click(object sender, RoutedEventArgs e)
        {
            if (!IsEverythingFilled())
            {
                Globals.Alert("Nincs kitöltve minden mező!", "Hiba", MessageBoxImage.Error);
                return;
            }
            if (!IsPasswordMatches())
            {
                Globals.Alert("A megadott jelszavak nem egyeznek!", "Hiba", MessageBoxImage.Error);
                return;
            }
            if (AdminHandler.Signup(tbUser.Text, tbPassword.Password))
            {
                this.DialogResult = true;
                this.Close();
            }
        }

        private bool IsPasswordMatches()
        {
            return tbPassword.Password == tbConfirm.Password;
        }

        private bool IsEverythingFilled()
        {
            foreach (TextBox tb in mainPanel.Children.OfType<TextBox>())
            {
                if (string.IsNullOrWhiteSpace(tb.Text))
                {
                    return false;
                }
            }
            return true;
        }
    }
}
