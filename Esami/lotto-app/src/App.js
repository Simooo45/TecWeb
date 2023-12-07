import React, { useState } from 'react';
import Compilazione from './Compilazione';
import Visualizzazione from './Visualizzazione';
import Estrazione from './Estrazione';
import './styles.css';

const App = () => {
  const [compiledNumbers, setCompiledNumbers] = useState(['', '', '', '', '']);
  const [extractedNumbers, setExtractedNumbers] = useState(['', '', '', '', '']);
  const [result, setResult] = useState('');

  // Funzione per verificare la presenza di numeri vincenti
  const checkWinning = (extractedNumbers, compiledNumbers) => {
    const matchingNumbers = extractedNumbers.filter(num => compiledNumbers.includes(num));
    const matchingCount = matchingNumbers.length;

    switch (matchingCount) {
      case 2:
        return 'ambo';
      case 3:
        return 'terno';
      case 4:
        return 'quaterna';
      case 5:
        return 'cinquina';
      default:
        return 'non-vincente';
    }
  };

  const handleFinalize = (numbers) => {
    // Gestisci la finalizzazione della giocata
    setCompiledNumbers(numbers);
    setResult('');
  };

  const handleExtract = (numbers) => {
    // Gestisci l'estrazione dei numeri e verifica il risultato
    setExtractedNumbers(numbers);

    // Verifica la presenza di numeri vincenti
    const winningResult = checkWinning(numbers, compiledNumbers);

    setResult(winningResult);
  };

  return (
    <div>
      <h1>Lotto Semplificato</h1>
      <Compilazione onFinalize={handleFinalize} />
      <Visualizzazione numbers={compiledNumbers} result={result} />
      <Estrazione onExtract={handleExtract} />
    </div>
  );
};

export default App;