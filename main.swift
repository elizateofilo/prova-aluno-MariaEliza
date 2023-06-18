print()
print("Questão 01:")
print("Uma locadora de veículos deseja controlar suas locações para isso é necessário armazenar: • a placa (ID), • a marca, • o modelo do veículo, • o ano de fabricação, • se está disponível para locação • o valor de locação por dia de aluguel.")
print()
struct Vehicle {
    let plate: String
    let brand: String
    let model: String
    let year: Int
    var isAvailable: Bool
    let rentalPricePerDay: Double
    
    init(plate: String, brand: String, model: String, year: Int, isAvailable: Bool, rentalPricePerDay: Double) {
        self.plate = plate
        self.brand = brand
        self.model = model
        self.year = year
        self.isAvailable = isAvailable
        self.rentalPricePerDay = rentalPricePerDay
    }
}

class RentalService {
    var vehicles: [Vehicle]
    
    init() {
        vehicles = []
    }
    
    func addVehicle(_ vehicle: Vehicle) {
        vehicles.append(vehicle)
    }
    
    func removeVehicle(withPlate plate: String) {
        vehicles.removeAll { $0.plate == plate }
    }
    
    func rentVehicle(withPlate plate: String) {
        if let index = vehicles.firstIndex(where: { $0.plate == plate && $0.isAvailable }) {
            vehicles[index].isAvailable = false
            print("Vehicle with plate \(plate) rented successfully.")
        } else {
            print("Vehicle with plate \(plate) is not available for rent.")
        }
    }
    
    func returnVehicle(withPlate plate: String) {
        if let index = vehicles.firstIndex(where: { $0.plate == plate && !$0.isAvailable }) {
            vehicles[index].isAvailable = true
            print("Vehicle with plate \(plate) returned successfully.")
        } else {
            print("Invalid vehicle plate or vehicle is already available.")
        }
    }
    
    func printAvailableVehicles() {
        let availableVehicles = vehicles.filter { $0.isAvailable }
        
        if availableVehicles.isEmpty {
            print("No vehicles available for rent.")
        } else {
            print("Available Vehicles:")
            for vehicle in availableVehicles {
                print("Plate: \(vehicle.plate), Brand: \(vehicle.brand), Model: \(vehicle.model), Year: \(vehicle.year), Rental Price Per Day: \(vehicle.rentalPricePerDay)")
            }
        }
    }
}

let rentalService = RentalService()

// Adicionar veículos
let vehicle1 = Vehicle(plate: "ABC123", brand: "Toyota", model: "Corolla", year: 2020, isAvailable: true, rentalPricePerDay: 50.0)
rentalService.addVehicle(vehicle1)

let vehicle2 = Vehicle(plate: "DEF456", brand: "Honda", model: "Civic", year: 2021, isAvailable: true, rentalPricePerDay: 45.0)
rentalService.addVehicle(vehicle2)


rentalService.printAvailableVehicles()


print()
print("------------------------------------------------------------------------------------------------------------------------")
print("Questão 02:")
print("Crie uma struct para abstrair veículos com Atributos: • placa, • marca, • modelo, • ano, • estaLocado, • valorLocacaoDia")
print()
struct Vei {
    let placa1: String
    let marca1: String
    let modelo1: String
    let ano1: Int
    var estaLocado1: Bool
    let valorLocacaoDia1: Double
    
    init(placa1: String, marca1: String, modelo1: String, ano1: Int, estaLocado1: Bool, valorLocacaoDia1: Double) {
        self.placa1 = placa1
        self.marca1 = marca1
        self.modelo1 = modelo1
        self.ano1 = ano1
        self.estaLocado1 = estaLocado1
        self.valorLocacaoDia1 = valorLocacaoDia1
    }
    
    func show1() {
        print("Placa: \(placa1)")
        print("Marca: \(marca1)")
        print("Modelo: \(modelo1)")
        print("Ano: \(ano1)")
        print("Está Locado: \(estaLocado1)")
        print("Valor de Locação por Dia: \(valorLocacaoDia1)")
    }
}
let veiculo = Vei(placa1: "ABC123", marca1: "Toyota", modelo1: "Corolla", ano1: 2020, estaLocado1: false, valorLocacaoDia1: 50.0)
veiculo.show1()


