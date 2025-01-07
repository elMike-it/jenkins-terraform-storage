variable "project_id" {
  description = "ID del proyecto de Google Cloud"
  type        = string
}

variable "region" {
  description = "Región donde se creará el bucket"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "Nombre del bucket"
  type        = string
}

variable "storage_class" {
  description = "Clase de almacenamiento del bucket"
  type        = string
  default     = "STANDARD"
}

variable "force_destroy" {
  description = "Forzar eliminación del bucket con contenido"
  type        = bool
  default     = false
}

variable "retention_days" {
  description = "Número de días para retener los objetos antes de eliminarlos"
  type        = number
  default     = 30
}
