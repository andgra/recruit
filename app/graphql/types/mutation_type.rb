Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createCompany do
    type Types::CompanyType
    description 'Creates new Company'
    argument :name, !types.String
    argument :location, !types.String
    resolve ->(obj, args, ctx) {
      new_company = Company.create(name: args[:name], location: args[:location])
      new_company
    }
  end

  field :createJob do
    type Types::JobType
    description 'Creates new Job'
    argument :name, !types.String
    argument :place, !types.String
    argument :company_id, !types.Int
    resolve ->(obj, args, ctx) {
      new_job = Job.create(name: args[:name], place: args[:place], company_id: args[:company_id])
      new_job
    }
  end

end
