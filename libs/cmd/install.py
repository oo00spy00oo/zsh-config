from rich.console import Console
from rich.markdown import Markdown
import os
import subprocess
from libs.homebrew import Homebrew
from libs.pip import Pip
from libs.location import Location
from libs.version_manager import VersionManager
from libs.node import Node
from libs.kubernetes import Kubernetes
from libs.utils import Utils

class Install:

    def __init__(self):
        self.console = Console()
        self.location = Location()
        self.utils = Utils()

        self.prefix_cmd = "sh $HOME/" + self.location.INSTALL_LOCATION

    def homebrew(self):
        brew = Homebrew()

        tasks = {
            0: "All",
            1: "Formulae",
            2: "Cask",
        }

        self.console.rule("Choosing provider?")
        self.utils.tasks_print(tasks)

        choice = self.console.input("What is your [bold red]choice[/]? :smiley: ")
        self.console.print(f'You entered {choice}')
        choice = int(choice)

        if choice == 0:
            self.homebrew_formulae()
            self.homebrew_cask()
        elif choice == 1:
            self.homebrew_formulae()
        elif choice == 2:
            self.homebrew_cask()

        self.console.print("Installing [bold red]DevOps Tools[/] from [bold magenta]Homebrew[/]...")
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_FORMULAE + self.location.DEVOPS_TOOLS_FILE))
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_CASK + self.location.DEVOPS_TOOLS_FILE), True)

        self.console.print("Installing [bold red]Desktop Application[/] from [bold magenta]Homebrew[/]...")
        brew.exec_single(self.utils.absolute_location(self.location.HOMEBREW_FORMULAE + self.location.DESKTOP_APPICATION_FILE))
        brew.exec_single(self.utils.absolute_location(self.location.HOMEBREW_CASK + self.location.DESKTOP_APPICATION_FILE), True)

        self.console.print("Installing [bold red]Font[/] from [bold magenta]Homebrew[/]...")
        brew.tap("homebrew/cask-fonts")
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_FORMULAE + self.location.FONT_FILE))
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_CASK + self.location.FONT_FILE), True)

    def homebrew_formulae(self):
        brew = Homebrew()
        self.console.print("Installing [bold red]CLI Tools[/] from [bold magenta]Homebrew[/]...")
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_FORMULAE + self.location.CLI_FILE))
        self.console.print("Installing [bold red]DevOps Tools[/] from [bold magenta]Homebrew[/]...")
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_FORMULAE + self.location.DEVOPS_TOOLS_FILE))
        self.console.print("Installing [bold red]Desktop Application[/] from [bold magenta]Homebrew[/]...")
        brew.exec_single(self.utils.absolute_location(self.location.HOMEBREW_FORMULAE + self.location.DESKTOP_APPICATION_FILE))
        self.console.print("Installing [bold red]Font[/] from [bold magenta]Homebrew[/]...")
        brew.tap("homebrew/cask-fonts")
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_FORMULAE + self.location.FONT_FILE))

    def homebrew_cask(self):
        brew = Homebrew()
        self.console.print("Installing [bold red]CLI Tools[/] from [bold magenta]Homebrew[/]...")
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_CASK + self.location.CLI_FILE), True)
        self.console.print("Installing [bold red]DevOps Tools[/] from [bold magenta]Homebrew[/]...")
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_CASK + self.location.DEVOPS_TOOLS_FILE),True)
        self.console.print("Installing [bold red]Desktop Application[/] from [bold magenta]Homebrew[/]...")
        brew.exec_single(self.utils.absolute_location(self.location.HOMEBREW_CASK + self.location.DESKTOP_APPICATION_FILE), True)
        self.console.print("Installing [bold red]Font[/] from [bold magenta]Homebrew[/]...")
        brew.tap("homebrew/cask-fonts")
        brew.exec_multiple(self.utils.absolute_location(self.location.HOMEBREW_CASK + self.location.FONT_FILE), True)

    def sdkman(self):
        self.console.print()
        self.console.print("Installing [bold red]SDK Man[/] packages..")
        cmd = self.prefix_cmd + "sdkman.sh"
        os.system(cmd)
        # sdkman_thread = subprocess.Popen(["sh", "install/sdkman.sh"])
        # sdkman_thread.wait()

    def version_manager(self):
        vm = VersionManager()
        vm.run()

    def pip(self):
        pip = Pip()

        self.console.print()
        self.console.print("Installing [bold red]pip[/] packages...")
        pip.exec_single(self.utils.absolute_location(self.location.PIP + self.location.PIP_FILE))

    def node(self):
        node = Node()
        self.console.print()
        self.console.print("Installing [bold red]Node[/] packages...")
        node.yarn(self.utils.absolute_location(self.location.NODE + self.location.YARN_FILE))

    def kubernetes_plugins(self):
        kubernetes = Kubernetes()
        self.console.print()
        self.console.print("Installing [bold red]Kubernetes Plugins[/]...")
        kubernetes.krew(self.utils.absolute_location(self.location.KUBERNETES + self.location.KREW_FILE))

    def awscli(self):
        self.console.print()
        self.console.print("Installing [bold red]AWS CLI v2[/]...")
        cmd = self.prefix_cmd + "awscli.sh"
        os.system(cmd)

    def go(self):
        self.console.print()
        self.console.print("Installing [bold red]Go[/] packages...")
        cmd = self.prefix_cmd + "go.sh"
        os.system(cmd)

    def run(self):
        tasks = {
            0: "All",
            1: "Homebrew",
            2: "SDK Man",
            3: "Version Manager",
            4: "Kubernetes Plugins",
            5: "pip",
            6: "node",
            7: "awscli",
            8: "go",
        }

        self.console.rule("Install package from?")
        self.utils.tasks_print(tasks)

        choice = self.console.input("What is your [bold red]choice[/]? :smiley: ")
        self.console.print(f'You entered {choice}')
        choice = int(choice)

        if choice == 0:
            self.homebrew()
            self.sdkman()
            self.version_manager()
            self.kubernetes_plugins()
            self.pip()
            self.node()
            self.awscli()
            self.go()
        elif choice == 1:
            self.homebrew()
        elif choice == 2:
            self.sdkman()
        elif choice == 3:
            self.version_manager()
        elif choice == 4:
            self.kubernetes_plugins()
        elif choice == 5:
            self.pip()
        elif choice == 6:
            self.node()
        elif choice == 7:
            self.awscli()
        elif choice == 8:
            self.go()