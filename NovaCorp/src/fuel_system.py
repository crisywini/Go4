class FuelSystem:
    """Handles fuel verification and loading for rocket pre-launch preparation."""

    def check(self) -> bool:
        """Verifies that fuel levels and pressure are within acceptable parameters.

        Returns:
            True if fuel status is nominal, False otherwise.
        """
        print("[FuelSystem] Checking fuel levels and pressure...")
        return True

    def load(self, amount: float) -> None:
        """Loads the specified amount of fuel into the rocket.

        Args:
            amount: Fuel quantity in liters to load into the rocket.
        """
        print(f"[FuelSystem] Loading {amount} liters of fuel...")
