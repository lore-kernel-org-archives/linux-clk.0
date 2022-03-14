Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1760CC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 14 Mar 2022 14:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242212AbiCNOSQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Mar 2022 10:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbiCNOSP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Mar 2022 10:18:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFCA13D3D
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 07:17:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVK-0004zQ-Uh; Mon, 14 Mar 2022 15:16:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVL-000f2w-C0; Mon, 14 Mar 2022 15:16:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVJ-0097ar-83; Mon, 14 Mar 2022 15:16:57 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v8 06/16] bus: bt1: Don't open code devm_clk_get_enabled()
Date:   Mon, 14 Mar 2022 15:16:33 +0100
Message-Id: <20220314141643.22184-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562; i=uwe@kleine-koenig.org; h=from:subject; bh=RiJiPFiKMeyGfmKhKarGEGDg1+/6Bn25BvlbEK0N0us=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL03960HOitJFfJZ+CRAFjCSUeq2zaKYmZFQt3SqD 9iqwUYSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9N/QAKCRDB/BR4rcrsCXPnB/ 9o0B3mWCEzFHjYT6pfTwTJYm52n5sClCxESiYiFf/iC7rwP6c/8E+s52Ev3OBXvF5oLORNLtfRnVLK rDK8Fzn6yM+QXPrPVMuLdWMr/sTAzfgGZsQgYW6JuFWbLRe8H89h2it4S+7FBLpvYIkkLO2JxoSJqk K0MCE/vLGs90HXzNGPky82/NaVrh4IsHYKVi0Dm71Lc6d1xvi6SMc4Wq6SY/D3iNomvtFuuORcpXKx XqaZYZIAor/s2xs6m8IQvkMLlPRRvcJilRVz0z6GCRTx2JZqucAz901ctS6wZApgQAMag1yVlGFGXL brxdJAEln4hBERYIa9YPWA0IfzpWTm
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

devm_clk_get_enabled() returns a clock prepared and enabled and already
registers a devm exit handler to disable (and unprepare) the clock.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/bus/bt1-apb.c | 23 +----------------------
 drivers/bus/bt1-axi.c | 23 ++---------------------
 2 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
index b25ff941e7c7..2fa135f1097b 100644
--- a/drivers/bus/bt1-apb.c
+++ b/drivers/bus/bt1-apb.c
@@ -187,35 +187,14 @@ static int bt1_apb_request_rst(struct bt1_apb *apb)
 	return ret;
 }
 
-static void bt1_apb_disable_clk(void *data)
-{
-	struct bt1_apb *apb = data;
-
-	clk_disable_unprepare(apb->pclk);
-}
-
 static int bt1_apb_request_clk(struct bt1_apb *apb)
 {
-	int ret;
-
-	apb->pclk = devm_clk_get(apb->dev, "pclk");
+	apb->pclk = devm_clk_get_enabled(apb->dev, "pclk");
 	if (IS_ERR(apb->pclk)) {
 		dev_err(apb->dev, "Couldn't get APB clock descriptor\n");
 		return PTR_ERR(apb->pclk);
 	}
 
-	ret = clk_prepare_enable(apb->pclk);
-	if (ret) {
-		dev_err(apb->dev, "Couldn't enable the APB clock\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(apb->dev, bt1_apb_disable_clk, apb);
-	if (ret) {
-		dev_err(apb->dev, "Can't add APB EHB clocks disable action\n");
-		return ret;
-	}
-
 	apb->rate = clk_get_rate(apb->pclk);
 	if (!apb->rate) {
 		dev_err(apb->dev, "Invalid clock rate\n");
diff --git a/drivers/bus/bt1-axi.c b/drivers/bus/bt1-axi.c
index e7a6744acc7b..e96a2c0df890 100644
--- a/drivers/bus/bt1-axi.c
+++ b/drivers/bus/bt1-axi.c
@@ -147,34 +147,15 @@ static int bt1_axi_request_rst(struct bt1_axi *axi)
 	return ret;
 }
 
-static void bt1_axi_disable_clk(void *data)
-{
-	struct bt1_axi *axi = data;
-
-	clk_disable_unprepare(axi->aclk);
-}
-
 static int bt1_axi_request_clk(struct bt1_axi *axi)
 {
-	int ret;
-
-	axi->aclk = devm_clk_get(axi->dev, "aclk");
+	axi->aclk = devm_clk_get_enabled(axi->dev, "aclk");
 	if (IS_ERR(axi->aclk)) {
 		dev_err(axi->dev, "Couldn't get AXI Interconnect clock\n");
 		return PTR_ERR(axi->aclk);
 	}
 
-	ret = clk_prepare_enable(axi->aclk);
-	if (ret) {
-		dev_err(axi->dev, "Couldn't enable the AXI clock\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(axi->dev, bt1_axi_disable_clk, axi);
-	if (ret)
-		dev_err(axi->dev, "Can't add AXI clock disable action\n");
-
-	return ret;
+	return 0;
 }
 
 static int bt1_axi_request_irq(struct bt1_axi *axi)
-- 
2.35.1

