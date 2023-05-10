using KonyvklubAdmin.Components;
using KonyvklubAdmin.Dialogs;
using KonyvklubAdmin.Interfaces;
using KonyvklubAdmin.Models;
using System.Windows;
using System.Windows.Controls;

namespace KonyvklubAdmin.Pages
{
    /// <summary>
    /// Interaction logic for UsersPage.xaml
    /// </summary>
    public partial class UsersPage : Page, ITablePage
    {
        private User selectedUser;

        public UsersPage()
        {
            InitializeComponent();
            headerFrame.Content = new Header(this);
            DataContext = this;
            UpdateSource();
        }

        public void UpdateSource()
        {
            usersGrid.ItemsSource = UserHandler.GetUsers();
        }

        public void Search(string text)
        {
            usersGrid.ItemsSource = UserHandler.SearchUser(text);
        }

        private void BtnModify_Click(object sender, RoutedEventArgs e)
        {
            UserDialog userDlg = new UserDialog(selectedUser);
            if (userDlg.ShowDialog() == true) UpdateSource();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (Globals.Confirm($"Biztos törölni szeretnéd \"{selectedUser.email}\" felhasználót?", "Törlés"))
            {
                if (UserHandler.DeleteUser(selectedUser.email))
                {
                    usersGrid.ItemsSource = UserHandler.GetUsers();
                }
            }
        }

        private void UsersGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selectedUser = (User)usersGrid.SelectedItem;
        }
    }
}
