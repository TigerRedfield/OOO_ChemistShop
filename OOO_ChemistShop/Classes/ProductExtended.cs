using OOO_ChemistShop.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOO_ChemistShop.Classes
{
    public class ProductExtended
    {

        public ProductExtended(Model.Medicine medicines)
        {
            this.Medicines = medicines;
        }
        public Model.Medicine Medicines { get; set; }

        //строка с заглушкой или фото+папка
        public string ProductPhotoPath
        {
            get
            {
                string temp = Environment.CurrentDirectory + "/Images/" + Medicines.MedicinePhoto;
                if(!File.Exists(temp))
                {
                    temp = "/Resources/Pictures.png";
                }
                return temp;
            }
        }

        private double productCostWithDiscount;

        //цена со скидкой
        public double ProductCostWithDiscount
        {
            get
            {
                double temp = 0.0;
                double dicount = (double)Medicines.MedicineCost * (double)Medicines.MedicineDiscount / 100;
                temp = (double)Medicines.MedicineCost - dicount;
                return temp;
            }
            set
            {
                productCostWithDiscount = value;
            }
        }
    }
}
