CREATE TABLE ubicaciones (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE
);

CREATE TABLE proveedores (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE,
    telefono VARCHAR(15) NULL,
    correo VARCHAR(100) NULL
);

CREATE TABLE tipos (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE
);
CREATE TABLE extintores (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    capacidad INT UNSIGNED,
    fechafabricacion DATE,
    estado VARCHAR(50),
    idubicacion INT UNSIGNED,
    idproveedor INT UNSIGNED,
    FOREIGN KEY (idubicacion) REFERENCES ubicaciones(id),
    FOREIGN KEY (idproveedor) REFERENCES proveedores(id)
);

CREATE TABLE inspecciones (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idextintor INT UNSIGNED,
    fecha DATE,
    proximainspeccion DATE,
    FOREIGN KEY (idextintor) REFERENCES extintores(id)
);

CREATE TABLE recargas (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idextintor INT UNSIGNED,
    fecha DATE,
    proximarecarga DATE,
    FOREIGN KEY (idextintor) REFERENCES extintores(id)
);

INSERT INTO ubicaciones (nombre) VALUES ('sala 1');
INSERT INTO ubicaciones (nombre) VALUES ('sala 2');
INSERT INTO ubicaciones (nombre) VALUES ('sala 3');
SELECT*FROM ubicaciones;

INSERT INTO proveedores (nombre, telefono, correo) VALUES ('luisa', '3170457280', 'proveedoraluisa@example.com');
INSERT INTO proveedores (nombre, telefono, correo) VALUES ('fernanda', '3215647582', 'proveedorfer@example.com');
INSERT INTO proveedores (nombre, telefono, correo) VALUES ('sara', '3180457280', 'proveedorasara@example.com');
SELECT*FROM provedores;

INSERT INTO tipos (nombre) VALUES ('CO2');
INSERT INTO tipos (nombre) VALUES ('POLVO');
INSERT INTO tipos (nombre) VALUES ('ESPUMA');
SELECT*FROM tipos;

INSERT INTO extintores (capacidad, fechafabricacion, estado, idubicacion, idproveedor) VALUES (5, '2023-01-01', 'Bueno', 1, 1);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idubicacion, idproveedor) VALUES (10, '2022-06-15', 'Regular', 2, 2);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idubicacion, idproveedor) VALUES (8, '2023-02-06', 'malo', 3, 3);
SELECT*FROM extintores;


INSERT INTO inspecciones (idextintor, fecha, proximainspeccion) VALUES (1, '2024-05-09', '2024-11-07');
INSERT INTO inspecciones (idextintor, fecha, proximainspeccion) VALUES (2, '2024-09-05', '2024-11-08');
INSERT INTO inspecciones (idextintor, fecha, proximainspeccion) VALUES (3, '2024-01-02', '2024-11-05');
SELECT*FROM inspecciones;




INSERT INTO recargas (idextintor, fecha, proximarecarga) VALUES (1, '2024-05-08', '2024-11-02');
INSERT INTO recargas (idextintor, fecha, proximarecarga) VALUES (2, '2024-05-07', '2024-12-08');
INSERT INTO recargas (idextintor, fecha, proximarecarga) VALUES (3, '2024-05-06', '2024-10-09');
SELECT*FROM recargas;