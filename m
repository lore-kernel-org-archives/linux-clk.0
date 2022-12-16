Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6910CC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 16 Dec 2022 21:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbiLPVJg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 16:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiLPVJf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 16:09:35 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81C86B207
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 13:09:34 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2909E85175;
        Fri, 16 Dec 2022 22:09:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1671224973;
        bh=3MGgi4uKVr3bC4TfYyOS+IA3xRyMpBGwgdgWe9ZN0/I=;
        h=From:To:Cc:Subject:Date:From;
        b=jrjn01u6br4fSM9ldgxRxPcfIiws4r64jDnxaIYlmWdslm7RkVH3tfrrgXLI5KG+D
         Jf6wk6oF75MtCmbvuu9NoMsLWSM8vtiIWnOzCRRibhMEskAnsNiAwyvJQ8yTqIyN4P
         wBfVeFgVy8P33xu51N7Z9bIWoxiesVzR66F22YDMRd5bEaE4prKH/nVtYUj9hnH5u+
         Pc+DndFenJPrwwZVZd/Z9+dClz6SRcFbvOGUw222X5mL7Wy17RgQk6oQ4j1nUrm4VE
         KP7+uUAR3rJmZ6DgOwurz0E1MM1kHONkqUYQmwmFiT2KAWdq4ct9KJYPPMUDIKUyZ3
         EBCQgEDfUS3fA==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: rs9: Drop unused pin_xin field
Date:   Fri, 16 Dec 2022 22:09:22 +0100
Message-Id: <20221216210922.592926-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pin_xin field in struct rs9_driver_data is unused, drop it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-renesas-pcie.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index e6247141d0c05..f91f30560820d 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -60,7 +60,6 @@ struct rs9_driver_data {
 	struct i2c_client	*client;
 	struct regmap		*regmap;
 	const struct rs9_chip_info *chip_info;
-	struct clk		*pin_xin;
 	struct clk_hw		*clk_dif[2];
 	u8			pll_amplitude;
 	u8			pll_ssc;
-- 
2.35.1

