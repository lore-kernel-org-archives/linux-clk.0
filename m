Return-Path: <rjui@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Simran Rai <ssimran@broadcom.com>,
	Ray Jui <rjui@broadcom.com>
Subject: [PATCH v2 0/4] Add Cygnus audio clock support
Date: Mon, 23 Nov 2015 09:50:23 -0800
Message-ID: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

This patch series adds support for the Cygnus audio clock based on existing
iProc clock support

This patch series is developed based on v4.4-rc1 with full tree available
on GITHUB:
repo: https://github.com/Broadcom/cygnus-linux.git
branch: cygnus-audio-clk-v2

Changes from v1:
 - Remove function prototype of a non-exist function 'iproc_audiopll_clk_setup'
 - Remove __init macros from all functions prototypes in iproc-clk.h

Ray Jui (1):
  clk: iproc: Remove __init from header

Simran Rai (3):
  Documentation: dt-bindings: Add DT bindings for Cygnus audio clock
  clk: iproc: Add support for Cygnus audio clocks
  ARM: dts: enable audio clock support for Cygnus

 .../bindings/clock/brcm,iproc-clocks.txt           |  6 +++
 arch/arm/boot/dts/bcm-cygnus-clock.dtsi            |  9 ++++
 drivers/clk/bcm/clk-cygnus.c                       | 59 ++++++++++++++++++++++
 drivers/clk/bcm/clk-iproc-pll.c                    | 41 +++++++++++++--
 drivers/clk/bcm/clk-iproc.h                        | 43 ++++++++++++----
 include/dt-bindings/clock/bcm-cygnus.h             |  6 +++
 6 files changed, 148 insertions(+), 16 deletions(-)

-- 
1.9.1
