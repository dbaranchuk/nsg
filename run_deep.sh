for i in {1..19}
do
    echo ${i}
    ./build/tests/test_nsg_optimized_search ../data/deep/deep_base.fvecs ../data/deep/deep_query.fvecs deep.nsg ${i} 1 deep_output.ivecs 
    ./compute_recall ../data/deep/deep_groundtruth.ivecs deep_output.ivecs 
done

for i in {20..100..10}
do
    echo ${i}
    ./build/tests/test_nsg_optimized_search ../data/deep/deep_base.fvecs ../data/deep/deep_query.fvecs deep.nsg ${i} 1 deep_output.ivecs
    ./compute_recall ../data/deep/deep_groundtruth.ivecs deep_output.ivecs
done
