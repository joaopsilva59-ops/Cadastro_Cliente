
using Npgsql;

namespace ClienteApi.Services;

public class ConexaoBanco
{
    private readonly string _connectionString;

    public ConexaoBanco(IConfiguration configuration)
    {
        _connectionString = configuration
            .GetConnectionString("PostgreSQL")
            ?? throw new InvalidOperationException(
                "String de conexão não encontrada.");
    }

    public async Task<bool> TestarConexao()
    {
        await using var conexao =
            new NpgsqlConnection(_connectionString);

        await conexao.OpenAsync();

        await using var comando =
            new NpgsqlCommand("SELECT 1", conexao);

        var resultado = await comando.ExecuteScalarAsync();

        return Convert.ToInt32(resultado) == 1;
    }
}
