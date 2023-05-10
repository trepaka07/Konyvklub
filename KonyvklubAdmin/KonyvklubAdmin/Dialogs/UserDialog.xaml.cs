using KonyvklubAdmin.Models;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace KonyvklubAdmin.Dialogs
{
    /// <summary>
    /// Interaction logic for UserDialog.xaml
    /// </summary>
    public partial class UserDialog : Window
    {
        private string pwd;

        public UserDialog(User user)
        {
            InitializeComponent();
            tbEmail.Text = user.email;
            tbLastname.Text = user.lastname;
            tbFirstname.Text = user.firstname;
            tbAddress.Text = user.address;
            tbPhone.Text = user.phone;
            pwd = user.pwd;
        }

        private void IsTextAllowed(object sender, TextCompositionEventArgs e)
        {
            if (Globals.IsNumberInput(e.Text)) e.Handled = true;
        }

        private void BtnOK_Click(object sender, RoutedEventArgs e)
        {
            if (!IsEverythingFilled())
            {
                Globals.Alert("Nincs kitöltve minden mező!", "Hiba", MessageBoxImage.Error);
                return;
            }
            bool result = UserHandler.UpdateUser(tbEmail.Text, tbLastname.Text, tbFirstname.Text, tbAddress.Text, tbPhone.Text, pwd);
            if (result)
            {
                this.DialogResult = true;
                this.Close();
            }
        }

        private bool IsEverythingFilled()
        {
            foreach (TextBox tb in formGrid.Children.OfType<TextBox>())
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
