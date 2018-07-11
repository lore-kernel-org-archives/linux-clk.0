Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 4.19
Date: Wed, 11 Jul 2018 16:22:04 +0200
Message-ID: <9241272.zrLup0OXSE@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below the pull request for 4.19 Rockchip clock updates.
As the tag describes this contains the px30 clock controller including
its new clock type of a "half-divider", as well as a small fix for wrong
register values that is present since the beginning of rk3399 support.

Please pull
Heiko


The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.19-rockchip-clk1

for you to fetch changes up to a64ad008980c65d38e6cf6858429c78e6b740c41:

  clk: rockchip: fix clk_i2sout parent selection bits on rk3399 (2018-07-08 00:19:19 +0200)

----------------------------------------------------------------
Support for Rockchip's PX30 SoC including its new half-divider
clock type that is doing freq_out = 2*freq_in / (2*div + 3).
As well as a register-bit fix for the rk3399 i2sout clock.

----------------------------------------------------------------
Alberto Panizzo (1):
      clk: rockchip: fix clk_i2sout parent selection bits on rk3399

Elaine Zhang (4):
      clk: rockchip: add dt-binding header for px30
      dt-bindings: add bindings for px30 clock controller
      clk: rockchip: add support for half divider
      clk: rockchip: add clock controller for px30

Heiko Stuebner (1):
      Merge branch 'v4.19-shared/clkids' into v4.19-clk/next

 .../bindings/clock/rockchip,px30-cru.txt           |   65 ++
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-half-divider.c            |  227 +++++
 drivers/clk/rockchip/clk-px30.c                    | 1039 ++++++++++++++++++++
 drivers/clk/rockchip/clk-rk3399.c                  |    2 +-
 drivers/clk/rockchip/clk.c                         |   10 +
 drivers/clk/rockchip/clk.h                         |  126 ++-
 include/dt-bindings/clock/px30-cru.h               |  389 ++++++++
 8 files changed, 1858 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,px30-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-half-divider.c
 create mode 100644 drivers/clk/rockchip/clk-px30.c
 create mode 100644 include/dt-bindings/clock/px30-cru.h
