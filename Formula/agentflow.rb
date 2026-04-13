class Agentflow < Formula
  desc "Parallel and DAG orchestration for Claude, Codex, and Kimi agents"
  homepage "https://github.com/CodeshipAI/agentflow"
  url "https://github.com/CodeshipAI/agentflow.git", branch: "master"
  version "0.1.0"
  license "MIT"
  head "https://github.com/CodeshipAI/agentflow.git", branch: "master"

  depends_on "python@3.12"

  def install
    python3 = Formula["python@3.12"].opt_bin/"python3.12"
    system python3, "-m", "venv", libexec
    system libexec/"bin/pip", "install", "."
    bin.install_symlink libexec/"bin/agentflow"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/agentflow --help")
  end
end
