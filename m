Return-Path: <grandpaul@gmail.com>
Return-Path: <grandpaul@gmail.com>
Sender: PaulLiu <grandpaul@gmail.com>
From: "Ying-Chun Liu (PaulLiu)" <paulliu@debian.org>
To: linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: yliu@ucrobotics.com,
	"Ying-Chun Liu (PaulLiu)" <paulliu@debian.org>
Subject: [PATCH] clk: owl: Init submit for Actions s900 SoC clock driver
Date: Mon,  1 Aug 2016 23:20:38 +0800
Message-Id: <1470064839-3449-1-git-send-email-paulliu@debian.org>
List-ID: <linux-clk.vger.kernel.org>

Dear Maintainers,

I'm working on submitting the patches to enable Bubblegum-96 board which
uses Actions s900 SoC. To enable the board as minimum requirement. I need
to submit the clock/reset drivers and the dtbs. Please kindly review my
patches for the clock driver. The other drivers will be submitted to other
relate branches.

Yours Sincerely,
Paul

Ying-Chun Liu (PaulLiu) (1):
  clk: owl: add initial Actions s900 clock driver

 .../bindings/clock/actions,s900-clock.txt          |  45 ++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/owl/Makefile                           |   5 +
 drivers/clk/owl/clk-factor.c                       | 284 ++++++++++
 drivers/clk/owl/clk-pll.c                          | 371 +++++++++++++
 drivers/clk/owl/clk-s900.c                         | 616 +++++++++++++++++++++
 drivers/clk/owl/clk.c                              | 461 +++++++++++++++
 drivers/clk/owl/clk.h                              | 369 ++++++++++++
 include/dt-bindings/clock/actions,s900-clock.h     | 140 +++++
 9 files changed, 2292 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/actions,s900-clock.txt
 create mode 100644 drivers/clk/owl/Makefile
 create mode 100644 drivers/clk/owl/clk-factor.c
 create mode 100644 drivers/clk/owl/clk-pll.c
 create mode 100644 drivers/clk/owl/clk-s900.c
 create mode 100644 drivers/clk/owl/clk.c
 create mode 100644 drivers/clk/owl/clk.h
 create mode 100644 include/dt-bindings/clock/actions,s900-clock.h

-- 
2.8.1
