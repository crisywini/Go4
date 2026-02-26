/**
 * ui.js — DOM and rendering layer.
 *
 * All functions here read from or write to the DOM. No fetch calls
 * and no business logic. Imported globals: none (runs after HTML).
 */

const responseBody   = document.getElementById('response-body');
const responseOrigin = document.getElementById('response-origin');

// ── Response panel states ─────────────────────────────────────────

/**
 * Switches the response panel to a loading state with a scan animation.
 *
 * @param {string} origin  Endpoint label shown in the header bar.
 */
function showLoading(origin) {
  responseOrigin.textContent = origin;
  responseBody.innerHTML     = '';
  responseBody.classList.add('response-viewer__body--loading');
}

/**
 * Renders a successful API response as highlighted JSON.
 *
 * @param {Object} data    Parsed response from the server.
 * @param {string} origin  Endpoint label shown in the header bar.
 */
function showSuccess(data, origin) {
  responseOrigin.textContent = origin;
  responseBody.classList.remove('response-viewer__body--loading');

  const badge       = buildBadge('ok', '✓ 200 OK');
  const highlighted = syntaxHighlight(JSON.stringify(data, null, 2));

  responseBody.innerHTML = `${badge}<pre>${highlighted}</pre>`;
}

/**
 * Renders an error state in the response panel.
 *
 * @param {string} message  Error message to display.
 * @param {string} origin   Endpoint label shown in the header bar.
 */
function showError(message, origin) {
  responseOrigin.textContent = origin;
  responseBody.classList.remove('response-viewer__body--loading');

  const badge = buildBadge('error', '✕ Error');

  responseBody.innerHTML = `${badge}<span style="color:var(--accent-error)">${escapeHtml(message)}</span>`;
}

/**
 * Resets the panel to its initial placeholder state.
 */
function clearResponse() {
  responseOrigin.textContent = '—';
  responseBody.classList.remove('response-viewer__body--loading');
  responseBody.innerHTML = '<span class="response-viewer__placeholder">Awaiting request...</span>';
}

// ── Button state helpers ──────────────────────────────────────────

/**
 * Disables a submit button and shows a loading label.
 * Stores original HTML so it can be restored later.
 *
 * @param {HTMLButtonElement} btn
 * @param {string}            loadingText
 */
function setButtonLoading(btn, loadingText) {
  btn.dataset.originalHtml = btn.innerHTML;
  btn.disabled             = true;
  btn.textContent          = loadingText;
}

/**
 * Restores a button to its pre-loading state.
 *
 * @param {HTMLButtonElement} btn
 */
function resetButton(btn) {
  btn.innerHTML = btn.dataset.originalHtml;
  btn.disabled  = false;
}

// ── Private helpers ───────────────────────────────────────────────

/**
 * Builds a status badge element string.
 *
 * @param {'ok'|'error'} type
 * @param {string}       text
 * @returns {string}  HTML string.
 */
function buildBadge(type, text) {
  return `<div class="status-badge status-badge--${type}">${text}</div>`;
}

/**
 * Wraps JSON tokens in <span> elements for CSS syntax highlighting.
 *
 * @param {string} json  Stringified, indented JSON.
 * @returns {string}     HTML with syntax spans.
 */
function syntaxHighlight(json) {
  const escaped = escapeHtml(json);

  return escaped.replace(
    /("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g,
    (match) => {
      let cls = 'json-number';

      if (/^"/.test(match)) {
        cls = /:$/.test(match) ? 'json-key' : 'json-string';
      } else if (/true|false/.test(match)) {
        cls = 'json-bool';
      } else if (/null/.test(match)) {
        cls = 'json-null';
      }

      return `<span class="${cls}">${match}</span>`;
    }
  );
}

/**
 * Escapes HTML special characters to prevent XSS in innerHTML assignments.
 *
 * @param {string} str
 * @returns {string}
 */
function escapeHtml(str) {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}
