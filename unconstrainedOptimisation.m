x0 = [1 2 3 2 1]; % Starting guess
options = optimset('GradObj','on');
x = fminunc(@(h)ErrorFunc(h),x0,options);