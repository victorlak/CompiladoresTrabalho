import java.util.ArrayList;
import java.util.List;

public abstract class ListaErros {

    protected List<Erro> erros;

    public ListaErros() {
        erros = new ArrayList<>();
    }

    public void defineErro(int l, int c, String texto) {
        erros.add(new Erro(l, c, texto));
    }

    public void defineErro(int l, int c) {
        defineErro(l, c, null);
    }

    public void defineErro(String texto) {
        defineErro(0, 0, texto);
    }

    public void dump() {
        for (Erro erro : erros) {
            erro.imprime();
        }
    }

    public boolean hasErros() {
        return !erros.isEmpty();
    }
}