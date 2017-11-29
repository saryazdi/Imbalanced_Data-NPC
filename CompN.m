function res = CN(Sample,Test,Weights,WinThresh)
size2=size(Sample,2);
ResultClass=zeros(1,size(Test,1));
Distances=pdist2(Sample(:,1:size2-1),Test(:,1:size2-1)); % first column of Distances is the distance of every Sample from first Test data
for i=1:size(Test,1)
    Rank(:,:,i)=sortrows([Distances(:,i),Sample(:,size2)]);
    PPoints(:,i)=Rank(:,2,i).*Weights(:,1); % each column: Weights of minority nearest neighbors of a training data, in order of rank
    NPoints(:,i)=(Rank(:,2,i)==0).*Weights(:,2); % each column: Weights of majority nearest neighbors of a training data, in order of rank
end
PScores=zeros(1,size(Test,1));
NScores=zeros(1,size(Test,1));
for j=1:size(Sample,1) % This loop looks at progressively more neighbors for all training samples until one class wins
    PScores = PScores+PPoints(j,:);
    NScores = NScores+NPoints(j,:);
    PWin = (PScores-NScores)>=WinThresh; % if PScores is ahead by a margin>WinThresh => Positive label
    if sum(PWin')>=1
        ResultClass(find(PWin==1))=1;
        PPoints(:,find(PWin==1))=0;
        NPoints(:,find(PWin==1))=0;
        PScores(:,find(PWin==1))=0;
        NScores(:,find(PWin==1))=0;
    end
    NWin = (NScores-PScores)>=WinThresh; % if NScores is ahead by a margin>WinThresh => Negative label
    if sum(NWin')>=1
        ResultClass(find(NWin==1))=0;
        PPoints(:,find(NWin==1))=0;
        NPoints(:,find(NWin==1))=0;
        PScores(:,find(NWin==1))=0;
        NScores(:,find(NWin==1))=0;
    end
end
res=ResultClass';
end