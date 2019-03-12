for i in {1..19}
do
    echo ${i}
    ./build/tests/test_nsg_optimized_search ../data/sift/sift_base.fvecs ../data/sift/sift_query.fvecs sift.nsg ${i} 1 sift_output.ivecs 
    ./compute_recall ../data/sift/sift_groundtruth.ivecs sift_output.ivecs 
done

for i in {20..100..10}
do
    echo ${i}
    ./build/tests/test_nsg_optimized_search ../data/sift/sift_base.fvecs ../data/sift/sift_query.fvecs sift.nsg ${i} 1 sift_output.ivecs
    ./compute_recall ../data/sift/sift_groundtruth.ivecs sift_output.ivecs
done
