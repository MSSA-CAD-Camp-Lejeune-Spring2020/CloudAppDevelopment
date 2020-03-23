using System.ComponentModel.DataAnnotations;

namespace LejeuneCohortWeb.Models
{
	public class USMCUnit
	{
		[Key]
		public int Id { get; private set; }

		public string Name { get; set; }

		public string SSN { get; set; }

		public USMCRank Rank { get; set; }
	}
}
