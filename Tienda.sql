create database Tienda
use Tienda

CREATE TABLE Elementos (
    ID_Elemento INT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE Componentes (
    ID_Componente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Stock INT
);

CREATE TABLE ElementosComponentes (
    ID_Elemento INT,
    ID_Componente INT,
    CantidadNecesaria INT,
    PRIMARY KEY (ID_Elemento, ID_Componente),
    FOREIGN KEY (ID_Elemento) REFERENCES Elementos(ID_Elemento),
    FOREIGN KEY (ID_Componente) REFERENCES Componentes(ID_Componente)
);


DECLARE @ElementoID INT = 1; -- ID del elemento que quieres armar

SELECT 
    c.Nombre AS Componente, 
    ec.CantidadNecesaria AS Cantidad_Requerida,
    c.Stock AS Stock_Disponible
FROM ElementosComponentes ec
JOIN Componentes c ON ec.ID_Componente = c.ID_Componente
WHERE ec.ID_Elemento = @ElementoID;


INSERT INTO Elementos (ID_Elemento, Nombre)
VALUES 
(1, 'Silla de Madera'),
(2, 'Mesa de Centro'),
(3, 'Estantería');

INSERT INTO Componentes (ID_Componente, Nombre, Stock)
VALUES 
(1, 'Tablas de Madera', 50),
(2, 'Tornillos', 200),
(3, 'Patas de Metal', 30),
(4, 'Pegamento', 20);


INSERT INTO ElementosComponentes (ID_Elemento, ID_Componente, CantidadNecesaria)
VALUES 
-- Silla de Madera necesita:
(1, 1, 4),  -- 4 Tablas de Madera
(1, 2, 8),  -- 8 Tornillos
(1, 3, 4),  -- 4 Patas de Metal

-- Mesa de Centro necesita:
(2, 1, 6),  -- 6 Tablas de Madera
(2, 2, 10), -- 10 Tornillos
(2, 3, 4),  -- 4 Patas de Metal
(2, 4, 1),  -- 1 Pegamento

-- Estantería necesita:
(3, 1, 8),  -- 8 Tablas de Madera
(3, 2, 12), -- 12 Tornillos
(3, 4, 2);  -- 2 Pegamentos


SELECT * FROM Elementos;
SELECT * FROM Componentes;
SELECT * FROM ElementosComponentes;
