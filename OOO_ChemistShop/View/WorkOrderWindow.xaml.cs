using OOO_ChemistShop.Classes;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace OOO_ChemistShop.View
{
    /// <summary>
    /// Логика взаимодействия для WorkOrderWindow.xaml
    /// </summary>
    public partial class WorkOrderWindow : Window
    {
        public WorkOrderWindow()
        {
            InitializeComponent();
        }

        //Список всех заказов из БД
        List<Model.Order> listOrders = new List<Model.Order>();
        //Список заказанных товаров
        List<Model.MedicineOrder> listProductsInOrders = new List<Model.MedicineOrder>();
        //Список заказанных товаров с дополнительными свойствами
        List<Classes.OrderExtended> listExtendedOrders;


        Classes.OrderExtended selectOrder;      //Выбранный заказ

        /// При загрузке окна
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //Список статусов заказа
            cbStatus.ItemsSource = Helper.DB.Status.ToList();
            cbStatus.DisplayMemberPath = "StatusName";
            cbStatus.SelectedValuePath = "StatusId";
            cbFilterDiscount.SelectedIndex = 0;
            ShowOrders();
        }

        /// Метод отображает информацию о заказах с дополнительными свойствами
        /// </summary>
        private void ShowOrders()
        {
            listOrders = Helper.DB.Order.ToList();  //Получить все заказы
            int totalCount = listOrders.Count;      //Их общее количество
            listProductsInOrders = Helper.DB.MedicineOrder.ToList(); //Получить все заказанные товары
                                                                     //Создание списка заказанных товаров с расширенными свойствами
            listExtendedOrders = new List<OrderExtended>();
            foreach (var order in listOrders)
            {
                Classes.OrderExtended orderExtended = new OrderExtended();
                orderExtended.Order = order;        //Заполнить данные о заказе из БД
                                                    //Вызов методов класса через объект для вычисления дополнительных свойств
                orderExtended.TotalSumma = orderExtended.CalcTotalSummma(listProductsInOrders);
                orderExtended.TotalDiscount = orderExtended.CalcTotalDiscount(listProductsInOrders);
                listExtendedOrders.Add(orderExtended);
            }

            if (cbFilterDiscount != null)
            {
                if (cbFilterDiscount.SelectedIndex == 1)
                {
                    listExtendedOrders = listExtendedOrders.Where(o => o.TotalDiscountPercent < 3).ToList();
                }
                else if (cbFilterDiscount.SelectedIndex == 2)
                {
                    listExtendedOrders = listExtendedOrders.Where(o => o.TotalDiscountPercent > 2.99 && o.TotalDiscountPercent < 5).ToList();
                }
                else if (cbFilterDiscount.SelectedIndex == 3)
                {
                    listExtendedOrders = listExtendedOrders.Where(o => o.TotalDiscountPercent > 4.99).ToList();
                }

            }

            if (RbSortHigh.IsChecked == true)
            {
                listExtendedOrders = listExtendedOrders.OrderBy(or => or.TotalSumma).ToList();
            }

            else if (RbSortLow.IsChecked == true)
            {
                listExtendedOrders = listExtendedOrders.OrderByDescending(or => or.TotalSumma).ToList();
            }

            else if (RbSortAll.IsChecked == true)
            {
                listExtendedOrders = listExtendedOrders.ToList();
            }


            //Отображение информации о заказах
            int filterCount = listExtendedOrders.Count;
            listViewOrders.ItemsSource = null;
            listViewOrders.ItemsSource = listExtendedOrders;
            tbCount.Text = filterCount + " из " + totalCount + " ";
        }

        /// Метод создает список заказанных товаров только для конкретного заказа
        /// <param name="orderId"> Номер заказа</param>
        /// <returns>Построенный список из товаров в заказе</returns>
        public List<Model.MedicineOrder> ListProductsInOrderId(int orderId)
        {
            List<Model.MedicineOrder> list = new List<Model.MedicineOrder>();
            //Поиск всех товаров для выбранного номера заказа
            list = listProductsInOrders.FindAll(pr => pr.OrderId == orderId).ToList();
            return list;
        }

        /// Выбор заказа в списке заказов
        private void listViewOrders_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //Проверка, что есть выбранный заказ
            if (listViewOrders.SelectedItem == null)
                return;
            //Получение всей информации о выбранном заказе
            selectOrder = listViewOrders.SelectedItem as Classes.OrderExtended;
            //Формирование списка товаров в этом заказе по разработанному методу
            List<Model.MedicineOrder> listTemp = ListProductsInOrderId(selectOrder.Order.OrderId);
            //Отображение товаров выбранного заказа
            listViewOrder.ItemsSource = listTemp;
            //Отобразить статус заказа
            cbStatus.SelectedValue = selectOrder.Order.OrderStatusId;
            //Отобразить дату доставки заказа
            dateDelivery.SelectedDate = selectOrder.Order.DateDelivery;
            ShowOrders();
        }

        

        /// <summary>
        /// Выбор условия фильтрации
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cbFilterDiscount_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ShowOrders();
        }

        /// <summary>
        /// Сохранение в таблицу Order БД изменений о заказе
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void butEditOrder_Click(object sender, RoutedEventArgs e)
        {
            //Есть выбранный заказ для редактирования
            if (selectOrder != null)
            {
                //Получить объект модели заказа
                Model.Order order = selectOrder.Order;
                //Задать новые значения для даты доставки и статуса
                order.DateDelivery = (DateTime)dateDelivery.SelectedDate;
                order.OrderStatusId = (int)cbStatus.SelectedValue;
                try
                {
                    Helper.DB.SaveChanges();        //Сохранение в БД
                    MessageBox.Show("Данные успешно обновлены");
                    ShowOrders();
                }
                catch
                {
                    MessageBox.Show("При обновлении данных возникли проблемы");
                    return;
                }
            }
            else
            {
                MessageBox.Show("Не выбран редактируемый заказ");
            }
        }

        /// <summary>
        /// Событие без сортировки
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RbSortAll_Checked(object sender, RoutedEventArgs e)
        {
            ShowOrders();
        }

        /// <summary>
        /// Событие сортировки по стоимости по возрастанию
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RbSortHigh_Checked(object sender, RoutedEventArgs e)
        {
            ShowOrders();
        }

        /// <summary>
        /// Событие сортировки по стоимости по убыванию
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RbSortLow_Checked(object sender, RoutedEventArgs e)
        {
            ShowOrders();
        }
        
        /// <summary>
        /// Событие кнопки назад
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ButtonExit_Click(object sender, RoutedEventArgs e)
        {
            //Предупреждение о том, что пользователь вернётся в предыдущее окно
            if (MessageBox.Show("Вы точно хотите вернуться на экран выбора товаров?", "Внимание!", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                this.Close(); //Закрытие окна
            }
        }
    }
}
