class Solution:
    def reverse(self, x: int) -> int:
        sign = -1 if x < 0 else 1
        x = abs(x)
        
        reverse = int(str(x)[::-1])
        reverse *= sign
        
        # Check 32-bit range AFTER reversing
        if reverse < -2**31 or reverse > 2**31 - 1:
            return 0
        
        return reverse
        