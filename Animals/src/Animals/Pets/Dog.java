package Animals.Pets;

import Animals.Pet;

import java.util.Date;
import java.util.HashSet;

public class Dog extends Pet {
    public Dog(String name, Date birthday, HashSet<String> commands) {
        super(name, birthday, commands);
    }

    @Override
    public String toString() {
        return "Собака " + getInfo();
    }
}
