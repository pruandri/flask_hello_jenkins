# Utiliser Python 3.7
FROM python:3.7

# Ne pas exécuter en root
RUN useradd flask

# Répertoire de travail dans le conteneur
WORKDIR /home/flask

# Ajouter tous les fichiers du contexte Docker (sauf .dockerignore)
ADD . .

# Installer les dépendances (pas besoin de venv dans Docker)
RUN pip install --upgrade pip && \
    pip install --default-timeout=100 -r requirements.txt

# Rendre les scripts exécutables + donner accès à l’utilisateur flask
RUN chmod a+x app.py test.py && \
    chown -R flask:flask ./

# Définir variable d’environnement Flask
ENV FLASK_APP app.py

# Ouvrir le port 5000
EXPOSE 5000

# Utiliser utilisateur flask
USER flask

# Démarrer l'application
CMD ["./app.py"]

