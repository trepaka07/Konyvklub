namespace KonyvklubAdmin.Models
{
    public class Product
    {
        public string isbn { get; set; }
        public string title { get; set; }
        public string author { get; set; }
        public string description { get; set; }
        public string category { get; set; }
        public int price { get; set; }
        public int stock { get; set; }
        public int ordered { get; set; }
        public string image { get; set; }

        public Product() { }

        public Product(string[] line)
        {
            isbn = line[0];
            title = line[1];
            author = line[2];
            description = line[3];
            category = line[4];
            price = int.Parse(line[5]);
            stock = int.Parse(line[6]);
            ordered = int.Parse(line[7]);
            image = line[8];
        }
    }
}
