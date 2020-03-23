using System.ComponentModel.DataAnnotations;

namespace LejeuneCohortWeb.Models
{
	public class USMCRank
	{
		[Key]
		public int Id { get; private set; }

		public string Designator { get; set; }

		public bool IsOfficer { get; set; }

		public bool IsEnlisted { get; set; }
	}
}
