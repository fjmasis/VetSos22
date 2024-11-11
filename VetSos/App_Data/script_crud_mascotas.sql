-- Crear nueva Mascota
CREATE PROCEDURE sp_CrearMascota
    @Nombre NVARCHAR(50),
    @Especie NVARCHAR(50),
    @Raza NVARCHAR(50),
    @FechaNacimiento DATE,
    @Color NVARCHAR(20),
    @Peso DECIMAL(5,2),
    @DueñoID INT,
    @AdicionadoPor NVARCHAR(50)
AS
BEGIN
    INSERT INTO Mascotas (Nombre, Especie, Raza, FechaNacimiento, Color, Peso, DueñoID, AdicionadoPor, FechaAdicion)
    VALUES (@Nombre, @Especie, @Raza, @FechaNacimiento, @Color, @Peso, @DueñoID, @AdicionadoPor, GETDATE());
END;
GO

-- Leer Mascotas
CREATE PROCEDURE sp_LeerMascotas
AS
BEGIN
    SELECT * FROM Mascotas;
END;
GO

-- Actualizar Mascota
CREATE PROCEDURE sp_ActualizarMascota
    @MascotaID INT,
    @Nombre NVARCHAR(50),
    @Especie NVARCHAR(50),
    @Raza NVARCHAR(50),
    @FechaNacimiento DATE,
    @Color NVARCHAR(20),
    @Peso DECIMAL(5,2),
    @DueñoID INT,
    @ModificadoPor NVARCHAR(50)
AS
BEGIN
    UPDATE Mascotas
    SET Nombre = @Nombre,
        Especie = @Especie,
        Raza = @Raza,
        FechaNacimiento = @FechaNacimiento,
        Color = @Color,
        Peso = @Peso,
        DueñoID = @DueñoID,
        ModificadoPor = @ModificadoPor,
        FechaModificacion = GETDATE()
    WHERE MascotaID = @MascotaID;
END;
GO

-- Eliminar Mascota
CREATE PROCEDURE sp_EliminarMascota
    @MascotaID INT
AS
BEGIN
    DELETE FROM Mascotas
    WHERE MascotaID = @MascotaID;
END;
GO
