import React, { useState } from 'react';

const Compilazione = ({ onFinalize }) => {
  const [numbers, setNumbers] = useState(['', '', '', '', '']);

  const handleGenerate = () => {
    // Genera una schedina vuota
    setNumbers(['', '', '', '', '']);
  };

  const handleInputChange = (index, value) => {
    // Gestisci l'input dei numeri
    const newNumbers = [...numbers];
    newNumbers[index] = value;
    setNumbers(newNumbers);
  };

  const handleFinalize = () => {
    // Verifica che ogni casella contenga un numero ammissibile
    if (numbers.every(num => num >= 1 && num <= 10)) {
      onFinalize(numbers);
    } else {
      alert('Inserire numeri ammissibili da 1 a 10 in tutte le caselle.');
    }
  };

  return (
    <div>
      <button onClick={handleGenerate}>Genera Schedina Vuota</button>
      <br />
      {numbers.map((num, index) => (
        <input
          key={index}
          type="number"
          value={num}
          onChange={(e) => handleInputChange(index, e.target.value)}
        />
      ))}
      <br />
      <button onClick={handleFinalize}>Finalizza Giocata</button>
    </div>
  );
};

export default Compilazione;