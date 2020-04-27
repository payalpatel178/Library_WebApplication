using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryWebApplication.BusinessLayer
{
    public class Book
    
    {
        public string Title { get; set; }
        public int PageCount { get; set; }
        public decimal Price { get; set; }
    }
}