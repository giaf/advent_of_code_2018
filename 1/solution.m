% read data.m defining the data vector x
data

%x = [3, 3, 4, -2, -4];
%x = [7, 7, -2, -7, -4];



%% part 1

x_sum_end = sum(x)



%% part 2 smart

if 1

	n = length(x);

	x_sum = zeros(size(x));

	x_sum(1) = x(1);
	for ii=2:n
		x_sum(ii) = x_sum(ii-1) + x(ii);
	end

	%x_sum

	x_diff = 0;
	x_diff_mod = 0;
	rep = -1;
	rep_min = inf;
	freq_twice = inf;
	for ii=1:n
		for jj=1:ii-1
			x_diff = x_sum(ii)-x_sum(jj);
			x_diff_mod = mod(x_diff, x_sum_end);
			if x_diff_mod==0
				rep = abs(x_diff)/abs(x_sum_end);
				if rep<rep_min
					rep_min = rep;
					if x_sum_end>=0
						freq_twice = max(x_sum(ii), x_sum(jj));
					else
						freq_twice = min(x_sum(ii), x_sum(jj));
					end
					fprintf("\n%d %d\n", freq_twice, rep);
				end
			end
		end
	end

	return;

end



%% part 2 brute force

if 0
	n_bins = 2048;

	bins = {};
	for ii=1:n_bins
		bins{ii} = zeros(1, 0);
	end

	%bins

	tmp_sum = 0;
	idx = 0;
	freq_twice = inf;
	for nn=1:136
		for ii=1:length(x)
			tmp_sum += x(ii);
			idx = mod(tmp_sum, n_bins);
			for jj=1:length(bins{idx+1})
				if tmp_sum==bins{idx+1}(jj)
					freq_twice = tmp_sum
					return;
				end
			end
			bins{idx+1} = [bins{idx+1}, tmp_sum];
		end
	end

	%bins

	freq_twice

end
