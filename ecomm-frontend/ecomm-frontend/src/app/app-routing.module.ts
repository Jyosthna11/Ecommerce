import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './Module/feture/home/home.component';
import { ProductsComponent } from './Module/feture/products/products.component';
import { CartComponent } from './Module/feture/cart/cart.component';
import { ProductDetailsComponent } from './Module/feture/product-details/product-details.component';
import { CheckoutComponent } from './Module/feture/checkout/checkout.component';
import { PaymentComponent } from './Module/feture/payment/payment.component';
import { PaymentSuccessComponent } from './Module/feture/payment-success/payment-success.component';
import { LoginComponent } from './Module/auth/login/login.component';
import { RegisterComponent } from './Module/auth/register/register.component';
import { OrderComponent } from './Module/feture/order/order.component';
import { OrderDetailsComponent } from './Module/feture/order-details/order-details.component';
import { authGuard } from './guards/auth.guard';
import { adminGuard } from './guards/admin.guard';

const routes: Routes = [
  {path:"",component:HomeComponent},
  {path:'login',component:LoginComponent},
  {path:"products",component:ProductsComponent},
  {path:'register',component:RegisterComponent},
  {path:'cart',component:CartComponent,canActivate:[authGuard]},
  {path:'product-details/:id',component:ProductDetailsComponent},
  {path:'checkout',component:CheckoutComponent,canActivate:[authGuard]},
  {path:'checkout/payment/:id',component:PaymentComponent,canActivate:[authGuard]},
  {path:'payment-success',component:PaymentSuccessComponent,canActivate:[authGuard]},
  { path: ':lavelOne/:lavelTwo/:lavelThree', component: ProductsComponent },
  { path: 'order-summery', component: ProductsComponent,canActivate:[authGuard] },
  { path: 'account/orders', component: OrderComponent,canActivate:[authGuard] },
  { path: 'order/:orderId', component: OrderDetailsComponent, canActivate:[authGuard] },
  {path: 'admin',canActivate:[adminGuard],loadChildren:()=>import("./Module/admin/admin-routing.module").then(m=>m.AdminRoutingModule)}
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
