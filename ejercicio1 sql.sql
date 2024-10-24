--EJERCICIO 1--

--crear un procedimiento almacenado que contenga un cursor que se encargue de genera
-- UN NREPORTE DE VENTAS DE PRODUCTO POR CATEGORIA LA CONSULTA DEBE DEVOLVER EL PRUCTO, 
--LA CATEGORIA Y EL TOTAL DE LAS VENTAS

CREATE DATABASE VentaCelulares

CREATE TABLE Categorias (
    CategoriesID INT PRIMARY KEY,
    CategoriesName VARCHAR(100)
);


CREATE TABLE Productos (
    ProductID INT PRIMARY KEY,
    PrroductName VARCHAR(100),
    CategoriesID INT,
    FOREIGN KEY (CategoriesID) REFERENCES Categorias(CategoriesID)
);

CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY,
    ProductID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FechaVenta DATE,
    FOREIGN KEY (ProductID) REFERENCES Productos(ProductID)
);
 CREATE PROCEDURE GenerarReporteVentas()
BEGIN
    
    DECLARE CategoriesID INT;
    DECLARE CategoriesName VARCHAR(100);
    DECLARE done INT DEFAULT 0;

    DECLARE ProductID INT;
    DECLARE ProductName VARCHAR(100);
    DECLARE TotalVentas DECIMAL(10, 2);

  
    DECLARE cursorCategorias CURSOR FOR
        SELECT CategoriesID, CategoriesName FROM Categorias;

    
    OPEN cursorCategorias;

        FETCH cursorCategorias INTO CategoriesID, CategoriesName;

        SELECT CONCAT('Categoría: ', Categorias) AS Categoria;

        DECLARE cursorVentas CURSOR FOR
            SELECT P.ProductoID, P.PrroductName, SUM(V.Cantidad * V.PrecioUnitario) AS TotalVentas
            FROM Productos P
            JOIN Ventas V ON P.ProductoID = V.ProductoID
            WHERE P.CategoriesID = v_CategoriesID
            GROUP BY P.ProductoID, P.ProductName;

     
        OPEN cursorVentas;

    
            FETCH cursorVentas INTO ProductoID, ProductName, TotalVentas;


            SELECT ProductName AS Producto, TotalVentas AS Total_Ventas;
        CLOSE cursorVentas;

    CLOSE cursorCategories;
END