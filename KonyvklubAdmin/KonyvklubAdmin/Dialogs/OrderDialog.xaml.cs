using KonyvklubAdmin.Models;
using System.Windows;

namespace KonyvklubAdmin.Dialogs
{
    /// <summary>
    /// Interaction logic for OrderDialog.xaml
    /// </summary>
    public partial class OrderDialog : Window
    {
        private Order order;

        public OrderDialog(Order order)
        {
            InitializeComponent();
            this.order = order;
            cbState.SelectedValue = order.state;
        }

        private void BtnOK_Click(object sender, RoutedEventArgs e)
        {
            order.state = cbState.Text;
            if (OrderHandler.UpdateOrderState(order))
            {
                this.DialogResult = true;
                this.Close();
            }
        }
    }
}
