CREATE SCHEMA empresa;
USE empresa;

CREATE TABLE Clientes(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50),
    cp INT,
    direccion VARCHAR(30),
    telefono VARCHAR(12),
    localidad VARCHAR(30)
);

INSERT INTO clientes (id, nombre, cp, direccion, telefono, localidad) VALUES
(1, 'Juan Perez', '1043', 'Av. Corrientes 1234', '011-555-1234', 'Buenos Aires'),
(2, 'Maria Gomez', '5000', 'Av. Las Heras 456', '011-555-5678', 'Córdoba'),
(3, 'Pedro Martinez', '4400', 'Av. Belgrano 789', '011-555-9012', 'Salta'),
(4, 'Ana Torres', '5500', 'Calle San Martin 456', '011-555-3456', 'Mendoza'),
(5, 'Luisa Gonzalez', '5400', 'Calle San Juan 789', '011-555-7890', 'SanJuan'),
(6, 'Carlos Rodriguez', '2000', 'Av. Santa Fe 123', '011-555-2345', 'Rosario'),
(7, 'Fernando Hernandez', '4000', 'Calle 25 de Mayo 789', '011-555-6789', 'Tucumán'),
(8, 'Sofia Ramirez', '1900', 'Av. Mitre 123', '011-555-9012', 'La Plata'),
(9, 'Jorge Castro', '7600', 'Calle Rivadavia 456', '011-555-3456', 'Mar del Plata'),
(10, 'Laura Diaz', '8000', 'Av. Rivadavia 789', '011-555-7890', 'Bahía Blanca');


CREATE TABLE Proveedores(
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nombre VARCHAR(50) NOT NULL,
     cuit VARCHAR(30),
     descricion VARCHAR(50),
     direccion VARCHAR(60) NOT NULL,
     telefono VARCHAR(20),
     localidad VARCHAR(50)
);

INSERT INTO proveedores (id, nombre, cuit, direccion, telefono, localidad) VALUES
(1, 'Samsung Electronics Argentina S.A.', '30-64158053-8', 'Av. del Libertador 6301', '0800-333-SAMSUNG', 'Buenos Aires'),
(2, 'Apple South America', '30-71432342-0', 'Av. Del Libertador 4101', '0800-444-APPLE', 'Buenos Aires'),
(3, 'Motorola Solutions Argentina SRL', '30-70938823-2', 'Av. Leandro N. Alem 986', '0800-555-6686', 'Buenos Aires'),
(4, 'LG Electronics Argentina S.A.', '30-70923361-4', 'Salguero 2739', '0800-555-54-54', 'Buenos Aires'),
(5, 'Xiaomi Argentina', '30-71533691-2', 'Gorriti 5070', '+54 9 11 3050-5965', 'Buenos Aires'),
(6, 'Huawei Technologies Argentina S.A.', '30-71432504-9', 'Av. Leandro N. Alem 855', '+54 11 3984-2200', 'Buenos Aires'),
(7, 'Sony Inter-American', '30-70795249-3', 'Tucumán 1', '0800-777-7669', 'Buenos Aires'),
(8, 'OnePlus Argentina', '30-71791435-0', 'Florida 165', '+54 9 11 5667-8888', 'Buenos Aires'),
(9, 'Nokia Technologies', '30-71661829-4', 'Av. Del Libertador 101', '0800-888-6654', 'Buenos Aires'),
(10, 'Google Argentina SRL', '30-71134885-5', 'Avenida Del Libertador 498', '+54 11 5530-3000', 'Buenos Aires');

CREATE TABLE Stock(
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       nombre VARCHAR(30),
       cantidad INT,
       costo DECIMAL(12,1) NOT NULL
);
	
INSERT INTO stock (id, nombre, cantidad, costo) VALUES
(1, 'iPhone 12', 20, 999.00),
(2, 'Samsung Galaxy S21', 30, 899.00),
(3, 'Google Pixel 5a', 15, 449.00),
(4, 'OnePlus 9', 25, 729.00),
(5, 'Xiaomi Redmi Note 10 Pro', 40, 279.00),
(6, 'Motorola Moto G Power (2021)', 50, 249.00),
(7, 'Sony Xperia 5 II', 10, 949.00),
(8, 'LG Velvet', 20, 499.00),
(9, 'Huawei P40 Pro', 5, 1099.00),
(10, 'Nokia 8.3', 15, 699.00);

