﻿using HeartSpace.DAL;
using HeartSpace.Helpers;
using HeartSpace.Models;
using HeartSpace.Models.EFModels;
using HeartSpace.Models.ViewModels;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.ApplicationServices;
using System.Web.Mvc;
using System.Web.Security;
using Member = HeartSpace.Models.EFModels.Member;

namespace HeartSpace.Controllers
{
	public class ProfileController : Controller
	{
		private readonly AppDbContext _context;

		public ProfileController(AppDbContext context)
		{
			_context = context;
		}
		public ActionResult Profile()
		{


			// 獲取當前會員資料
			var member = GetMember();
			if (member == null)
			{
				return HttpNotFound();
			}

			// 抓取 "您的貼文"
			var userPosts = _context.Posts
				.Where(p => p.MemberId == member.Id)
				.OrderByDescending(p => p.PublishTime)
				.Select(p => new PostCard
				{

					Id = p.Id,
					Title = p.Title,
					PostContent = p.PostContent,
					PublishTime = p.PublishTime,
					MemberNickName = p.Member != null ? p.Member.NickName : "未知作者",
					PostImg = p.PostImg,
					MemberImg = _context.Members
			.Where(m => m.Id == p.MemberId)
			.Select(m => m.MemberImg)
			.FirstOrDefault(),
					CategoryName = _context.Categories
					.Where(c => c.Id == p.CategoryId)
					.Select(c => c.CategoryName)
					.FirstOrDefault() ?? "未分類"
				}).ToList();

			// 抓取 "您發起的揪團"
			var initiatedEvents = _context.Events
				.Where(e => e.MemberId == member.Id)
				.OrderByDescending(e => e.EventTime)
				.Select(e => new EventCard
				{
					Id = e.Id,
					Title = e.EventName,
					EventContent = e.Description,
					EventTime = e.EventTime,
					MemberNickName = e.Member != null ? e.Member.NickName : "未知發起人",
					EventImg = e.EventImg,
					MemberImg = _context.Members
			.Where(m => m.Id == e.MemberId)
			.Select(m => m.MemberImg)
			.FirstOrDefault(),
					CategoryName = _context.Categories
					.Where(c => c.Id == c.Id)
					.Select(c => c.CategoryName)
					.FirstOrDefault() ?? "未分類"
				}).ToList();

			// 抓取 "您過去參與的揪團"（假設有 JoinTable 或 JoinLogs 紀錄參與者）
			var participatedEvents = _context.EventMembers
		.Where(em => em.MemberId == member.Id)
		.Select(em => em.Event)
		.OrderByDescending(e => e.EventTime)
		.Select(e => new EventCard
		{
			Id = e.Id,
			Title = e.EventName,
			EventContent = e.Description,
			EventTime = e.EventTime,
			MemberNickName = e.Member != null ? e.Member.NickName : "未知發起人",
			MemberImg = _context.Members
			.Where(m => m.Id == e.MemberId)
			.Select(m => m.MemberImg)
			.FirstOrDefault(),
			EventImg = e.EventImg,
			CategoryName = _context.Categories
					.Where(c => c.Id == c.Id)
					.Select(c => c.CategoryName)
					.FirstOrDefault() ?? "未分類"
		}).ToList();

			// 將資料放入 ViewModel
			var profileViewModel = new ProfileViewModel
			{
				MemberNickName = member.NickName,
				MemberImg = member.MemberImg,
				Posts = userPosts,
				InitiatedEvents = initiatedEvents,
				ParticipatedEvents = participatedEvents
			};

			return View(profileViewModel);
		}

		public ActionResult EventList()
		{
			// 假設從資料庫取得活動列表
			var events = _context.Events
				.Select(e => new EventViewModel
				{
					Id = e.Id,
					EventName = e.EventName
				})
				.ToList();

			return View(events);
		}

		[HttpGet]
		//[Authorize]
		public ActionResult EditProfile()
		{
			int memberId = GetCurrentMemberId();

	
			var member = _context.Members.Find(memberId);
			if (member == null)
			{
				return HttpNotFound();
			}


			var absentEvents = _context.EventMembers
				 .Where(em => em.MemberId == memberId)
				.Where(em => em.IsAttend == false)
				.Select(em => new EventCard
				{
					Id = em.Event.Id,
					Title = em.Event.EventName,
					EventContent = em.Event.Description,
					EventTime = em.Event.EventTime,
					MemberNickName = em.Event.Member.NickName ?? "未知發起人",
					MemberImg = em.Event.Member.MemberImg,
					EventImg = em.Event.EventImg,
					CategoryName = em.Event.Category.CategoryName ?? "未分類"
				})
				.OrderByDescending(e => e.EventTime)
				.ToList();

			var viewModel = new ProfileViewModel
			{
				Id = member.Id,
				Name = member.Name,
				Email = member.Email,
				Account = member.Account,
				MemberImg = member.MemberImg,
				MemberNickName = member.NickName,
				AbsentEvents = absentEvents
			};

			return View(viewModel);
		}

