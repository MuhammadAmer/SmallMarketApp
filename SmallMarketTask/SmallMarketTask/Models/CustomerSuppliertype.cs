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
    
    public partial class CustomerSuppliertype
    {
        public CustomerSuppliertype()
        {
            this.CustomersSuppliers = new HashSet<CustomersSupplier>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<CustomersSupplier> CustomersSuppliers { get; set; }
    }
}
