import React from 'react';

const Visualizzazione = ({ numbers, result }) => {
  return (
    <div>
      <p>Risultato: {result}</p>
      {numbers.map((num, index) => (
        <input key={index} type="text" value={num} readOnly />
      ))}
    </div>
  );
};

export default Visualizzazione;