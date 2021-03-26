Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAC1C433E3
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 12:03:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6621A61A45
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 12:03:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhCZMC5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 08:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhCZMCU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Mar 2021 08:02:20 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57B7C0613B5
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 05:02:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by michel.telenet-ops.be with bizsmtp
        id l02G2400253vE1T0602GZz; Fri, 26 Mar 2021 13:02:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAN-00AXLV-Ic; Fri, 26 Mar 2021 13:02:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAM-006cQZ-BW; Fri, 26 Mar 2021 13:02:14 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/7] clk: renesas: rcar-gen3: Grammar s/dependent of/dependent on/
Date:   Fri, 26 Mar 2021 13:00:57 +0100
Message-Id: <20210326120100.1577596-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326120100.1577596-1-geert+renesas@glider.be>
References: <20210326120100.1577596-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix grammar in comments for cpg_z_clk_set_rate().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index cf0d049aa8c78115..a241bf6e904f2f66 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -117,7 +117,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 *
 	 * Using experimental measurements, it seems that no more than
 	 * ~10 iterations are needed, independently of the CPU rate.
-	 * Since this value might be dependent of external xtal rate, pll1
+	 * Since this value might be dependent on external xtal rate, pll1
 	 * rate or even the other emulation clocks rate, use 1000 as a
 	 * "super" safe value.
 	 */
-- 
2.25.1