print()
print("------------------------------------------------------------------------------------------------------------------------")
print("Questão 03:")
print("Crie uma classe para armazenar veículos com os seguintes atributos: • veículos[], / array para armazenar objetos do tipo veículo; Crie os seguintes métodos: • init para criar uma estrutura de armazenamento de veículos, • add(veiculo) para armazenar veículos no array, • del(veiculo) para re`rar um veículo do array, • showAll para mostrar todos os veículos armazenados no array, • show (disponiveis). A depender do valor do parâmetro disponiveis (true/false) mostrar os veículos que estão disponíveis ou locados(percorrer array), • faturamentoDia() retornar o valor do somatório dos valores de locação dos veículos que estão locados no momento. (retornar um valor). • orcamento(placa, diasLocacao). Dada a placa do veículo e os dias que se pretende locar, retornar o valor total da locação para o veículo, • orcamentoDesconto(placa, diasLocacao, desconto). Dada a placa do veículo e os dias que se pretende locar e um percentual de desconto, retornar o valor total da locação para o veículo, mas agora com o desconto aplicado.")
print()

struct Veiculo {
    let placa: String
    let marca: String
    let modelo: String
    let ano: Int
    var estaLocado: Bool
    let valorLocacaoDia: Double
    
    init(placa: String, marca: String, modelo: String, ano: Int, estaLocado: Bool, valorLocacaoDia: Double) {
        self.placa = placa
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.estaLocado = estaLocado
        self.valorLocacaoDia = valorLocacaoDia
    }
    
    func mostrar() {
        print("Placa: \(placa)")
        print("Marca: \(marca)")
        print("Modelo: \(modelo)")
        print("Ano: \(ano)")
        print("Está Locado: \(estaLocado)")
        print("Valor de Locação por Dia: \(valorLocacaoDia)")
    }
}

class ArmazenamentoVeiculos {
    var veiculos: [Veiculo]
    
    init() {
        veiculos = []
    }
    
    func adicionar(_ veiculo: Veiculo) {
        veiculos.append(veiculo)
    }
    
    func remover(_ veiculo: Veiculo) {
        if let index = veiculos.firstIndex(where: { $0.placa == veiculo.placa }) {
            veiculos.remove(at: index)
        }
    }
    
    func mostrarTodos() {
        for veiculo in veiculos {
            veiculo.mostrar()
            print("---")
        }
    }
    
    func mostrarDisponiveis() {
        let veiculosDisponiveis = veiculos.filter { !$0.estaLocado }
        for veiculo in veiculosDisponiveis {
            veiculo.mostrar()
            print("---")
        }
    }
    
    func mostrarLocados() {
        let veiculosLocados = veiculos.filter { $0.estaLocado }
        for veiculo in veiculosLocados {
            veiculo.mostrar()
            print("---")
        }
    }
    
    func faturamentoDiario() -> Double {
        let veiculosLocados = veiculos.filter { $0.estaLocado }
        let totalFaturamento = veiculosLocados.reduce(0) { $0 + $1.valorLocacaoDia }
        return totalFaturamento
    }
    
    func orcamento(placa: String, diasLocacao: Int) -> Double? {
        if let veiculo = veiculos.first(where: { $0.placa == placa }) {
            return veiculo.valorLocacaoDia * Double(diasLocacao)
        }
        return nil
    }
    
    func orcamentoDesconto(placa: String, diasLocacao: Int, desconto: Double) -> Double? {
        if let veiculo = veiculos.first(where: { $0.placa == placa }) {
            let valorLocacao = veiculo.valorLocacaoDia * Double(diasLocacao)
            let valorDesconto = valorLocacao * desconto / 100.0
            return valorLocacao - valorDesconto
        }
        return nil
    }
}

