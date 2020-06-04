# cub3D_map_tester
-test for the cub3D project at 42 school 42. (cursus42, june 2020)


안녕하세요~! 🖐 이 프로그램은 cub3D 프로그램이 [cub3D 프로젝트](https://github.com/moon9ua/42_seoul/wiki/2.-cub3D#cub3d)의 [맵 제약조건](https://github.com/moon9ua/42_seoul/wiki/2.-cub3D#chapter-4-%ED%95%84%EC%88%98-%ED%8C%8C%ED%8A%B8---cub3d) 요구사항을 잘 충족하는지 체크하는데 도움을 주기 위해 만들어졌습니다. 하단 설명을 참고하시어 코드작성 or 동료평가시 활용해보세요 🙂

## 개요

- 이 프로그램은 invalid map 파일을 당신의 cub3D 파일에 전달합니다. 
- 오류가 있는지 확인하기 위해서는 Return 메세지를 직접 확인해주셔야 합니다.
  - 만약 예외처리가 잘 되어있다면, 당신이 의도한 방식대로 error 메세지를 출력할 거에요.
  - **만약 예외처리가 잘 되어있지 않다면, 아래 두가지 동작이 예상됩니다.**
      1. **segfault, sigabort 등등 예기치 않은 error 메세지가 출력되는 경우**
      2. **cub3D가 작동해버리는 경우**
- invalid map는 `maps` 디렉토리 안에 있습니다. 참고하여 예외처리 진행하시면 됩니다.


## 🍉 설치 및 실행

1. Move to directory where your cub3D file exist
2. Clone this repository
    ```console
    git clone https://github.com/humblEgo/cub3D_map_tester.git
    ```
3. Move to cub3D_map_tester directory
   ```console
   cd cub3D_map_tester
   ```
4. Execute **test_map_valid_function.sh**
    ```console
    ./test_map_valid_function.sh
    ```


<details>
    <summary>👉 시작할 때 count down이 거슬릴 경우</summary>
    <p> <br>-f 옵션을 넣어서 count down을 생략할 수 있습니다. 
    
    ./test_map_valid_function.sh -f
    
</p>   
</details>


<details>
    <summary>👉 실행시 directory tree</summary>
    <p> <br>결과적으로 test_map_valid_function.sh 의 상위폴더에 cub3D 실행파일이 있으면 됩니다.
    
    
    .
    ├── cub3D
    ├── _cub3D_map_tester
    |   ├── test_map_valid_function.sh
    |   ├── README.md
    |   ├── _images
    |   └── _maps
    |   ├── ...
    └── ...
    
    
</p>   
</details>



## 🍉 TEST COVERAGE

test파일은 'test_{TYPE}{NUMBER}.cub' 형식으로 되어있습니다. 
각 TYPE, NUMBER별 케이스는 아래와 같습니다.
   
| 요소       | 요소2    | R   | W   | FC       | I   | MAP                  |
| ---------- | -------- | --- | --- | -------- | --- | -------------------- |
| 형식 개수  | 0개      | 6   | 6   | 7        | 4   |                      |
|            | 2개      | 7   | 2   | 6        | 3   |                      |
| 인자 개수  | 0개      | 8   | 7   | 11       | 5   | 18                   |
|            | 1개      | 2   |     |          |     |                      |
|            | 2개      |     | 3   | 4,5      | 6   | 19,20                |
|            | 3개      | 1   |     |          |     |                      |
| 형식 값    | 오타     | 9   | 5   | 8        | 7   |                      |
|            | 중복     | 5   | 1   | 1        | 2   |                      |
| 인자 값    | 오타     | 10  | 4   | 3,9,10,2 | 1   | 1                    |
|            | 범위초과 | 3,4 |     |          |     |                      |
| player개수 | 0개      |     |     |          |     | 3                    |
|            | 2개 이상 |     |     |          |     | 2, 13                |
| open map   | no tab   |     |     |          |     | 4,5,6,7,8,9,10,11,12 |
|            | with tab |     |     |          |     | 17                   |
| out of map |          |     |     |          |     | 14, 15               |
| 맵 위치    |          |     |     |          |     | 16                   |

ex)
`R 640 480`을 예로들면 `R`은 '형식'이라 간주하고 `640 480`은 '인자'라고 간주했습니다.
따라서 `test_R1`의 경우 인자개수가 3개인 테스트 맵파일입니다.

## 🍉 참고사항

1. 쉘스크립트로 테스트 자동화는 처음 시도해보는 것이라 더 학습하고 싶습니다.
쉘스크립트 개선에 관하여 PR이나 ISSUE 남겨주세요! 감사히 배우겠습니다🙏

2. 맵 테스트케이스 추가를 원하신다면 역시 PR이나 ISSUE 남겨주시면 반영하겠습니다.

3. cub3D로 고통받고 계시다면, [taelee42님의 mlx_example](https://github.com/taelee42/mlx_example)을 참고해보세요.

기타 문의할 사항이 있으시다면 Slack ID iwoo로 DM 날려주세요~ :)