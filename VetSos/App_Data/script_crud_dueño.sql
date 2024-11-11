-- Crear nuevo Due�o
CREATE PROCEDURE sp_CrearDue�o
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @Direccion NVARCHAR(100),
    @Telefono NVARCHAR(20),
    @Email NVARCHAR(100),
    @Identificacion NVARCHAR(20),
    @AdicionadoPor NVARCHAR(50)
AS
BEGIN
    INSERT INTO Due�os (Nombre, Apellido, Direccion, Telefono, Email, Identificacion, AdicionadoPor, FechaAdicion)
    VALUES (@Nombre, @Apellido, @Direccion, @Telefono, @Email, @Identificacion, @AdicionadoPor, GETDATE());
END;
GO

-- Leer Due�os
CREATE PROCEDURE sp_LeerDue�os
AS
BEGIN
    SELECT * FROM Due�os;
END;
GO

-- Actualizar Due�o
CREATE PROCEDURE sp_ActualizarDue�o
    @Due�oID INT,
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @Direccion NVARCHAR(100),
    @Telefono NVARCHAR(20),
    @Email NVARCHAR(100),
    @Identificacion NVARCHAR(20),
    @ModificadoPor NVARCHAR(50)
AS
BEGIN
    UPDATE Due�os
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        Direccion = @Direccion,
        Telefono = @Telefono,
        Email = @Email,
        Identificacion = @Identificacion,
        ModificadoPor = @ModificadoPor,
        FechaModificacion = GETDATE()
    WHERE Due�oID = @Due�oID;
END;
GO

-- Eliminar Due�o
CREATE PROCEDURE sp_EliminarDue�o
    @Due�oID INT
AS
BEGIN
    DELETE FROM Due�os
    WHERE Due�oID = @Due�oID;
END;
GO
