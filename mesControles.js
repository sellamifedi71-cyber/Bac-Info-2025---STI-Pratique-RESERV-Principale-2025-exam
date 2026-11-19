'use strict';
function piedpage() {
    const footer = document.getElementById('pied');
    if (footer && !footer.dataset.yearAdded) {
        footer.textContent = `${footer.textContent} ${new Date().getFullYear()}`;
        footer.dataset.yearAdded = 'true';
    }
}
function moyenne() {
    const fields = ['orig', 'pres', 'gout'].map((id) => Number(document.getElementById(id)?.value ?? 0));
    const average = fields.every(Number.isFinite) ? fields.reduce((sum, value) => sum + value, 0) / 3 : 0;
    const output = document.getElementById('note');
    if (output) output.textContent = average.toFixed(2);
}
function numerique(value) { return /^[0-9]+$/.test(value); }
function validation() {
    const cin = document.getElementById('cin').value.trim();
    const taster = document.getElementById('liste').value;
    if (cin.length !== 8 || !numerique(cin)) { alert('Le CIN doit contenir exactement 8 chiffres.'); return false; }
    if (!/^D[0-9]{2}$/.test(taster)) { alert('Choisissez un dégustateur.'); return false; }
    for (const id of ['orig', 'pres', 'gout']) {
        const raw = document.getElementById(id).value;
        const score = Number(raw);
        if (raw === '' || !Number.isFinite(score) || score < 0 || score > 20) { alert('Chaque note doit être comprise entre 0 et 20.'); return false; }
    }
    return true;
}
