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
      url: 'https://www.olx.pt/imoveis/apartamento-casa-a-venda/apartamentos-arrenda/encarnazao/?search%5Bfilter_float_price%3Afrom%5D=700&search%5Bfilter_float_price%3Ato%5D=1250&search%5Bfilter_enum_tipologia%5D%5B0%5D=t1&search%5Bfilter_enum_tipologia%5D%5B1%5D=t2&search%5Bfilter_enum_condicao%5D%5B0%5D=usado&search%5Bfilter_enum_condicao%5D%5B1%5D=renovado&search%5Bfilter_enum_condicao%5D%5B2%5D=novo&search%5Bdescription%5D=1',
      district: District.find_by(name: 'Bairro Alto'),
      site: Site.find_by(title: 'Olx')
    },
    {
      name: 'Sant Maria Maior',
      url: 'https://www.olx.pt/imoveis/apartamento-casa-a-venda/apartamentos-arrenda/castelo/?search%5Bfilter_float_price%3Afrom%5D=700&search%5Bfilter_float_price%3Ato%5D=1250&search%5Bfilter_enum_tipologia%5D%5B0%5D=t2&search%5Bfilter_enum_tipologia%5D%5B1%5D=t1&search%5Bfilter_enum_condicao%5D%5B0%5D=novo&search%5Bfilter_enum_condicao%5D%5B1%5D=renovado&search%5Bfilter_enum_condicao%5D%5B2%5D=usado&search%5Bdescription%5D=1',
      district: District.find_by(name: 'Baixa'),
      site: Site.find_by(title: 'Olx')
    },
    {
      name: 'Sao Vicente',
      url: 'https://www.olx.pt/imoveis/apartamento-casa-a-venda/apartamentos-arrenda/graca/?search%5Bfilter_float_price%3Afrom%5D=700&search%5Bfilter_float_price%3Ato%5D=1250&search%5Bfilter_enum_tipologia%5D%5B0%5D=t2&search%5Bfilter_enum_tipologia%5D%5B1%5D=t1&search%5Bfilter_enum_condicao%5D%5B0%5D=novo&search%5Bfilter_enum_condicao%5D%5B1%5D=renovado&search%5Bfilter_enum_condicao%5D%5B2%5D=usado&search%5Bdescription%5D=1',
      district: District.find_by(name: 'Alfama'),
      site: Site.find_by(title: 'Olx')
    }
  ]
)


Status.create(
  [
    { name: 'new'}
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
    { name: 'Ernest', email: 'ernest.griszka@gmail.com' }
  ]
)

