# Use the official Nginx image as the base image
FROM nginx:stable-alpine

# Set the working directory to /usr/share/nginx/html (default directory for Nginx)
WORKDIR /usr/share/nginx/html

# Remove default Nginx static files
RUN rm -rf ./*

# Copy the build output from Flutter to the Nginx directory
COPY build/web/ .

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]


# # Stage 1: Build the Flutter web app
# # Specify the platform for M1/M2 Mac (arm64) or Intel (amd64) architectures
# FROM fischerscode/flutter:latest AS build

# # Set the working directory to /app
# WORKDIR /app

# # Copy the pubspec files to the working directory
# COPY pubspec.* ./

# # Get the dependencies
# RUN flutter pub get

# # Copy the rest of the app's source code to the working directory
# COPY . .

# # Build the Flutter web app for production
# RUN flutter build web --release

# # Stage 2: Serve the app with Nginx
# FROM nginx:stable-alpine

# # Set the working directory to /usr/share/nginx/html
# WORKDIR /usr/share/nginx/html

# # Remove default Nginx static files
# RUN rm -rf ./*

# # Copy the build output from the first stage to Nginx's html directory
# COPY --from=build /app/build/web/ .

# # Expose port 80
# EXPOSE 80

# # Start Nginx
# CMD ["nginx", "-g", "daemon off;"]
