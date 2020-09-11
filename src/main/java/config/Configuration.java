package config;

import java.io.*;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.Map;
import java.util.Properties;

public final class Configuration {

    private Configuration() {
    }

    private static Properties properties;

    public static void load() throws IOException {
        Configuration.load("config.properties", "/");
    }

    public static void load(String fileName, String path) throws IOException {
        Configuration config = new Configuration();
        boolean isProperty = false;
        if (properties == null) {
            properties = new Properties();
        } else {
            isProperty = true;
        }
        Enumeration<URL> enumeration = config.getClass().getClassLoader().getResources(path);
        while (enumeration.hasMoreElements()) {
            System.out.println(enumeration.nextElement());
        }
        InputStream inputStream = new FileInputStream(new File(fileName));
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
        try {
            if (isProperty) {
                Properties propertiesTemp = new Properties();
                propertiesTemp.load(new BufferedReader(new InputStreamReader(
                        (new FileInputStream(new File(fileName))), StandardCharsets.UTF_8)));
                properties.putAll(propertiesTemp);
            } else {
                properties.load(reader);
            }
        } finally {
            inputStream.close();
            reader.close();
        }
    }

    public static String get(String option) {
        String value = properties.getProperty(option);
        if (value == null) {
            return "";
        }
        return value;
    }

    public static void print() {
        for (Map.Entry<Object, Object> entry : properties.entrySet()) {
            System.out.println(String.format("%s=%s", entry.getKey(), entry.getValue()));
        }
    }
}