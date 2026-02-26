/**
 * main.js — Entry point.
 *
 * Wires form events to API calls and UI updates.
 * No fetch logic (see api.js) and no direct DOM rendering (see ui.js).
 */

document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('create-form').addEventListener('submit', handleCreateSubmit);
  document.getElementById('clone-form').addEventListener('submit', handleCloneSubmit);
  document.getElementById('clear-btn').addEventListener('click', clearResponse);
});

// ── Form handlers ─────────────────────────────────────────────────

async function handleCreateSubmit(event) {
  event.preventDefault();

  const btn    = event.target.querySelector('[type="submit"]');
  const origin = 'POST /creatures';

  showLoading(origin);
  setButtonLoading(btn, 'Registering...');

  try {
    const result = await createCreature(buildCreatePayload());
    showSuccess(result, origin);
  } catch (err) {
    showError(err.message, origin);
  } finally {
    resetButton(btn);
  }
}

async function handleCloneSubmit(event) {
  event.preventDefault();

  const btn    = event.target.querySelector('[type="submit"]');
  const origin = 'POST /creatures/clone';

  showLoading(origin);
  setButtonLoading(btn, 'Cloning...');

  try {
    const result = await cloneCreature(buildClonePayload());
    showSuccess(result, origin);
  } catch (err) {
    showError(err.message, origin);
  } finally {
    resetButton(btn);
  }
}

// ── Payload builders ──────────────────────────────────────────────

/**
 * Builds the full creature payload for POST /creatures.
 * All fields are always sent; empty inputs map to sensible defaults.
 *
 * @returns {Object}
 */
function buildCreatePayload() {
  return {
    name:   getStringValue('create-name'),
    dna:    getStringValue('create-dna'),
    skills: parseSkills(getStringValue('create-skills')) ?? [],
    stats: {
      health:   getNumberValue('create-health'),
      speed:    getNumberValue('create-speed'),
      strength: getNumberValue('create-strength'),
    },
    behavior: {
      aggressiveness: getNumberValue('create-aggressiveness'),
      socialLevel:    getNumberValue('create-social'),
      nocturnal:      getStringValue('create-nocturnal') === 'true',
    },
  };
}

/**
 * Builds a sparse override payload for POST /creatures/clone.
 * Only non-empty fields are included; empty ones are omitted so the
 * server preserves the cloned values.
 *
 * @returns {Object}
 */
function buildClonePayload() {
  const payload = {
    prototype: getStringValue('clone-prototype'),
    newName:   getStringValue('clone-new-name'),
  };

  appendIfPresent(payload, 'dna',            getStringValue('clone-dna'));
  appendIfPresent(payload, 'skills',         parseSkills(getStringValue('clone-skills')));
  appendIfPresent(payload, 'health',         getNumberValue('clone-health'));
  appendIfPresent(payload, 'speed',          getNumberValue('clone-speed'));
  appendIfPresent(payload, 'strength',       getNumberValue('clone-strength'));
  appendIfPresent(payload, 'aggressiveness', getNumberValue('clone-aggressiveness'));
  appendIfPresent(payload, 'socialLevel',    getNumberValue('clone-social'));
  appendIfPresent(payload, 'nocturnal',      getNocturnalOverride('clone-nocturnal'));

  return payload;
}

// ── Field readers ─────────────────────────────────────────────────

/**
 * Returns the trimmed string value of an input, or null if empty.
 *
 * @param {string} id  Element id.
 * @returns {string|null}
 */
function getStringValue(id) {
  const val = document.getElementById(id).value.trim();
  return val === '' ? null : val;
}

/**
 * Returns a parsed float for a number input, or null if empty.
 *
 * @param {string} id  Element id.
 * @returns {number|null}
 */
function getNumberValue(id) {
  const val = document.getElementById(id).value.trim();
  return val === '' ? null : parseFloat(val);
}

/**
 * Returns boolean for the nocturnal override select, or null when
 * the "—" (empty) option is selected (meaning: no override).
 *
 * @param {string} id  Element id.
 * @returns {boolean|null}
 */
function getNocturnalOverride(id) {
  const val = document.getElementById(id).value;
  if (val === '') return null;
  return val === 'true';
}

// ── Value transformers ────────────────────────────────────────────

/**
 * Splits a comma-separated skills string into a trimmed array.
 * Returns null if the raw value is null or results in an empty array.
 *
 * @param {string|null} raw
 * @returns {string[]|null}
 */
function parseSkills(raw) {
  if (!raw) return null;
  const skills = raw.split(',').map((s) => s.trim()).filter(Boolean);
  return skills.length > 0 ? skills : null;
}

/**
 * Adds a key/value pair to an object only when the value is not null.
 * Used to build sparse override payloads.
 *
 * @param {Object} obj
 * @param {string} key
 * @param {*}      value
 */
function appendIfPresent(obj, key, value) {
  if (value !== null && value !== undefined) {
    obj[key] = value;
  }
}
