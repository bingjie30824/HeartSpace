using HeartSpaceAdmin.Models.EFModels;
using Microsoft.EntityFrameworkCore;

namespace HeartSpaceAdmin
{
	public class Program
	{
		public static void Main(string[] args)
		{
			var builder = WebApplication.CreateBuilder(args);

			// Add services to the container.
			builder.Services.AddControllersWithViews();

			//配置資料庫服務
			builder.Services.AddDbContext<AppDbContext>(options =>
	options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

			var app = builder.Build();

			// Configure the HTTP request pipeline.
			if (!app.Environment.IsDevelopment())
			{
				app.UseExceptionHandler("/Home/Error");
				// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
				app.UseHsts();
			}

			app.UseHttpsRedirection();
			app.UseStaticFiles();

			app.UseRouting();

			app.UseAuthorization();

			app.MapControllerRoute(
			name: "default",
			pattern: "{controller=Member}/{action=Index}/{id?}"); // 預設指向 MemberController 的 Index 動作


			app.Run();
		}
	}
}
