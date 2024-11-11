-- Crear nuevo Dueño
CREATE PROCEDURE sp_CrearDueño
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @Direccion NVARCHAR(100),
    @Telefono NVARCHAR(20),
    @Email NVARCHAR(100),
    @Identificacion NVARCHAR(20),
    @AdicionadoPor NVARCHAR(50)
AS
BEGIN
    INSERT INTO Dueños (Nombre, Apellido, Direccion, Telefono, Email, Identificacion, AdicionadoPor, FechaAdicion)
    VALUES (@Nombre, @Apellido, @Direccion, @Telefono, @Email, @Identificacion, @AdicionadoPor, GETDATE());
END;
GO

-- Leer Dueños
CREATE PROCEDURE sp_LeerDueños
AS
BEGIN
    SELECT * FROM Dueños;
END;
GO

-- Actualizar Dueño
CREATE PROCEDURE sp_ActualizarDueño
    @DueñoID INT,
    @Nombre NVARCHAR(50),
    @Apellido NVARCHAR(50),
    @Direccion NVARCHAR(100),
    @Telefono NVARCHAR(20),
    @Email NVARCHAR(100),
    @Identificacion NVARCHAR(20),
    @ModificadoPor NVARCHAR(50)
AS
BEGIN
    UPDATE Dueños
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        Direccion = @Direccion,
        Telefono = @Telefono,
        Email = @Email,
        Identificacion = @Identificacion,
        ModificadoPor = @ModificadoPor,
        FechaModificacion = GETDATE()
    WHERE DueñoID = @DueñoID;
END;
GO

-- Eliminar Dueño
CREATE PROCEDURE sp_EliminarDueño
    @DueñoID INT
AS
BEGIN
    DELETE FROM Dueños
    WHERE DueñoID = @DueñoID;
END;
GO
