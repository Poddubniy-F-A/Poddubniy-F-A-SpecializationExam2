package Animals;

import java.util.Date;
import java.util.HashSet;

public abstract class Pet extends Animal {
    public static int createdExamplesNum = 0;

    public Pet(String name, Date birthday, HashSet<String> commands) {
        super(name, birthday, commands);
        createdExamplesNum++;
    }
}
