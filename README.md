# Lock
数电作业：设计一个电子密码锁

## 题目
设计一个电子密码锁，在锁开的状态下输入密码，设置的密码共4位，用数据开关K1=K10分别代表数字1,2,….9,0,输入的密码用数码管显示，最后输入的密码显示在最右边的数码管上，即每输入一位数，密码在数码管上的显示左移一位。可删除输入的数字，删除的是最后输入的数字，每删除一位，密码在数码管的显示右移一位，并在左边空出的位上补充“0”。用一位输出电平的状态代表锁的开闭状态。为保证密码锁的主人能打开密码锁，设置一个万能密码，在主人忘记密码时使用。
## 开发环境
使用的开发环境为一个运行在Windows XP上的Xilinx ISE 14.7
## 算法流程图
![picture](/img/picture.png)
## 仿真波形图
![picture2](/img/win.png)

## License

GNU General Public License v3

Copyright (C) 2018 by zzp <zhang9zp970@gmail.com>

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

![gpl](/img/GPLv3_Logo.png)
