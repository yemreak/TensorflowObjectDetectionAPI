python ../../../scripts/preprocessing/xml_to_csv.py -i ../images/train -o ../images/train_labels.csv
python ../../../scripts/preprocessing/xml_to_csv.py -i ../images/test -o ../images/test_labels.csv
python ../../../scripts/preprocessing/generate_tfrecord.py --label_map=./label_map.pbtxt --img_path=..\images\train --csv_input=../images/train_labels.csv --output_path=./train.record
python ../../../scripts/preprocessing/generate_tfrecord.py --label_map=./label_map.pbtxt --img_path=..\images\test --csv_input=../images/test_labels.csv --output_path=./test.record
