﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace HeartSpace.Helpers
{
	public class PaginatedList<T> : List<T>
	{
		public int PageIndex { get; private set; }
		public int TotalPages { get; private set; }
		public int TotalItemCount { get; private set; }

		public PaginatedList(IEnumerable<T> source, int totalItemCount, int pageIndex, int pageSize)
		{
			if (pageIndex < 1) throw new ArgumentOutOfRangeException(nameof(pageIndex), "PageIndex must be greater than 0.");
			if (pageSize < 1) throw new ArgumentOutOfRangeException(nameof(pageSize), "PageSize must be greater than 0.");

			TotalItemCount = totalItemCount;
			TotalPages = totalItemCount > 0 ? (int)Math.Ceiling(totalItemCount / (double)pageSize) : 1;
			PageIndex = pageIndex;

			// 修正超過範圍的 PageIndex
			if (PageIndex > TotalPages)
			{
				PageIndex = TotalPages > 0 ? TotalPages : 1; // 如果資料為空，預設 PageIndex = 1
			}

			// 分頁邏輯
			var skipCount = (PageIndex - 1) * pageSize;
			if (skipCount >= source.Count())
			{
				skipCount = Math.Max(0, source.Count() - pageSize);
			}

			var items = source.Skip(skipCount).Take(pageSize).ToList();
			this.AddRange(items);
		}

		public bool HasPreviousPage => PageIndex > 1;
		public bool HasNextPage => PageIndex < TotalPages;

		public static PaginatedList<T> Create(IEnumerable<T> source, int totalItemCount, int pageIndex, int pageSize)
		{
			return new PaginatedList<T>(source, totalItemCount, pageIndex, pageSize);
		}
	} 
}



//using System;
//using System.Collections.Generic;
//using System.Linq;
//using HeartSpace.Models;
//using HeartSpace.Models.DTOs;

//namespace HeartSpace.Helpers
//{
//    public class PaginatedList<T> : List<T>
//    {
//        public int PageIndex { get; private set; }
//        public int TotalPages { get; private set; }
//        public int TotalItemCount { get; private set; }

//		// Constructor for IQueryable<T>
//		public PaginatedList(IQueryable<T> source, int pageIndex, int pageSize)
//		{
//			// Validate parameters
//			if (pageIndex < 1) throw new ArgumentOutOfRangeException(nameof(pageIndex), "PageIndex must be greater than 0.");
//			if (pageSize < 1) throw new ArgumentOutOfRangeException(nameof(pageSize), "PageSize must be greater than 0.");

//			PageIndex = pageIndex;

//			// Avoid executing unsupported LINQ methods
//			var totalCount = source.Count(); // Get total count from database
//			TotalPages = (int)Math.Ceiling(totalCount / (double)pageSize);

//			// Execute pagination in the database
//			var items = source.Skip((PageIndex - 1) * pageSize).Take(pageSize).ToList();
//			this.AddRange(items);
//		}

//		// Constructor for IEnumerable<T>
//		public PaginatedList(IEnumerable<T> source, int pageIndex, int pageSize)
//		{
//			if (pageIndex < 1) throw new ArgumentOutOfRangeException(nameof(pageIndex), "PageIndex must be greater than 0.");
//			if (pageSize < 1) throw new ArgumentOutOfRangeException(nameof(pageSize), "PageSize must be greater than 0.");

//			PageIndex = pageIndex;

//			// Calculate total pages
//			var totalCount = source.Count();
//			TotalPages = (int)Math.Ceiling(totalCount / (double)pageSize);

//			// Apply pagination
//			var items = source.Skip((PageIndex - 1) * pageSize).Take(pageSize);
//			this.AddRange(items);
//		}

//		public bool HasPreviousPage => PageIndex > 1;
//		public bool HasNextPage => PageIndex < TotalPages;

//		// Factory method for IQueryable<T>
//		public static PaginatedList<T> Create(IQueryable<T> source, int pageIndex, int pageSize)
//		{
//			return new PaginatedList<T>(source, pageIndex, pageSize);
//		}

//		// Factory method for IEnumerable<T>
//		public static PaginatedList<T> Create(IEnumerable<T> source, int totalPostCount,int pageIndex, int pageSize)
//		{
//			return new PaginatedList<T>(source, totalPostCount,pageIndex, pageSize);
//		}

//	}
//}