let armazenamento = ArmazenamentoVeiculos()

// Adicionar veículos
let veiculo1 = Veiculo(placa: "ABC123", marca: "Toyota", modelo: "Corolla", ano: 2020, estaLocado: false, valorLocacaoDia: 50.0)
armazenamento.adicionar(veiculo1)

let veiculo2 = Veiculo(placa: "DEF456", marca: "Honda", modelo: "Civic", ano: 2021, estaLocado: true, valorLocacaoDia: 45.0)
armazenamento.adicionar(veiculo2)

let veiculo3 = Veiculo(placa: "GHI789", marca: "Ford", modelo: "Fiesta", ano: 2019, estaLocado: true, valorLocacaoDia: 40.0)
armazenamento.adicionar(veiculo3)

// Mostrar todos os veículos
print("Todos os veículos:")
print()
armazenamento.mostrarTodos()

// Mostrar veículos disponíveis
print("Veículos disponíveis:")
print()
armazenamento.mostrarDisponiveis()

// Mostrar veículos locados
print("Veículos locados:")
print()
armazenamento.mostrarLocados()

// Faturamento diário
let faturamento = armazenamento.faturamentoDiario()
print("Faturamento diário: \(faturamento)")

// Orçamento
if let orcamento = armazenamento.orcamento(placa: "ABC123", diasLocacao: 7) {
    print("Orçamento: \(orcamento)")
} else {
    print("Veículo não encontrado.")
}

// Orçamento com desconto
if let orcamentoDesconto = armazenamento.orcamentoDesconto(placa: "DEF456", diasLocacao: 5, desconto: 10.0) {
    print("Orçamento com desconto: \(orcamentoDesconto)")
} else {
    print("Veículo não encontrado.")
}


print()
print("------------------------------------------------------------------------------------------------------------------------")
print("Questão 04:")
print("Crie exatamente 5 veículos (com dados semelhantes ao mundo real): 3 locados e 2 não-locados e insira na estrutura de controle. Em seguida, faça uma simulação para usar todos os métodos.")
print()

struct Veiculo3 {
    let placa3: String
    let marca3: String
    let modelo3: String
    let anoFabricacao: Int
    var disponivel: Bool
    let valorLocacaoDia3: Double
    
    init(placa3: String, marca3: String, modelo3: String, anoFabricacao: Int, disponivel: Bool, valorLocacaoDia3: Double) {
        self.placa3 = placa3
        self.marca3 = marca3
        self.modelo3 = modelo3
        self.anoFabricacao = anoFabricacao
        self.disponivel = disponivel
        self.valorLocacaoDia3 = valorLocacaoDia3
    }
    
    func mostrar3() {
        print("Placa: \(placa3)")
        print("Marca: \(marca3)")
        print("Modelo: \(modelo3)")
        print("Ano: \(anoFabricacao)")
        print("Está Locado: \(disponivel)")
        print("Valor de Locação por Dia: \(valorLocacaoDia3)")
    }
}

class Locadora {
    var veiculos: [Veiculo3] = []
    
    init() {
        veiculos = []
    }
    
    func add(_ veiculo3: Veiculo3) {
        veiculos.append(veiculo3)
    }
    
    func del(_ veiculo3: Veiculo3) {
        if let index = veiculos.firstIndex(where: { $0.placa3 == veiculo3.placa3 }) {
            veiculos.remove(at: index)
        }
    }
    
    func showAll3() {
        print("Veículos cadastrados:")
        for veiculo3 in veiculos {
            print("Placa: \(veiculo3.placa3), Marca: \(veiculo3.marca3), Modelo: \(veiculo3.modelo3), Ano: \(veiculo3.anoFabricacao), Disponível: \(veiculo3.disponivel), Valor Locação por Dia: \(veiculo3.valorLocacaoDia3)")
        }
    }
    
