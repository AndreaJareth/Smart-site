BEGIN TRANSACTION;
CREATE TABLE customers (
    customer_id  INTEGER PRIMARY KEY,
    full_name    TEXT,
    email        TEXT,
    phone        TEXT,
    created_at   TEXT,
    site_id      INTEGER
);
INSERT INTO "customers" VALUES(1,'Juan Pérez','juan.perez@smartsite.com','+52 55 1000 0001','2025-01-12',1);
INSERT INTO "customers" VALUES(2,'María López','maria.lopez@smartsite.com','+52 55 1000 0002','2025-02-05',1);
INSERT INTO "customers" VALUES(3,'Carlos García','carlos.garcia@smartsite.com','+52 55 1000 0003','2025-02-18',2);
CREATE TABLE incidents (
    incident_id  INTEGER PRIMARY KEY,
    reported_at  TEXT,
    system       TEXT,
    severity     TEXT,
    description  TEXT
);
INSERT INTO "incidents" VALUES(1,'2025-03-05','CRM','media','Duplicados detectados en registros de clientes.');
INSERT INTO "incidents" VALUES(2,'2025-03-12','ERP','alta','Unidades de inventario heterogéneas.');
INSERT INTO "incidents" VALUES(3,'2025-04-01','ERP','critica','Outlier de 45,000 en inventario, confirmado como error.');
CREATE TABLE inventory (
    inventory_id INTEGER PRIMARY KEY,
    site_id      INTEGER,
    product_id   INTEGER,
    quantity     INTEGER,
    last_updated TEXT
);
INSERT INTO "inventory" VALUES(1,1,1,220,'2025-06-30');
INSERT INTO "inventory" VALUES(2,1,2,80,'2025-06-30');
INSERT INTO "inventory" VALUES(3,2,1,180,'2025-06-30');
CREATE TABLE orders (
    order_id     INTEGER PRIMARY KEY,
    customer_id  INTEGER,
    site_id      INTEGER,
    product_id   INTEGER,
    quantity     INTEGER,
    order_date   TEXT
);
INSERT INTO "orders" VALUES(1,1,1,1,10,'2025-05-02');
INSERT INTO "orders" VALUES(2,2,1,2,5,'2025-05-10');
INSERT INTO "orders" VALUES(3,3,2,3,2,'2025-05-15');
CREATE TABLE products (
    product_id   INTEGER PRIMARY KEY,
    product_name TEXT,
    unit         TEXT
);
INSERT INTO "products" VALUES(1,'Sensor ambiental','unidades');
INSERT INTO "products" VALUES(2,'Gateway IoT','unidades');
INSERT INTO "products" VALUES(3,'Módulo de energía','unidades');
CREATE TABLE sites (
    site_id      INTEGER PRIMARY KEY,
    site_name    TEXT,
    region       TEXT,
    created_at   TEXT
);
INSERT INTO "sites" VALUES(1,'Smart Site - Centro','CDMX','2025-01-10');
INSERT INTO "sites" VALUES(2,'Smart Site - Norte','EdoMex','2025-01-10');
INSERT INTO "sites" VALUES(3,'Smart Site - Occidente','Jalisco','2025-02-01');
CREATE TABLE source_audit (
    audit_id      INTEGER PRIMARY KEY,
    source_name   TEXT,
    raw_record_id TEXT,
    action        TEXT,
    notes         TEXT,
    action_time   TEXT
);
INSERT INTO "source_audit" VALUES(1,'CRM','CUST-4310','dedupe','Fusión por nombre+email duplicados.','2025-09-29T21:09:53Z');
INSERT INTO "source_audit" VALUES(2,'ERP:Inventarios.xlsx','INV-8812','standardize_unit','Homologación a ''unidades''.','2025-09-29T21:09:53Z');
INSERT INTO "source_audit" VALUES(3,'CRM','CUST-2044','impute_email','Correo recuperado de histórico.','2025-09-29T21:09:53Z');
COMMIT;
