Return-Path: <LW@karo-electronics.de>
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Anson Huang <b20788@freescale.com>,
	Bai Ping <b51503@freescale.com>,
	Frank Li <Frank.Li@freescale.com>,
	Fugang Duan <B38611@freescale.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	=?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pawel Moll <pawel.moll@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@arm.linux.org.uk>,
	Sascha Hauer <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: ARM: dts: imx6ul: add more functionality to i.MX6UL
Date: Fri,  4 Mar 2016 13:37:21 +0100
Message-Id: <1457095043-14115-1-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>, <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

[PATCHv3 1/2] ARM: dts: imx6ul: add support for Ka-Ro electronics TXUL modules
[PATCHv3 2/2] ARM: dts: imx6ul: add support for Ka-Ro electronics TXUL mainboard

This patchset adds more functionality to the i.MX6UL machines.

Changes vs. v1:
- added patch to implement KPP clock for i.MX6UL to prevent conflicts
  when this patch would go via a different tree.
- added board support for Ka-Ro electronics TX6UL module for the same
  reason
- added imx6ul specific compatibles as requested by Lucas Stach

Changes vs. v2:
- dropped patches which have already been applied in the meantime
- addressed comments by Shawn Guo
