from flask import Flask, render_template
from database import Database

app = Flask(__name__)


@app.route('/')
def index():
    perfiles = []
    with Database() as db:
        perfiles = db.consultar('''
        SELECT*FROM perfiles''')
        #for perfil in perfiles:
         #   print(dict(perfil))
    return render_template('index.html', lista_perfiles= perfiles)

@app.route('/viajes')
def viajes():
    viajes = []
    with Database() as db:
        viajes = db.consultar(
            '''
            SELECT V.id, V.fecha ,P.nombre || " "|| P. apellidos as Nombre_Completo,
            EI.nombre as Estacion_inicial, DI.nombre as Distrito_Inicial,
            EF.nombre as Estacion_final ,DF.nombre as Distrito_Final
            FROM viajes As V
            INNER JOIN estaciones EF ON V.final_estacion_id =EF.id 
            INNER JOIN distritos DF ON EF.id_distrito=DF.id 
            INNER JOIN estaciones EI ON V.inicial_estacion_id =EI.id
            INNER JOIN distritos DI ON EI.id_distrito=DI.id 
            INNER JOIN perfiles P ON V.perfil_id=P.id
            ORDER BY V.fecha DESC;
            '''
        )
        # for viaje in viaje:
            # print(dict(viaje))
    return render_template('viajes.html', lista_viajes = viajes)

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


