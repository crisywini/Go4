/* ─────────────────────────────────────────────────────────────
   AlquimiCoffee — Order UI
   ───────────────────────────────────────────────────────────── */

const API_URL   = 'http://localhost:8080/drinks/prepare';
const BASE_COST = 7.0;

/* ── State ───────────────────────────────────────────────── */
const selected = new Set();

/* ── DOM refs ────────────────────────────────────────────── */
const cards        = document.querySelectorAll('.ingredient-card');
const livePrice    = document.getElementById('livePrice');
const orderBtn     = document.getElementById('orderBtn');
const btnLabel     = orderBtn.querySelector('.btn-label');
const btnSpinner   = orderBtn.querySelector('.btn-spinner');
const resultSec    = document.getElementById('resultSection');
const receiptDrink = document.getElementById('receiptDrink');
const receiptCost  = document.getElementById('receiptCost');
const newOrderBtn  = document.getElementById('newOrderBtn');

/* ── Ingredient toggle ───────────────────────────────────── */
cards.forEach(card => {
  card.addEventListener('click', () => {
    const key = card.dataset.ingredient;

    if (selected.has(key)) {
      selected.delete(key);
      card.setAttribute('aria-pressed', 'false');
    } else {
      selected.add(key);
      card.setAttribute('aria-pressed', 'true');
    }

    refreshPrice();
  });
});

function refreshPrice() {
  let total = BASE_COST;
  cards.forEach(card => {
    if (selected.has(card.dataset.ingredient)) {
      total += parseFloat(card.dataset.cost);
    }
  });
  livePrice.textContent = `$${total.toFixed(2)}`;
}

/* ── Place order ─────────────────────────────────────────── */
orderBtn.addEventListener('click', async () => {
  setLoading(true);

  try {
    const res = await fetch(API_URL, {
      method:  'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        base:        'coffee',
        ingredients: [...selected],
      }),
    });

    if (!res.ok) throw new Error(`Server responded with status ${res.status}`);

    const data = await res.json();
    showReceipt(data);

  } catch (err) {
    showToast(err.message || 'Could not reach the server — is it running?');
  } finally {
    setLoading(false);
  }
});

/* ── New order ───────────────────────────────────────────── */
newOrderBtn.addEventListener('click', () => {
  resultSec.hidden = true;
  selected.clear();
  cards.forEach(c => c.setAttribute('aria-pressed', 'false'));
  refreshPrice();
  document.getElementById('order').scrollIntoView({ behavior: 'smooth' });
});

/* ── Helpers ─────────────────────────────────────────────── */
function setLoading(on) {
  orderBtn.disabled    = on;
  btnLabel.textContent = on ? 'Preparing…' : 'Prepare My Coffee';
  btnSpinner.hidden    = !on;
}

function showReceipt(data) {
  receiptDrink.textContent = data.description;
  receiptCost.textContent  = `$${Number(data.totalCost).toFixed(2)}`;
  resultSec.hidden = false;
  resultSec.scrollIntoView({ behavior: 'smooth', block: 'center' });
}

let toastTimer;
function showToast(msg) {
  let toast = document.querySelector('.toast');
  if (!toast) {
    toast = document.createElement('div');
    toast.className = 'toast';
    document.body.appendChild(toast);
  }
  toast.textContent = msg;
  toast.classList.add('show');
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => toast.classList.remove('show'), 4000);
}
