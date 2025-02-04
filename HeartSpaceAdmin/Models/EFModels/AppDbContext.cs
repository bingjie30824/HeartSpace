﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace HeartSpaceAdmin.Models.EFModels;

public partial class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Event> Events { get; set; }

    public virtual DbSet<EventComment> EventComments { get; set; }

    public virtual DbSet<EventMember> EventMembers { get; set; }

    public virtual DbSet<Member> Members { get; set; }

    public virtual DbSet<Post> Posts { get; set; }

    public virtual DbSet<PostComment> PostComments { get; set; }

    public virtual DbSet<Tag> Tags { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Categori__3214EC074C8EC56F");

            entity.Property(e => e.CategoryName)
                .IsRequired()
                .HasMaxLength(10);
		});

        modelBuilder.Entity<Event>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Events__3214EC0763D13807");

            entity.Property(e => e.Description)
                .IsRequired()
                .HasMaxLength(500);
            entity.Property(e => e.EventName)
                .IsRequired()
                .HasMaxLength(25);
            entity.Property(e => e.EventTime).HasColumnType("datetime");
            entity.Property(e => e.Limit)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Location).HasMaxLength(500);

            entity.HasOne(d => d.Category).WithMany(p => p.Events)
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Events__Category__48CFD27E");
        });

        modelBuilder.Entity<EventComment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__EventCom__3214EC073D125381");

            entity.Property(e => e.CommentTime).HasColumnType("datetime");
            entity.Property(e => e.Disabled)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.EventCommentContent)
                .IsRequired()
                .HasMaxLength(500);

            entity.HasOne(d => d.Event).WithMany(p => p.EventComments)
                .HasForeignKey(d => d.EventId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__EventComm__Event__6477ECF3");

            entity.HasOne(d => d.Member).WithMany(p => p.EventComments)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__EventComm__Membe__656C112C");
        });

        modelBuilder.Entity<EventMember>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__EventMem__3214EC070A9B9D26");

            entity.HasOne(d => d.Event).WithMany(p => p.EventMembers)
                .HasForeignKey(d => d.EventId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__EventMemb__Event__46E78A0C");

            entity.HasOne(d => d.Member).WithMany(p => p.EventMembers)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__EventPart__Membe__5AEE82B9");
        });

        modelBuilder.Entity<Member>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Members__3214EC071B6F6E88");

            entity.HasIndex(e => e.NickName, "IX_Members").IsUnique();

            entity.Property(e => e.Account)
                .IsRequired()
                .HasMaxLength(25);
            entity.Property(e => e.ConfirmCode)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(25);
            entity.Property(e => e.NickName)
                .IsRequired()
                .HasMaxLength(25);
            entity.Property(e => e.PasswordHash)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Role)
                .IsRequired()
                .HasMaxLength(50);
        });

        modelBuilder.Entity<Post>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Posts__3214EC0776D1E5ED");

            entity.Property(e => e.PostContent)
                .IsRequired()
                .HasMaxLength(500);
            entity.Property(e => e.PublishTime).HasColumnType("datetime");
            entity.Property(e => e.Title)
                .IsRequired()
                .HasMaxLength(20);

            entity.HasOne(d => d.Member).WithMany(p => p.Posts)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Posts__MemberId__5DCAEF64");
        });

        modelBuilder.Entity<PostComment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__PostComm__3214EC07462A8722");

            entity.Property(e => e.Comment)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.CommentTime).HasColumnType("datetime");

            entity.HasOne(d => d.Post).WithMany(p => p.PostComments)
                .HasForeignKey(d => d.PostId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__PostComme__PostI__60A75C0F");

            entity.HasOne(d => d.User).WithMany(p => p.PostComments)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__PostComme__UserI__619B8048");
        });

        modelBuilder.Entity<Tag>(entity =>
        {
            entity.Property(e => e.TagName)
                .IsRequired()
                .HasMaxLength(15);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}