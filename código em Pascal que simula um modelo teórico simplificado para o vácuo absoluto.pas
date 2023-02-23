program VacuoAbsoluto;

const
  TEMPO_MAXIMO = 100; // tempo m�ximo da simula��o
  INTERVALO_TEMPO = 0.1; // intervalo de tempo entre as itera��es
  NUM_PARTICULAS = 1000; // n�mero de part�culas simuladas
  POSICAO_INICIAL = 0; // posi��o inicial das part�culas

type
  TParticula = record
    posicao: Real;
    velocidade: Real;
  end;

var
  particulas: array[1..NUM_PARTICULAS] of TParticula;
  tempo: Real;

procedure InicializarParticulas;
var
  i: Integer;
begin
  for i := 1 to NUM_PARTICULAS do
  begin
    particulas[i].posicao := POSICAO_INICIAL;
    particulas[i].velocidade := 0;
  end;
end;

procedure AtualizarParticulas(deltaTempo: Real);
var
  i: Integer;
begin
  for i := 1 to NUM_PARTICULAS do
  begin
    particulas[i].posicao := particulas[i].posicao + particulas[i].velocidade * deltaTempo;
    particulas[i].velocidade := particulas[i].velocidade + 0 * deltaTempo; // a acelera��o � zero, simulando o v�cuo absoluto
  end;
end;

procedure ImprimirPosicoes;
var
  i: Integer;
begin
  for i := 1 to NUM_PARTICULAS do
    writeln('Part�cula ', i, ' est� na posi��o ', particulas[i].posicao:0:2);
end;

begin
  InicializarParticulas;
  tempo := 0;
  while tempo < TEMPO_MAXIMO do
  begin
    AtualizarParticulas(INTERVALO_TEMPO);
    tempo := tempo + INTERVALO_TEMPO;
  end;
  ImprimirPosicoes;
  readln;
end.