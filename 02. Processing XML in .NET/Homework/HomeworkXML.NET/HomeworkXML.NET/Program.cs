//2. Write program that extracts all different artists which are found in the catalog.xml.
//    For each author you should print the number of albums in the catalogue.
//    Use the DOM parser and a hash-table.

using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Xml;

namespace task2
{
    class Program
    {
        static void Main(string[] args)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalog.xml");
            XmlNode rootNode = doc.DocumentElement;
            Hashtable artistAlbums = new Hashtable();
            foreach (XmlNode node in rootNode.ChildNodes)
            {
                string artist = node["artist"].InnerText;
                if (artistAlbums.ContainsKey(artist))
                {
                    int albumCount = (int)artistAlbums[artist];
                    albumCount++;
                    artistAlbums[artist] = albumCount;
                }
                else
                {
                    artistAlbums.Add(artist, 1);
                }
            }

            foreach (DictionaryEntry artistAlbumNumber in artistAlbums)
            {
                Console.WriteLine("{0} has {1} albums in the catalog", artistAlbumNumber.Key, artistAlbumNumber.Value);
            }
        }
    }
}
