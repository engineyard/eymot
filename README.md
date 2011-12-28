Engine Yard Managed Order Tool

This project will take over Orderly and add the ability for Managed customers to create
new environments.


Requires
To use it, you need to have a ~/.fog file with the following contents:

:default:
  :vcloud:
    :ecloud:
      :versions_uri: https://services.enterprisecloud.terremark.com/api/versions
      :version: 0.8b-ext2.6
      :module: Fog::Vcloud::Terremark::Ecloud
      :username: <your icenter login>
      :password: <your icenter password>
	
