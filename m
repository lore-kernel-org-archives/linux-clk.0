Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
	<alexandre.belloni@free-electrons.com>, <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
	<pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v2 0/2] clk: at91: add new driver for Flexcom
Date: Tue, 2 Jun 2015 18:57:17 +0200
Message-ID: <cover.1433264017.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

ChangeLog

v2:
- fix commit message

v1:
This series of patches introduces a new driver for the Atmel Flexcom.

Cyrille Pitchen (2):
  clk: at91: add a new compatible string for Flexcom in the DT
    documentation
  clk: at91: add Flexcom clock

 .../devicetree/bindings/clock/at91-clock.txt       |  20 +++
 arch/arm/mach-at91/Kconfig                         |   3 +
 drivers/clk/at91/Makefile                          |   1 +
 drivers/clk/at91/clk-flexcom.c                     | 160 +++++++++++++++++++++
 4 files changed, 184 insertions(+)
 create mode 100644 drivers/clk/at91/clk-flexcom.c

-- 
1.8.2.2

