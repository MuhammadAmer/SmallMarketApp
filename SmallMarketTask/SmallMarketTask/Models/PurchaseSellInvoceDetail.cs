//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmallMarketTask.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PurchaseSellInvoceDetail
    {
        public int Id { get; set; }
        public Nullable<int> PurchaseSellInvoiceId { get; set; }
        public Nullable<int> ItemId { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<decimal> TotalPrice { get; set; }
        public Nullable<decimal> TotalDiscount { get; set; }
    
        public virtual Item Item { get; set; }
        public virtual PurchaseSellInvoice PurchaseSellInvoice { get; set; }
    }
}