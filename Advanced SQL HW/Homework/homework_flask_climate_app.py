import numpy as np

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

# 2. Create an app, being sure to pass __name__
#################################################
# Database Setup
#################################################
engine = create_engine("sqlite:///Resources/hawaii.sqlite")

# # reflect an existing database into a new model
Base = automap_base()
# # reflect the tables
Base.prepare(engine, reflect=True)

# # Save reference to the table
Measurement = Base.classes.measurement
Station = Base.classes.station

# Create our session (link) from Python to the DB

#################################################
# Flask Setup
#################################################
app = Flask(__name__)

@app.route("/")
def welcome():
    return (
        f"Welcome to the Justice League API!<br/>"
        f"Available Routes:<br/>"
        f"/api/v1.0/precipitation<br/>"
        f"/api/v1.0/stations<br/>"
        f"/api/v1.0/tobs<br/>"
        f"/api/v1.0/yyyy-mm-dd<br/>"
        f"/api/v1.0/yyyy-mm-dd/yyyy-mm-dd<br/>"
        f"/api/v1.0/2016-05-12<br/>"
        f"/api/v1.0/2015-03-12/2017-01-10<br/>"
    )


@app.route("/api/v1.0/precipitation")
def percip():
    session = Session(engine)
    one_year = engine.execute('SELECT Measurement.date, Measurement.prcp FROM Measurement where date >= "2016-08-23"')
    return jsonify({'one_year': [dict(row) for row in one_year]})


@app.route("/api/v1.0/stations")
def stationz():
    session = Session(engine)
    stations = engine.execute('SELECT distinct Measurement.station FROM Measurement group by station')
    return jsonify({'stations': [dict(row) for row in stations]})

@app.route("/api/v1.0/tobs")
def tobz():
    session = Session(engine)
    tobs = engine.execute('SELECT Measurement.tobs FROM Measurement where date >= "2016-08-23" and station = "USC00519281"')

    return jsonify({'tobs': [dict(row) for row in tobs]})

@app.route("/api/v1.0/<start>")
def starting(start):
    session = Session(engine)
    results = session.query(func.min(Measurement.tobs), func.avg(Measurement.tobs), func.max(Measurement.tobs)).filter(Measurement.date >= start).all()
    return jsonify(results)

@app.route("/api/v1.0/<starti>/<end>")
def ending(starti, end):
    session = Session(engine)
    results = session.query(func.min(Measurement.tobs), func.avg(Measurement.tobs), func.max(Measurement.tobs)).filter(Measurement.date >= starti).filter(Measurement.date <= end).all()
    return jsonify(results)


if __name__ == "__main__":
    app.run(debug=True)
