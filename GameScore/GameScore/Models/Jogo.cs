using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GameScore.Models
{
    public class Jogo
    {
        public int Id { get; set; }

        [Display(Name = "Data do Jogo")]
        [Required(ErrorMessage = "Preencha a Data do Jogo")]
        [DataType(DataType.Date, ErrorMessage = "Data em formato inválido")]
        public DateTime DataJogo { get; set; }

        [Required(ErrorMessage = "Preencha a Pontuação")]
        [Display(Name = "Pontuação")]
        public int PontuacaoJogo { get; set; }
    }
}