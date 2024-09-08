package Animals.PackAnimals;

import Animals.PackAnimal;

import java.util.Date;
import java.util.HashSet;

public class Horse extends PackAnimal {
    public Horse(String name, Date birthday, HashSet<String> commands) {
        super(name, birthday, commands);
    }

    @Override
    public String toString() {
        return "Лошадь " + getInfo();
    }
}