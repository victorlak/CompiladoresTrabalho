public class Erro {
    private int linha;
    private int coluna;
    private String texto;

    public Erro(int linha, int coluna, String texto) {
        this.linha = linha;
        this.coluna = coluna;
        this.texto = texto;
    }

    public void imprime() {
    String aux = "";

    aux = "linha:" + this.linha + ", coluna:" + this.coluna + ", ";

    if (this.texto == null)
        aux += " erro indefinido!";
    else
        aux += this.texto;

    System.out.println(aux);
}

}