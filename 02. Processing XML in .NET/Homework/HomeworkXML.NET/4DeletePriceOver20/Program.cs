using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace _4DeletePriceOver20
{
    class Program
    {
        static void Main(string[] args)
        {
            XmlDocument document = new XmlDocument();
            document.Load("../../../catalog.xml");
            XmlNode rootNode = document.DocumentElement;
            foreach (XmlNode element in rootNode.ChildNodes)
            {
                float albumPrice = float.Parse(element["price"].InnerText);
                if (albumPrice > 20.0)
                {
                    rootNode.RemoveChild(element);
                }
            }

            document.Save("../../catalog4Result.xml");            
        }
    }
}