		[HttpPost]
		//[Authorize]
		public ActionResult EditProfile(ProfileViewModel model)
		{
			// 檢查 ModelState 是否有效
			if (!ModelState.IsValid)
			{
				var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
				TempData["ErrorMessage"] = string.Join("<br/>", errors);
				return View(model);
			}

			int memberId = model.Id; // 從 ViewModel 獲取會員 ID

			// 抓取 "您缺席的揪團"
			var absentEvents = _context.EventMembers
		.Where(em => em.MemberId == memberId)
		.Where(em => em.IsAttend == false)
		.Select(em => em.Event)
		.OrderByDescending(e => e.EventTime)
		.Select(e => new EventCard
		{
			Id = e.Id,
			Title = e.EventName,
			EventContent = e.Description,
			EventTime = e.EventTime,
			MemberNickName = e.Member != null ? e.Member.NickName : "未知發起人",
			MemberImg = _context.Members
						.Where(m => m.Id == e.MemberId)
						.Select(m => m.MemberImg)
						.FirstOrDefault(),
			EventImg = e.EventImg,
			CategoryName = _context.Categories
						.Where(c => c.Id == e.CategoryId)
						.Select(c => c.CategoryName)
						.FirstOrDefault() ?? "未分類"
		}).ToList();
			model.AbsentEvents = absentEvents;



			// 檢查暱稱是否重複
			var isNickNameExists = _context.Members.Any(m => m.NickName == model.MemberNickName && m.Id != model.Id);
			if (isNickNameExists)
			{
				ModelState.AddModelError("NickName", "該暱稱已被使用，請選擇其他暱稱。");
				return View(model);
			}

			// 嘗試更新會員資料
			var member = _context.Members.Find(memberId);
			if (member != null)
			{
				// 更新會員名稱和暱稱
				member.Name = model.Name;
				member.NickName = model.MemberNickName;

                if (model.MemberImgFile != null && model.MemberImgFile.ContentLength > 0)
                {
                    try
                    {
                        // 確保資料夾存在
                        HeartSpaceImage.ImageHelper.EnsureDirectoryExists();
                        var uploadDir = HeartSpaceImage.ImageHelper.RootPath;

						// 取得檔案副檔名
						var fileExtension = Path.GetExtension(model.MemberImgFile.FileName).ToLower();

						// 支援的檔案格式檢查
						if (fileExtension != ".jpg" && fileExtension != ".jpeg" && fileExtension != ".png" && fileExtension != ".webp")
						{
							ModelState.AddModelError("MemberImgFile", "僅接受 JPG、JPEG、PNG、WEBP 格式圖片。");
							return View(model);
						}

                        // 檔案名稱生成
                        var fileName = $"Member_{member.Id}.jpg";
                        var savePath = Path.Combine(uploadDir, fileName);

						if (fileExtension == ".webp")
						{
							// 處理 .webp 圖片轉換
							using (var webpStream = model.MemberImgFile.InputStream)
							{
								using (var bitmap = new System.Drawing.Bitmap(webpStream))
								{
									bitmap.Save(savePath, System.Drawing.Imaging.ImageFormat.Jpeg);
									System.Diagnostics.Debug.WriteLine($"WEBP 已轉換為 JPG 並儲存到：{savePath}");
								}
							}
						}
						else
						{
							// 直接儲存非 .webp 圖片
							model.MemberImgFile.SaveAs(savePath);
							System.Diagnostics.Debug.WriteLine($"圖片已儲存到路徑：{savePath}");
						}

                        // 更新資料庫的圖片路徑
                        member.MemberImg = $"https://localhost:44378/Images/{fileName}";
                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError("MemberImgFile", $"圖片上傳失敗：{ex.Message}");
                        return View(model);
                    }
                }





                // 保存資料庫變更
                try
                {
                    _context.SaveChanges();
                    TempData["SuccessMessage"] = "資料已成功儲存！";
                    return RedirectToAction("EditProfile");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "儲存資料時發生錯誤：" + ex.Message);
                    return View(model);
                }
            }
            else
            {
                TempData["ErrorMessage"] = "找不到對應的會員資料！";
            }

			return View(model);
		}



		private Member GetMember()
		{
			if (!User.Identity.IsAuthenticated)
			{
				throw new UnauthorizedAccessException("使用者未登入。");
			}

			// 取得身份驗證 Cookie
			var authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
			if (authCookie == null)
			{
				throw new UnauthorizedAccessException("未找到身份驗證 Cookie。");
			}

			// 解密票據
			var ticket = FormsAuthentication.Decrypt(authCookie.Value);
			if (ticket == null || string.IsNullOrEmpty(ticket.UserData))
			{
				throw new UnauthorizedAccessException("身份驗證票據無效。");
			}

			// 解析 UserData 格式 "MemberId|Role"
			var parts = ticket.UserData.Split('|');
			if (int.TryParse(parts[0], out int memberId))
			{
				// 使用 MemberId 從資料庫中查詢 Member
				var member = _context.Members.Find(memberId);
				if (member != null)
				{
					return member; // 返回完整的 Member 資料
				}

				throw new Exception("無法找到對應的會員資料。");
			}

			throw new Exception("票據中的用戶 ID 無效。");
		}


		// 獲取當前用戶 ID
		private int GetCurrentMemberId()
		{
			if (!User.Identity.IsAuthenticated)
			{
				throw new UnauthorizedAccessException("使用者未登入。");
			}

			var authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
			if (authCookie == null)
			{
				throw new UnauthorizedAccessException("未找到身份驗證 Cookie。");
			}

			var ticket = FormsAuthentication.Decrypt(authCookie.Value);
			if (ticket == null || string.IsNullOrEmpty(ticket.UserData))
			{
				throw new UnauthorizedAccessException("身份驗證票據無效。");
			}

			// 解析 UserData 格式 "MemberId|Role"
			var parts = ticket.UserData.Split('|');
			if (int.TryParse(parts[0], out int memberId))
			{
				return memberId; // 返回 MemberId
			}

			throw new Exception("票據中的用戶 ID 無效。");
		}

	}



}