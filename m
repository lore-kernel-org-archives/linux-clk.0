Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35600 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750923AbeAAVBx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Jan 2018 16:01:53 -0500
Received: by mail-wm0-f65.google.com with SMTP id a79so19250031wma.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Jan 2018 13:01:53 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc: carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/1] add support for the NAND clocks on Meson8b
Date: Mon,  1 Jan 2018 22:01:38 +0100
Message-Id: <20180101210139.29808-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds support for the NAND clocks found in the Meson8, Meson8b
and Meson8m2 SoCs.
The clocks consist of a simple gate, a divider and a mux. The mux
parents are not documented in the public S805 datasheet [0], so I
had to use a bit of math and take the vendor kernel as reference [1]
to find the actual parent clocks.
Some mux parents cannot be divided down without remainder to the
target clocks (as expected by the vendor NAND driver) these clocks
have the ROUND_CLOSEST flag set.

The new clocks are similar to gxbb_sd_emmc_c_clk0_sel,
gxbb_sd_emmc_c_clk0_div and gxbb_sd_emmc_c_clk0 on the GX SoCs.
Actual differences are:
- mux parents are re-ordered
- the gate is controlled by bit 8 (instead of bit 7 on GX)


Changes since v1 at [0]:
- rebased so it still applies in 2018
- dropped mux table (since the known parents are values 0..4)
- replaced CLK_SET_RATE_NO_REPARENT with CLK_SET_RATE_PARENT on the mux
- added CLK_SET_RATE_PARENT on the divider
- fixed width of the divider (it's 7 bits wide, ranging from bit 0 to 6
  while v1 only used a width of 6 bits)


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-April/003237.html


Martin Blumenstingl (1):
  clk: meson: meson8b: add support for the NAND clocks

 drivers/clk/meson/meson8b.c              | 51 ++++++++++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h              |  3 +-
 include/dt-bindings/clock/meson8b-clkc.h |  3 ++
 3 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.15.1

