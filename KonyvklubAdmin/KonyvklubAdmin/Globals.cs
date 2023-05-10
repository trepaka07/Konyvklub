using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media;

namespace KonyvklubAdmin
{
    public class Globals
    {
        private static readonly Dictionary<string, string> charEncodings = new Dictionary<string, string>()
        {
            { "\\u00e1", "á" },
            { "\\u00e9", "é" },
            { "\\u00eD", "í" },
            { "\\u00f3", "ó" },
            { "\\u00f6", "ö" },
            { "\\u0151", "ő" },
            { "\\u00fc", "ü" },
            { "\\u0171", "ű" }
        };

        public static bool Confirm(string message, string title = "Megerősítés")
        {
            MessageBoxResult mbr = MessageBox.Show(message, title, MessageBoxButton.YesNo);
            return mbr == MessageBoxResult.Yes;
        }

        public static void Alert(string message, string title = "Könyvklub", MessageBoxImage img = MessageBoxImage.None)
        {
            MessageBox.Show(StrToUtf8(message), title, MessageBoxButton.OK, img);
        }

        public static bool IsNumberInput(string input)
        {
            Regex regex = new Regex("[^0-9]+");
            return regex.IsMatch(input);
        }

        public static string StrToUtf8(string text)
        {
            foreach (KeyValuePair<string, string> item in charEncodings)
            {
                if (text.Contains(item.Key))
                {
                    text = text.Replace(item.Key, item.Value);
                }
            }
            text = text.Trim('"');
            return text;
        }
    }
}
