from flask import Flask, render_template
from database import Database

app = Flask(__name__)


@app.route('/')
def index():
    jugadores = []
    with Database() as db:
        jugadores = jugadores = db.consultar('''
SELECT 
J.id, J.ranking, J.nombre AS jugador, J.ovr, J.estatura, J.peso, J.edad,
P.nombre AS posicion, N.nombre AS nacionalidad, N.imagen AS bandera, PI.nombre AS pie
FROM jugadores J 
INNER JOIN posiciones P ON J.posicion_id = P.id 
INNER JOIN nacionalidades N ON N.id = J.nacionalidad_id 
INNER JOIN pies PI ON PI.id = J.pie_id 
LIMIT 20;
''')
        # for jugador in jugadores:
            # print(dict(jugador))
    return render_template('index.html', lista_jugadores = jugadores)

@app.route('/nacionalidades')
def nacionalidades():
    paises = []
    with Database() as db:
        paises = db.consultar('SELECT id, nombre AS name , imagen FROM nacionalidades;')
        # for jugador in jugadores:
            # print(dict(jugador))
    return render_template('nacionalidades.html', lista_paises = paises)

@app.route('/nosotros')
def nosotros():
    return render_template('nosotros.html')


@app.route('/servicios')
def servicios():
    return render_template('servicios.html')


@app.route('/contacto')
def contacto():
    return render_template('contacto.html')


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
