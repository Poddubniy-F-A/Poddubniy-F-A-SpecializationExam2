package Animals.PackAnimals;

import Animals.PackAnimal;

import java.util.Date;
import java.util.HashSet;

public class Camel extends PackAnimal {
    public Camel(String name, Date birthday, HashSet<String> commands) {
        super(name, birthday, commands);
    }

    @Override
    public String toString() {
        return "Верблюд " + getInfo();
    }
}
