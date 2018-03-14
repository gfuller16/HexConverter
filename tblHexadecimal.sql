USE [Sample1]
GO

/****** Object:  Table [dbo].[tblHexadecimal]    Script Date: 3/14/2018 3:34:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblHexadecimal](
	[hxValue] [varchar](2) NOT NULL,
	[hxCharacter] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hxValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
