﻿
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HeartSpace.Models
{
    public class PostViewModel
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "標題為必填項")]
        [StringLength(20, ErrorMessage = "標題最多 20 字")]
        public string Title { get; set; }

        [Required(ErrorMessage = "內文為必填項")]
        [StringLength(500, ErrorMessage = "內文最多 500 字")]
        public string PostContent { get; set; }

        public string PostImg { get; set; } 

        public DateTime PublishTime { get; set; }
        public bool Disabled { get; set; }


        public int MemberId { get; set; }

        public string MemberNickName { get; set; } // 原PO暱稱


        public string MemberImg { get; set; } 
        





        [Required(ErrorMessage = "請選擇分類")]
        [Display(Name = "分類")]
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public IEnumerable<SelectListItem> CategoryList { get; set; }

        public List<CommentViewModel> Comments { get; set; } = new List<CommentViewModel>(); // 留言集合



    }
    public class CommentViewModel
    {

        public int PostId { get; set; }
        public int CommentId { get; set; }
        public int UserId { get; set; }
        public string UserNickName { get; set; }

        public string UserImg { get; set; }
        public string Comment { get; set; }
        public DateTime CommentTime { get; set; }
        public int FloorNumber { get; set; } // 樓層編號

        public bool Disabled { get; set; } // 是否被刪除

    }


}