create database my_database;
use my_database;
create table phieu_xuat(so_px int auto_increment primary key,
 ngay_xuat datetime);
create table vat_tu(ma_vt int auto_increment primary key,
 ten_vt varchar(255));
create table chi_tiet_phieu_xuat(dg_xuat int,
 sl_xuat int, ma_vt int, so_px int, primary key(ma_vt, so_px),
 foreign key (ma_vt) references vat_tu(ma_vt),
 foreign key (so_px) references phieu_xuat(so_px));
create table phieu_nhap(so_pn int auto_increment primary key,
 ngay_nhap datetime);
create table chi_tiey_phieu_nhap(dg_nhap int,
 sl_nhap int,
 ma_vt int,
 so_pn int,
 primary key(ma_vt, so_pn),
 foreign key (ma_vt) references vat_tu(ma_vt),
 foreign key (so_pn) references phieu_nhap(so_pn));
create table don_dat_hang(so_dh int auto_increment primary key,
 ngay_dh datetime,
 ma_ncc int,
 foreign key (ma_ncc) references nha_cung_cap(ma_ncc));
create table chi_tiet_don_dat_hang(ma_vt int,
 so_dh int,
 primary key (ma_vt, so_dh),
 foreign key (ma_vt) references vat_tu(ma_vt),
 foreign key (so_dh) references don_dat_hang(so_dh));
create table nha_cung_cap(ma_ncc int auto_increment primary key,
 ten_ncc varchar(255), dia_chi varchar(255));
create table sdt(ma_ncc int,
 sdt varchar(255) primary key,
 foreign key (ma_ncc) references nha_cung_cap(ma_ncc));