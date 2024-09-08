import Animals.*;
import Animals.PackAnimals.*;
import Animals.Pets.*;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Main {
    private static final Scanner scanner = new Scanner(System.in);

    private static final ArrayList<Animal> animals = new ArrayList<>();

    public static void main(String[] args) throws InvocationTargetException, NoSuchMethodException, InstantiationException, IllegalAccessException {
        final int EXIT_CODE = 0,
                ADD_ANIMAL_CODE = 1,
                GET_COMMANDS_CODE = 2,
                ADD_COMMAND_CODE = 3,
                SORT_ANIMALS_BY_AGE = 4,
                GET_PACK_ANIMALS_NUM_CODE = 5,
                GET_PETS_NUM_CODE = 6,
                SHOW_ANIMALS_CODE = 7;

        System.out.println("\nВас приветствует программа-реестр животных!");
        int command;
        do {
            System.out.println("\nВведите\n" +
                    EXIT_CODE + " - если хотите выйти\n" +
                    ADD_ANIMAL_CODE + " - если нужно добавить новое животное в реестр\n" +
                    GET_COMMANDS_CODE + " - если нужно узнать, какие команды умеет исполнять конкретное животное\n" +
                    ADD_COMMAND_CODE + " - если животное выучило новую команду\n" +
                    SORT_ANIMALS_BY_AGE + " - если нужно отсортировать животных в реестре по дате рождения\n" +
                    GET_PACK_ANIMALS_NUM_CODE + " - если нужно узнать количество вьючных животных в реестре\n" +
                    GET_PETS_NUM_CODE + " - если нужно узнать количество домашних животных в реестре\n" +
                    SHOW_ANIMALS_CODE + " - если хотите посмотреть список всех животных в реестре\n");
            command = scanner.nextInt();
            scanner.nextLine();
            switch (command) {
                case ADD_ANIMAL_CODE -> addCase();
                case GET_COMMANDS_CODE -> getCommandsCase();
                case ADD_COMMAND_CODE -> addCommandCase();
                case SORT_ANIMALS_BY_AGE -> {
                    animals.sort(Comparator.comparing(Animal::getBirthday));
                    printAnimals();
                }
                case GET_PACK_ANIMALS_NUM_CODE -> System.out.println(PackAnimal.createdExamplesNum);
                case GET_PETS_NUM_CODE -> System.out.println(Pet.createdExamplesNum);
                case SHOW_ANIMALS_CODE -> printAnimals();
                default -> {
                    if (command != EXIT_CODE) {
                        System.out.println("Некорректный код команды");
                    }
                }
            }
        } while (command != EXIT_CODE);
    }

    private static void addCase() throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        final String CAMEL_CODE = "Верблюд",
                DONKEY_CODE = "Осёл",
                HORSE_CODE = "Лошадь",
                CAT_CODE = "Кошка",
                DOG_CODE = "Собака",
                HAMSTER_CODE = "Хомяк";

        Class<? extends Animal> animalClass;
        while (true) {
            System.out.print("Введите название животного (" +
                    CAMEL_CODE + " / " +
                    DONKEY_CODE + " / " +
                    HORSE_CODE + " / " +
                    CAT_CODE + " / " +
                    DOG_CODE + " / " +
                    HAMSTER_CODE +
                    "): ");
            switch (scanner.nextLine()) {
                case CAMEL_CODE -> animalClass = Camel.class;
                case DONKEY_CODE -> animalClass = Donkey.class;
                case HORSE_CODE -> animalClass = Horse.class;
                case CAT_CODE -> animalClass = Cat.class;
                case DOG_CODE -> animalClass = Dog.class;
                case HAMSTER_CODE -> animalClass = Hamster.class;
                default -> {
                    System.out.println("Такой вид животных не поддерживается");
                    continue;
                }
            }
            break;
        }

        System.out.print("Введите имя животного: ");
        String name = scanner.nextLine();

        Date birthday;
        while (true) {
            System.out.print("Введите дату рождения животного в формате dd.MM.yyyy: ");
            try {
                birthday = new SimpleDateFormat("dd.MM.yyyy").parse(scanner.nextLine());
            } catch (ParseException e) {
                System.out.println("Некорректный формат даты");
                continue;
            }
            break;
        }

        System.out.print("Введите через пробел команды, которые знает животное: ");
        HashSet<String> commands = new HashSet<>(Arrays.asList(scanner.nextLine().split(" ")));

        animals.add(animalClass.getConstructor(String.class, Date.class, HashSet.class).
                newInstance(name, birthday, commands));
        System.out.println("Животное добавлено!");
    }

    private static void getCommandsCase() {
        int index = getIndex();

        Animal animal = animals.get(index);
        System.out.println(animal.getName() + " знает следующие команды:" + animal.getCommands());
    }

    private static void addCommandCase() {
        int index = getIndex();
        scanner.nextLine();

        System.out.print("Введите новую команду: ");
        animals.get(index).addCommand(scanner.nextLine());
        System.out.println("Команда добавлена!");
    }

    private static int getIndex() {
        System.out.print("Введите индекс животного: ");
        int index = scanner.nextInt();
        if (index > 0 && index <= animals.size()) {
            return index - 1;
        } else {
            System.out.println("Некорректное значение индекса");
            return getIndex();
        }
    }

    private static void printAnimals() {
        for (int i = 0; i < animals.size(); i++) {
            System.out.println((i + 1) + " " + animals.get(i));
        }
    }
}