class CommunicationSystem:
    """Establishes and maintains contact with the ground control station."""

    def connect_to_central(self) -> None:
        """Opens a secure communication channel with the central control station
        to enable telemetry exchange and mission oversight during launch.
        """
        print("[CommunicationSystem] Establishing connection with central control station...")
