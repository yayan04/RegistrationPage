using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AppRegistrationPage.Startup))]
namespace AppRegistrationPage
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