    func show3(disponiveis: Bool) {
        if disponiveis {
            let veiculosDisponiveis = veiculos.filter { $0.disponivel }
            print("Veículos disponíveis:")
            for veiculo3 in veiculosDisponiveis {
                print("Placa: \(veiculo3.placa3), Marca: \(veiculo3.marca3), Modelo: \(veiculo3.modelo3), Ano: \(veiculo3.anoFabricacao), Valor Locação por Dia: \(veiculo3.valorLocacaoDia3)")
            }
        } else {
            let veiculosLocados = veiculos.filter { !$0.disponivel }
            print("Veículos locados:")
            for veiculo3 in veiculosLocados {
                print("Placa: \(veiculo3.placa3), Marca: \(veiculo3.marca3), Modelo: \(veiculo3.modelo3), Ano: \(veiculo3.anoFabricacao), Valor Locação por Dia: \(veiculo3.valorLocacaoDia3)")
            }
        }
    }
    
    func faturamentoDia3() -> Double {
        let veiculosLocados = veiculos.filter { !$0.disponivel }
        let faturamento3 = veiculosLocados.reduce(0) { $0 + $1.valorLocacaoDia3 }
        return faturamento3
    }
    
    func orcamento3(placa3: String, diasLocacao3: Int) -> Double? {
        if let veiculo3 = veiculos.first(where: { $0.placa3 == placa3 }) {
            return veiculo3.valorLocacaoDia3 * Double(diasLocacao3)
        }
        return nil
    }
    
    func orcamentoDesconto3(placa3: String, diasLocacao3: Int, desconto3: Double) -> Double? {
        if let veiculo3 = veiculos.first(where: { $0.placa3 == placa3 }) {
            let valorLocacaoTotal = veiculo3.valorLocacaoDia3 * Double(diasLocacao3)
            let valorDesconto = valorLocacaoTotal * Double(desconto3 / 100.0)
            return valorLocacaoTotal - valorDesconto
        }
        return nil
    }
}

// Criação dos veículos
let veiculo13 = Veiculo3(placa3: "ABC123", marca3: "Ford", modelo3: "Fiesta", anoFabricacao: 2020, disponivel: true, valorLocacaoDia3: 100.0)
let veiculo23 = Veiculo3(placa3: "DEF456", marca3: "Chevrolet", modelo3: "Cruze", anoFabricacao: 2018, disponivel: false, valorLocacaoDia3: 150.0)
let veiculo33 = Veiculo3(placa3: "GHI789", marca3: "Volkswagen", modelo3: "Golf", anoFabricacao: 2021, disponivel: true, valorLocacaoDia3: 120.0)
let veiculo43 = Veiculo3(placa3: "JKL012", marca3: "Fiat", modelo3: "Palio", anoFabricacao: 2017, disponivel: true, valorLocacaoDia3: 80.0)
let veiculo53 = Veiculo3(placa3: "MNO345", marca3: "Toyota", modelo3: "Corolla", anoFabricacao: 2019, disponivel: false, valorLocacaoDia3: 200.0)

// Inicialização da estrutura de controle
let locadora = Locadora()

// Adiciona os veículos na estrutura de controle
locadora.add(veiculo13)
locadora.add(veiculo23)
locadora.add(veiculo33)
locadora.add(veiculo43)
locadora.add(veiculo53)

// Teste dos métodos
locadora.showAll3()

print("\n")

locadora.show3(disponiveis: true)

print("\n")

locadora.show3(disponiveis: false)

print("\n")

let faturamento3 = locadora.faturamentoDia3()
print("Faturamento do dia: R$\(faturamento3)")

print("\n")

if let orcamento3 = locadora.orcamento3(placa3: "ABC123", diasLocacao3: 5) {
    print("Orçamento para locação do veículo ABC123 por 5 dias: R$\(orcamento3)")
} else {
    print("Veículo não encontrado.")
}

print("\n")

if let orcamentoDesconto3 = locadora.orcamentoDesconto3(placa3: "DEF456", diasLocacao3: 3, desconto3: 10.0) {
    print("Orçamento com desconto para locação do veículo DEF456 por 3 dias: R$\(orcamentoDesconto3)")
} else {
    print("Veículo não encontrado.")
}
