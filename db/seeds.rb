# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Site.create(
  [
    { title: 'UniPlaces', url: 'https://www.uniplaces.com/pt/' },
    { title: 'Idealista', url: 'https://www.idealista.pt/arrendar-quarto/lisboa-distrito/' },
    { title: 'EasyQuarto', url: 'http://www.easyquarto.com.pt/portugal/lisboa-companheiros-de-quarto/anuncios/l' },
    { title: 'CasaSapo', url: 'https://casa.sapo.pt/quartos' },
    { title: 'BQuarto', url: 'http://www.bquarto.pt' },
    { title: 'CustoJusto', url: 'http://www.custojusto.pt/' },
    { title: 'Olx', url: 'https://www.olx.pt' }
  ]
)

SearchLink.create(
  [
    {
      name: 'Misericordia',
      url: 'https://www.olx.pt/imoveis/apartamento-casa-a-venda/apartamentos-arrenda/encarnazao/?search%5Bfilter_enum_tipologia%5D%5B0%5D=t1&search%5Bfilter_enum_tipologia%5D%5B1%5D=t2&search%5Bdescription%5D=1',
      district: District.first,
      site: Site.find_by(title: 'Olx')
    }
  ]
)


District.create(
  [
    { name: 'unknown' },
    { name: 'Alfama' },
    { name: 'Baixa' },
    { name: 'Bairro Alto' }
  ]
)

User.create(
  [
    { name: 'Piotr', email: 'pbrudny@gmail.com' }
  ]
)

