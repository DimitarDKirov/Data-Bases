using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Xml;

namespace _3ArtistsXPath
{
    class Program
    {
        static void Main(string[] args)
        {
            XmlDocument document = new XmlDocument();
            document.Load("../../../catalog.xml");
            string xPathQuery = "/catalog/album/artist";
            XmlNodeList nodeList = document.SelectNodes(xPathQuery);
            Hashtable artistAlbumsCount = new Hashtable();
            foreach (XmlElement artistNode in nodeList)
            {
                string artist = artistNode.InnerText;
                if (artistAlbumsCount.ContainsKey(artist))
                {
                    int albumCount = (int)artistAlbumsCount[artist];
                    albumCount++;
                    artistAlbumsCount[artist] = albumCount;
                }
                else
                {
                    artistAlbumsCount.Add(artist, 1);
                }
            }

            foreach (DictionaryEntry artistAlbums in artistAlbumsCount)
            {
                Console.WriteLine("{0} has {1} albums in the catalog", artistAlbums.Key, artistAlbums.Value);
            }
        }
    }
}
