#include <cstdio>
#include <fstream>
#include <iostream>
#include <cstdlib>
#include <assert.h>

int main(int argc, char** argv)
{
    if (argc != 3)
        throw "wrong number of args";
    
    const int k = 1;
    auto gt_file = std::ifstream(argv[1]);
    auto answers_file = std::ifstream(argv[2]);

    const size_t query_size = 10000;
    int gt[100*query_size], answers[k*query_size];
    
    float counter = 0;
    for (size_t i = 0 ; i < query_size; i++){
        int gt_d = 0;
        gt_file.read((char *) &gt_d, sizeof(gt_d));
        gt_file.read((char *) (gt + gt_d*i), gt_d*sizeof(int));

        int a_d = 0;
        answers_file.read((char *) &a_d, sizeof(a_d));
        assert(k == a_d);
        answers_file.read((char *) (answers + a_d*i), a_d*sizeof(int));
        for (size_t j = 0; j < k; j++)
            counter += answers[k*i + j] == gt[gt_d*i + j];
        
    }
    std::cout << "Recall@1: " << counter / (k * query_size) << std::endl;
}
