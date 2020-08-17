/* Creación de la Base de datos si no existe */
CREATE DATABASE IF NOT EXISTS red_social_imagenes COLLATE utf8_general_ci;

/* Usar la base de datos */
USE red_social_imagenes;

/* Creación de tablas */
/* USERS */
CREATE TABLE IF NOT EXISTS users(
    id INT AUTO_INCREMENT,
    role VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    nick VARCHAR(100) NULL DEFAULT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    remember_token VARCHAR(255),
    CONSTRAINT pk_users PRIMARY KEY(id) 
)ENGINE=InnoDB;

ALTER TABLE users
  ADD KEY email (email),
  ADD KEY password (password);

/* IMAGES */
CREATE TABLE IF NOT EXISTS images(
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    description TEXT NULL DEFAULT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    CONSTRAINT pk_images PRIMARY KEY(id),
    CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDB;

ALTER TABLE images
  ADD KEY user_id (user_id);

/* COMMENTS */
CREATE TABLE IF NOT EXISTS comments(
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    image_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    CONSTRAINT pk_comments PRIMARY KEY(id),
    CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDB;

ALTER TABLE comments
  ADD KEY user_id (user_id),
  ADD KEY image_id (image_id);

/* LIKES */
CREATE TABLE IF NOT EXISTS likes(
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    image_id INT NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    CONSTRAINT pk_likes PRIMARY KEY(id) ,
    CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDB;

ALTER TABLE likes
  ADD KEY user_id (user_id),
  ADD KEY image_id (image_id);