package Animals;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;

public abstract class Animal {
    private final SimpleDateFormat dateFormatter =  new SimpleDateFormat("dd.MM.yyyy");

    private final String name;
    private final Date birthday;

    private final HashSet<String> commands;
    private final StringBuilder commandsString = new StringBuilder();

    public Animal(String name, Date birthday, HashSet<String> commands) {
        this.name = name;
        this.birthday = birthday;

        this.commands = commands;
        for (String command : commands) {
            commandsString.append(" ").append(command);
        }
    }

    protected String getInfo() {
        return name + ", дата рождения: " + dateFormatter.format(birthday) + ", знает команды:" + commandsString;
    }

    public void addCommand(String newCommand) {
        if (!commands.contains(newCommand)) {
            commands.add(newCommand);
            commandsString.append(" ").append(newCommand);
        }
    }

    public String getName() {
        return name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public String getCommands() {
        return commandsString.toString();
    }
}
