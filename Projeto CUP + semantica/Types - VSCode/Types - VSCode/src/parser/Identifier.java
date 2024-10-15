package parser;

public class Identifier {

    private final String name; // nome do identificador
    private Integer type; // tipo do identificador

    public Identifier(String name) {
        this.name = name; // nome do identificador
        this.type = null; // sem tipo inicialmente
    }

    public String getName() {
        return this.name;
    }

    public Integer getType() {
        return this.type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "ID: " + this.name + " TYPE: " + this.type;
    }
}
