Vim�UnDo� �6����]����'��ǏP%�PX��9�   "                                        ^�VP    _�                             ����                                                                                                                                                                                                                                                                                                                                                             ^�T;     �                  �               �                      	# Two Sum   #    3# [Easy] [AC:45.4% 2.9M of 6.4M] [filetype:python3]   #    k# Given an array of integers, return indices of the two numbers such that they add up to a specific target.   #    m# You may assume that each input would have exactly one solution, and you may not use the same element twice.   #    
# Example:   #    *# Given nums = [2, 7, 11, 15], target = 9,   #    (# Because nums[0] + nums[1] = 2 + 7 = 9,   #    # return [0, 1].   #    # [End of Description]:�               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�TK     �                         5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�TQ     �                       e5�_�                       @    ����                                                                                                                                                                                                                                                                                                                                                             ^�TX     �                 @    def twoSum(self, nums: List[int], target: int) -> List[int]:5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�Tf     �                         res = [-1, -1]5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�Tp     �                         seen = {}5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�Tp     �                         5�_�      	                 "    ����                                                                                                                                                                                                                                                                                                                                                             ^�Tz     �                 #        for idx, val in enumerate()5�_�      
           	      (    ����                                                                                                                                                                                                                                                                                                                                                             ^�T~     �                 (        for idx, val in enumerate(nums):5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             ^�T�     �                             if val in seen:5�_�   
                    "    ����                                                                                                                                                                                                                                                                                                                                                             ^�T�     �                 "                res[0] = seen[val]5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�T�     �                                 res[1] = idx5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�T�     �                                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�T�     �                             5�_�                       $    ����                                                                                                                                                                                                                                                                                                                                                             ^�U     �                 $            seen[target - val] = idx5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�U     �                             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^�U
     �                         return res5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^�VO    �              �                            �                # �                # �                # �                # �   	             # �                # �                # �                # 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�U!    �                #�                #�                #�   	             #�                #�                #�                #�                #�                 �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^�U�     �       #           �                	# Two Sum   #    3# [Easy] [AC:45.4% 2.9M of 6.4M] [filetype:python3]   #    k# Given an array of integers, return indices of the two numbers such that they add up to a specific target.   #    m# You may assume that each input would have exactly one solution, and you may not use the same element twice.   #    
# Example:   #    *# Given nums = [2, 7, 11, 15], target = 9,   #    (# Because nums[0] + nums[1] = 2 + 7 = 9,   #    # return [0, 1].   #    # [End of Description]:�                     	# Two Sum   #    3# [Easy] [AC:45.4% 2.9M of 6.4M] [filetype:python3]   #    7# Given an array of integers, return indices of the two   5# numbers such that they add up to a specific target.   #    7# You may assume that each input would have exactly one   7# solution, and you may not use the same element twice.   #    
# Example:   #    *# Given nums = [2, 7, 11, 15], target = 9,   #    (# Because nums[0] + nums[1] = 2 + 7 = 9,   #    # return [0, 1].   #    # [End of Description]:�                class Solution:   @    def twoSum(self, nums: List[int], target: int) -> List[int]:           �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�V4     �                       e5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�V1     �                       e5��