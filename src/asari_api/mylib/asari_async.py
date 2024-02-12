from asari.api import Sonar
sonar = Sonar()


async def async_sonar_ping(doc: str):
    return sonar.ping(text=doc)

