Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-eopbgr20052.outbound.protection.outlook.com ([40.107.2.52]:22800
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750981AbdJBKcn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 2 Oct 2017 06:32:43 -0400
From: Adriana Reus <adriana.reus@nxp.com>
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: anson.huang@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Adriana Reus <adriana.reus@nxp.com>
Subject: [PATCH RESEND 0/2] Fixes for imx7d-ccm clock driver
Date: Mon,  2 Oct 2017 13:32:09 +0300
Message-Id: <1506940331-16742-1-git-send-email-adriana.reus@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The first patch sets the OCRAM_CLK parent to main_axi_root_clk instead of
axi_post_div.

The second patch removes the ARM_M0 clock.
IMX7d does not have an M0 and this clock is not otherwise used.

This is a RESEND of: https://www.spinics.net/lists/arm-kernel/msg595007.html
It has been idle for a long time.
Please let me know if there is anything specific that needs to be changed or
clarified or if they can be pushed.

Adriana Reus (2):
  clk: imx: imx7d: Fix parent clock for OCRAM_CLK
  clk: imx: imx7d: Remove ARM_M0 clock

 drivers/clk/imx/clk-imx7d.c             | 11 +----------
 include/dt-bindings/clock/imx7d-clock.h |  8 ++++----
 2 files changed, 5 insertions(+), 14 deletions(-)

-- 
2.7.4

