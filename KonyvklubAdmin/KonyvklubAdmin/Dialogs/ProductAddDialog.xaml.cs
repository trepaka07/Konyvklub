using KonyvklubAdmin.Models;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;

namespace KonyvklubAdmin.Dialogs
{
    /// <summary>
    /// Interaction logic for BookDialog.xaml
    /// </summary>
    public partial class ProductAddDialog : Window
    {
        private bool isNew = true;
        private TextRange rtbRange;

        public ProductAddDialog()
        {
            InitializeComponent();
            FillCategories();
            tblTitle.Text = "Új termék felvétele";
        }

        public ProductAddDialog(Product book)
        {
            InitializeComponent();
            FillCategories();
            isNew = false;
            tbIsbn.IsReadOnly = true;
            tblTitle.Text = "Termék módosítása";
            tbIsbn.Text = book.isbn.ToString();
            tbTitle.Text = book.title;
            tbAuthor.Text = book.author;
            rtbDoc.Blocks.Add(new Paragraph(new Run(book.description)));
            cbCategory.SelectedValue = book.category;
            tbPrice.Text = book.price.ToString();
            tbStock.Text = book.stock.ToString();
            tbOrdered.Text = book.ordered.ToString();
            tbImage.Text = book.image;
            rtbRange = new TextRange(rtbDoc.ContentStart, rtbDoc.ContentEnd);
        }

        private void FillCategories()
        {
            foreach (string c in ProductHandler.GetCategories())
            {
                ComboBoxItem item = new ComboBoxItem();
                item.Content = c;
                cbCategory.Items.Add(item);
            }
        }

        private bool IsEverythingFilled()
        {
            if (cbCategory.Text == "" || rtbRange == null || string.IsNullOrWhiteSpace(rtbRange.Text))
            {
                return false;
            }
            foreach (TextBox tb in formGrid.Children.OfType<TextBox>())
            {
                if (string.IsNullOrWhiteSpace(tb.Text))
                {
                    return false;
                }
            }
            return true;
        }

        private void BtnOK_Click(object sender, RoutedEventArgs e)
        {
            if (!IsEverythingFilled())
            {
                Globals.Alert("Nincs kitöltve minden mező!", "Hiba", MessageBoxImage.Error);
                return;
            }

            bool success = true;
            if (isNew)
            {
                success = ProductHandler.AddNewProduct(tbIsbn.Text, tbTitle.Text, tbAuthor.Text,
                            rtbRange.Text.Trim(), cbCategory.Text, tbPrice.Text, tbStock.Text, tbOrdered.Text, tbImage.Text);
            }
            else
            {
                success = ProductHandler.ModifyProduct(tbIsbn.Text, tbTitle.Text, tbAuthor.Text,
                            rtbRange.Text.Trim(), cbCategory.Text, tbPrice.Text, tbStock.Text, tbOrdered.Text, tbImage.Text);
            }

            if (success)
            {
                this.DialogResult = true;
                this.Close();
            }
        }

        private void RtbDoc_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            rtbRange = new TextRange(rtbDoc.ContentStart, rtbDoc.ContentEnd);
            if (e.Key != Key.Back && e.Key != Key.Delete && rtbRange.Text.Length == 255)
            {
                e.Handled = true;
            }
        }

        private void IsTextAllowed(object sender, TextCompositionEventArgs e)
        {
            if (Globals.IsNumberInput(e.Text)) e.Handled = true;
        }
    }
}
