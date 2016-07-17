Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 0/6] Add Amlogic meson8b clock gates
Date: Sun, 17 Jul 2016 20:44:45 +0200
Message-Id: <1468781091-39119-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This patch series adds support for the Amlogic meson8b clock gates. The Amlogic
U-Boot disables most of them at boot. In order to enable ethernet, USB and other
components it's mandatory to enable the clock gates when loading the corresponding
drivers.

The meson8b clock gate support is based on the previous work done for Amlogic gxbb
currently available in clk-next.

Changes since v2:
  - Added commit description for patch 2
  - Changed CLK_NR_CLOCKS macro to constant int
  - Moved back MESON_GATE macro to share it between gxbb and meson8b

Changes since v1:
  - Fixed GXBB spelling
  - Moved newly introduced CLKID defines to private header
  - Moved CLK_NR_CLKS define from DT binding to private header
  - Rebased to linux-amlogic/v4.7/integ making Kconfig select obsolete

Alexander Müller (6):
  clk: meson: Rename meson8b-clkc.c to reflect gxbb naming convention
  meson: clk: Move register definitions to meson8b.h
  meson: clk: Rename register names according to Amlogic datasheet
  clk: meson: Copy meson8b CLKID defines to private header file
  gxbb: clk: Adjust MESON_GATE macro to be shared with meson8b
  meson: clk: Add support for clock gates

 drivers/clk/meson/Makefile                      |   2 +-
 drivers/clk/meson/clkc.h                        |   2 +-
 drivers/clk/meson/gxbb.c                        | 162 ++++++-------
 drivers/clk/meson/{meson8b-clkc.c => meson8b.c} | 293 +++++++++++++++++++++---
 drivers/clk/meson/meson8b.h                     | 148 ++++++++++++
 include/dt-bindings/clock/meson8b-clkc.h        |   2 -
 6 files changed, 494 insertions(+), 115 deletions(-)
 rename drivers/clk/meson/{meson8b-clkc.c => meson8b.c} (52%)
 create mode 100644 drivers/clk/meson/meson8b.h

-- 
2.5.0
