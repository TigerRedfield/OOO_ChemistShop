using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace OOO_ChemistShop.Classes
{
    public class OrderExtended
    {
        //Свойства класса
        public Model.Order Order { get; set; }		//Связь с моделью

        public double TotalSumma { get; set; }	//Сумма всего заказа
        public double TotalDiscount { get; set; }   //Суммарная скидка

        public double TotalDiscountPercent  //Свойство класса – суммарная скидка в %
        {
            get
            {
                return TotalDiscount * 100 / TotalSumma;
            }
        }

        /// Метод расчета суммы заказа по номеру заказа
        public double CalcTotalSummma(List<Model.MedicineOrder> productsInOrder)
        {
            double total = 0;
            //Перебор всех заказанных товаров
            foreach (var item in productsInOrder)
            {
                if (item.OrderId == Order.OrderId)	//Выделение только товаров текущего заказа
                {
                    total += (int)item.Medicine.MedicineCost * item.ProductCount;
                }
            }
            return total;
        }


        /// Метод расчета суммарной скидки заказа по номеру заказа
        public double CalcTotalDiscount(List<Model.MedicineOrder> productsInOrder)
        {
            double total = 0;
            foreach (var item in productsInOrder)
            {
                if (item.OrderId == Order.OrderId)
                {
                    //Стоимость товара с учетом скидки
                    double discountAmount = (double)item.Medicine.MedicineCost *
                                                               (item.Medicine.MedicineDiscount / 100.0);
                    total += discountAmount * item.ProductCount;
                }
            }
            return total;
        }

        public SolidColorBrush BackgroundColor
        {
            get
            {
                var allInStorage = true; //все товары есть на складе

                foreach (var item in Order.MedicineOrder)
                {
                    if (item.ProductCount < 3)
                    {
                        allInStorage = false;
                        break;
                    }
                }

                if (!allInStorage)
                {
                    return new SolidColorBrush(Color.FromArgb(255, 240, 255, 255));
                }
                else
                {
                    return new SolidColorBrush(Color.FromArgb(255, 230, 230, 250));
                }
            }
        }
    }
}
