class Agentflow < Formula
  desc "Parallel and DAG orchestration for Claude, Codex, and Kimi agents"
  homepage "https://github.com/CodeshipAI/agentflow"
  url "https://github.com/CodeshipAI/agentflow.git", branch: "master"
  version "0.1.0"
  license "MIT"
  head "https://github.com/CodeshipAI/agentflow.git", branch: "master"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "Usage", shell_output("#{bin}/agentflow --help")
  end
end
