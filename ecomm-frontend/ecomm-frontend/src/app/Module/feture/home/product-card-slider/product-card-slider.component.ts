import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { productdata } from 'src/productsData';

@Component({
  selector: 'app-product-card-slider',
  templateUrl: './product-card-slider.component.html',
  styleUrls: ['./product-card-slider.component.scss']
})
export class ProductCardSliderComponent {
  @Input() title: string | undefined;
  @Input() products:any[] | undefined;

  // products:any[]=[]

  constructor(private router:Router) {
    
  }

  navigateToProducts(product:any){
    if(product?.id){
      this.router.navigate([`/product-details/${product?.id}`])
    }
  }
}
