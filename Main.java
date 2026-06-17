import java.io.FileReader;

public class Main {
    public static void main(String[] args) {
        try {
            ListaErros listaErros = new ListaErros() {};

            Scanner scanner = new Scanner(new FileReader("teste.txt"), listaErros);

            parser p = new parser(scanner);

            p.parse();

            if (listaErros.hasErros()) {
                listaErros.dump();
            }

        } catch (Exception e) {
            System.out.println("Erro de sintaxe: " + e);
        }
    }
}