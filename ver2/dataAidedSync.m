function syncdSymOut = dataAidedSync(symIn)

    % symIn: preamble sequence + data symbols
    
    % For use in Simulink model 
    persistent cfo_est 
    alpha = 0.7;

    if isempty(cfo_est)
        cfo_est = 0;
    end

    preamble = [-1 -1 -1 -1 -1 +1 +1 -1 -1 +1 -1 +1 -1].';

    r_preamb = symIn(11:length(preamble)+10);
    
    
    phaseCorrSeq = r_preamb .* conj(preamble);
    
    
    phase = angle(phaseCorrSeq);


    % Phase offset
    phi0 = phase(1)

    phase = unwrap(phase);

    figure
    plot((0:length(phase)-1)/symRate, phase)
    title("unwrap(phase) v.s time")

    freq_offset_aprox = zeros(1,1);
     
    for i=1:(length(phase)-1)
        slope = (phase(i+1)-phase(i))*symRate/(2*pi);
        freq_offset_aprox = [freq_offset_aprox slope];
    end
     
    freq_offset_aprox(2:end)

    freq_offset = mean(freq_offset_aprox(2:end))
    
    
    % For Simulink model use: 
    cfo_est = freq_offset*alpha + (1-alpha)*cfo_est
    
    time3 = (0:length(symIn)-1)'*1/symRate;
    syncdSymOut = exp(-1j*phi0) *symIn .* exp(-1j*2*pi*cfo_est.*time3);

end