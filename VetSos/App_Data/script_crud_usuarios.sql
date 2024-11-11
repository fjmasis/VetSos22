--Crear nuevo usuario
CREATE PROCEDURE sp_CrearUsuario
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @Email NVARCHAR(150),
    @NombreUsuario NVARCHAR(50),
    @Contraseña NVARCHAR(255),
    @Rol NVARCHAR(50),
    @AdicionadoPor NVARCHAR(50),
    @UsuarioID_AdicionadoPor INT
AS
BEGIN
    INSERT INTO Usuarios (Nombre, Apellido, Email, NombreUsuario, Contraseña, Rol, AdicionadoPor, FechaAdicion, UsuarioID_AdicionadoPor)
    VALUES (@Nombre, @Apellido, @Email, @NombreUsuario, @Contraseña, @Rol, @AdicionadoPor, GETDATE(), @UsuarioID_AdicionadoPor);
END;
GO

--Leer usuarios
CREATE PROCEDURE sp_ObtenerUsuarios
AS
BEGIN
    SELECT UsuarioID, Nombre, Apellido, Email, NombreUsuario, Rol, AdicionadoPor, FechaAdicion, ModificadoPor, FechaModificacion
    FROM Usuarios;
END;
GO

--Obtener usuario por ID
CREATE PROCEDURE sp_ObtenerUsuarioPorID
    @UsuarioID INT
AS
BEGIN
    SELECT UsuarioID, Nombre, Apellido, Email, NombreUsuario, Rol, AdicionadoPor, FechaAdicion, ModificadoPor, FechaModificacion
    FROM Usuarios
    WHERE UsuarioID = @UsuarioID;
END;
 GO

--Actualizar usuario existente
CREATE PROCEDURE sp_ActualizarUsuario
    @UsuarioID INT,
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @Email NVARCHAR(150),
    @NombreUsuario NVARCHAR(50),
    @Contraseña NVARCHAR(255),
    @Rol NVARCHAR(50),
    @ModificadoPor NVARCHAR(50),
    @UsuarioID_ModificadoPor INT
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        Email = @Email,
        NombreUsuario = @NombreUsuario,
        Contraseña = @Contraseña,
        Rol = @Rol,
        ModificadoPor = @ModificadoPor,
        FechaModificacion = GETDATE(),
        UsuarioID_ModificadoPor = @UsuarioID_ModificadoPor
    WHERE UsuarioID = @UsuarioID;
END;
GO

--Eliminar usuario existente
CREATE PROCEDURE sp_EliminarUsuario
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios
    WHERE UsuarioID = @UsuarioID;
END;
GO

CREATE PROCEDURE sp_IniciarSesion
    @NombreUsuario NVARCHAR(50),
    @Contrasenna NVARCHAR(255) 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        UsuarioID, 
        Nombre, 
        Apellido, 
        Email, 
        Rol, 
        AdicionadoPor, 
        FechaAdicion, 
        ModificadoPor, 
        FechaModificacion
    FROM Usuarios
    WHERE NombreUsuario = @NombreUsuario
      AND Contraseña = @Contrasenna; -- Asegúrate de usar un hash aquí
END;
GO