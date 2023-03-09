import os
import argparse
import json

parser = argparse.ArgumentParser(description='Create ImageNet-Drawing')
parser.add_argument('--source', type=str, default='path/to/imagenet/val', help="Path to source folder")
parser.add_argument('--target', type=str, default='path/to/imagenet/val', help="Path to target folder")

args = parser.parse_args()


def compare_dir_layout(dir1, dir2):
    def _compare_dir_layout(dir1, dir2):
        diff = None

        for (dirpath, dirnames, filenames) in os.walk(dir1):
            diff = diff if diff is not None else {dir: set() for dir in dirnames}
            relative_path = dirpath.replace(dir1, "")
            for filename in filenames:
                if not os.path.exists(dir2 + relative_path + '\\' + filename):
                    diff[relative_path[1:]].add(filename)
                    print(relative_path, filename)

        for (key, value) in diff.items():
            diff[key] = list(value)

        return diff

    print('files in "' + dir1 + '" but not in "' + dir2 + '"')
    missing = _compare_dir_layout(dir1, dir2)
    file = f"missing_in_{dir2.split(os.sep)[-2]}.json"
    with open(file, 'w', encoding='utf8') as json_file:
        json.dump(missing, json_file)

    print('files in "' + dir2 + '" but not in "' + dir1 + '"')
    missing = _compare_dir_layout(dir2, dir1)
    file = f"missing_in_{dir1.split(os.sep)[-2]}.json"
    with open(file, 'w', encoding='utf8') as json_file:
        json.dump(missing, json_file)


def main():
    compare_dir_layout(args.source, args.target)


if __name__ == '__main__':
    main()