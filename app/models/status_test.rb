class StatusTest < ApplicationRecord
  enum status: { ativo: 0, inativo: 1 }
end
