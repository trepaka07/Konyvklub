using Microsoft.Win32;
using System.Windows;

namespace KonyvklubAdmin.Dialogs
{
    /// <summary>
    /// Interaction logic for ProductFileDialog.xaml
    /// </summary>
    public partial class ProductFileDialog : Window
    {
        public ProductFileDialog()
        {
            InitializeComponent();
        }

        private void BtnFilepath_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.Filter = "Pontosvesszővel tagolt fájl|*.csv";
            if (dlg.ShowDialog() == true)
            {
                tbFilepath.Text = dlg.FileName;
            }
        }

        private void BtnUpload_Click(object sender, RoutedEventArgs e)
        {
            bool uploadResult = ProductHandler.UploadProductsFromFile(tbFilepath.Text);
            if (uploadResult)
            {
                this.DialogResult = true;
                this.Close();
            }
        }
    }
}
