import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup } from "@angular/forms";
import {
  menCategory,
  womenCategory,
} from "src/app/Module/shared/components/navbar/navbar-content/navbarMenu";
import { ProductService } from "src/app/state/Product/product.service";
@Component({
  selector: "app-add-product",
  templateUrl: "./add-product.component.html",
  styleUrls: ["./add-product.component.scss"],
})
export class AddProductComponent implements OnInit {
  productForm!: FormGroup;
  categories: any = {
    men: menCategory,
    women: womenCategory,
  };

  topLevelCategories = [
    {
      name: "Men",
      id: "men",
    },
    {
      name: "Women",
      id: "women",
    },
  ];

  seconLevelCategories: any = [];
  thirdLevelCategories:any = [];

  constructor(
    private formBuilder: FormBuilder,
    private productService: ProductService
  ) {}

  ngOnInit(): void {
    this.buildProductForm();
    const topLavelCategoryControl = this.productForm.get("topLavelCategory");
    const secondLavelCategoryControl = this.productForm.get(
      "secondLavelCategory"
    );

    if (topLavelCategoryControl) {
      topLavelCategoryControl.valueChanges.subscribe((value) =>
        this.handleTopLavelCategoryChange(value)
      );
    }

    if (secondLavelCategoryControl) {
      secondLavelCategoryControl.valueChanges.subscribe((value)=>
        this.handleSecondLavelCategoryChange(value)
      );
    }
  }

  buildProductForm() {
    this.productForm = this.formBuilder.group({
      imageUrl: "",
      brand: "",
      title: "",
      color: "",
      quantity: null,
      price: null,
      discountedPrice: null,
      discountPersent: null,
      topLavelCategory: "",
      secondLavelCategory: "",
      thirdLavelCategory: "",
      description: "",
      size: "",
    });
  }

  private handleTopLavelCategoryChange(id: string): void {
    console.log("topLavelCategory changed to:", id);

    console.log(this.categories);
    this.seconLevelCategories = this.categories[id].sections;
    // Add additional logic to handle the change
  }

  private handleSecondLavelCategoryChange(id: string): void {
    console.log("secondLavelCategory changed to:", id);
    this.thirdLevelCategories = this.seconLevelCategories?.find((catg:any)=> catg?.id === id).items
    // Add additional logic to handle the change
  }

  onSubmit() {
    if (this.productForm.valid) {
      const formData = this.productForm.value;
      formData.size = [{ size: formData.size, quantity: formData.quantity }];

      this.productService.createProduct(formData);
      console.log(formData);
      this.productForm.reset();
      alert("product created");
    }
  }
}
