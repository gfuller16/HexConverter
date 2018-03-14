/****** Object:  StoredProcedure [dbo].[spText2Hex]    Script Date: 3/14/2018 3:35:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spText2Hex] --'Have a great day!'
@Text VARCHAR(MAX)
AS
BEGIN

    DECLARE @Index INT = LEN(@Text),
		  @HexMessage VARCHAR(MAX) = '',
		  @Character VARCHAR(1),
		  @errmsg VARCHAR(100)
    --SELECT @Length

    WHILE(@Index > 0)
    BEGIN
	   
	   SET @Character = (SELECT SUBSTRING(@Text,@Index,1))

	   IF(SELECT
	   hxValue
	   FROM tblHexadecimal
	   WHERE hxCharacter = @Character COLLATE SQL_Latin1_General_CP1_CS_AS) IS NULL
	   BEGIN
		  
		  SET @errmsg = 'ASCII character "' + @Character + '" not recognized. Please add to tblHexadecimal.'
		  RAISERROR(@errmsg,12,1)
		  RETURN

	   END
	   
	   ELSE
	   BEGIN

		  SET @HexMessage = (
		  SELECT
		  hxValue
		  FROM tblHexadecimal
		  WHERE hxCharacter = @Character COLLATE SQL_Latin1_General_CP1_CS_AS
		  ) + '-' + @HexMessage

	   END

	   --SELECT @Index,@Character
	   SET @Index = @Index - 1

    END


    SELECT LEFT(@HexMessage,LEN(@HexMessage)-1) AS [HexMessage]

END
