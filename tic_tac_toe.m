function x_si_0_final()
    % Inițializăm tabla cu spații
    tabla = repmat(' ', 3, 3); 
    jucator_simbol = 'X'; 
    meci_in_curs = true;
    mutari = 0;

    while meci_in_curs
        clc; % Curăță ecranul 
        disp('--- Joc X și 0 ---');
        afiseaza_tabla(tabla);
        
        fprintf('\nEste rândul lui %s\n', jucator_simbol);
        
        % Citire și validare input
        rand = input('Introdu rândul (1-3): ');
        col = input('Introdu coloana (1-3): ');

        if isempty(rand) || isempty(col) || rand < 1 || rand > 3 || col < 1 || col > 3 || tabla(rand, col) ~= ' '
            fprintf('\n!!! Mutare invalidă! Apasă Enter pentru a reîncerca.');
            pause(1.5); % Pauză scurtă să apuce jucătorul să vadă mesajul de eroare
            continue;
        end

        % Aplicare mutare
        tabla(rand, col) = jucator_simbol;
        mutari = mutari + 1;

        % Verificare câștigător
        if verifica_castigator(tabla, jucator_simbol)
             clc;
             disp('--- REZULTAT FINAL ---');
             afiseaza_tabla(tabla);
             fprintf('\nFELICITĂRI! Jucătorul %s a câștigat!\n', jucator_simbol);
             meci_in_curs = false;
        elseif mutari == 9
            clc;
            disp('--- REZULTAT FINAL ---');
            afiseaza_tabla(tabla);
            disp('\nEGALITATE! Jocul s-a terminat.');
            meci_in_curs = false;
        else
            % Schimbăm jucătorul
            if jucator_simbol == 'X', jucator_simbol = 'O'; else, jucator_simbol = 'X'; end
        end
    end
end

% Funcție separată pentru afișarea estetică a tablei
function afiseaza_tabla(t)
    fprintf('\n    1   2   3\n');
    fprintf('  -------------\n');
    for i = 1:3
        fprintf('%d | %c | %c | %c |\n', i, t(i,1), t(i,2), t(i,3));
        fprintf('  -------------\n');
    end
end

function gata = verifica_castigator(t, s)
    lin = any(all(t == s, 2));
    col = any(all(t == s, 1));
    diag1 = all(diag(t) == s);
    diag2 = all(diag(flipud(t)) == s);
    gata = lin || col || diag1 || diag2;
end
