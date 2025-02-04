using System.Linq;
using System.Web.Mvc;
using Unity.AspNet.Mvc;

[assembly: WebActivatorEx.PreApplicationStartMethod(typeof(HeartSpace.App_Start.UnityMvcActivator), "Start")]
[assembly: WebActivatorEx.ApplicationShutdownMethod(typeof(HeartSpace.App_Start.UnityMvcActivator), "Shutdown")]

namespace HeartSpace.App_Start
{
    public static class UnityMvcActivator
    {
        /// <summary>
        /// �b���ε{���Ұʮɾ�X Unity�C
        /// </summary>
        public static void Start()
        {
            if (UnityConfig.Container == null)
            {
                UnityConfig.RegisterComponents(); // �p�G�e���|����l�ơA�h��ʪ�l��
            }

            FilterProviders.Providers.Remove(FilterProviders.Providers.OfType<FilterAttributeFilterProvider>().First());
            FilterProviders.Providers.Add(new UnityFilterAttributeFilterProvider(UnityConfig.Container));

            DependencyResolver.SetResolver(new UnityDependencyResolver(UnityConfig.Container));
        }
        

        /// <summary>
        /// �b���ε{������������ Unity �e���C
        /// </summary>
        public static void Shutdown()
        {
            UnityConfig.Container.Dispose();
        }
    }
}
