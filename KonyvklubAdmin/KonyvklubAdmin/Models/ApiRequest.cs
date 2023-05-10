using RestSharp;

namespace KonyvklubAdmin.Models
{
    public enum RequestType
    {
        Lekérdezés,
        Hozzáadás,
        Módosítás,
        Törlés
    }

    public class ApiRequest
    {
        private static RestClient _client = new RestClient("https://konyvklub-shop.hu/api/");

        public string Result { get; set; }
        public int Code { get; set; }
        public bool Success { get; set; }
        public string Type { get; set; }

        public ApiRequest(object values, RequestType type = RequestType.Lekérdezés)
        {
            this.Type = type.ToString();
            PostRequest(values);
        }

        public ApiRequest(string key, string value, RequestType type = RequestType.Lekérdezés)
        {
            this.Type = type.ToString();
            GetRequest(key, value);
        }

        private void GetRequest(string key, string value)
        {
            var request = new RestRequest($"?{key}={value}", Method.Get);
            var response = _client.Execute(request);
            ProcessResponse(response);
        }

        private void PostRequest(object body)
        {
            var request = new RestRequest("", Method.Post);
            request.AddObject(body);
            var response = _client.Execute(request);
            ProcessResponse(response);
        }

        private bool IsJson()
        {
            return Result.Contains("{");
        }

        private void ProcessResponse(RestResponse response)
        {
            if (response.StatusCode == 0 || response.Content.Contains("!doctype"))
            {
                this.Result = "A szerver jelenleg nem elérhető!";
                this.Code = 500;
                Success = false;
            }
            else if (response.ContentType == "text/html")
            {
                this.Result = response.Content;
                this.Code = 500;
                Success = false;
            }
            else if ((int)response.StatusCode == 200)
            {
                this.Result = response.Content;
                this.Code = (int)response.StatusCode;
                Success = true;
            }
            else
            {
                this.Result = response.Content;
                this.Code = (int)response.StatusCode;
                Success = false;
            }
        }
    }
}
