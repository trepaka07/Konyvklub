using KonyvklubAdmin.Models;
using Newtonsoft.Json;
using System.Collections.ObjectModel;

namespace KonyvklubAdmin
{
    public class UserHandler
    {
        private static ObservableCollection<User> users = new ObservableCollection<User>();

        private static void SendSelectRequest(object body)
        {
            ApiRequest request = new ApiRequest(body);
            if (request.Success)
            {
                users = JsonConvert.DeserializeObject<ObservableCollection<User>>(request.Result);
            }
            else if (request.Code == 404)
            {
                users = new ObservableCollection<User>();
            }
        }

        public static ObservableCollection<User> GetUsers()
        {
            SendSelectRequest(new { users = 1 });
            return users;
        }

        public static ObservableCollection<User> SearchUser(string email)
        {
            SendSelectRequest(new { user = email });
            return users;
        }

        public static bool DeleteUser(string email)
        {
            return ApiTools.QuickRequest(new { del_user = email }, RequestType.Törlés);
        }

        public static bool UpdateUser(string email, string lastname, 
            string firstname, string address, string phone, string pwd)
        {
            var values = new
            {
                mod_user = 1,
                email,
                lastname,
                firstname,
                address,
                phone,
                pwd
            };
            return ApiTools.QuickRequest(values, RequestType.Módosítás);
        }
    }
}
