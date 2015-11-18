Return-Path: <rjui@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Simran Rai <ssimran@broadcom.com>,
	Ray Jui <rjui@broadcom.com>
Subject: [PATCH 0/3] Add Cygnus audio clock support
Date: Wed, 18 Nov 2015 10:08:06 -0800
Message-ID: <1447870089-2382-1-git-send-email-rjui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

This patch series adds support for the Cygnus audio clock based on existing
iProc clock support

This patch series is developed based on v4.4-rc1 with full tree available
on GITHUB:
repo: https://github.com/Broadcom/cygnus-linux.git
branch: cygnus-audio-clk-v1

Simran Rai (3):
  Documentation: dt-bindings: Add DT bindings for Cygnus audio clock
  clk: iproc: Add support for Cygnus audio clocks
  ARM: dts: enable audio clock support for Cygnus

 .../bindings/clock/brcm,iproc-clocks.txt           |  6 +++
 arch/arm/boot/dts/bcm-cygnus-clock.dtsi            |  9 ++++
 drivers/clk/bcm/clk-cygnus.c                       | 59 ++++++++++++++++++++++
 drivers/clk/bcm/clk-iproc-pll.c                    | 41 +++++++++++++--
 drivers/clk/bcm/clk-iproc.h                        | 27 ++++++++++
 include/dt-bindings/clock/bcm-cygnus.h             |  6 +++
 6 files changed, 143 insertions(+), 5 deletions(-)

-- 
1.9.1
