using KonyvklubAdmin.Components;
using KonyvklubAdmin.Dialogs;
using KonyvklubAdmin.Interfaces;
using KonyvklubAdmin.Models;
using System.Windows;
using System.Windows.Controls;

namespace KonyvklubAdmin.Pages
{
    /// <summary>
    /// Interaction logic for ProductsPage.xaml
    /// </summary>
    public partial class ProductsPage : Page, ITablePage
    {
        private Product selectedProduct;

        public ProductsPage()
        {
            InitializeComponent();
            headerFrame.Content = new Header(this);
            DataContext = this;
            UpdateSource();
        }

        public void UpdateSource()
        {
            productsGrid.ItemsSource = ProductHandler.GetProducts();
        }

        public void Search(string text)
        {
            productsGrid.ItemsSource = ProductHandler.SearchProduct(text);
        }

        public void NewRecordManual()
        {
            ProductAddDialog addManualDlg = new ProductAddDialog();
            if (addManualDlg.ShowDialog() == true) UpdateSource();
        }

        public void NewRecordFromFile()
        {
            ProductFileDialog addFileDlg = new ProductFileDialog();
            if (addFileDlg.ShowDialog() == true)
            {
                Globals.Alert("Feltöltés kész.", "Feltöltés");
                UpdateSource();
            }
        }

        private void BtnModify_Click(object sender, RoutedEventArgs e)
        {
            ProductAddDialog productDlg = new ProductAddDialog(selectedProduct);
            if (productDlg.ShowDialog() == true) UpdateSource();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (Globals.Confirm($"Biztos törölni szeretnéd a(z) {selectedProduct.isbn} számú terméket?", "Törlés"))
            {
                if (ProductHandler.DeleteProduct(selectedProduct.isbn.ToString()))
                {
                    UpdateSource();
                }
            }
        }

        private void ProductsGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selectedProduct = (Product)productsGrid.SelectedItem;
        }
    }
}
