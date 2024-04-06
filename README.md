### 01 변수지정하기
```
<변수명> = <값>
```
---
예시입력
```
a = 0
b = 2
print(a)
print(b)
```
출력
```
0
2
```
---
### 02 함수지정하기
```
fun <함수명>(매개변수)
    실행할코드
end()
```
---
예시입력
```
fun add(a,b)
    print(a)
    print(b)
end()
add(5,1)
add(8,2)
```
출력
```
5
1
8
2
```
---
### 03 포맷팅
```
변수명
"$변수명"
```
---
예시
```
a = 12
b = a
c = "$b t"
print(b)
print("$b t")
print(c)
```
출력
```
12
12 t
12 t
```
### 04 연산
```
using math
Math("<연산할 식>")
```
---
예시
```
using math
a = 12
b = 10
c = Math("$a + $b")
print(c)
```
출력
```
22
```
### 05 시간 가져오기
```
using time
time.now()
time.time()
```
---
예시
```
using time
print(time.now())
print(time.time())
```
출력
```
0000-00-00T00:00:00.000000
0000000000000000
```