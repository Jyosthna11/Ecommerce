import { Component } from '@angular/core';
import { Route, Router } from '@angular/router';
import { Store, select } from '@ngrx/store';
import { AppState } from 'src/app/Models/AppState';
import { CartService } from 'src/app/state/Cart/cart.service';
function updateCartPricing(cartItems:any) {
  const cart:any = {}
  let totalPrice = 0;
  let totalDiscountedPrice = 0;
  let totalItem = 0;

  cartItems.forEach((item:any) => {
    totalDiscountedPrice += item.discountedPrice;
    totalPrice += item?.price;
      // totalPrice += item.price * item.quantity;
      // totalDiscountedPrice += item.discountedPrice * item.quantity;
      totalItem += item.quantity;
  });

  const totalDiscount = totalPrice - totalDiscountedPrice;

  cart.totalPrice = totalPrice;
  cart.totalItem = totalItem;
  cart.totalDiscountedPrice = totalDiscountedPrice;
  cart.discount = totalDiscount;

  return cart;
}
@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.scss'],
})
export class CartComponent {
  products = [1, 1, 1, 1, , 1];
  cart: any;
  cartItems:any;
  cartPaymentSummary:any = {}

  constructor(
    private router: Router,
    private cartService: CartService,
    private store: Store<AppState>
  ) {}

  ngOnInit() {
    console.log("ngOnInit")
   this.getCartDetail()
  }

  navigateToCheckout = () => {
    this.router.navigate(['checkout']);
  };

 

  getCartDetail(){
    this.cartService.getCart();

    this.store.pipe(select((store) => store.cart)).subscribe((cart) => {
      const data = {...cart}
      this.cartItems = cart?.cartItems
      if(data?.cart){
        this.cartPaymentSummary = updateCartPricing(cart?.cartItems)
      }
      console.log("data?.cart")
      console.log(data)
      console.log(this.cartItems)
      console.log(this.cartPaymentSummary)
    });
  }
  
}
