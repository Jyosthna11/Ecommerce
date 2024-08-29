import { Component, Input } from "@angular/core";
import { mens_kurta } from "../../../../../Data/Men/men_kurta";
import { Router } from "@angular/router";
@Component({
  selector: "app-product-card",
  templateUrl: "./product-card.component.html",
  styleUrls: ["./product-card.component.scss"],
})
export class ProductCardComponent {
  @Input() product: any = mens_kurta[0];

  constructor(private router:Router){}
  onClick() {
    this.router.navigate([`/product-details/${this.product?.id}`])
  }
}
