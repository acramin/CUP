/*
    Para executar o interpretador na linha de comando (fora do IDE):
        java -jar types.jar <nome_do_arquivo>
 */
package parser;

public class Main {

    public static void main(String[] args) {

        java.io.Reader reader = null;
        if (args.length == 0) {
            reader = new java.io.InputStreamReader(System.in);
        } else {
            if (args.length != 1) {
                System.out.println("Uso : java -jar types <nome_do_arquivo>");
            } else {
                try {
                    java.io.FileInputStream stream = new java.io.FileInputStream(args[0]);
                    reader = new java.io.InputStreamReader(stream);
                } catch (java.io.FileNotFoundException e) {
                    System.out.println("Arquivo não encontrado: \"" + args[0] + "\"");
                } catch (Exception e) {
                    System.out.println("Exceção inesperada: " + e);
                }
            }
        }
        try {
            // Cria o scanner
            Scanner scanner = new Scanner(reader);
            // Cria o parser
            Parser parser = new Parser(scanner);
            // Executa análise
            parser.parse();
        } catch (Exception e) {
            System.out.println("Exceção detectada durante a análise: " + e);
        }
    }
}
