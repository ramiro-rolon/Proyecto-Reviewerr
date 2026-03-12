using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TP_FINAL.Interfaces;

namespace TP_FINAL.Clases_base
{
    abstract class ContenidoAudiovisual : ICalificable
    {
        private List<double> calificaciones;
        private int id;
        public string Titulo { get; set; }
        public string Genero { get; set; }
        public string Descripcion { get; set; }
        public string Director { get; set; }
        public ContenidoAudiovisual(int id, string titulo, string genero, string descripcion, string director)
        {
            calificaciones = new List<double>();
            this.id = id;
            Titulo = titulo;
            Genero = genero;
            Descripcion = descripcion;
            Director = director;
        }
        public int ObtenerId() { return id; }
        public override string ToString() { return $"{Titulo} - {Genero} - Director: {Director} - Sinopsis: {Descripcion}"; }
        public double PromedioCalificaciones()
        {
            if (calificaciones.Count == 0) return 0;
            return calificaciones.Average();
        }
        public void AgregarCalificacion(int calificacion)
        {
            if (calificacion < 1 || calificacion > 5)
                throw new ArgumentOutOfRangeException("La calificación debe estar entre 1 y 5.");
            calificaciones.Add(calificacion);
        }
    }
}
