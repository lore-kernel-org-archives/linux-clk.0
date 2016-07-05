Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/7] Add Amlogic meson8b clock gates
Date: Tue,  5 Jul 2016 19:56:24 +0200
Message-Id: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This patch series adds support for the Amlogic meson8b clock gates. The Amlogic
U-Boot disables most of them at boot. In order to enable ethernet, USB and other
components it's mandatory to enable the clock gates when loading the corresponding
drivers.

The meson8b clock gate support is based on the previous work done for Amlogic gxbb
currently available in clk-next.

Alexander Müller (7):
  clk: meson: Rename meson8b-clkc.c to reflect gxbb naming convention
  meson: clk: Move register definitions to meson8b.h
  meson: clk: Rename register names according to Amlogic datasheet
  meson: clk: Add CLKIDs for DT binding
  gxbb: clk: Move MESON_GATE macro to gxbb
  meson: clk: Add support for clock gates
  arm: amlogic: select meson8b clk driver

 arch/arm/mach-meson/Kconfig              |   2 +
 drivers/clk/meson/Makefile               |   2 +-
 drivers/clk/meson/clkc.h                 |  14 -
 drivers/clk/meson/gxbb.c                 | 176 ++++----
 drivers/clk/meson/meson8b-clkc.c         | 458 --------------------
 drivers/clk/meson/meson8b.c              | 706 +++++++++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h              |  44 ++
 include/dt-bindings/clock/meson8b-clkc.h |  79 +++-
 8 files changed, 926 insertions(+), 555 deletions(-)
 delete mode 100644 drivers/clk/meson/meson8b-clkc.c
 create mode 100644 drivers/clk/meson/meson8b.c
 create mode 100644 drivers/clk/meson/meson8b.h

-- 
2.5.0
