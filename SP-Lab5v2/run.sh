#! bin/bash
exec > ${PROJECT_DIR}/${PROJECT_NAME}/result.log 2>&1
(
sleep 1
${TARGET_BUILD_DIR}/${EXECUTABLE_NAME} < ${PROJECT_DIR}/${PROJECT_NAME}/input.txt
)&
