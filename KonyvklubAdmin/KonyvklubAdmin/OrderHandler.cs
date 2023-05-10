using KonyvklubAdmin.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.ObjectModel;
using System.Windows;

namespace KonyvklubAdmin
{
    public class OrderHandler
    {
        private static ObservableCollection<Order> orders = new ObservableCollection<Order>();
        private static ObservableCollection<OrderedBook> orderedBooks = new ObservableCollection<OrderedBook>();

        private static void SendSelectRequest(object body)
        {
            ApiRequest request = new ApiRequest(body);
            if (request.Success)
            {
                orders = JsonConvert.DeserializeObject<ObservableCollection<Order>>(request.Result);
            }
            else if (request.Code == 404)
            {
                orders = new ObservableCollection<Order>();
            }
        }

        public static ObservableCollection<Order> GetOrders()
        {
            SendSelectRequest(new { orders = 1 });
            return orders;
        }

        public static ObservableCollection<Order> SearchOrder(string search)
        {
            SendSelectRequest(new { order = search });
            return orders;
        }

        public static ObservableCollection<OrderedBook> GetOrderedBooks(string orderID)
        {
            ApiRequest request = new ApiRequest(new { orderedbooks = orderID });
            if (request.Success)
            {
                orderedBooks = JsonConvert.DeserializeObject<ObservableCollection<OrderedBook>>(request.Result);
            }
            else if (request.Code == 404)
            {
                orderedBooks = new ObservableCollection<OrderedBook>();
            }
            return orderedBooks;
        }

        public static bool DeleteOrder(string orderID)
        {
            return ApiTools.QuickRequest(new { del_order = orderID }, RequestType.Törlés);
        }

        public static bool DeleteOrderedBook(OrderedBook book)
        {
            var values = new
            {
                del_orderedbook = book.orderID,
                isbn = book.isbn
            };
            return ApiTools.QuickRequest(values, RequestType.Törlés);
        }

        public static bool UpdateQuantity(OrderedBook book)
        {
            var values = new
            {
                mod_orderedbook = book.orderID,
                isbn = book.isbn,
                quantity = book.quantity
            };
            return ApiTools.QuickRequest(values, RequestType.Módosítás);
        }

        public static bool UpdateOrderState(Order order)
        {
            var values = new
            {
                orderID = order.orderID,
                state = order.state
            };
            return ApiTools.QuickRequest(values, RequestType.Módosítás);
        }
    }
}
