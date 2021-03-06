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
    
    public partial class Item
    {
        public Item()
        {
            this.PurchaseSellInvoceDetails = new HashSet<PurchaseSellInvoceDetail>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public Nullable<int> CategoryId { get; set; }
        public Nullable<decimal> PurchasePrice { get; set; }
        public Nullable<decimal> SellPrice { get; set; }
        public Nullable<int> UnitId { get; set; }
        public Nullable<int> ValidQuantity { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual Unit Unit { get; set; }
        public virtual ICollection<PurchaseSellInvoceDetail> PurchaseSellInvoceDetails { get; set; }
    }
}
