using KonyvklubAdmin.Components;
using KonyvklubAdmin.Dialogs;
using KonyvklubAdmin.Interfaces;
using KonyvklubAdmin.Models;
using System.Windows;
using System.Windows.Controls;

namespace KonyvklubAdmin.Pages
{
    /// <summary>
    /// Interaction logic for OrdersPage.xaml
    /// </summary>
    public partial class OrdersPage : Page, ITablePage
    {
        private Order selectedOrder;
        private OrderedBook selectedProduct;

        public OrdersPage()
        {
            InitializeComponent();
            headerFrame.Content = new Header(this);
            DataContext = this;
            UpdateSource();
        }

        public void UpdateSource()
        {
            ordersGrid.ItemsSource = OrderHandler.GetOrders();
            productsGrid.ItemsSource = null;
        }

        public void UpdateProducts()
        {
            if (selectedOrder != null)
            {
                productsGrid.ItemsSource = OrderHandler.GetOrderedBooks(selectedOrder.orderID);
            }
        }

        public void Search(string text)
        {
            ordersGrid.ItemsSource = OrderHandler.SearchOrder(text);
        }

        private void BtnCompleted_Click(object sender, RoutedEventArgs e)
        {
            if (Globals.Confirm($"Biztos jóvá szeretnéd hagyni a(z) {selectedOrder.orderID} számú rendelést?"))
            {
                if (OrderHandler.DeleteOrder(selectedOrder.orderID))
                {
                    UpdateSource();
                }
            }
        }

        private void BtnModify_Click(object sender, RoutedEventArgs e)
        {
            OrderDialog orderDlg = new OrderDialog(selectedOrder);
            if (orderDlg.ShowDialog() == true)
            {
                UpdateSource();
            }
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (Globals.Confirm($"Biztos törölni szeretnéd a(z) {selectedOrder.orderID} számú rendelést?"))
            {
                if (OrderHandler.DeleteOrder(selectedOrder.orderID))
                {
                    UpdateSource();
                }
            }
        }

        private void OrdersGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selectedOrder = (Order)ordersGrid.SelectedItem;
            UpdateProducts();
        }

        private void ProductDelete_Click(object sender, RoutedEventArgs e)
        {
            DeleteSelectedProduct();
        }

        private bool DeleteSelectedProduct()
        {
            if (Globals.Confirm($"Biztos törölni szeretnéd a(z) {selectedProduct.isbn} számú könyvet a rendelésből?"))
            {
                if (OrderHandler.DeleteOrderedBook(selectedProduct))
                {
                    UpdateSource();
                }
                return true;
            }
            return false;
        }

        private void ChangeQuantity()
        {
            if (OrderHandler.UpdateQuantity(selectedProduct))
            {
                UpdateProducts();
            }
        }

        private void ReduceQuantity_Click(object sender, RoutedEventArgs e)
        {
            selectedProduct.quantity--;
            if (selectedProduct.quantity == 0)
            {
                if (!DeleteSelectedProduct())
                {
                    selectedProduct.quantity++;
                }
                return;
                //if (OrderHandler.DeleteOrderedBook(selectedProduct))
                //{
                //    UpdateSource();
                //}
                //return;
            }
            ChangeQuantity();
        }

        private void IncreaseQuantity_Click(object sender, RoutedEventArgs e)
        {
            selectedProduct.quantity++;
            ChangeQuantity();
        }

        private void ProductsGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selectedProduct = (OrderedBook)productsGrid.SelectedItem;
        }
    }
}
