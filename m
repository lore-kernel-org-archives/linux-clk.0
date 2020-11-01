Return-Path: <SRS0=2OLx=EH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CA2C2D0A3
	for <linux-clk@archiver.kernel.org>; Sun,  1 Nov 2020 18:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89E4A22275
	for <linux-clk@archiver.kernel.org>; Sun,  1 Nov 2020 18:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="hsn85R6i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgKASsc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 Nov 2020 13:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgKASsc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 Nov 2020 13:48:32 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38EFC0617A6;
        Sun,  1 Nov 2020 10:48:31 -0800 (PST)
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 0E18B22EDE;
        Sun,  1 Nov 2020 19:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1604256509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=QWuBDvG556P7DgFxAEfxlK29CFtxfxLBOH3cyEwiDWs=;
        b=hsn85R6i3Tvv7DgWk7LrzbdV/K+WBvjafkVmOo0Jxfhvm4zNiYqrBIXERgs8hR/8Hov+HD
        yoB9swCRB1rd0aw5hGfxiFD4UDaMJHY6bdkEP5stzKEouTPsngHqSJsi/HVsv/Fw+WU0Cv
        5nV1q0GCdmmsWqsiuHTvMGtW4wUA8oY=
From:   Michael Walle <michael@walle.cc>
To:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH] clk: fsl-sai: fix memory leak
Date:   Sun,  1 Nov 2020 19:48:18 +0100
Message-Id: <20201101184818.2754-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If the device is removed we don't unregister the composite clock. Fix
that.

Fixes: 9cd10205227c ("clk: fsl-sai: new driver")
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/clk/clk-fsl-sai.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
index 0221180a4dd7..1e81c8d8a6fd 100644
--- a/drivers/clk/clk-fsl-sai.c
+++ b/drivers/clk/clk-fsl-sai.c
@@ -68,9 +68,20 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
+	platform_set_drvdata(pdev, hw);
+
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
 }
 
+static int fsl_sai_clk_remove(struct platform_device *pdev)
+{
+	struct clk_hw *hw = platform_get_drvdata(pdev);
+
+	clk_hw_unregister_composite(hw);
+
+	return 0;
+}
+
 static const struct of_device_id of_fsl_sai_clk_ids[] = {
 	{ .compatible = "fsl,vf610-sai-clock" },
 	{ }
@@ -79,6 +90,7 @@ MODULE_DEVICE_TABLE(of, of_fsl_sai_clk_ids);
 
 static struct platform_driver fsl_sai_clk_driver = {
 	.probe = fsl_sai_clk_probe,
+	.remove = fsl_sai_clk_remove,
 	.driver		= {
 		.name	= "fsl-sai-clk",
 		.of_match_table = of_fsl_sai_clk_ids,
-- 
2.20.1

