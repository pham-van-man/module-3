create database quan_ly_diem_thi;
use quan_ly_diem_thi;
create table hoc_sinh(ma_hs varchar(20) primary key, ten_hs varchar(50), ngay_sinh datetime, lop varchar(20), gt varchar(20));
create table mon_hoc(ma_mh varchar(20) primary key, ten_mh varchar(50), ma_gv varchar(20), foreign key (ma_gv) references giao_vien(ma_gv));
create table ban_diem(ma_hs varchar(20), ma_mh varchar(50),primary key (ma_hs, ma_mh), foreign key (ma_hs) references hoc_sinh(ma_hs), foreign key (ma_mh) references mon_hoc(ma_mh));
create table giao_vien(ma_gv varchar(20) primary key, ten_gv varchar(50), sdt varchar(10));