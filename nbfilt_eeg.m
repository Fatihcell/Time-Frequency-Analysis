function EEG_narrow = nbfilt_eeg(EEG,kernel)

%%
% This function employs narrow band filtering analysis on EEG signals. The
% frequency of interest is determined by the kernel wavelet.Note that
% filtering is realized in time domain with convolution operation.
% Author: Fatih ONAY
%% Narrow Band Filtering EEG
% Parameters
if length(size(EEG.data)) == 3  % Epoched EEG data
    trialnum        =   size(EEG.data,3);
    channum         =   size(EEG.data,1);
    signal          =   EEG.data;
    kernel          =   kernel/length(kernel);
    
    
    for ch = 1 : channum % Channel of interest
        x1 = squeeze(signal(ch,:,:));
        for t = 1 : trialnum  % Trial of interest
            single_trial = x1(:,t);
            filtered(ch,:,t)  =  conv(single_trial,kernel,'same');
        end
    end
    EEG.data = filtered;
    EEG_narrow =EEG;
    
%%% 2D EEG %%%%%   
else % if EEG is concatenated
    for ch = 1 : channum
        x1 = squeeze(signal(ch,:));
        filtered(ch,:)  =  conv(x1,kernel,'same');
    end
    EEG.data = filtered;
    EEG_narrow =EEG;
end
    

end


