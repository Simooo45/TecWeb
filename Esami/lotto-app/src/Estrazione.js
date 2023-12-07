import React, { useState } from 'react';

const Estrazione = ({ onExtract }) => {
  const [extractedNumbers, setExtractedNumbers] = useState(['', '', '', '', '']);

  const handleExtract = () => {
    // Simula l'estrazione casuale di cinque numeri ammissibili
    const newNumbers = Array.from({ length: 5 }, () => Math.floor(Math.random() * 10) + 1);
    setExtractedNumbers(newNumbers);
    onExtract(newNumbers);
  };

  return (
    <div>
      <button onClick={handleExtract}>Estrai Numeri</button>
      <br />
      {extractedNumbers.map((num, index) => (
        <input key={index} type="text" value={num} readOnly />
      ))}
    </div>
  );
};

export default Estrazione;