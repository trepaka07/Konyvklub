using KonyvklubAdmin.models;
using System.Windows;

namespace KonyvklubAdmin.Dialogs
{
    /// <summary>
    /// Interaction logic for AdminDialog.xaml
    /// </summary>
    public partial class AdminDialog : Window
    {
        public AdminDialog()
        {
            InitializeComponent();
            DataContext = this;
            UpdateAdminsSource();
        }

        private void UpdateAdminsSource()
        {
            adminsGrid.ItemsSource = AdminHandler.GetAdmins();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            SignupDialog signupDlg = new SignupDialog();
            this.Hide();
            bool result = signupDlg.ShowDialog() == true;
            this.Show();
            if (result)
            {
                UpdateAdminsSource();
            }
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            Admin selectedAdmin = (Admin)adminsGrid.SelectedItem;
            if (Globals.Confirm($"Biztos törölni szeretnéd \"{selectedAdmin.username}\" felhasználót?", "Törlés"))
            {
                if (AdminHandler.Delete(selectedAdmin.username))
                {
                    UpdateAdminsSource();
                }
            }
        }
    }
}
