using HeartSpace.App_Start;
using System;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;

namespace HeartSpace
{
	public class MvcApplication : System.Web.HttpApplication
	{
		protected void Application_Start()
		{
			UnityConfig.RegisterComponents();

			AreaRegistration.RegisterAllAreas();
			RouteConfig.RegisterRoutes(RouteTable.Routes);
			FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
			BundleConfig.RegisterBundles(BundleTable.Bundles);
		}

		protected void Application_AuthenticateRequest(object sender, EventArgs e)
		{
			if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
			{
				var formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
				if (formsIdentity != null)
				{
					// ���o FormsAuthenticationTicket
					var ticket = formsIdentity.Ticket;

					// ���� UserData�A���]�榡�� "Name|Role"
					var userDataParts = ticket.UserData.Split('|');
					if (userDataParts.Length == 2)
					{
						var role = userDataParts[1]; // ���o���� (Role)

						// �]�m����� HttpContext.User
						HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(formsIdentity, new[] { role });
					}
				}
			}
		}
	}
}
