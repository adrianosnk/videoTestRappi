# videoTestRappi

Arquitéctura VIPER
Tiene dos modulos:

Catalog: Lista de películas, vista principal.
MovieDetail: Vista de detalle.
Catalog:
Protocols: Es la carpeta que contiene la clase CatalogProtocols que a su vez contiene todos los Protocolos de VIPER .

DataManager:

CacheDataManager que se encarga del Cache de Imagenes descargadas y almacenamiento Local.

ImageDownloader: Clase encargada de descargar y comprimir imágenes.

Interactor: Esta clase CatalogInteractor es el intermediario para los Request, descarga de Películas e Imagenes y peticiones al almacenamiento Local. 
Se encarga de Notificar al Presenter.

Presenter: La clase CatalogPresenter es la capa intermedia entre la Vista y el Interactor. Además de comunciarse con el Router para navegar a nuevas vistas.

View: Esta carpeta incluye el ViewController del módulo y elementos de vista en general.

Entities: Son los objetos de Mappeo utilizados en el response para poblar la vista, esto son MovieResults, Movie, Genres y Genre. Todos objetos Mappeables.

Router: Contiene la clase CatalogRouter que nos permite la conexíon y navegación con otras vistas (módulos) de la App.

MovieDetail:
Dentro de esté módulo tenemos lo siguiente:

Protocols: Es la carpeta que contiene todos los Protocolos de VIPER dentro de la clase MovieDetailProtocols.

View: Esta carpeta incluye el ViewController del módulo y elementos de vista en general.

Presenter: Esta carpeta incluye la clase MovieDetailPresenter que es el Presenter de este módulo.

Entities: Incluye dos entidades Video y VideoDetails que se utilizan en la respuesta del KEY para visualizar videos de Youtube.


Preguntas
1.- ¿En qué consiste el principio de responsabilidad única? ¿Cuál es su propósito?
Este principio establece que cada clase, función, estructura o bloque de código tiene una tarea. El propósito es tener una arquitectura limpia,
que al modificar un bloque de código el impacto sea grande y limpio. Esto además permite reutilizar y crear capas para el mejor mantenimiento.

2.- ¿Qué características tiene, según su opinión, un “buen” código o código limpio?
Un buen código comienza desde que es legible, variables simples, comentado, enfocado a las estructuras de datos mas que a las librerias o el lenguaje. 
Envitar errores de ausencia de datos nil values. Detectar si el código se repite mucho, entonces es factible una refactorización y quizas el uso 
de patrones de diseño pueda ser una solución (sin caer en los antipatrones). La declaración explicita de datos, con el fin de ser claros en nuestros
valores y evitar inferencia de tipos, entre otras técnicas. Respetar la arquitectura establecida. Y el uso de Unit Tests para asegurar el funcionamiento
correcto del proyecto.
