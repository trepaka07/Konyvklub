using KonyvklubAdmin.Dialogs;
using KonyvklubAdmin.Interfaces;
using KonyvklubAdmin.Pages;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace KonyvklubAdmin.Components
{
    /// <summary>
    /// Interaction logic for Header.xaml
    /// </summary>
    public partial class Header : Page
    {
        private ITablePage page;

        public Header(ITablePage page)
        {
            InitializeComponent();
            this.page = page;
            if (page.GetType() == typeof(ProductsPage))
            {
                menuAdd.Visibility = Visibility.Visible;
            }
        }

        private void TbSearch_FocusChanged(object sender, RoutedEventArgs e)
        {
            string placeholder = "Keresés";
            if (tbSearch.Text == placeholder)
            {
                tbSearch.Text = "";
                tbSearch.Foreground = Brushes.Black;
            }
            else if (string.IsNullOrWhiteSpace(tbSearch.Text))
            {
                tbSearch.Text = placeholder;
                tbSearch.Foreground = Brushes.Gray;
            }
        }

        private void BtnSearch_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbSearch.Text))
            {
                page.UpdateSource();
            }
            else
            {
                page.Search(tbSearch.Text);
            }
        }

        private void BtnReset_Click(object sender, RoutedEventArgs e)
        {
            tbSearch.Text = "";
            TbSearch_FocusChanged(sender, e);
            page.UpdateSource();
        }

        private void BtnAdmin_Click(object sender, RoutedEventArgs e)
        {
            AdminDialog adminDlg = new AdminDialog();
            adminDlg.ShowDialog();
        }

        private void TbSearch_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                BtnSearch_Click(sender, e);
            }
        }

        private void MenuAddManual_Click(object sender, RoutedEventArgs e)
        {
            ((ProductsPage)page).NewRecordManual();
        }

        private void MenuAddFile_Click(object sender, RoutedEventArgs e)
        {
            ((ProductsPage)page).NewRecordFromFile();
        }
    }
}
