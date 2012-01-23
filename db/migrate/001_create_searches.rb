migration 1, :create_searches do
  up do
    create_table :searches do
      column :id, Integer, :serial => true
      
    end
  end

  down do
    drop_table :searches
  end
end
