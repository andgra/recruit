Types::JobType = GraphQL::ObjectType.define do
  name 'Job'
  description 'A Job Type'

  field :id, types.ID
  field :name, types.String
  field :place, types.String
  field :is_deleted, types.Boolean
  field :company_id, types.Int
  field :company do
    type Types::CompanyType
    resolve ->(job, args, ctx) {
      job.company
    }
  end
end
