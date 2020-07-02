## Proyecto fin de Máster UAH.
#### Autores:
- Daniel Martínez Calleja.
- Rebeca Revilla Martín.
- Belén Ortega Lucena
- Ricardo Caro

### Modelos predictivos en el mundo financiero.
En este proyecto se ha tenido como objetivo predecir , fuera de muestra , los siguientes días del precio de cierre de varias empresas así como un análisis del sentimiento para poder contrastar ambos tipos de análisis a nivel de cotización.
Para ello, se han conectado varios contenedores docker que responden funcionalmente a los siguientes pasos  :

-1. Llamada a las API´s respectivas de Alpaca, Twitter y Reddit a través de **Nifi** y **Kafka**.
-2. Almacenamiento de los datos sin tratar en sistemas distribuidos a través de **Hadoop**
-3. Entrenamiento de modelos: una vez leídos los datos crudos de hdfs a través de **Spark** , utilizamos ML para optimizar modelos de series temporales y obtener el forecasting de los siguientes días.
-4. El resultado de las predicciones las almacenamos en colecciones (por modelo y empresa) en **MongoDB**
-5. Almacenados los resultados del forecasting, se consultan y visualizan en **PowerBI** a través de una conexión ODBC. 
