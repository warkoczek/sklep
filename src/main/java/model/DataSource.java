package model;

import model.User;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;

public class DataSource {
		private HashMap<String, String> userSource;

		public DataSource() {
			userSource = new HashMap<String, String>();
			//generateTestData();
			loadData();
		}

		public void register(String name, String password) {
			userSource.put(name, password);
		}

		public boolean userExists(User user) {
			String passwordFromSource = userSource.get(user.getName());
			if(passwordFromSource != null) {
				return user.getPassword().equals(passwordFromSource);
			}else
				return false;
		}
		private void loadData() {
			
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            URL url = classLoader.getResource("");
            File file = new File(url.getPath() + "/dane.txt");
			try {
			FileReader reader = new FileReader(file);
			BufferedReader buf = new BufferedReader(reader);
			String linia = "";
			while((linia = buf.readLine()) != null) {
				String[] tablica = linia.split(":");
				userSource.put(tablica[0], tablica[1]);
			}
			buf.close();
			//reader.close();
			}
			catch(FileNotFoundException fnfe) {
				System.out.println(fnfe.getMessage());
			}
			catch(IOException iex) {
				System.out.println(iex.getMessage());
			}
		}
		private void generateTestData() {
			userSource.put("admin", "test");
			userSource.put("user", "passUser");
		}
}
