using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace TP_FINAL
{
    abstract class Persona
    {
        private int id;
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public int DNI { get; set; }
        private string password;
        public Persona(int id, string nombre, string apellido, string email, int dni, string password)
        {
            this.id = id;
            Nombre = nombre;
            Apellido = apellido;
            Email = email;
            DNI = dni;
            this.password = password;
        }
        public int ObtenerId() { return id; }
        public bool VerificarPassword(string password) { return this.password == password; }
        public override string ToString() { return $"{Nombre} {Apellido} - {Email} - DNI: {DNI}"; }
    }
}
