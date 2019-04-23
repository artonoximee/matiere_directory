class Structure < ApplicationRecord
	#belongs_to :structure_type
	#belongs_to :structure_classification

	has_many :structure_individuals
	has_many :individuals, through: :structure_individuals

	has_many :is_parent, foreign_key: "parent_id", class_name: "ParentChildRelation"
	has_many :is_child, foreign_key: "child_id", class_name: "ParentChildRelation"
	has_many :child_structures, through: :is_parent, source: :child
	has_many :parent_structures, through: :is_child, source: :parent

	has_many :is_supported, foreign_key: "supported_id", class_name: "StructureRelation"
	has_many :is_supported_by, through: :is_supported, source: :supporting
	has_many :supports_structures, foreign_key: "supporting_id", class_name: "StructureRelation"
	has_many :supports, through: :supports_structures, source: :supported

	has_one :association_detail

	enum status: {player: "0", partner: "1", both: "2"}

	enum public: {large_public: "0", professional: "1", for_all: "2"}

	def status_fr
		if self.status == "player"
			return "Acteur"
		elsif self.status == "partner"
			return "Partenaire"
		else
			return "Acteur & Partenaire"
		end
	end

	def public_fr
		if self.public == "large_public"
			return "Grand Public"
		elsif self.public == "professional"
			return "Professionnel"
		else
			return "Grand public & Professionnel"
		end
	end

	def active?
		if self.active == true
			return "Actif"
		else
			return "Non Actif"
		end
	end

end
