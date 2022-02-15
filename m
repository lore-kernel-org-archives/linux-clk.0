Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634D0C4321E
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 08:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbiBOIou (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 03:44:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbiBOIou (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 03:44:50 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADBAF111F93;
        Tue, 15 Feb 2022 00:44:40 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E74B18169D;
        Tue, 15 Feb 2022 09:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1644914679;
        bh=pAKOWAwDDKaQbZd58CkUZplR6yVT8zZRE93BWYUYrtY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ns2QIZQ8t2uBZqiGcn9gqpoKWBWdsmOSAvZAjMNpNB1HYJ/Wj5isy8sF/bI4Conbq
         VvY3YvEu3HHA/uFxeMrN4AbjrlGTTV0TI63mvf8/OctvTReqBPu0gVgTes01OrIYAj
         w5d7kSP4R20iQs2CLxW+NoXWI/VfIuxOeuftpwdgv2HNvJDiscFIU80zaw+iYn2cWO
         BmNs4lXzkRjRFjugwDsghBvW0erD4Wc6faXI87WkB1hKikaw5Ojw90sDNHZEHgVCFU
         yL0vdRBApZ2Ys9yKNu5fWq4v0bKZLxxuxNH40M8EqFEAnBzE7zttKJSsc5wpje3TVw
         Vzwlo9pBllCOw==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: [PATCH 3/3] clk: bd718xx: Implement basic .match_clkspec
Date:   Tue, 15 Feb 2022 09:44:12 +0100
Message-Id: <20220215084412.8090-3-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215084412.8090-1-marex@denx.de>
References: <20220215084412.8090-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The new match_clkspec() callback is used to determine whether struct clk_hw
that is currently being registered matches the clock specifier currently in
DT "critical-clock" property, and if so, then the CLK_IS_CRITICAL is added
to these newly registered clock.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-power@fi.rohmeurope.com
To: linux-clk@vger.kernel.org
---
 drivers/clk/clk-bd718x7.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index ac40b669d60b7..8b41f122bbb0d 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -70,10 +70,16 @@ static int bd71837_clk_is_enabled(struct clk_hw *hw)
 	return enabled & c->mask;
 }
 
+static int bd71837_match_clkspec(struct clk_hw *hw, struct of_phandle_args *clkspec)
+{
+	return 0;
+}
+
 static const struct clk_ops bd71837_clk_ops = {
 	.prepare = &bd71837_clk_enable,
 	.unprepare = &bd71837_clk_disable,
 	.is_prepared = &bd71837_clk_is_enabled,
+	.match_clkspec = &bd71837_match_clkspec,
 };
 
 static int bd71837_clk_probe(struct platform_device *pdev)
-- 
2.34.1

