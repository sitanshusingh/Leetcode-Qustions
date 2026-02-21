class Solution:
    def isPalindrome(self, x: int) -> bool:
        result = 0
        original = x 
        while x > 0:
            digit = x%10
            result = (result * 10) + digit
            x = x//10
        if result == original:
            return True
        else:
            return False