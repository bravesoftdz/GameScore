using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;

namespace GameScore.Models
{
    public class JogoDbContext : DbContext
    {
        public JogoDbContext() : base("Jogo")
        {
            Database.CreateIfNotExists();
        }

        public DbSet<Jogo> Jogos { get; set; }

    }
}