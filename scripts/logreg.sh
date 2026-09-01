CONFIG_DIR="/home/gpuhead-2/data_mining/DataMiningCourseProject/configs/logreg"
LOG_BASE_DIR="/home/gpuhead-2/data_mining/DataMiningCourseProject/logs/logreg_mbib"
TRAIN_DATASET_PATH="/home/gpuhead-2/data_mining/DataMiningCourseProject/data/mbib/mbib_balanced_trainval.csv"
TEST_DATASET_PATH="/home/gpuhead-2/data_mining/DataMiningCourseProject/data/mbib/mbib_balanced_trainval.csv"
MODEL_NAME="logreg"
CHECKPOINT_DIR="/home/gpuhead-2/data_mining/DataMiningCourseProject/checkpoints/logreg_mbib"

echo "Starting experiment runner..."
echo "--------------------------------"

for config_file in "$CONFIG_DIR"/*.yaml; do
    config_name=$(basename "$config_file" .yaml)

    echo "Running Experiment: $config_name"

    python main.py \
        --dataset "mbib" \
        --train_dataset_path "$TRAIN_DATASET_PATH" \
        --test_dataset_path "$TEST_DATASET_PATH" \
        --model_name "$MODEL_NAME" \
        --config_path "$config_file" \
        --train \
        --test\
        --log_dir "$LOG_BASE_DIR" \
        --checkpoint_dir "$CHECKPOINT_DIR"

    echo "Finished $config_name. Results saved to $current_log_dir"
    echo "--------------------------------"
done

echo "All experiments completed!"