-- Crear base de datos
CREATE DATABASE ClinicaVeterinaria;
GO

USE ClinicaVeterinaria;
GO

-- Tabla de Due�os
CREATE TABLE Due�os (
    Due�oID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Direccion NVARCHAR(100),
    Telefono NVARCHAR(20),
    Email NVARCHAR(100),
    Identificacion NVARCHAR(20) UNIQUE,

    -- Campos de auditor�a
    AdicionadoPor NVARCHAR(50) NOT NULL,
    FechaAdicion DATETIME NOT NULL DEFAULT GETDATE(),
    ModificadoPor NVARCHAR(50),
    FechaModificacion DATETIME
);
GO

-- Tabla de Mascotas
CREATE TABLE Mascotas (
    MascotaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Especie NVARCHAR(50) NOT NULL,
    Raza NVARCHAR(50),
    FechaNacimiento DATE,
    Color NVARCHAR(20),
    Peso DECIMAL(5,2),

    -- Clave for�nea para el due�o
    Due�oID INT NOT NULL,
    FOREIGN KEY (Due�oID) REFERENCES Due�os(Due�oID) ON DELETE CASCADE,

    -- Campos de auditor�a
    AdicionadoPor NVARCHAR(50) NOT NULL,
    FechaAdicion DATETIME NOT NULL DEFAULT GETDATE(),
    ModificadoPor NVARCHAR(50),
    FechaModificacion DATETIME
);
GO

-- Tabla de Historial Cl�nico
CREATE TABLE HistorialClinico (
    HistorialID INT PRIMARY KEY IDENTITY(1,1),
    FechaVisita DATETIME NOT NULL,
    Sintomas NVARCHAR(250),
    Diagnostico NVARCHAR(250),
    Tratamiento NVARCHAR(250),
    Veterinario NVARCHAR(100),

    -- Clave for�nea para la mascota
    MascotaID INT NOT NULL,
    FOREIGN KEY (MascotaID) REFERENCES Mascotas(MascotaID) ON DELETE CASCADE,

    -- Campos de auditor�a
    AdicionadoPor NVARCHAR(50) NOT NULL,
    FechaAdicion DATETIME NOT NULL DEFAULT GETDATE(),
    ModificadoPor NVARCHAR(50),
    FechaModificacion DATETIME
);
GO
--Tabla de usuarios 
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) UNIQUE NOT NULL,
    NombreUsuario NVARCHAR(50) UNIQUE NOT NULL,
    Contrase�a NVARCHAR(255) NOT NULL, -- Puedes almacenar un hash de la contrase�a
    Rol NVARCHAR(50) NOT NULL, -- Ejemplo: "admin", "veterinario", etc.

    -- Campos de auditor�a
    AdicionadoPor NVARCHAR(50) NOT NULL,
    FechaAdicion DATETIME DEFAULT GETDATE(),
    ModificadoPor NVARCHAR(50) NULL,
    FechaModificacion DATETIME NULL,

    -- Clave for�nea al Usuario que cre� el registro (si es necesario)
    UsuarioID_AdicionadoPor INT NULL,
    UsuarioID_ModificadoPor INT NULL,
    FOREIGN KEY (UsuarioID_AdicionadoPor) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (UsuarioID_ModificadoPor) REFERENCES Usuarios(UsuarioID)
);
GO