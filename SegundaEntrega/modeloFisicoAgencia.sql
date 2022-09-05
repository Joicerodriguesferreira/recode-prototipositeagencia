
CREATE TABLE cliente (
telefone_cli VARCHAR(20),
email_cli VARCHAR(50),
cpf_cli VARCHAR(11) PRIMARY KEY,
data_nascimento_cli DATETIME,
senha VARCHAR(20),
nome_completo_cli VARCHAR(40)
)

CREATE TABLE endereco_cli (
endereco_PK INTEGER PRIMARY KEY,
uf_cli VARCHAR(2),
cidade_cli VARCHAR(30),
bairro_cli VARCHAR(25),
numero_cli VARCHAR(5),
rua_cli VARCHAR(40),
cep_cli VARCHAR(10),
cpf_FK VARCHAR(),
FOREIGN KEY(cpf_FK) REFERENCES cliente (cpf_cli)
)

CREATE TABLE reserva (
data DATETIME,
idReserva INTEGER PRIMARY KEY,
taxaServico DECIMAL(20),
cpf_cli VARCHAR(10),
FOREIGN KEY(cpf_cli) REFERENCES cliente (cpf_cli)
)

CREATE TABLE passageiro (
idPassageiro INTEGER,
cpf_pass VARCHAR(11),
dataNascimento_pass DATETIME,
nomeCompleto_pass VARCHAR(40)
)

CREATE TABLE passagem  (
idPassagem INTEGER PRIMARY KEY,
dataViagem DATETIME,
horaViagem VARCHAR(10),
tipoTransporte VARCHAR(20),
destino VARCHAR(30),
quantidade NUMERIC(10),
precoVenda DECIMAL(10),
precoCompra DECIMAL(10)
)

CREATE TABLE pacote (
idPacote INTEGER PRIMARY KEY,
nome_pct VARCHAR(30)
)

CREATE TABLE hotel (
idHotel INTEGER PRIMARY KEY,
precoCompraReserva DECIMAL(10),
precoVendaReserva DECIMAL(10),
telefone_hotel VARCHAR(20),
email_hotel VARCHAR(50),
nome_hotel VARCHAR(40),
tipoHospedagem VARCHAR(20)
)

CREATE TABLE destinos (
idDestino INTEGER PRIMARY KEY,
pais_destino VARCHAR(20),
estado_destino CHAR(2),
cidade_destino VARCHAR(30)
)

CREATE TABLE ciaRodoviaria (
telefone_rod VARCHAR(10),
site_rod VARCHAR(10),
nome_rod VARCHAR(10),
idempresaRodoviaria VARCHAR(10) PRIMARY KEY
)


CREATE TABLE endereco_hotel (
endereco_PK INTEGER PRIMARY KEY,
cep_hotel VARCHAR(10),
rua_hotel VARCHAR(10),
numero_hotel VARCHAR(10),
bairro_hotel VARCHAR(10),
cidade_hotel VARCHAR(10),
estado_hotel VARCHAR(10),
pais_hotel VARCHAR(10),
idHotel_FK INTEGER,
FOREIGN KEY(idHotel_FK) REFERENCES hotel (idHotel)
)

CREATE TABLE enderecoChegada (
enderecoChegada_PK INTEGER PRIMARY KEY,
nome VARCHAR(10),
rua VARCHAR(10),
numero VARCHAR(10),
bairro VARCHAR(10),
cidade VARCHAR(30),
estado CHAR(2),
cep VARCHAR(10),
pais VARCHAR(20),
idDestino_FK INTEGER,
FOREIGN KEY(idDestino_FK) REFERENCES destinos (idDestino)
)

CREATE TABLE adquire (
idPassagem INTEGER,
idPacote INTEGER,
PRIMARY KEY(idPassagem,idPacote)
)

CREATE TABLE contem (
idHotel INTEGER,
idPacote INTEGER,
FOREIGN KEY(idHotel) REFERENCES hotel (idHotel),
FOREIGN KEY(idPacote) REFERENCES pacote (idPacote)
)

CREATE TABLE fornece (
idEmpresaAerea INTEGER,
idempresaRodoviaria INTEGER,
idPassagem INTEGER,
PRIMARY KEY(idEmpresaAerea,idempresaRodoviaria,idPassagem)
)

CREATE TABLE atende (
idEmpresaAerea VARCHAR(10),
idempresaRodoviaria VARCHAR(10),
idDestino VARCHAR(10),
PRIMARY KEY(idEmpresaAerea,idempresaRodoviaria,idDestino)
)

CREATE TABLE dispoe (
idPassagem INTEGER,
idPacote INTEGER,
FOREIGN KEY(idPassagem) REFERENCES passagem  (idPassagem),
FOREIGN KEY(idPacote) REFERENCES pacote (idPacote)
)

CREATE TABLE notaFiscal (
codigoNf INTEGER PRIMARY KEY
)

CREATE TABLE formaDePagamento (
codPagamento INTEGER PRIMARY KEY,
tipoPagamento VARCHAR(20)
)

CREATE TABLE possui (
codPagamento INTEGER,
FOREIGN KEY(codPagamento) REFERENCES formaDePagamento (codPagamento)
)

CREATE TABLE compra (
codigoNf INTEGER,
FOREIGN KEY(codigoNf) REFERENCES notaFiscal (codigoNf)
)

CREATE TABLE Possui (
idReserva INTEGER,
FOREIGN KEY(idReserva) REFERENCES reserva (idReserva)
)

CREATE TABLE ciaAerea (
idEmpresaAerea INTEGER PRIMARY KEY,
nome_aerea VARCHAR(40),
telefone_aerea VARCHAR(20),
site_aerea VARCHAR(30)
)

