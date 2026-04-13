class Agentflow < Formula
  include Language::Python::Virtualenv

  desc "Parallel and DAG orchestration for Claude, Codex, and Kimi agents"
  homepage "https://github.com/CodeshipAI/agentflow"
  url "https://github.com/CodeshipAI/agentflow.git", branch: "master"
  version "0.1.0"
  license "MIT"
  head "https://github.com/CodeshipAI/agentflow.git", branch: "master"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--no-deps", *std_pip_args(build_isolation: true), "."
    system libexec/"bin/pip", "install",
      "boto3>=1.35.0",
      "fastapi>=0.116.0",
      "httpx>=0.28.1",
      "jinja2>=3.1.6",
      "pydantic>=2.11.0",
      "PyYAML>=6.0.2",
      "typer>=0.16.0",
      "uvicorn>=0.35.0"
    bin.install_symlink Dir[libexec/"bin/agentflow"]
  end

  test do
    assert_match "Usage", shell_output("#{bin}/agentflow --help")
  end
end
