using KonyvklubAdmin.Models;
using Newtonsoft.Json;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System;
using System.Linq;
using System.Windows;

namespace KonyvklubAdmin
{
    public class ProductHandler
    {
        private static ObservableCollection<Product> products = new ObservableCollection<Product>();

        private static void SendSelectRequest(object body)
        {
            ApiRequest request = new ApiRequest(body);
            if (request.Success)
            {
                products = JsonConvert.DeserializeObject<ObservableCollection<Product>>(request.Result);
            }
            else if (request.Code == 404)
            {
                products = new ObservableCollection<Product>();
            }
        }

        public static ObservableCollection<Product> GetProducts()
        {
            SendSelectRequest(new { books = 1 });
            return products;
        }

        public static ObservableCollection<Product> SearchProduct(string search)
        {
            SendSelectRequest(new { book = search });
            if (products.Count == 0)
            {
                products = GetProducts();
            }
            return products;
        }

        public static List<string> GetCategories()
        {
            List<string> categories = new List<string>();
            foreach (Product p in products)
            {
                if (!categories.Contains(p.category))
                {
                    categories.Add(p.category);
                }
            }
            return categories;
        }

        public static bool DeleteProduct(string isbn)
        {
            return ApiTools.QuickRequest(new { del_book = isbn }, RequestType.Törlés);
        }

        public static bool AddNewProduct(string isbn, string title, string author, 
            string description, string category, string price, string stock, string ordered, string image)
        {
            var values = new
            {
                add_book = 1,
                isbn,
                title,
                author,
                description,
                category,
                price,
                stock,
                ordered,
                image
            };
            return ApiTools.QuickRequest(values, RequestType.Hozzáadás);
        }

        public static bool ModifyProduct(string isbn, string title, string author,
            string description, string category, string price, string stock, string ordered, string image)
        {
            var values = new
            {
                mod_book = 1,
                isbn,
                title,
                author,
                description,
                category,
                price,
                stock,
                ordered,
                image
            };
            return ApiTools.QuickRequest(values, RequestType.Módosítás);
        }

        public static bool UploadProductsFromFile(string filePath)
        {
            ImportFile importFile = new ImportFile(filePath);
            if (!importFile.IsValid)
            {
                Globals.Alert("A fájl felépítése nem megfelelő!", "Fájl beolvasása", System.Windows.MessageBoxImage.Error);
                return false;
            }
            foreach (Product book in importFile.Products)
            {
                if (products.Any(p => p.isbn == book.isbn)) continue;
                bool result = AddNewProduct(book.isbn.ToString(), book.title, book.author, book.description, book.category, 
                    book.price.ToString(), book.stock.ToString(), book.ordered.ToString(), book.image);
                if (!result)
                {
                    Globals.Alert("A feltöltés részben vagy egészben sikertelen!", "Feltöltés fájlból", MessageBoxImage.Error);
                    return false;
                }
            }
            return true;
        }
    }
}
