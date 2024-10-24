--EJERCICIO 3--
--crear un procedimineto almacenado que contenga un cursor que se encargue de
--procesar las cancelaciones de ordenes. debe actualizar el statuis de la orden a "cancelado" 
-- y actualizar los niveles de stock para las ordenes canceladas 

-- Tabla de Ordenes
CREATE TABLE Ordenes (
    OrdenID INT PRIMARY KEY,
    Status VARCHAR(50),
    FechaOrden DATE
);


CREATE TABLE DetallesOrden (
    DetalleID INT PRIMARY KEY,
    OrdenID INT,
    ProductoID INT,
    Cantidad INT,
    FOREIGN KEY (OrdenID) REFERENCES Ordenes(OrdenID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Tabla de Productos
CREATE TABLE Productos (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    StockDisponible INT
);