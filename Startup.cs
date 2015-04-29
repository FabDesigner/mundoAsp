using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WbForm.Startup))]
namespace WbForm
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
