

import java.io.*;
import static java.lang.Thread.sleep;
import java_cup.runtime.Symbol;

/**
 *
 * @author Prof. Ivan Luís Süptitz (06/01/2021)
 */
public class ExemploJFlexCup {
    public static final String JFLEX_PATH            = "jar/jflex-full-1.8.2.jar";
    public static final String SCANNER_FLEX_PATH     = "scanner.flex";
//    public static final String SCANNER_JAVA_TO_PATH  = "src//";
    
    public static final String JCUP_PATH                    = "jar/java-cup-11b.jar";
    public static final String PARSER_CUP_PATH              = "parser.cup";
    public static final String PARSER_TOKENS_JAVA_TO_PATH   = "src//";

    public static final String ENTRADA_PATH = "src/entrada.txt";


    public static Process p;
    public static Runtime r;

    public static void main(String[] args) {
        atualizarArquivos();        
//        atualizarArquivos();
        
        scanReadEntrada();
    }
    
    public static void scanReadEntrada(){
        try{
            scannearEntrada(ENTRADA_PATH);
            sleep(2);
            parseEntrada(ENTRADA_PATH);
        } catch(Exception e){
            System.out.println("Erro ao scannear ou ler entrada: "+ e.toString());
        }
    }
    
    public static void atualizarArquivos(){
        try{
            gerarScanner(JFLEX_PATH, SCANNER_FLEX_PATH);
            sleep(500);
            gerarParserTokens(JCUP_PATH, PARSER_CUP_PATH, PARSER_TOKENS_JAVA_TO_PATH);
        } catch (Exception e){System.out.println("Erro ao Atualizar Arquivos" + e.toString());}
    }
    
    
    /**
     * Faz Parse da entrada
     */
    public static void parseEntrada(String entradaPath){
        try{
            Scanner scanner = new Scanner(new FileReader(entradaPath));
            Parser parser = new Parser(scanner);     
            System.out.println("\n...\n..\nPARSE FINALIZADO\n..\n..");
            parser.parse();
        } catch (Exception e){
//            e.printStackTrace();
            System.out.println("\n===\n===\nErro ao Fazer Parse de " + entradaPath + ":\n"+ e.toString() +"\n===\n===\n");
        }
    }
    
    /**
     * Escanea a entrada
     */
    public static void scannearEntrada(String entradaPath){
        try{
            Scanner scanner = new Scanner(new FileReader(entradaPath));
            System.out.println("\n--\n--\nANÁLISE LÉXICA: LISTA DE TOKENS:");
            Symbol s = scanner.next_token();
            while(s.sym != Tokens.EOF){
                System.out.printf("<%d, %s>\n", s.sym, s.value);
                s = scanner.next_token();
            }
        } catch (Exception e){
            System.out.println("\n===\n===\nErro ao Scannear " + entradaPath + ":\n"+ e.toString() +"\n===\n===\n");
        }
            
    }
    
    /**
     * Gera Classe Scanner.java
     */
    public static void gerarScanner(String JFlexPath, String ScannerFlexPath){
        try{
            r = Runtime.getRuntime();
            p = r.exec(new String[]{"java", "-jar", JFlexPath, ScannerFlexPath}, null, new File("src//"));
            
            int result = p.waitFor();

            if(result == 1)
                throw new Exception("RESULTADO DO PROCESSO = 1");
            
            System.out.println("\n--\n--\nARQUIVO SCANNER.JAVA GERADOS NO PATH: "+ "src//" + "\n--\n--\n");
        } catch (Exception e){
            System.out.println("\n--\n--\nErro ao gerar Scanner.java \n--\n--\n" + e.toString());
        }
    }
    

    /**
     * Gera Classes Parser.java e Tokens.java
     */
    public static void gerarParserTokens(String JCupPath, String ParserCupPath, String FilesToPath){
        try{
            r = Runtime.getRuntime();
            p = r.exec(new String[]{"java","-jar", JCupPath, "-parser", "Parser", "-symbols", "Tokens", ParserCupPath}, null, new File("src//"));
            
            int result = p.waitFor();
            if(result == 1)
                throw new Exception("RESULTADO DO PROCESSO = 1");
            
            System.out.println("\n--\n--\nARQUIVOS PARSER.JAVA E TOKENS.JAVA GERADOS NO PATH: " + FilesToPath + "\n--\n--\n");
        } catch (Exception e){
            System.out.println("\n--\n--\nErro ao gerar Parser.java, Tokens.java \n--\n--\n" + e.toString());
        }
    }
    
}
