/**
 * api.js — HTTP layer.
 *
 * Exposes one function per endpoint. Each function returns a parsed
 * JSON object on success, or throws an Error with status information
 * on failure. No DOM access here.
 */

const API_BASE = 'http://localhost:8080/creatures';

/**
 * Registers a new creature in the registry.
 *
 * @param {Object} creatureData  Full creature payload.
 * @returns {Promise<Object>}    The created creature.
 */
async function createCreature(creatureData) {
  const response = await fetch(API_BASE, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(creatureData),
  });

  if (!response.ok) {
    throw new Error(`${response.status} ${response.statusText}`);
  }

  return response.json();
}

/**
 * Clones an existing creature with optional field overrides.
 * Only the fields present in cloneData (besides prototype/newName)
 * will be overwritten in the clone; the rest are inherited.
 *
 * @param {Object} cloneData  Must include `prototype` and `newName`.
 * @returns {Promise<Object>} The cloned creature.
 */
async function cloneCreature(cloneData) {
  const response = await fetch(`${API_BASE}/clone`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(cloneData),
  });

  if (!response.ok) {
    throw new Error(`${response.status} ${response.statusText}`);
  }

  return response.json();
}
