package com.hospital;

public class Solution {
    public static void main(String[] args) {
        System.out.println(fastPower(2, 1000000000));
    }
    static long fastPower(long base, long power){
        long res = 1;
        while(power > 0){
            //当指数为奇数的时候记入贡献
            if((power & 1) == 1){ //与运算快于模运算
                res = (res * base) % 1000; //(a * b) % c = ((a % c) * (b % c)) % c
            }
            power = power >>> 1; //右移运算快于除法运算
            base = (base * base) % 1000; //(a * b) % c = ((a % c) * (b % c)) % c
        }
        return res;
    }
}
