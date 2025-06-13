class EstatisticasService
    def valor_total_dia
        Ingresso.where('DATE(created_at) = ?', Date.today).sum(:valor)
    end 
end