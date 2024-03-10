using Microsoft.Win32;
using OOO_ChemistShop.Classes;
using OOO_ChemistShop.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.IO;
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
    /// Логика взаимодействия для CatalogWindow.xaml
    /// </summary>
    public partial class CatalogWindow : Window
    {

        OpenFileDialog dlg = new OpenFileDialog();
        bool isPhoto = false;		//Наличие фото
        string filePath;			//Путь к фото из диалога
        //Путь к папке с фотографиями
        string pathPhoto = System.IO.Directory.GetCurrentDirectory() + @"\Images\";
        Model.Medicine medicine;	//Товар, с которым сейчас работают
        public CatalogWindow()
        {
            InitializeComponent();
            this.DataContext = this;			//Элементы интерфейса связать с данными
        }

      public List<Classes.ProductInOrder> productInOrders = new List<Classes.ProductInOrder>();

        /// <summary>
        /// Событие кнопки назад
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ButtonExit_Click(object sender, RoutedEventArgs e)
        {
            //Предупреждение о том, что пользователь вернётся в главное меню
            if (MessageBox.Show("Вы точно хотите вернуться на главное меню?", "Внимание!", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                this.Close(); //Закрытие окна
            }
        }

        /// <summary>
        /// Событие загрузки элементов интерфейса и данных о товарах
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //не видно кнопку связанную с отсутствием товаров в корзине
            OrderButtton.Visibility = Visibility.Hidden;
            AddProductButton.Visibility = Visibility.Hidden;
            miDescriptionMedicine.Visibility = Visibility.Hidden;
            miAddInOrder.Visibility = Visibility.Hidden;
            AdmAddPicture.Visibility = Visibility.Hidden;
            admDeleteCatalog.Visibility = Visibility.Hidden;
            WorkOrderButton.Visibility = Visibility.Hidden;

            //Информация о пользователе
            if (Helper.User != null)			//Авторизованный
            {
                txtFIO.Text = Helper.User.UserFullName;
                switch (Helper.User.UserRoleId)
                {
                    case 1:				//Пользователь
                        miAddInOrder.Visibility = Visibility.Visible;
                        miDescriptionMedicine.Visibility = Visibility.Visible;
                        break;
                    case 2:				//Менеджер
                        WorkOrderButton.Visibility = Visibility.Visible;
                        break;
                    case 3:				//Администратор
                        WorkOrderButton.Visibility = Visibility.Visible;
                        AddProductButton.Visibility = Visibility.Visible;
                        AdmAddPicture.Visibility = Visibility.Visible;
                        admDeleteCatalog.Visibility = Visibility.Visible;
                        break;
                }
            }
            else					//Гость
            {
                txtFIO.Text = "Гость";
                miDescriptionMedicine.Visibility = Visibility.Visible;
            }


            // Получили все данные о товарах
            List<Model.Categories> categories = new List<Model.Categories>();
            List<Model.Manufacturers> manufacturers = new List<Model.Manufacturers>();

            Model.Categories category = new Model.Categories();
            category.CategoryId = 0;
            category.CategoryName = "Все категории";
            categories.Add(category);
            categories.AddRange(Helper.DB.Categories.ToList());

            Model.Manufacturers manufacturer = new Model.Manufacturers();
            manufacturer.MedicineManufacturerId = 0;
            manufacturer.ManufacturerName = "Все производители";
            manufacturers.Add(manufacturer);
            manufacturers.AddRange(Helper.DB.Manufacturers.ToList());

            CbCategoryFilter.DisplayMemberPath = "CategoryName";
            CbCategoryFilter.SelectedValuePath = "CategoryId";
            CbCategoryFilter.ItemsSource = categories;

            cbFilterManuf.DisplayMemberPath = "ManufacturerName";
            cbFilterManuf.SelectedValuePath = "MedicineManufacturerId";
            cbFilterManuf.ItemsSource = manufacturers;

            cbFilterDisc.SelectedIndex = 0;
            cbFilterManuf.SelectedIndex = 0;
            CbCategoryFilter.SelectedIndex = 0;
            RbHigh.IsChecked = true;

            ShowMedicines();
        }



        /// <summary>
        ///   Метод отображает информацию о лекарствах с дополнительными свойствами
        /// </summary>
        private void ShowMedicines()
        {
            List<ProductExtended> productExtendeds = Helper.DB.Medicine.ToList().ConvertAll<ProductExtended>(p => new ProductExtended(p));

            int min = 0; int max = 100;

            //фильтр по скидке
            if (cbFilterDisc.SelectedIndex > 0)
            {
                switch (cbFilterDisc.SelectedIndex)
                {
                    case 1:
                        min = 0; max = 9;
                        break;
                    case 2:
                        min = 10; max = 14;
                        break;
                    case 3:
                        min = 15; max = 100;
                        break;
                }
                productExtendeds = productExtendeds.Where(pr => pr.Medicines.MedicineDiscount >= min && pr.Medicines.MedicineDiscount <= max).ToList();
            }

            if(CbCategoryFilter.SelectedIndex > 0)
            {
                productExtendeds = productExtendeds.Where(pr => pr.Medicines.MedicineCategory == (int)CbCategoryFilter.SelectedValue).ToList();
            }

            if (cbFilterManuf.SelectedIndex > 0)
            {
                productExtendeds = productExtendeds.Where(pr => pr.Medicines.MedicineManufacturerId == (int)cbFilterManuf.SelectedValue).ToList();
            }

            if(RbHigh.IsChecked == true)
            {
                productExtendeds = productExtendeds.OrderBy(pr => pr.Medicines.MedicineCost).ToList();
            }

            else if(RbLow.IsChecked == true)
            {
                productExtendeds = productExtendeds.OrderByDescending(pr => pr.Medicines.MedicineCost).ToList();
            }

            //поиск по названию товаров

            string search = tbSearch.Text;
            if (!string.IsNullOrEmpty(search))
            {
                productExtendeds = productExtendeds.Where(pr => pr.Medicines.MedicineName.ToLower().Contains(search.ToLower())).ToList();
            }

            ListBoxProduct.ItemsSource = productExtendeds;

        }


        /// <summary>
        /// Событие для работы фильтрации по категориям
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CbCategoryFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ShowMedicines();
        }


        /// <summary>
        /// Событие для работы фильтрации по скидке
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cbFilterDisc_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ShowMedicines();
        }


        /// <summary>
        /// Событие для работы фильтрации по производителям
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cbFilterManuf_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ShowMedicines();
        }

        /// <summary>
        /// Событие для работы поиска по названию товара
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            ShowMedicines();
        }



        /// <summary>
        /// Событие для работы сортировки стоимости по возрастанию
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RbHigh_Checked(object sender, RoutedEventArgs e)
        {
            ShowMedicines();
        }

        /// <summary>
        /// Событие для работы сортировки стоимости по убыванию
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RbLow_Checked(object sender, RoutedEventArgs e)
        {
            ShowMedicines();
        }

        /// <summary>
        /// Событие для добавления товара в корзину из контекстного меню
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void miAddInOrder_Click(object sender, RoutedEventArgs e)
        {
            OrderButtton.Visibility = Visibility.Visible;
            //Выбранный товар
            Classes.ProductExtended productSelected = ListBoxProduct.SelectedItem as ProductExtended;
            //Ищем товар по ID
            int ID = productSelected.Medicines.MedicineId;
            //результат поиска товара по индексу
            Classes.ProductInOrder productSearch = productInOrders.FirstOrDefault(pr => pr.ProductExtendedInOrder.Medicines.MedicineId == ID);
            if(productSearch != null)
            {
                productSearch.countProductInOrder++;
            }
            else
            {
                //Создали продукт на основе выбранного
                Classes.ProductInOrder productNew = new Classes.ProductInOrder(productSelected);
                //добавили в заказ товар
                productInOrders.Add(productNew);
            }
        }

        /// <summary>
        /// Событие для кнопки просмотра заказа
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void OrderButtton_Click(object sender, RoutedEventArgs e)
        {
            View.OrderWindow orderWindow = new View.OrderWindow(productInOrders);
            this.Hide();
            orderWindow.Owner = this;
            orderWindow.ShowDialog();
            this.ShowDialog();
        }

        /// <summary>
        /// Событие для кнопки работы с заказами
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void WorkOrderButton_Click(object sender, RoutedEventArgs e)
        {
            WorkOrderWindow workOrder = new WorkOrderWindow();
            this.Hide();
            workOrder.ShowDialog();
            this.ShowDialog();
        }

        /// <summary>
        /// Событие по двойному клику по товару для редактирования его данных 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ListBoxProduct_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (Helper.User.UserRoleId == 3) 		//Только для роли администратора 
            {
                //Выбранный товар в каталоге
                Classes.ProductExtended productSelected =
                                         ListBoxProduct.SelectedItem as Classes.ProductExtended;
                //Вызов конструктора с параметром - выбранный товар для редактирования
                View.EditCatalogWindow editCatalog = new View.EditCatalogWindow(productSelected);
                this.Hide();
                editCatalog.ShowDialog();
                ShowMedicines();
                this.ShowDialog();
            }
        }


        /// <summary>
        /// Событие для кнопки добавления товара в каталог
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void AddProductButton_Click(object sender, RoutedEventArgs e)
        {
            //Вызов конструктора без параметров
            View.EditCatalogWindow editCatalog = new View.EditCatalogWindow();
            this.Hide();
            editCatalog.ShowDialog();
            this.ShowDialog();
            ShowMedicines();

        }


        /// <summary>
        /// Событие для кнопки удаления товара из списка каталога
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void admDeleteCatalog_Click(object sender, RoutedEventArgs e)
        {
            Classes.ProductExtended productSelected = null;
            if (ListBoxProduct.SelectedItem == null)	//Проверка, что есть выбранный товар в списке
            {
                MessageBox.Show("Выберите удаляемый товар");
                return;
            }
            //Выбранный товар в каталоге
            productSelected = ListBoxProduct.SelectedItem as Classes.ProductExtended;
            if (MessageBox.Show("Вы действительно хотите удалить этот товар?",
                        "Подтверждение удаления", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                //Выбранный товар
                Model.Medicine product = productSelected.Medicines;
                //Поиск его среди заказанных товаров для правильного удаления
                Model.MedicineOrder orderProduct = Helper.DB.MedicineOrder.
                                                  FirstOrDefault(pr => pr.MedicineId == product.MedicineId);
                if (orderProduct == null)				//Товар еще не заказывали
                {
                    Helper.DB.Medicine.Remove(product); 	//Можно удалять
                    try
                    {
                        Helper.DB.SaveChanges(); 		//Фиксация изменений в БД
                        MessageBox.Show("Товар успешно удален");
                        ShowMedicines();
                    }
                    catch
                    {
                        MessageBox.Show("При удалении возникли проблемы");
                        return;
                    }
                }
                else 					//Товар присутствует в заказах - удалять нельзя
                {
                    MessageBox.Show("Удалить нельзя, т.к. товар есть в заказах");
                    return;
                }
            }
        }


        /// <summary>
        /// Событие для добавления картинки товара из контекстного меню
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void AdmAddPicture_Click(object sender, RoutedEventArgs e)
        {

            Classes.ProductExtended productSelected = null;
            productSelected = ListBoxProduct.SelectedItem as Classes.ProductExtended;

            if (ListBoxProduct.SelectedItem == null)	//Проверка, что есть выбранный товар в списке
            {
                MessageBox.Show("Выберите товар у которой хотите изменить картинку");
                return;
            }

                if (dlg.ShowDialog() == true)
                {
                    filePath = dlg.FileName;
                    //Ищем товар по ID
                    medicine = productSelected.Medicines;
                    //результат поиска товара по индексу
                    medicine.MedicinePhoto = Helper.DB.Medicine.FirstOrDefault(x => x.MedicineId == medicine.MedicineId).MedicineName + ".jpg";     //Для записи в БД
                    string newPath = pathPhoto + medicine.MedicinePhoto;    //Полное имя файла цели
                    System.IO.File.Copy(filePath, newPath, true); //Копирование из диалога в целевую

                    try
                    {
                        Helper.DB.SaveChanges();        //Обновить БД и при добавлении/редактировании
                        MessageBox.Show("БД успешно обновлена");
                        ShowMedicines();

                    }
                    catch
                    {
                        MessageBox.Show("При обновлении БД возникли проблемы");
                    }

                }
        
            
 
        }


        /// <summary>
        /// Событие для просмотра описания товара из контекстного меню
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void miDescriptionMedicine_Click(object sender, RoutedEventArgs e)
        {
            //Выбранный товар в каталоге
            Classes.ProductExtended productSelected =
                                     ListBoxProduct.SelectedItem as Classes.ProductExtended;

            //Вызов конструктора с параметром
            View.DescriptionMedicineWindow descriptionMedicine = new View.DescriptionMedicineWindow(productSelected);
            this.Hide();
            descriptionMedicine.ShowDialog();
            ShowMedicines();
            this.ShowDialog();


        }
    }
    
}

