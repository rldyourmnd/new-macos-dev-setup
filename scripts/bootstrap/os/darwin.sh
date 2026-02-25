#!/usr/bin/env bash
set -euo pipefail

bootstrap_darwin() {
  ensure_homebrew
  source "${SCRIPT_DIR}/modules/system/system-tools.sh"
  source "${SCRIPT_DIR}/modules/system/shell-env.sh"
  source "${SCRIPT_DIR}/modules/system/containers.sh"
  source "${SCRIPT_DIR}/modules/system/stats.sh"
  source "${SCRIPT_DIR}/modules/technologies/js-ts.sh"
  source "${SCRIPT_DIR}/modules/technologies/python.sh"
  source "${SCRIPT_DIR}/modules/technologies/rust.sh"
  source "${SCRIPT_DIR}/modules/technologies/flutter.sh"
  source "${SCRIPT_DIR}/modules/technologies/java.sh"
  source "${SCRIPT_DIR}/modules/technologies/cpp.sh"
  source "${SCRIPT_DIR}/modules/technologies/ai-cli.sh"

  install_system_tools
  install_stats_optional
  install_container_stack
  install_java_stack
  install_node_stack
  install_python_stack
  install_rust_stack
  install_flutter_stack
  install_cpp_stack
  install_ai_cli_stack
  configure_shell_env
}
