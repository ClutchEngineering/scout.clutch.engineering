/**
 * Building Animation System
 * Spawns gas stations and air pumps that animate across the screen
 */
class BuildingSpawner {
  constructor(container) {
    this.container = container;
    this.buildings = [];
    this.isRunning = false;
    this.spawnTimer = null;

    // Configuration
    this.config = {
      minSpawnInterval: 0,
      maxSpawnInterval: 1000,
      animationDuration: 25000, // Time to cross screen
      buildingScale: 0.4, // Scale buildings to 40% of original size
      groundOffset: 100, // Offset from bottom of container

      // Possible building sightings (each entry has buildings array and weight)
      buildingSightings: [
        {
          buildings: ['GasStation.png', 'DieselPump.png'],
          weight: 0.2
        },
        {
          buildings: ['GasStation.png', 'GasPump.png', 'DieselPump.png'],
          weight: 0.5
        },
        {
          buildings: ['GasStation.png', 'GasPump.png', 'DieselPump.png', 'AirPump.png'],
          weight: 0.4
        },
        {
          buildings: ['GasStation.png', 'GasPump.png', 'AirPump.png', 'Vacuum.png'],
          weight: 0.3
        },
        {
          buildings: ['GasStation.png', 'GasPump.png', 'DieselPump.png', 'AirPump.png', 'Vacuum.png'],
          weight: 0.2
        },
      ]
    };
  }

  start() {
    if (this.isRunning) return;
    this.isRunning = true;
    this.scheduleNextSpawn();
  }

  stop() {
    this.isRunning = false;
    if (this.spawnTimer) {
      clearTimeout(this.spawnTimer);
      this.spawnTimer = null;
    }
    // Clean up existing buildings
    this.buildings.forEach(building => building.remove());
    this.buildings = [];
  }

  scheduleNextSpawn() {
    if (!this.isRunning) return;

    // Allow up to 2 building groups at once
    // Spawn next building when current one is halfway through (after half the animation duration)
    const delay = this.buildings.length === 0 ? 0 : this.config.animationDuration / 4; // Partway through current animation

    this.spawnTimer = setTimeout(() => {
      // Only spawn if we have less than 2 building groups
      if (this.buildings.length < 2) {
        this.spawnBuilding();
      }
      this.scheduleNextSpawn();
    }, delay);
  }

  spawnBuilding() {
    const selectedSighting = this.selectWeightedRandom(this.config.buildingSightings);
    this.createBuildingGroup(selectedSighting.buildings);
  }

  selectWeightedRandom(options) {
    // Calculate total weight
    const totalWeight = options.reduce((sum, option) => sum + option.weight, 0);

    // Generate random number between 0 and totalWeight
    let random = Math.random() * totalWeight;

    // Find the selected option
    for (const option of options) {
      random -= option.weight;
      if (random <= 0) {
        return option;
      }
    }

    // Fallback to first option (shouldn't happen with proper weights)
    return options[0];
  }

  createBuildingGroup(buildingFiles) {
    const group = document.createElement('div');
    group.className = 'building-group';

    // Position group off-screen to the right, behind Scout
    group.style.cssText = `
      position: absolute;
      right: -10px;
      bottom: ${this.config.groundOffset}px;
      display: flex;
      align-items: flex-end;
      gap: 10px;
      z-index: 5;
      transform: translateX(100vw);
    `;

    // Create building elements
    buildingFiles.forEach((filename, index) => {
      const building = document.createElement('img');
      building.src = `/gfx/buildings/${filename}`;
      building.alt = filename.replace('.png', '');
      building.style.cssText = `
        height: auto;
        display: block;
        margin: 0;
        padding: 0;
        vertical-align: bottom;
      `;

      // Scale by setting width after image loads to get proper dimensions
      building.onload = () => {
        const scaledWidth = building.naturalWidth * this.config.buildingScale;
        building.style.width = scaledWidth + 'px';
      };

      group.appendChild(building);
    });

    this.container.appendChild(group);
    this.buildings.push(group);

    // Trigger animation
    requestAnimationFrame(() => {
      group.style.transition = `transform ${this.config.animationDuration}ms linear`;
      group.style.transform = `translateX(calc(-100vw - 400px))`;
    });

    // Clean up after animation completes
    setTimeout(() => {
      if (group.parentNode) {
        group.remove();
      }
      const index = this.buildings.indexOf(group);
      if (index > -1) {
        this.buildings.splice(index, 1);
      }
    }, this.config.animationDuration + 1000);
  }
}

// Auto-initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
  // Find the driving scene container (the ground section)
  const drivingSceneContainer = document.querySelector('.h-\\[12lvh\\]');

  if (drivingSceneContainer) {
    // Make container relative positioned if not already
    const computedStyle = window.getComputedStyle(drivingSceneContainer);
    if (computedStyle.position === 'static') {
      drivingSceneContainer.style.position = 'relative';
    }

    const spawner = new BuildingSpawner(drivingSceneContainer);

    // Spawn first building immediately, then start normal schedule
    spawner.spawnBuilding();
    spawner.start();

    // Handle visibility changes (pause when tab not visible)
    document.addEventListener('visibilitychange', function() {
      if (document.hidden) {
        spawner.stop();
      } else {
        spawner.start();
      }
    });

    // Expose spawner globally for debugging
    window.buildingSpawner = spawner;
  }
});