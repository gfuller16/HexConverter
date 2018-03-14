/****** Object:  StoredProcedure [dbo].[spHex2Text]    Script Date: 3/14/2018 3:35:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spHex2Text] --'48-61-76-65-20-61-20-67-72-65-61-74-20-64-61-79-21'
@Hex VARCHAR(MAX)
AS 
BEGIN

    SET @Hex = REPLACE(@Hex,'-','')
    SET @Hex = REPLACE(@Hex,' ' ,'')
    DECLARE @Index INT = LEN(@Hex),
		  @TextMessage VARCHAR(MAX) = '',
		  @Character VARCHAR(2),
		  @errmsg VARCHAR(100)

    WHILE(@Index >= 2)
    BEGIN
	   
	   SET @Character = (SELECT SUBSTRING(@Hex,@Index-1,2))

	   IF(SELECT
	   hxCharacter
	   FROM tblHexadecimal
	   WHERE hxValue = @Character) IS NULL
	   BEGIN
		  
		  SET @errmsg = 'Hex Value "' + @Character + '" not recognized. Please add to tblHexadecimal.'
		  RAISERROR(@errmsg,12,1)
		  RETURN

	   END
	   
	   ELSE
	   BEGIN

		  SET @TextMessage = (
		  SELECT
		  hxCharacter
		  FROM tblHexadecimal
		  WHERE hxValue = @Character
		  ) + @TextMessage

	   END

	   --SELECT @Index,@Character,@TextMessage
	   SET @Index = @Index - 2

    END


    SELECT LEFT(@TextMessage,LEN(@TextMessage)) AS [HexMessage]

END
