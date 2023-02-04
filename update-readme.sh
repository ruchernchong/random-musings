#!/usr/bin/env bash

cat /dev/null > README.md

echo -e '# Random Musings\n' >> README.md
echo -e 'A collection containing fun and interesting things I came across randomly.\n' >> README.md

GITHUB_USERNAME=ruchernchong
GITHUB_REPOSITORY=random-musings

dir=items
random_musings_array=()

for filename in "$dir"/*
do
  git_timestamp=$(git log --format="format:%ci" --diff-filter=A -- "$filename")
  date=($git_timestamp)
  random_musings_array+=("$date:$filename")
done

mapfile -t sorted_array < <(printf "%s\n" "${random_musings_array[@]}" | sort -r -k1,1 -t':')

jq -n '[]' > feed.json

for element in "${sorted_array[@]}"; do
  IFS=: read -r date filename <<< "$element"
  title=$(head -n 1 "$filename" | sed 's/# //')
  path=$(basename "$filename")
  content=$(cat "$filename")

  jq \
      --arg content "$content" \
      --arg date "$date" \
      --arg path "$path" \
      --arg title "$title" \
      '. += [{"content": $content, "date": $date, "path": $path, "title": $title}]' \
      feed.json > feed.json.tmp

  mv feed.json.tmp feed.json

  echo "- $date: [$title](https://github.com/$GITHUB_USERNAME/$GITHUB_REPOSITORY/blob/main/$filename)" >> README.md
done