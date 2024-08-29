import { Component } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { select, Store } from "@ngrx/store";
import { AppState } from "src/app/Models/AppState";
import {
  findProductByIdRequest,
  updateProductRequest,
} from "src/app/state/Product/Actions";
import { productdata } from "src/productsData";
import { Observable } from "rxjs";
import {
  addItemToCartRequest,
  getCartRequest,
} from "src/app/state/Cart/cart.actions";
import { ProductService } from "src/app/state/Product/product.service";
import { CartService } from "src/app/state/Cart/cart.service";
import { AuthComponent } from "../../auth/auth.component";
import { MatDialog } from "@angular/material/dialog";
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
    pageSize: 16,
    stock: null,
  };
}
@Component({
  selector: "app-product-details",
  templateUrl: "./product-details.component.html",
  styleUrls: ["./product-details.component.scss"],
})
export class ProductDetailsComponent {
  selectedSize!: string;
  relatedProducts: any;
  reviews = [1, 1, 1];
  productDetails$!: Observable<any>;
  productId!: Number;
  userProfile!:any
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private store: Store<AppState>,
    private productService: ProductService,
    private cartService: CartService,
    private dialog: MatDialog,
  ) {
    // this.relatedProducts = productdata;
    this.store.pipe(select((state) => state)).subscribe((store) => {
      console.log('address ', store);
      this.userProfile = store.user.userProfile;
    });
  }

  navigateToCart = () => {
    this.router.navigate(["/cart"]);
  };

  ngOnInit() {
    this.onParamUpdate();
  }

  init(id: number) {
    if (id) {
      console.log("id ", id);
      this.productService.findProductById(id);
    }

    this.productDetails$ = this.store.select(
      (state) => state.product.selectedProduct
    );

    this.productDetails$.subscribe((productdata) => {
      this.productId = Number(productdata?.id);
      console.log("product details from store - ", productdata);

      this.getProductByCategory(productdata?.category?.name);
    });
  }
  handleAddToCart = () => {
    console.log("this.userProfile")
    console.log(this.userProfile)
    if(!this.userProfile){
      this.openLoginModal()
      return
    }
    const data = { size: this.selectedSize, productId: this.productId };
    this.cartService.addItemToCart(data);
    this.cartService.getCart();

    this.store.dispatch(getCartRequest());

    this.navigateToCart();
  };
  getProductByCategory(id: string) {
    var reqData = getCatgoriesParams(id);
    this.productService.getProducts(reqData).subscribe((data: any) => {
      console.log("this.relatedProducts");
      console.log(this.relatedProducts);
      this.relatedProducts = data?.content?.filter(
        (current: any) => current?.id !== this.productId
      );
      console.log(data);
      // const index = this.relatedProducts.findIndex((current:any) => current?.id === id);
      // if (index > -1) {
      //   this.relatedProducts[index].data = data?.content;
      // }
    });
  }

  onParamUpdate() {
    this.route.paramMap.subscribe((params) => {
      const id = params.get("id");

      if (id !== null) {
        console.log("URL parameter changed:", id);
        this.init(Number(id));
      }
  
      window.scrollTo({
        top: 0,
        left: 0,
        behavior: 'smooth'
      });
    });
  }

  openLoginModal(): void {
    this.dialog.open(AuthComponent, {
      width: "400px",
      disableClose: false,
    });
  }
}
