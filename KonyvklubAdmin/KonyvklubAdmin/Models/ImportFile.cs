using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KonyvklubAdmin.Models
{
    public class ImportFile
    {
        public string FullPath { get; set; }
        public string Filename { get; set; }
        public string Extension { get; set; }
        public List<Product> Products { get; set; }
        public bool IsValid { get; set; }

        public ImportFile(string fullPath)
        {
            this.FullPath = fullPath;
            this.Filename = Path.GetFileNameWithoutExtension(fullPath);
            this.Extension = Path.GetExtension(fullPath);
            IsValid = ReadFile();
        }

        private bool ReadFile()
        {
            Products = new List<Product>();
            try
            {
                using (StreamReader reader = new StreamReader(this.FullPath))
                {
                    string header = reader.ReadLine();
                    while (!reader.EndOfStream)
                    {
                        string[] line = reader.ReadLine().Trim().Split(';');
                        Product current = new Product(line);
                        Products.Add(current);
                    }
                }
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}
