import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, catchError, map, of } from "rxjs";
import { User } from "src/app/Models/user.model";
import { BASE_API_URL } from "src/app/config/api";
import {
  getAllCustomersFailure,
  getAllCustomersSuccess,
  getUserProfileFailure,
  getUserProfileSuccess,
  logoutSuccess,
} from "./Actions";
import { Store } from "@ngrx/store";
import { ActivatedRoute, Router } from "@angular/router";
const private_url = ["/cart","/checkout","/checkout/payment/:id","/order-summery","/account/orders","/order/:orderId"]
const shouldNavigateToHome = (url:string)=>{
  return private_url.includes(url) || url.startsWith('/admin')
}
@Injectable({
  providedIn: "root",
})
export class UserService {
  private apiUrl = BASE_API_URL + "/api/users/profile";

  constructor(private http: HttpClient, private store: Store,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  getUserProfile() {
    const headers = new HttpHeaders().set(
      "Authorization",
      `Bearer ${localStorage.getItem("jwt")}`
    );
    return this.http
      .get<User>(this.apiUrl, { headers })
      .pipe(
        map((data: any) => {
          localStorage.setItem("role", data?.role);
          return getUserProfileSuccess({ userProfile: data });
        }),
        catchError((error: any) => {
          console.error("Error getting user profile", error);
          return of(getUserProfileFailure(error));
        })
      )
      .subscribe((action) => {
        console.log("action ", action);
        return this.store.dispatch(action);
      });
  }

  getAllCustomers() {
    const headers = new HttpHeaders().set(
      "Authorization",
      `Bearer ${localStorage.getItem("jwt")}`
    );
    return this.http
      .get<User>(`${BASE_API_URL}/api/admin/users`, { headers })
      .pipe(
        map((data: any) => {
          console.log("get user ", data);
          return getAllCustomersSuccess({ payload: data });
        }),
        catchError((error: any) => {
          console.error("Error getting user profile", error);
          return of(getAllCustomersFailure(error));
        })
      )
      .subscribe((action) => {
        console.log("action ", action);
        return this.store.dispatch(action);
      });
  }

  logout() {
    console.log("this.router")
    console.log(this.router)
    let routePattern:any = this.getFullRoutePattern(this.route);
    console.log('Full route pattern:', routePattern);

    console.log("shouldNavigateToHome(routePattern)")
    console.log(shouldNavigateToHome(routePattern))
    
    localStorage.removeItem("jwt");
    localStorage.removeItem("role");
    this.store.dispatch(logoutSuccess());
    if(shouldNavigateToHome(routePattern)){
      this.router.navigate(['/']);
    }
  }


  getFullRoutePattern(route: ActivatedRoute): string | undefined {
    let path = route.routeConfig?.path || '';
    let childRoute = route.firstChild;

    while (childRoute) {
      path += '/' + (childRoute.routeConfig?.path || '');
      childRoute = childRoute.firstChild;
    }

    return path || undefined;
  }
}
