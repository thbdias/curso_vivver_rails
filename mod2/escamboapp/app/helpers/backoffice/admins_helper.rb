module Backoffice::AdminsHelper
    OptionsForRoles = Struct.new(:id, :description)

    def options_for_roles
        #opção 1
        #options = []

        #Admin.roles_i18n.each do |key, value|
        #    options.push(OptionsForRoles.new(key, value))
        #end

        #options

        #opção 2 - usando map
        Admin.roles_i18n.map do |key, value|
            OptionsForRoles.new(key, value)
        end
    end

end
