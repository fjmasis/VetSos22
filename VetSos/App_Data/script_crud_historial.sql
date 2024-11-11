-- Crear nuevo Historial Clínico
CREATE PROCEDURE sp_CrearHistorialClinico
    @FechaVisita DATETIME,
    @Sintomas NVARCHAR(250),
    @Diagnostico NVARCHAR(250),
    @Tratamiento NVARCHAR(250),
    @Veterinario NVARCHAR(100),
    @MascotaID INT,
    @AdicionadoPor NVARCHAR(50)
AS
BEGIN
    INSERT INTO HistorialClinico (FechaVisita, Sintomas, Diagnostico, Tratamiento, Veterinario, MascotaID, AdicionadoPor, FechaAdicion)
    VALUES (@FechaVisita, @Sintomas, @Diagnostico, @Tratamiento, @Veterinario, @MascotaID, @AdicionadoPor, GETDATE());
END;
GO

-- Leer Historial Clínico
CREATE PROCEDURE sp_LeerHistorialClinico
AS
BEGIN
    SELECT * FROM HistorialClinico;
END;
GO

-- Actualizar Historial Clínico
CREATE PROCEDURE sp_ActualizarHistorialClinico
    @HistorialID INT,
    @FechaVisita DATETIME,
    @Sintomas NVARCHAR(250),
    @Diagnostico NVARCHAR(250),
    @Tratamiento NVARCHAR(250),
    @Veterinario NVARCHAR(100),
    @MascotaID INT,
    @ModificadoPor NVARCHAR(50)
AS
BEGIN
    UPDATE HistorialClinico
    SET FechaVisita = @FechaVisita,
        Sintomas = @Sintomas,
        Diagnostico = @Diagnostico,
        Tratamiento = @Tratamiento,
        Veterinario = @Veterinario,
        MascotaID = @MascotaID,
        ModificadoPor = @ModificadoPor,
        FechaModificacion = GETDATE()
    WHERE HistorialID = @HistorialID;
END;
GO

-- Eliminar Historial Clínico
CREATE PROCEDURE sp_EliminarHistorialClinico
    @HistorialID INT
AS
BEGIN
    DELETE FROM HistorialClinico
    WHERE HistorialID = @HistorialID;
END;
GO
