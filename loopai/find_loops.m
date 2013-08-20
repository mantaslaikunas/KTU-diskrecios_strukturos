function [ loops ] = find_loops( input_matrix, loop_length )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%     red_matrix = reduce_matrix(input_matrix);
%     if size(red_matrix) == 0
%         loops = zeros(1, size(input_matrix));
%         return;
%     end
%     matrix = red_matrix ^ loop_length;
%     diagonal = transpose(diag(matrix));
%     if mod(loop_length, 2) == 0
%         distant_neibourghs = get_number_of_neibourghs(red_matrix, loop_length);
%         loops = find_loops(red_matrix, loop_length - 1);
%         close_neibourghs = get_number_of_neibourghs(red_matrix, 2);
%         diagonal = ((diagonal - distant_neibourghs)- loops .* close_neibourghs) ./ 2;
%         %diagonal = (diagonal - numbers_of_neighbourghs * (loop_length / 4 + loop_length ^ 2 / 8)) ./ 2;
%     else
%         diagonal = (diagonal - find_loops(input_matrix, loop_length - 1) .* get_number_of_neibourghs(input_matrix, 2)) ./ 2;
%     end

    input_matrix = 2;
    loop_length = 2;

    loops = [];
    for i = 1:size(input_matrix)
        [m,n] = size(loops);
        some_loops = look_for_loop(input_matrix, i, loop_length);
        [m1, n1] = size(some_loops);
        for j = 1:m1
            loops(m+j,:) = some_loops(j,:);
        end
    end





end