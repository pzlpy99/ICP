import Array "mo:base/Array";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
actor {
    func quicksort(arr:[Int]) : [Int] {
        var newArr:[var Int] = Array.thaw(arr);
        sort(newArr,0,newArr.size()-1);
        Array.freeze(newArr)
    };

    func sort(arr:[var Int],low:Nat,high:Nat){
        if(low>=high) return;
        var temp = arr[low];
        var leftIndex = low;
        var rightIndex = high;
        while(leftIndex < rightIndex){
            while(arr[rightIndex] >= temp and rightIndex > leftIndex){
                rightIndex -= 1;
            };
            arr[leftIndex] := arr[rightIndex];
            while(arr[leftIndex] <= temp and leftIndex < rightIndex){
                leftIndex += 1;
            };
            arr[rightIndex] := arr[leftIndex];
        };
        arr[rightIndex] := temp;
        if(leftIndex >= 1) sort(arr,low,leftIndex-1);
        sort(arr,leftIndex+1,high);
    };

    public func qsort(arr:[Int]) : async [Int] {
        quicksort(arr)
    };
};