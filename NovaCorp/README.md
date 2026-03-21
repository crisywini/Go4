# NovaCorp — Facade Pattern

**Language:** Python

## Pattern

The **Facade** pattern provides a simplified interface to a complex subsystem, hiding internal complexity from clients.

## Structure

```
RocketSystem (facade)
└── launch_rocket(lat, long, fuel)

Subsystems (hidden behind the facade)
├── WeatherSystem        → analyze()
├── FuelSystem           → check(), load(fuel)
├── NavigationSystem     → calculate_trajectory(lat, long), set_coordinates(lat, long)
└── CommunicationSystem  → connect_to_central()
```

## How it works

`RocketSystem.launch_rocket()` orchestrates all subsystems in the correct order — weather check, fuel load, trajectory calculation, coordinate setting, comms connection, then countdown. Clients call one method instead of managing four independent systems.
