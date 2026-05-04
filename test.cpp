#include <iostream>
#include <cstdint>

class Int{
    public:
        explicit Int(int num)&&{

        };
    private:
        uint32_t data_;
};

int main(void){
    std::cout << "Hello Pixed!\n";
    return 0;
}
