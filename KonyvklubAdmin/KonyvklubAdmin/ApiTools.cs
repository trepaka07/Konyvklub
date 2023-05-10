using KonyvklubAdmin.Models;
using System.Windows;

namespace KonyvklubAdmin
{
    public class ApiTools
    {
        public static bool QuickRequest(object values, RequestType requestType)
        {
            ApiRequest request = new ApiRequest(values, requestType);
            ErrorCheck(request);
            return request.Success;
        }

        private static void ErrorCheck(ApiRequest request)
        {
            if (request.Code != 200)
            {
                Globals.Alert(Globals.StrToUtf8(request.Result), request.Type, MessageBoxImage.Error);
            }
        }
    }
}
