# Projeto de BD, 2021/2022

## Correr localmente

```bash
ln -s ./web cgi-bin
python3 -m http.server --cgi 8000
```

Abrir no browser: http://localhost:8000/cgi-bin/app.cgi/

### Dependências

- psycopg2
- flask
- postgresql
