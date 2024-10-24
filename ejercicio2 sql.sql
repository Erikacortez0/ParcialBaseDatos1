--EJERCICIO 2--

--CREAR un procedimiento almaceado que contenga un cursor que se encargue 
--de generar un reporte del hiostorial de compra de cada cliente laconsulta debe 
--devolver el cliente, el total gastado de todas sus compras y la fecha de la ultima
--compra realizada



CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    NombreCliente VARCHAR(100)
);

-- Tabla de Compras
CREATE TABLE Compras (
    CompraID INT PRIMARY KEY,
    ClienteID INT,
    TotalCompra DECIMAL(10, 2),
    FechaCompra DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
