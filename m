Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:49342 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750791AbdJFGeH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Oct 2017 02:34:07 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 0/2] Add a regmap to Allwinner R40 CCU to export GMAC register
Date: Fri,  6 Oct 2017 14:33:31 +0800
Message-Id: <20171006063333.12345-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

In the CCU of the Allwinner R40 SoC, there's a GMAC configuration register,
which is intended to be accessed by the dwmac-sun8i driver. On SoCs already
supported by the driver the register is placed in the syscon rather than
the CCU.

As CCU is a critical part of the SoC, so write to it should be strictly
limited. A regmap with restricted write permission is created by the R40
CCU driver, and can be get with dev_get_regmap. In order to tie the regmap
to the CCU device, the R40 CCU is now a platform driver, so a platform
device is created for it (and then tied with the regmap).

The first patch does the conversion of the driver to a platform driver,
and the second patch adds the regmap.

Icenowy Zheng (2):
  clk: sunxi-ng: r40: rewrite init code to a platform driver
  clk: sunxi-ng: r40: export a regmap to access the GMAC register

 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 69 ++++++++++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 10 deletions(-)

-- 
2.13.6

