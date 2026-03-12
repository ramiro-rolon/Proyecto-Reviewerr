using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_FINAL.Interfaces
{
    interface ICalificable
    {
        double PromedioCalificaciones();
        void AgregarCalificacion(int calificacion);
    }
}
