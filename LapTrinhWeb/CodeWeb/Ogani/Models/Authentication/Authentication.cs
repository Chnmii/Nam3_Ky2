using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Test.Models.Authentication
{
    public class Authentication : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            context.Result = new RedirectToRouteResult(
                new RouteValueDictionary
                {
                    {"Controller", "Access" },
                    {"Action", "Login" }
            });
        }
    }
}
