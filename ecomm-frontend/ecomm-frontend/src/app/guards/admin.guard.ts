import { inject } from "@angular/core";
import { CanActivateFn, Router } from "@angular/router";
export const adminGuard: CanActivateFn = (route, state) => {
  const router = inject(Router);
  const isAdmin = localStorage.getItem("role") === "ROLE_ADMIN";
  if (!isAdmin) {
    router.navigate(["/"]);
    return false;
  }
  return true;
};
