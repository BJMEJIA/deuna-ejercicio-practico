# deuna-ejercicio-practico

Este repositorio contiene la infraestructura Terraform necesaria para desplegar los recursos base de la práctica de **deuna!** en AWS:

- **KMS**: llave maestra para encriptado  
- **S3**: bucket principal y bucket de logs, ambos cifrados y con bloqueo de acceso público  
- **RDS Aurora PostgreSQL**: cluster y réplicas  
- **Secrets Manager**: almacenamiento seguro de credenciales de `pgadmin` (OPCIONAL)

---

## Estructura del repositorio
```tree
├── environments
│ └── dev ← configuración específica para el entorno de desarrollo
│ ├── terraform.tf ← Configuración de proveedores y backend
│ ├── variables.tf ← variables del entorno
│ └── main.tf ← invocación de módulos
├── modules
│ ├── kms ← módulo para crear la llave KMS
│ ├── s3 ← módulo para crear buckets (principal)
│ ├── rds ← módulo para cluster Aurora y réplicas
│ └── secrets ← módulo para Secrets Manager
├── .gitignore
└── README.md
```

---

# Descripción de módulos

## modules/kms

Crea una CMK simétrica con key rotation y política base.

### modules/s3
Crea:

- Bucket principal cifrado con la CMK.

- Bucket de logs con ACL log-delivery-write.

- Bloqueo de acceso público y política TLS-only.

## modules/rds
Crea un cluster Aurora PostgreSQL con una o más instancias.

## modules/secrets
Crea un secreto en AWS Secrets Manager cifrado con la CMK.