CREATE TABLE Ventas(
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 factura VARCHAR(30) NOT NULL,
     fecha DATE NOT NULL,
     monto DECIMAL (12,1) NOT NULL,
     id_Clientes INT NOT NULL,
     FOREIGN KEY (id_Clientes) REFERENCES Clientes (id)
);

INSERT INTO ventas (id, factura, fecha, monto, id_clientes) VALUES
(1, 'FAC-001', '2023-05-24', 449.00, 1),
(2, 'FAC-002', '2023-05-23', 729.00, 2),
(3, 'FAC-003', '2023-05-22', 240.00, 3),
(4, 'FAC-004', '2023-05-21', 499.00, 4),
(5, 'FAC-005', '2023-05-20', 699.00, 5),
(6, 'FAC-006', '2023-05-19', 1099.00, 6),
(7, 'FAC-007', '2023-05-18', 279.00, 7),
(8, 'FAC-008', '2023-05-17', 949.00, 8),
(9, 'FAC-009', '2023-05-16', 899.00, 9),
(10, 'FAC-010', '2023-05-15', 240.00, 10);



CREATE TABLE Compras(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	  factura VARCHAR(30) NOT NULL ,
      fecha_oc DATE NOT NULL,
      monto DECIMAL(12.1),
      id_proveedor INT NOT NULL,
      FOREIGN KEY (id_proveedor) REFERENCES proveedores (id),
      FOREIGN KEY (factura) REFERENCES ventas (id)
);

INSERT INTO compras (id, factura, fecha_oc, monto, id_proveedor) VALUES
(1, 'FAC-001', '2023-05-24', 700.00, 1),
(2, 'FAC-002', '2023-05-23', 600.00, 2),
(3, 'FAC-003', '2023-05-22', 250.00, 3),
(4, 'FAC-004', '2023-05-21', 500.00, 4),
(5, 'FAC-005', '2023-05-20', 100.00, 5),
(6, 'FAC-006', '2023-05-19', 80.00, 6),
(7, 'FAC-007', '2023-05-18', 740.00, 7),
(8, 'FAC-008', '2023-05-17', 320.00, 8),
(9, 'FAC-009', '2023-05-16', 800.00, 9),
(10, 'FAC-010', '2023-05-15', 450.00, 10);

CREATE TABLE Pagos(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        factura VARCHAR(30) NOT NULL,
        id_cliente INT NOT NULL,
        id_producto INT NOT NULL,
        fecha DATE NOT NULL,
        precio DECIMAL(10,1) NOT NULL,
        cantidad INT,
        FOREIGN KEY (factura) REFERENCES ventas (id),
        FOREIGN KEY (id_cliente) REFERENCES clientes (id),
        FOREIGN KEY (id_producto) REFERENCES stock (id)
);
INSERT INTO pagos (id, factura, id_cliente, id_producto, fecha, precio, cantidad) VALUES
(1, 'FAC-001', 1, 1, '2023-05-24', 449.00, 1),
(2, 'FAC-002', 2, 2, '2023-05-23', 729.00, 1),
(3, 'FAC-003', 3, 3, '2023-05-22', 240.00, 1),
(4, 'FAC-004', 4, 4, '2023-05-21', 499.00, 1),
(5,'FAC-005', 5, 5, '2023-05-20', 699.00, 1),
(6, 'FAC-006', 6, 6, '2023-05-19', 1099.00, 1),
(7, 'FAC-007', 7, 7, '2023-05-18', 279.00, 1),
(8, 'FAC-008', 8, 8, '2023-05-17', 949.00, 1),
(9, 'FAC-009', 9, 9, '2023-05-16', 899.00, 1),
(10, 'FAC-010', 10, 10, '2023-05-15', 240.00, 1);

SELECT * FROM STOCK

















