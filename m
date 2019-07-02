Return-Path: <SRS0=SyXX=U7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733F6C06510
	for <linux-clk@archiver.kernel.org>; Tue,  2 Jul 2019 13:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 539F2206E0
	for <linux-clk@archiver.kernel.org>; Tue,  2 Jul 2019 13:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfGBN1Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Jul 2019 09:27:16 -0400
Received: from inva021.nxp.com ([92.121.34.21]:41896 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726824AbfGBN1Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Jul 2019 09:27:16 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4DD19200BE7;
        Tue,  2 Jul 2019 15:27:15 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 410C72001FE;
        Tue,  2 Jul 2019 15:27:15 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id EA4DD205ED;
        Tue,  2 Jul 2019 15:27:14 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] clk: Assert prepare_lock in clk_core_get_boundaries
Date:   Tue,  2 Jul 2019 16:27:10 +0300
Message-Id: <29453ee8e820457d87a8faf9d496390e59c6826f.1562073871.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <68e96af2df96512300604d797ade2088d7e6e496.1562073871.git.leonard.crestez@nxp.com>
References: <68e96af2df96512300604d797ade2088d7e6e496.1562073871.git.leonard.crestez@nxp.com>
In-Reply-To: <68e96af2df96512300604d797ade2088d7e6e496.1562073871.git.leonard.crestez@nxp.com>
References: <68e96af2df96512300604d797ade2088d7e6e496.1562073871.git.leonard.crestez@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This function iterates the clk consumer list on clk_core so it must be
called under prepare_lock. This is already done by all callers but add a
lockdep assert to check anyway.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

---
 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

I wouldn't mind if this is dropped as unnecessary.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e4e224982ae3..b1c79a58d734 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -591,10 +591,12 @@ static void clk_core_get_boundaries(struct clk_core *core,
 				    unsigned long *min_rate,
 				    unsigned long *max_rate)
 {
 	struct clk *clk_user;
 
+	lockdep_assert_held(&prepare_lock);
+
 	*min_rate = core->min_rate;
 	*max_rate = core->max_rate;
 
 	hlist_for_each_entry(clk_user, &core->clks, clks_node)
 		*min_rate = max(*min_rate, clk_user->min_rate);
-- 
2.17.1

