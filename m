Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E11C001DF
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 22:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbjG1W04 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 18:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbjG1W04 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 18:26:56 -0400
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE73448A
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 15:26:55 -0700 (PDT)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        by mail11.truemail.it (Postfix) with ESMTPA id E5F3A206DA;
        Sat, 29 Jul 2023 00:26:46 +0200 (CEST)
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jai Luthra <j-luthra@ti.com>
Cc:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1] clk: keystone: syscon-clk: Fix audio refclk
Date:   Sat, 29 Jul 2023 00:26:39 +0200
Message-Id: <20230728222639.110409-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Audio REFCLK's are not working correctly, trying to use them lead to the
following errors:

[    6.575277] of_clk_hw_onecell_get: invalid index 4294934528
[    6.581515] wm8904 1-001a: Failed to get MCLK
[    6.586290] wm8904: probe of 1-001a failed with error -2

The issue is that Audio REFCLK has #clock-cells = 0 [1], while the driver
is registering those clocks assuming they have one cells. Fix this by
registering the clock with of_clk_hw_simple_get() when there is only one
instance, e.g. "audio_refclk".

[1] Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml

Fixes: 6acab96ee337 ("clk: keystone: syscon-clk: Add support for audio refclk")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/clk/keystone/syscon-clk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
index d33f74119488..6b335ce5cc26 100644
--- a/drivers/clk/keystone/syscon-clk.c
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -151,8 +151,12 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
 				 data[i].name);
 	}
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-					   hw_data);
+	if (num_clks == 1)
+		return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+						   hw_data->hws[0]);
+	else
+		return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+						   hw_data);
 }
 
 #define TI_SYSCON_CLK_GATE(_name, _offset, _bit_idx)	\
-- 
2.25.1

