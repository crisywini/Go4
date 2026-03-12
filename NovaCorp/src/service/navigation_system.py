class NavigationSystem:
    """Computes flight trajectories and programs destination coordinates."""

    def calculate_trajectory(self, latitude: float, longitude: float) -> float:
        """Calculates the optimal flight trajectory toward the target coordinates.

        Args:
            latitude: Target latitude in decimal degrees.
            longitude: Target longitude in decimal degrees.

        Returns:
            Computed trajectory angle in degrees relative to launch position.
        """
        print(f"[NavigationSystem] Calculating trajectory to ({latitude}, {longitude})...")
        trajectory_angle = (latitude + longitude) / 2
        return trajectory_angle

    def set_coordinates(self, latitude: float, longitude: float) -> None:
        """Programs the destination coordinates into the navigation computer.

        Args:
            latitude: Target latitude in decimal degrees.
            longitude: Target longitude in decimal degrees.
        """
        print(f"[NavigationSystem] Setting destination coordinates to ({latitude}, {longitude})...")
