# Use Nginx alpine for a small, production-ready image
FROM nginx:stable-alpine

# Copy the static files from the dist directory to Nginx's default serve location
COPY ./dist /usr/share/nginx/html

# Expose port 80 (Nginx default)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
