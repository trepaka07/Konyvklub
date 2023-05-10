using KonyvklubAdmin.models;
using KonyvklubAdmin.Models;
using Newtonsoft.Json;
using System.Collections.ObjectModel;
using System.Windows;

namespace KonyvklubAdmin
{
    public class AdminHandler
    {
        private static ObservableCollection<Admin> admins = new ObservableCollection<Admin>();

        public static string Admin { get; set; } = string.Empty;

        public static ObservableCollection<Admin> GetAdmins()
        {
            ApiRequest request = new ApiRequest(new { admins = 1 });
            if (request.Success)
            {
                admins = JsonConvert.DeserializeObject<ObservableCollection<Admin>>(request.Result);
            }
            else if (request.Code == 404)
            {
                admins = new ObservableCollection<Admin>();
            }
            return admins;
        }

        public static bool Login(string username, string pwd)
        {
            var values = new
            {
                admin_login = username,
                adminpwd = pwd
            };
            ApiRequest request = new ApiRequest(values);
            if (!request.Success)
            {
                Globals.Alert(request.Result, "Bejelentkezés", MessageBoxImage.Error);
                return false;
            }
            return true;
        }

        public static bool Signup(string username, string pwd)
        {
            var values = new
            {
                admin_signup = username,
                adminpwd = pwd
            };
            ApiRequest request = new ApiRequest(values);
            if (!request.Success)
            {
                Globals.Alert(request.Result, "Regisztráció", MessageBoxImage.Error);
                return false;
            }
            return true;
        }

        public static bool Delete(string username)
        {
            if (Admin == username)
            {
                Globals.Alert("Az aktuális admin nem törölhető!", "Törlés", MessageBoxImage.Error);
                return false;
            }
            return ApiTools.QuickRequest(new { del_admin = username }, RequestType.Törlés);
        }
    }
}
