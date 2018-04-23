Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:45831 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932295AbeDWTfQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Apr 2018 15:35:16 -0400
Received: by mail-wr0-f195.google.com with SMTP id p5-v6so16577852wre.12
        for <linux-clk@vger.kernel.org>; Mon, 23 Apr 2018 12:35:15 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc: carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 0/2] add support for the NAND clocks on Meson8b
Date: Mon, 23 Apr 2018 21:35:07 +0200
Message-Id: <20180423193509.30584-1-martin.blumenstingl@googlemail.com>
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

Changes since v3 at [2]:
- move the dt-bindings change into a separate patch
- do not export the mux and the divider as we only need to manage the
  left clock (in our case: the gate - the common clock framework will
  take care of the rest)

Changes since v2 at [1]:
- rebased on top of v4.17-rc1 and updated the clocks to use the new
  clk_regmap framework (as all other clocks in meson8b.c)

Changes since v1 at [0]:
- rebased so it still applies in 2018
- dropped mux table (since the known parents are values 0..4)
- replaced CLK_SET_RATE_NO_REPARENT with CLK_SET_RATE_PARENT on the mux
- added CLK_SET_RATE_PARENT on the divider
- fixed width of the divider (it's 7 bits wide, ranging from bit 0 to 6
  while v1 only used a width of 6 bits)


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-April/003237.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/005934.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2018-April/007134.html

Martin Blumenstingl (2):
  dt-bindings: clock: meson8b: export the NAND clock
  clk: meson: meson8b: add support for the NAND clocks

 drivers/clk/meson/meson8b.c              | 54 ++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h              |  5 ++-
 include/dt-bindings/clock/meson8b-clkc.h |  1 +
 3 files changed, 59 insertions(+), 1 deletion(-)

-- 
2.17.0

