class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        int index = 0;  // 用于记录不等于val的元素位置
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] != val) {
                nums[index++] = nums[i];  // 直接在原数组上覆盖
            }
        }
        return index;  // 返回新的长度
    }
};