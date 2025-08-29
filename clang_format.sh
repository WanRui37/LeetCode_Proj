#!/bin/bash

# 检查clang-format是否安装
if ! command -v clang-format &> /dev/null
then
    echo "错误: clang-format 未安装，请先安装 clang-format"
    exit 1
fi

# 定义要格式化的文件扩展名
EXTENSIONS=("cpp" "h" "hpp")

# 存储找到的文件列表
FILES=()

# 遍历每个扩展名，查找对应的文件
for ext in "${EXTENSIONS[@]}"; do
    # 递归查找当前目录下所有扩展名为$ext的文件
    while IFS= read -r -d '' file; do
        FILES+=("$file")
    done < <(find . -type f -name "*.$ext" -print0)
done

# 检查是否找到文件
if [ ${#FILES[@]} -eq 0 ]; then
    echo "未找到任何 .cpp, .h 或 .hpp 文件"
    exit 0
fi

# 显示找到的文件数量
echo "找到 ${#FILES[@]} 个文件，开始格式化..."

# 对每个文件执行clang-format
for file in "${FILES[@]}"; do
    echo "格式化: $file"
    clang-format -i "$file"
done

echo "格式化完成"
