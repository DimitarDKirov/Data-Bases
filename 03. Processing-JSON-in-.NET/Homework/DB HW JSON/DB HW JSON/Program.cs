using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace DB_HW_JSON
{
    class Program
    {
        class VideoDescription
        {
            [JsonProperty("title")]
            public string Title { get; set; }

            [JsonProperty("link[@href]")]
            public string Link { get; set; }

            [JsonProperty("media:group[media:title]")]
            public string ImgLink { get; set; }

            [JsonProperty("media:thumbnail[@url]")]
            public string Description { get; set; }
        }
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            string rssUrl = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLC-vbm7OWvpbqzXaoAMGGw";
            var webClient = new WebClient();
            var rssData = webClient.DownloadData(rssUrl);
            string rssXmlContent = Encoding.UTF8.GetString(rssData);

            XmlDocument document = new XmlDocument();
            document.LoadXml(rssXmlContent);

            string rssJson = JsonConvert.SerializeXmlNode(document, Newtonsoft.Json.Formatting.Indented);

            var jsonLinq = JObject.Parse(rssJson);
            var titles = jsonLinq["feed"]["entry"].Select(item => item["title"]);

            Console.WriteLine("Titles found");
            foreach(string title in titles)
            {
                Console.WriteLine(title);
            }
        }
    }
}
