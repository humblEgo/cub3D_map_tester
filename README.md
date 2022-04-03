# cub3D_map_tester

-test for the cub3D project at 42 school 42. (cursus42, june 2020)

안녕하세요~! 🖐 이 프로그램은 cub3D 프로그램이 [cub3D 프로젝트](https://github.com/moon9ua/42_seoul/wiki/2.-cub3D#cub3d)의 [맵 제약조건](https://github.com/moon9ua/42_seoul/wiki/2.-cub3D#chapter-4-%ED%95%84%EC%88%98-%ED%8C%8C%ED%8A%B8---cub3d) 요구사항을 잘 충족하는지 체크하는데 도움을 주기 위해 만들어졌습니다. 하단 설명을 참고하시어 코드작성 or 동료평가시 활용해보세요 🙂

![cub3d_map_tester](https://user-images.githubusercontent.com/54612343/83720405-f5973a00-a673-11ea-994a-c9cde59aa429.gif)

## 🍉 개요

- 이 프로그램은 invalid map 파일을 당신의 cub3D 프로그램에 전달합니다.
- 오류가 있는지 확인하기 위해서는 Return 메세지를 직접 확인해주셔야 합니다.
  - 만약 예외처리가 잘 되어있다면, 당신이 의도한 방식대로 error 메세지를 출력할 거에요.
  - **만약 예외처리가 잘 되어있지 않다면, 아래 두가지 동작이 예상됩니다.**
    1. **segfault, sigabort 등등 예기치 않은 error 메세지가 출력되는 경우**
    2. **cub3D가 작동해버리는 경우**
  - 만약 `valgrind`가 설치되어 있다면, `leaks` 디렉토리에 로그를 쌓을 수 있습니다. 옵션을 선택해보세요 :)
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

❗ 당신의 cub3D 프로그램이 `libmlx.dylib`을 활용한다면, `libmlx.dylib`가 tester가 위치한 directory에도 위치해있어야합니다. tester가 알아서 복사해줄테니 걱정마세요! :)

<details>
    <summary>시작할 때 count down이 거슬릴 경우</summary>
    <p> <br>-f 옵션을 넣어서 count down을 생략할 수 있습니다. 
    
    ./test_map_valid_function.sh -f
    
</p>   
</details>

<details>
    <summary>실행시 directory tree (using minilibx_opengl)</summary>
    <p> <br>결과적으로 test_map_valid_function.sh 의 상위 디렉토리에 cub3D 실행파일이 있으면 됩니다.
    
    
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

<details>
    <summary>실행시 directory tree (using minilibx_mms_20200219_beta)</summary>
    <p> <br> `test_map_valid_function.sh`과 `libmlx.dylib`을 같은 디렉토리에 위치시킵니다. 또한 그 디렉토리의 상위 디렉토리에 cub3D 실행파일이 위치하면 됩니다.
    
    
    .
    ├── cub3D
    ├── _cub3D_map_tester
    |   ├── test_map_valid_function.sh
    |   ├── libmlx.dylib
    |   ├── README.md
    |   ├── _images
    |   └── _maps
    |   ├── ...
    └── ...
    
    
</p>   
</details>

## 🍉 기타 테스트케이스

❗ **`F 255, 255, 255`로 주어지는 등 인자 사이에 공백이 있는 경우에는 제대로 작동하도록 처리해주세요!**

## 🍉 참고사항

1. 쉘스크립트로 테스트 자동화는 처음 시도해보는 것이라 더 학습하고 싶습니다.
   쉘스크립트 개선에 관하여 PR이나 ISSUE 남겨주세요! 감사히 배우겠습니다🙏

2. 맵 테스트케이스 추가를 원하신다면 역시 PR이나 ISSUE 남겨주시면 반영하겠습니다. 특히 과제 변경에 의한 이슈 있으면 적극 말씀 부탁드립니다🙏

3. 서브젝트 자체도 완벽하지 않다보니 '어느 수준까지 예외처리해야하는지' 여부를 따로 판단해보시길 추천드립니다. 개인적으로는 동료평가시 디펜스가 가능한지 여부를 기준으로 결정하면 좋지않을까 싶어요 :)

4. cub3D로 고통받고 계시다면, 아래 두 링크를 참고해주세요!

- [taelee42님의 mlx_example](https://github.com/taelee42/mlx_example)
- [yohlee님의 Porting by Lode's Computer Graphics Tutorial](https://github.com/l-yohai/cub3d)

기타 문의할 사항이 있으시다면 Slack ID iwoo로 DM 날려주세요~
혹시 이 테스터가 도움이 되셨다면 star 하나씩 눌러주시면 소소하게 기쁠 것 같습니다, 감사합니다~! :)

## 🍉 기여해주신 분

이 테스터를 만드는데 기여해주신 분들입니다. 기여해주셔서 감사합니다!! 👏👏

🇰🇷

- [jwon님](https://github.com/jwon42)
- [eunhkim님](https://github.com/eunhyulkim)
- [sjaehyeo님](https://github.com/QKRM)
- [nkang님](https://github.com/nKiNk)
- [eun-park님](https://github.com/p-eye)
- [ykoh님](https://github.com/kohyounghwan)
- [yeslee-v님](https://github.com/yeslee-v)
- [seushin님](https://github.com/seushin)
- [minjkim2님](https://github.com/minjune8506)

🇫🇷

- [bahaas](https://github.com/Korkrane)
