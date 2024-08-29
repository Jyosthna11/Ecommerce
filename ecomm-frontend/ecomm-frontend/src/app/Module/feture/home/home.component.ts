import { Component, OnInit } from "@angular/core";
import { ProductService } from "src/app/state/Product/product.service";
import { gounsPage1 } from "src/Data/Gouns/gouns";
import { mens_kurta } from "src/Data/Men/men_kurta";
import { lehngacholiPage2 } from "src/Data/Saree/lenghaCholiPage2";
import { mensShoesPage1 } from "src/Data/shoes";
import { productdata } from "src/productsData";
function getCatgoriesParams(catagory: string) {
  return {
    category: catagory,
    colors: [],
    sizes: [],
    minPrice: 0,
    maxPrice: 10000,
    minDiscount: 0,
    sort: "price_low",
    pageNumber: 0,
    pageSize: 5,
    stock: null,
  };
}
@Component({
  selector: "app-home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.scss"],
})
export class HomeComponent implements OnInit {
  categories = [
    {
      id: "pant",
      label: "Men's Pants",
      data: [],
    },
    {
      id: "women_dress",
      label: "Women Dresses",
      data: [],
    },
    {
      id: "mens_kurta",
      label: "Men's Kurtas",
      data: [],
    },
    {
      id: "gouns",
      label: "Gouns",
      data: [],
    },
    {
      id: "saree",
      label: "Sarees",
      data: [],
    },
    {
      id: "lengha_choli",
      label: "Lehanga Choli",
      data: [],
    },
  ];

 
  constructor(
    private productService: ProductService,
  ) {}

  ngOnInit(): void {
    this.categories.forEach((data)=>{
      this.getProductByCategory(data?.id)
    })
    // this.getMensProducts();
  }


  getProductByCategory(id: string) {
    var reqData = getCatgoriesParams(id);
    this.productService.getProducts(reqData).subscribe((data: any) => {
      const index = this.categories.findIndex((current) => current?.id === id);
      if (index > -1) {
        this.categories[index].data = data?.content;
      }
    });
  }
}
