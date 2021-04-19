cd ..

path_to_cased_vocab_bert=PIE_ckpt/vocab.txt #bert's cased vocab path
data_dir=scratch/dev

mkdir -p $data_dir/pickles

#preprocessing consists of 2 steps
# 1. extract the common inserts (\Sigma_a in the paper):
# Example usage:
#python get_edit_vocab.py \
#    --vocab_path="$path_to_cased_vocab_bert" \
#    --incorr_sents=$data_dir/X_train.txt \
#    --correct_sents=$data_dir/y_train.txt \
#    --common_inserts_dir=$data_dir/pickles \
#    --size_insert_list=1000 \
#    --size_delete_list=1000

# 2. extract edits from incorrect and correct sentence pairs
# Example usage:
python get_seq2edits.py \
    --vocab_path="$path_to_cased_vocab_bert" \
    --common_inserts_dir=$data_dir/pickles \
    --incorr_sents=$data_dir/X_test.txt \
    --correct_sents=$data_dir/y_test.txt \
    --incorr_tokens=$data_dir/test_incorr_tokens.txt \
    --correct_tokens=$data_dir/test_corr_tokens.txt \
    --incorr_token_ids=$data_dir/test_incorr.txt \
    --edit_ids=$data_dir/test_labels.txt