# Use the stable Alpine-based Nginx image
FROM nginx:stable-alpine

# Set the working directory for Nginx configuration
WORKDIR /etc/nginx/conf.d

# Copy the custom Nginx configuration file to the container
COPY nginx/nginx.conf .

# Rename the copied configuration file to default.conf
RUN mv nginx.conf default.conf

# Set the working directory for web application content
WORKDIR /var/www/html

# Copy application source files into the container
COPY src/ .

# Expose port 80 to the host machine
EXPOSE 80

# Start Nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]
