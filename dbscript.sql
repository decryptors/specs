USE [master]
GO
/****** Object:  Database [CemeteryManagementDB]    Script Date: 01/07/2015 21:36:08 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'CemeteryManagementDB')
BEGIN
CREATE DATABASE [CemeteryManagementDB] ON  PRIMARY 
( NAME = N'CemeteryManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CemeteryManagementDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CemeteryManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CemeteryManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CemeteryManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CemeteryManagementDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET ARITHABORT OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CemeteryManagementDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CemeteryManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CemeteryManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [CemeteryManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CemeteryManagementDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CemeteryManagementDB] SET  READ_WRITE
GO
ALTER DATABASE [CemeteryManagementDB] SET RECOVERY FULL
GO
ALTER DATABASE [CemeteryManagementDB] SET  MULTI_USER
GO
ALTER DATABASE [CemeteryManagementDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CemeteryManagementDB] SET DB_CHAINING OFF
GO
USE [CemeteryManagementDB]
GO
/****** Object:  ForeignKey [FK__Areas__Graveyard__6FE99F9F]    Script Date: 01/07/2015 21:36:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Areas__Graveyard__6FE99F9F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Areas]'))
ALTER TABLE [dbo].[Areas] DROP CONSTRAINT [FK__Areas__Graveyard__6FE99F9F]
GO
/****** Object:  ForeignKey [FK__Buildings__AreaI__72C60C4A]    Script Date: 01/07/2015 21:36:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Buildings__AreaI__72C60C4A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Buildings]'))
ALTER TABLE [dbo].[Buildings] DROP CONSTRAINT [FK__Buildings__AreaI__72C60C4A]
GO
/****** Object:  ForeignKey [FK__Persons__AreaId__75A278F5]    Script Date: 01/07/2015 21:36:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Persons__AreaId__75A278F5]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [FK__Persons__AreaId__75A278F5]
GO
/****** Object:  ForeignKey [FK__Contracts__Perso__787EE5A0]    Script Date: 01/07/2015 21:36:58 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Contracts__Perso__787EE5A0]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK__Contracts__Perso__787EE5A0]
GO
/****** Object:  StoredProcedure [dbo].[AddHomeless]    Script Date: 01/07/2015 21:37:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddHomeless]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddHomeless]
GO
/****** Object:  StoredProcedure [dbo].[AddOwners]    Script Date: 01/07/2015 21:37:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddOwners]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddOwners]
GO
/****** Object:  StoredProcedure [dbo].[Owners_ReadAllOwners]    Script Date: 01/07/2015 21:36:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Owners_ReadAllOwners]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Owners_ReadAllOwners]
GO
/****** Object:  StoredProcedure [dbo].[DeleteHomeless]    Script Date: 01/07/2015 21:36:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteHomeless]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteHomeless]
GO
/****** Object:  StoredProcedure [dbo].[DeleteOwners]    Script Date: 01/07/2015 21:36:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteOwners]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteOwners]
GO
/****** Object:  StoredProcedure [dbo].[GetBuildingById]    Script Date: 01/07/2015 21:36:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetBuildingById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetBuildingById]
GO
/****** Object:  StoredProcedure [dbo].[AddBuilding]    Script Date: 01/07/2015 21:36:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddBuilding]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddBuilding]
GO
/****** Object:  StoredProcedure [dbo].[AddDeceased]    Script Date: 01/07/2015 21:36:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddDeceased]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddDeceased]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 01/07/2015 21:36:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contracts]') AND type in (N'U'))
DROP TABLE [dbo].[Contracts]
GO
/****** Object:  StoredProcedure [dbo].[Persons_ReadAllDeceased]    Script Date: 01/07/2015 21:36:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persons_ReadAllDeceased]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Persons_ReadAllDeceased]
GO
/****** Object:  StoredProcedure [dbo].[Persons_ReadAllHomeless]    Script Date: 01/07/2015 21:36:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persons_ReadAllHomeless]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Persons_ReadAllHomeless]
GO
/****** Object:  StoredProcedure [dbo].[ReadAllAreas]    Script Date: 01/07/2015 21:36:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllAreas]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadAllAreas]
GO
/****** Object:  StoredProcedure [dbo].[ReadAllAreasWithBuildings]    Script Date: 01/07/2015 21:36:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllAreasWithBuildings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadAllAreasWithBuildings]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBuilding]    Script Date: 01/07/2015 21:36:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteBuilding]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteBuilding]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDeceased]    Script Date: 01/07/2015 21:36:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDeceased]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteDeceased]
GO
/****** Object:  StoredProcedure [dbo].[ReadAllAreasWithPersons]    Script Date: 01/07/2015 21:36:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllAreasWithPersons]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadAllAreasWithPersons]
GO
/****** Object:  StoredProcedure [dbo].[ReadAllBuildings]    Script Date: 01/07/2015 21:36:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllBuildings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadAllBuildings]
GO
/****** Object:  StoredProcedure [dbo].[ReadAreaByIdWithBuildings]    Script Date: 01/07/2015 21:36:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAreaByIdWithBuildings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadAreaByIdWithBuildings]
GO
/****** Object:  StoredProcedure [dbo].[ReadAreaByIdWithPersons]    Script Date: 01/07/2015 21:36:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAreaByIdWithPersons]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadAreaByIdWithPersons]
GO
/****** Object:  StoredProcedure [dbo].[ReadByIDDeceased]    Script Date: 01/07/2015 21:36:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadByIDDeceased]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadByIDDeceased]
GO
/****** Object:  StoredProcedure [dbo].[ReadByIDHomeless]    Script Date: 01/07/2015 21:36:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadByIDHomeless]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadByIDHomeless]
GO
/****** Object:  StoredProcedure [dbo].[ReadByIDOwners]    Script Date: 01/07/2015 21:36:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadByIDOwners]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadByIDOwners]
GO
/****** Object:  StoredProcedure [dbo].[ReadDeceasedByYear]    Script Date: 01/07/2015 21:36:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadDeceasedByYear]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadDeceasedByYear]
GO
/****** Object:  StoredProcedure [dbo].[UpdateBuilding]    Script Date: 01/07/2015 21:36:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateBuilding]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateBuilding]
GO
/****** Object:  StoredProcedure [dbo].[UpdateDeceased]    Script Date: 01/07/2015 21:36:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateDeceased]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateDeceased]
GO
/****** Object:  StoredProcedure [dbo].[UpdateHomeless]    Script Date: 01/07/2015 21:36:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateHomeless]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateHomeless]
GO
/****** Object:  StoredProcedure [dbo].[UpdateOwners]    Script Date: 01/07/2015 21:36:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateOwners]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateOwners]
GO
/****** Object:  StoredProcedure [dbo].[AddArea]    Script Date: 01/07/2015 21:36:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddArea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddArea]
GO
/****** Object:  StoredProcedure [dbo].[ReadAreaById]    Script Date: 01/07/2015 21:36:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAreaById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadAreaById]
GO
/****** Object:  StoredProcedure [dbo].[ReadAllAreasWithoutFKs]    Script Date: 01/07/2015 21:36:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllAreasWithoutFKs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadAllAreasWithoutFKs]
GO
/****** Object:  StoredProcedure [dbo].[DeleteArea]    Script Date: 01/07/2015 21:36:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteArea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteArea]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 01/07/2015 21:36:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persons]') AND type in (N'U'))
DROP TABLE [dbo].[Persons]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 01/07/2015 21:36:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Buildings]') AND type in (N'U'))
DROP TABLE [dbo].[Buildings]
GO
/****** Object:  StoredProcedure [dbo].[UpdateArea]    Script Date: 01/07/2015 21:36:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateArea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateArea]
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 01/07/2015 21:36:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckUser]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 01/07/2015 21:36:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Areas]') AND type in (N'U'))
DROP TABLE [dbo].[Areas]
GO
/****** Object:  StoredProcedure [dbo].[AddGraveyard]    Script Date: 01/07/2015 21:36:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddGraveyard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddGraveyard]
GO
/****** Object:  StoredProcedure [dbo].[UpdateGraveyard]    Script Date: 01/07/2015 21:36:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateGraveyard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateGraveyard]
GO
/****** Object:  StoredProcedure [dbo].[ReadGraveyardById]    Script Date: 01/07/2015 21:36:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadGraveyardById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadGraveyardById]
GO
/****** Object:  StoredProcedure [dbo].[ReadAllGraveyards]    Script Date: 01/07/2015 21:36:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllGraveyards]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ReadAllGraveyards]
GO
/****** Object:  StoredProcedure [dbo].[DeleteGraveyard]    Script Date: 01/07/2015 21:36:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteGraveyard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteGraveyard]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/07/2015 21:36:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Graveyards]    Script Date: 01/07/2015 21:36:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Graveyards]') AND type in (N'U'))
DROP TABLE [dbo].[Graveyards]
GO
/****** Object:  User [user]    Script Date: 01/07/2015 21:36:15 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'user')
DROP USER [user]
GO
USE [master]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 01/07/2015 21:36:15 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
DROP LOGIN [##MS_PolicyEventProcessingLogin##]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 01/07/2015 21:36:13 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
DROP LOGIN [##MS_PolicyTsqlExecutionLogin##]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 01/07/2015 21:36:11 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
DROP LOGIN [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 01/07/2015 21:36:11 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
DROP LOGIN [NT Service\MSSQLSERVER]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 01/07/2015 21:36:11 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
DROP LOGIN [NT SERVICE\SQLSERVERAGENT]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 01/07/2015 21:36:10 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
DROP LOGIN [NT SERVICE\SQLWriter]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 01/07/2015 21:36:10 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
DROP LOGIN [NT SERVICE\Winmgmt]
GO
/****** Object:  Login [user]    Script Date: 01/07/2015 21:36:10 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'user')
DROP LOGIN [user]
GO
/****** Object:  Login [WIN-EMTTMU9N6L6\Administrator]    Script Date: 01/07/2015 21:36:08 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'WIN-EMTTMU9N6L6\Administrator')
DROP LOGIN [WIN-EMTTMU9N6L6\Administrator]
GO
/****** Object:  Login [WIN-EMTTMU9N6L6\Administrator]    Script Date: 01/07/2015 21:36:08 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'WIN-EMTTMU9N6L6\Administrator')
CREATE LOGIN [WIN-EMTTMU9N6L6\Administrator] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [user]    Script Date: 01/07/2015 21:36:10 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'user')
CREATE LOGIN [user] WITH PASSWORD=N'Áça?uR¡³ÕïÓc×fàQpÐádÉ¼7', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
EXEC sys.sp_addsrvrolemember @loginame = N'user', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'user', @rolename = N'securityadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'user', @rolename = N'serveradmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'user', @rolename = N'setupadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'user', @rolename = N'processadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'user', @rolename = N'diskadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'user', @rolename = N'dbcreator'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'user', @rolename = N'bulkadmin'
GO
ALTER LOGIN [user] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 01/07/2015 21:36:10 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 01/07/2015 21:36:10 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 01/07/2015 21:36:11 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 01/07/2015 21:36:11 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 01/07/2015 21:36:11 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 01/07/2015 21:36:13 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N',rWmj~2ëx¼õi¬éOf%+ºfeÑdbf', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 01/07/2015 21:36:15 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'>÷VQPaø~hbã;ÉÜµRÐþ=Åbð±jÁ«', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
USE [CemeteryManagementDB]
GO
/****** Object:  User [user]    Script Date: 01/07/2015 21:36:15 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'user')
CREATE USER [user] FOR LOGIN [user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Graveyards]    Script Date: 01/07/2015 21:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Graveyards]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Graveyards](
	[GraveyardId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[GraveyardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Graveyards] ON
INSERT [dbo].[Graveyards] ([GraveyardId], [Name], [Address]) VALUES (1, N'Viata de apoi', N'str. Vietii(de Apoi)')
INSERT [dbo].[Graveyards] ([GraveyardId], [Name], [Address]) VALUES (2, N'Ultimul Popas', N'str. Batranilor')
SET IDENTITY_INSERT [dbo].[Graveyards] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 01/07/2015 21:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Users] ([id], [name], [password]) VALUES (0, N'administrator', N'd54d54a4dceb876a676a3f2f60958f84')
/****** Object:  StoredProcedure [dbo].[DeleteGraveyard]    Script Date: 01/07/2015 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteGraveyard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteGraveyard]
	@Id int
as

delete from Graveyards where GraveyardId=@Id

return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAllGraveyards]    Script Date: 01/07/2015 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllGraveyards]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create PROCEDURE [dbo].[ReadAllGraveyards] 
AS
	BEGIN
SELECT
	GraveyardId,
	Name,
	Address
FROM
	CemeteryManagementDB.dbo.Graveyards;
	END' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadGraveyardById]    Script Date: 01/07/2015 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadGraveyardById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReadGraveyardById]
	@Id int
as
	Select GraveyardId,Name,Address from Graveyards where GraveyardId=@Id
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateGraveyard]    Script Date: 01/07/2015 21:36:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateGraveyard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateGraveyard]
	@Id int,
	@Name nvarchar(max),
	@Address nvarchar(max)
	
AS
	Update Graveyards
	Set Name=@Name,Address=@Address
	where GraveyardId=@Id
RETURN 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddGraveyard]    Script Date: 01/07/2015 21:36:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddGraveyard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddGraveyard]
	@Name nvarchar(max),
	@Address nvarchar(max)
	
AS
	Insert into Graveyards(Name,Address)
	Values (@Name,@Address)
RETURN 0' 
END
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 01/07/2015 21:36:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Areas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Areas](
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NULL,
	[Surface] [int] NULL,
	[GraveyardId] [int] NOT NULL,
	[ContractId] [int] NULL,
	[Photo] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Areas] ON
INSERT [dbo].[Areas] ([AreaId], [Number], [Surface], [GraveyardId], [ContractId], [Photo]) VALUES (1, 136, 136, 1, 1, NULL)
INSERT [dbo].[Areas] ([AreaId], [Number], [Surface], [GraveyardId], [ContractId], [Photo]) VALUES (3, 1334, 111, 1, 4, NULL)
INSERT [dbo].[Areas] ([AreaId], [Number], [Surface], [GraveyardId], [ContractId], [Photo]) VALUES (4, 55, 10, 1, 300, NULL)
INSERT [dbo].[Areas] ([AreaId], [Number], [Surface], [GraveyardId], [ContractId], [Photo]) VALUES (5, 5, 10, 1, 300, NULL)
INSERT [dbo].[Areas] ([AreaId], [Number], [Surface], [GraveyardId], [ContractId], [Photo]) VALUES (6, 5, 10, 1, 300, NULL)
INSERT [dbo].[Areas] ([AreaId], [Number], [Surface], [GraveyardId], [ContractId], [Photo]) VALUES (7, 5, 10, 1, 300, NULL)
SET IDENTITY_INSERT [dbo].[Areas] OFF
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 01/07/2015 21:36:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CheckUser] 
	@Name nvarchar(50),
	@Password nvarchar(200)
as 
	SELECT Count(*) FROM Users WHERE ((Users.name = @Name) AND (Users.password = @Password))
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateArea]    Script Date: 01/07/2015 21:36:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateArea]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateArea]
	@Id int,
	@Number int,
	@Surface int,
	@GraveyardId int,
	@ContractId int
as
	Update Areas
	set Number=@Number,Surface=@Surface,GraveyardId=@GraveyardId,ContractId=@ContractId,Photo=null
	where AreaId=@Id
	
return 0' 
END
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 01/07/2015 21:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Buildings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Buildings](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[isHistorical] [bit] NULL,
	[Type] [nvarchar](50) NULL,
	[AreaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON
INSERT [dbo].[Buildings] ([BuildingId], [isHistorical], [Type], [AreaId]) VALUES (1, 0, N'Gardut', 1)
INSERT [dbo].[Buildings] ([BuildingId], [isHistorical], [Type], [AreaId]) VALUES (2, 0, N'Cruce', 1)
INSERT [dbo].[Buildings] ([BuildingId], [isHistorical], [Type], [AreaId]) VALUES (3, 1, N'Piramida', 1)
INSERT [dbo].[Buildings] ([BuildingId], [isHistorical], [Type], [AreaId]) VALUES (5, 0, N'ingeras de marmura', 1)
INSERT [dbo].[Buildings] ([BuildingId], [isHistorical], [Type], [AreaId]) VALUES (7, 0, N'Cruce', 3)
SET IDENTITY_INSERT [dbo].[Buildings] OFF
/****** Object:  Table [dbo].[Persons]    Script Date: 01/07/2015 21:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Persons](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PersonType] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Religion] [nvarchar](max) NULL,
	[DateOfBurial] [date] NULL,
	[BurialCertificateNumber] [nvarchar](50) NULL,
	[isVip] [bit] NULL,
	[AreaId] [int] NULL,
	[RequestNo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Persons] ON
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (2, N'Vlad', NULL, NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (3, N'Vlad', NULL, NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (4, N'Vlad', NULL, NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (5, N'Vlad', N'Deceased', NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (6, N'Vlad', N'Deceased', NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (7, N'Vlad', N'Homeless', NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, N'36')
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (8, N'Vlad', N'Deceased', NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (9, N'Vlad', N'Deceased', NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (10, N'Vlad', N'Owner', N'Auschwitz', N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (11, N'Vlad', N'Deceased', NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (12, N'Vlad', N'Deceased', NULL, N'sadff', CAST(0x12350B00 AS Date), N'222', 1, 1, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (13, N'test', N'Deceased', NULL, N'test', CAST(0x00000000 AS Date), N'', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (14, N'', N'Deceased', NULL, N'', CAST(0x00000000 AS Date), N'', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (15, N'Unu', N'Deceased', NULL, N'Unu', CAST(0x00000000 AS Date), N'42', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (16, N'Unu', N'Deceased', NULL, N'Unu', CAST(0x00000000 AS Date), N'42', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (17, N'fff', N'Deceased', NULL, N'fff', CAST(0x00000000 AS Date), N'555', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (18, N'', N'Deceased', NULL, N'', CAST(0x00000000 AS Date), N'', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (19, N'Maews', N'Deceased', NULL, N'Maews', CAST(0x00000000 AS Date), N'2233', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (20, N'Mos Craciun', N'Deceased', NULL, N'Mos Craciun', CAST(0x00000000 AS Date), N'211', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (21, N'tralala', N'Deceased', NULL, N'hyndu', CAST(0x00000000 AS Date), N'asdf44', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (22, N'tralalaasass', N'Deceased', NULL, N'hyndu', CAST(0x00000000 AS Date), N'asdf44', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (23, N'tralalaasass', N'Deceased', NULL, N'hyndu', CAST(0x00000000 AS Date), N'asdf44', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (24, N'asd', N'Deceased', NULL, N'ASD', CAST(0x00000000 AS Date), N'asdd', 1, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (25, N'asd', N'Deceased', NULL, N'ASD', CAST(0x00000000 AS Date), N'asdd', 1, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (26, N'sfv', N'Deceased', NULL, N'sadf', CAST(0x00000000 AS Date), N'sdfsadf', 1, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (27, N'', N'Deceased', NULL, N'', CAST(0x00000000 AS Date), N'', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (28, N'sgfaa', N'Deceased', NULL, N'asdff', CAST(0x00000000 AS Date), N'asdff', 0, NULL, NULL)
INSERT [dbo].[Persons] ([PersonId], [Name], [PersonType], [Address], [Religion], [DateOfBurial], [BurialCertificateNumber], [isVip], [AreaId], [RequestNo]) VALUES (29, N'', N'Deceased', NULL, N'', CAST(0x00000000 AS Date), N'', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Persons] OFF
/****** Object:  StoredProcedure [dbo].[DeleteArea]    Script Date: 01/07/2015 21:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteArea]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteArea]
	@Id int
as
	Delete from Areas where AreaId=@Id
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAllAreasWithoutFKs]    Script Date: 01/07/2015 21:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllAreasWithoutFKs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReadAllAreasWithoutFKs] 
as
	Select AreaId,Number,Surface,Photo, Graveyards.GraveyardId,Graveyards.Name,Graveyards.Address from dbo.Areas
	inner join Graveyards on Areas.GraveyardId=Graveyards.GraveyardId' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAreaById]    Script Date: 01/07/2015 21:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAreaById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReadAreaById]
	@Id int
as 
	Select AreaId,Number,Surface,Photo, Graveyards.GraveyardId,Graveyards.Name,Graveyards.Address from dbo.Areas
	inner join Graveyards on Areas.GraveyardId=Graveyards.GraveyardId
	where AreaId=@Id
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddArea]    Script Date: 01/07/2015 21:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddArea]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddArea] 
	@Number int,
	@Surface int,
	@GraveyardId int,
	@ContractId int
as 
	Insert into Areas (Number,Surface,GraveyardId,ContractId,Photo)
	values (@Number,@Surface,@GraveyardId,@ContractId,null)
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOwners]    Script Date: 01/07/2015 21:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateOwners]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateOwners]
@Name nvarchar(50),
@Address nvarchar(50),
@PersonID int
AS
BEGIN 
	UPDATE Persons SET Name = @Name, Address = @Address
	WHERE PersonID = @PersonID
	
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateHomeless]    Script Date: 01/07/2015 21:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateHomeless]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateHomeless]
@Name nvarchar(50),
@Religion nvarchar(50),
@DateOfBurial date,
@isVip Bit,
@BurialCertificateNumber nvarchar(50)	,
@RequestNo nvarchar(50),
@PersonID int
AS
BEGIN 
	UPDATE Persons SET Name = @Name, Religion = @Religion, DateOfBurial = @DateOfBurial, 
					   isVip = @isVip, BurialCertificateNumber = 	@BurialCertificateNumber,
					   RequestNo =  @RequestNo
	WHERE PersonID = @PersonID
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDeceased]    Script Date: 01/07/2015 21:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateDeceased]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateDeceased]
	@Name nvarchar(max),
	@Religion nvarchar(50),
	@DateOfBurial date,
	@isVip bit,
	@BurialCertificateNumber nvarchar(50),
	@PersonID int
AS
	UPDATE [dbo].[Persons]
	SET Name = @Name, Religion = @Religion, DateOfBurial = @DateOfBurial, IsVIP = @isVIP, BurialCertificateNumber = @BurialCertificateNumber
	WHERE PersonID = @PersonID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBuilding]    Script Date: 01/07/2015 21:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateBuilding]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[UpdateBuilding]
	@Id int,
	@isHistorical bit,
	@Type nvarchar(50),
	@areaId int
as 
	Update Buildings
	set isHistorical=@isHistorical,Type=@Type,AreaId=@areaId
	where BuildingId=@Id
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadDeceasedByYear]    Script Date: 01/07/2015 21:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadDeceasedByYear]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReadDeceasedByYear] 
	@date date
AS
BEGIN
	
	SET NOCOUNT ON;

  
	SELECT PersonId, Name, DateOfBurial, AreaId, Religion FROM dbo.Persons
	WHERE YEAR(DateOfBurial) = YEAR(@date) AND PersonType = ''Deceased''
	ORDER BY DateOfBurial
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadByIDOwners]    Script Date: 01/07/2015 21:36:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadByIDOwners]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[ReadByIDOwners]
@PersonID int
AS
BEGIN 
	Select PersonID, Name ,Address 
	FROM Persons
	WHERE PersonID = @PersonID
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadByIDHomeless]    Script Date: 01/07/2015 21:36:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadByIDHomeless]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[ReadByIDHomeless]
@PersonID int
AS
BEGIN 
	Select Name ,Religion , DateOfBurial, isVip , BurialCertificateNumber, RequestNo
	FROM Persons
	WHERE PersonID = @PersonID
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadByIDDeceased]    Script Date: 01/07/2015 21:36:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadByIDDeceased]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReadByIDDeceased]
	@PersonID int
AS
	SELECT PersonId,Name, Religion, DateOfBurial, isVip,BurialCertificateNumber  from [dbo].[Persons]
	where [PersonType]=''Deceased'' AND	PersonID = @PersonID' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAreaByIdWithPersons]    Script Date: 01/07/2015 21:36:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAreaByIdWithPersons]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ReadAreaByIdWithPersons]
	@Id int
as
	select Areas.AreaId,Persons.Name,Persons.PersonId,Religion,DateOfBurial,BurialCertificateNumber,isVip from Areas 
	left join Persons on Areas.AreaId=Persons.AreaId
	where Areas.AreaId=@Id
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAreaByIdWithBuildings]    Script Date: 01/07/2015 21:36:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAreaByIdWithBuildings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create procedure [dbo].[ReadAreaByIdWithBuildings]
	@Id int
as 
	select Areas.AreaId,BuildingId,isHistorical,Type from Areas 
	left join Buildings on Areas.AreaId=Buildings.AreaId
	where Areas.AreaId=@Id
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAllBuildings]    Script Date: 01/07/2015 21:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllBuildings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create procedure [dbo].[ReadAllBuildings]
as
	Select BuildingId,IsHistorical,Type,AreaId
	from Buildings
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAllAreasWithPersons]    Script Date: 01/07/2015 21:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllAreasWithPersons]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReadAllAreasWithPersons]
as 
	select Areas.AreaId,Persons.Name,Persons.PersonId,Religion,DateOfBurial,BurialCertificateNumber,isVip from Areas 
	left join Persons on Areas.AreaId=Persons.AreaId
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDeceased]    Script Date: 01/07/2015 21:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDeceased]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteDeceased]
	@PersonID int
AS
BEGIN
	DELETE FROM Persons
	WHERE PersonId = @PersonID AND PersonType = ''Deceased''
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBuilding]    Script Date: 01/07/2015 21:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteBuilding]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[DeleteBuilding]
	@Id int
as 
	delete from Buildings where BuildingId=@Id
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAllAreasWithBuildings]    Script Date: 01/07/2015 21:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllAreasWithBuildings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[ReadAllAreasWithBuildings] 
as
	select Areas.AreaId,BuildingId,isHistorical,Type from Areas 
	left join Buildings on Areas.AreaId=Buildings.AreaId
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAllAreas]    Script Date: 01/07/2015 21:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReadAllAreas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ReadAllAreas]
as
	select Areas.AreaId,BuildingId,isHistorical,Type,Persons.Name,Persons.PersonId,Religion,DateOfBurial,BurialCertificateNumber,isVip from Areas 
	left join Buildings on Areas.AreaId=Buildings.AreaId
	left join Persons on Areas.AreaId=Persons.AreaId
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[Persons_ReadAllHomeless]    Script Date: 01/07/2015 21:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persons_ReadAllHomeless]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[Persons_ReadAllHomeless]
AS
BEGIN
	SELECT PersonId, Name, Religion, DateOfBurial, isVip, BurialCertificateNumber, RequestNo  FROM Persons
	WHERE PersonType = ''Homeless''
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Persons_ReadAllDeceased]    Script Date: 01/07/2015 21:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persons_ReadAllDeceased]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[Persons_ReadAllDeceased] 
AS
BEGIN
	SELECT PersonId,Name, Religion, DateOfBurial, isVip,BurialCertificateNumber  from [dbo].[Persons]
	where [PersonType]=''Deceased''
END
' 
END
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 01/07/2015 21:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contracts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Contracts](
	[ContractId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[InvoiceNo] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[numberInfo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[AddDeceased]    Script Date: 01/07/2015 21:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddDeceased]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddDeceased]
	@Name nvarchar(max),
	@Religion nvarchar(50),
	@DateOfBurial date,
	@isVip bit,
	@BurialCertificateNumber nvarchar(50)
AS
	Insert into Persons(Name, Religion, DateOfBurial, isVip, BurialCertificateNumber, PersonType)
	Values(@Name, @Religion, @DateOfBurial, @isVip, @BurialCertificateNumber, ''Deceased'')
RETURN 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddBuilding]    Script Date: 01/07/2015 21:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddBuilding]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddBuilding]
	@isHistorical bit,
	@Type nvarchar(50),
	@areaId int
	
as
	insert into Buildings (isHistorical,Type,AreaId)
	values (@isHistorical,@Type,@areaId)
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetBuildingById]    Script Date: 01/07/2015 21:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetBuildingById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[GetBuildingById]
	@Id int
as
	Select BuildingId,isHistorical,Type,AreaId from Buildings
	where BuildingId=@Id
return 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOwners]    Script Date: 01/07/2015 21:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteOwners]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteOwners]
@PersonID int
AS
BEGIN 
	DELETE FROM Persons WHERE PersonID = @PersonID
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteHomeless]    Script Date: 01/07/2015 21:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteHomeless]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteHomeless]
@PersonId int

AS
BEGIN
	DELETE FROM Persons WHERE PersonId = @PersonId
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Owners_ReadAllOwners]    Script Date: 01/07/2015 21:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Owners_ReadAllOwners]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[Owners_ReadAllOwners]
AS
BEGIN 
	SELECT PersonID, Name, Address FROM Persons
	WHERE PersonType = ''Owner''
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddOwners]    Script Date: 01/07/2015 21:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddOwners]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AddOwners]
	@Name nvarchar(max),
	@Address nvarchar(50),
	@BurialCertificateNumber nvarchar(50)
AS
	Insert into Persons(Name,Address , PersonType)
	Values(@Name, @Address, ''Deceased'')
RETURN 0' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddHomeless]    Script Date: 01/07/2015 21:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddHomeless]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddHomeless]
@Name nvarchar(50),
@Religion nvarchar(50),
@DateOfBurial date,
@isVip bit,
@BurialCertificateNumber nvarchar(50),
@RequestNo nvarchar(50)

AS
BEGIN
	INSERT INTO Persons(Name, Religion, DateOfBurial, isVip, BurialCertificateNumber, RequestNo, PersonType) Values
	(@Name, @Religion, @DateOfBurial, @isVip, @BurialCertificateNumber, @RequestNo, ''Homeless'')
END' 
END
GO
/****** Object:  ForeignKey [FK__Areas__Graveyard__6FE99F9F]    Script Date: 01/07/2015 21:36:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Areas__Graveyard__6FE99F9F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Areas]'))
ALTER TABLE [dbo].[Areas]  WITH CHECK ADD FOREIGN KEY([GraveyardId])
REFERENCES [dbo].[Graveyards] ([GraveyardId])
GO
/****** Object:  ForeignKey [FK__Buildings__AreaI__72C60C4A]    Script Date: 01/07/2015 21:36:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Buildings__AreaI__72C60C4A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Buildings]'))
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD FOREIGN KEY([AreaId])
REFERENCES [dbo].[Areas] ([AreaId])
GO
/****** Object:  ForeignKey [FK__Persons__AreaId__75A278F5]    Script Date: 01/07/2015 21:36:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Persons__AreaId__75A278F5]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD FOREIGN KEY([AreaId])
REFERENCES [dbo].[Areas] ([AreaId])
GO
/****** Object:  ForeignKey [FK__Contracts__Perso__787EE5A0]    Script Date: 01/07/2015 21:36:58 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Contracts__Perso__787EE5A0]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([PersonId])
GO
