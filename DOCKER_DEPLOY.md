# Docker Deploy Instructions for Render

## Option 1: Using Standard Dockerfile

### Dockerfile Features:

✅ **Multi-stage build** - Optimized size
✅ **Maven dependency caching** - Faster builds  
✅ **Security** - Non-root user
✅ **Health checks** - Container monitoring
✅ **Tomcat 9** - Compatible with Servlet API

### Deploy Steps:

1. **Push code to GitHub** with Dockerfile
2. **Connect GitHub to Render**
3. **Create Web Service** on Render
4. **Set Build Command**: `docker build -t app .`
5. **Set Start Command**: (auto-detected)

## Option 2: Using Render-Optimized Dockerfile

### Enhanced Features:

✅ **Dynamic PORT handling** - Render compatibility
✅ **Environment optimization** - Memory limits
✅ **Extended health checks** - Better reliability
✅ **Slim base image** - Smaller size

### Usage:

```bash
# Rename for deploy
mv Dockerfile.render Dockerfile
```

## Render Configuration

### Environment Variables (Optional):

```
JAVA_OPTS=-Xmx512m -XX:+UseG1GC
CATALINA_OPTS=-Dspring.profiles.active=prod
```

### Health Check Endpoint:

- URL: `https://your-app.onrender.com/`
- Expected: HTTP 200 response

## Troubleshooting

### Common Issues:

1. **Port Binding Error**

   - Solution: Dockerfile.render handles dynamic ports

2. **Memory Limits**

   - Solution: Set CATALINA_OPTS with memory limits

3. **Slow Startup**

   - Solution: Increase health check start-period

4. **Build Timeout**
   - Solution: Use dependency caching (already implemented)

### Build Logs Check:

```bash
# Local test
docker build -t baitap2 .
docker run -p 8080:8080 baitap2

# Check health
curl http://localhost:8080/
```

## Deployment Strategy

### Recommended Approach:

1. **Test locally** with Docker first
2. **Use Dockerfile.render** for production
3. **Monitor logs** during first deploy
4. **Set up health checks** in Render dashboard

### Files Required:

- ✅ Dockerfile or Dockerfile.render
- ✅ pom.xml (Maven config)
- ✅ src/ directory (source code)
- ✅ No manual WAR upload needed

### Expected Results:

- **Build time**: 3-5 minutes
- **Startup time**: 30-60 seconds
- **Memory usage**: ~256-512MB
- **URL**: `https://your-app-name.onrender.com/`
