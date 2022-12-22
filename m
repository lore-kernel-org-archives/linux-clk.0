Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45539C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 22 Dec 2022 21:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiLVVHX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Dec 2022 16:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiLVVHW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Dec 2022 16:07:22 -0500
X-Greylist: delayed 326 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 22 Dec 2022 13:07:21 PST
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CA91A227
        for <linux-clk@vger.kernel.org>; Thu, 22 Dec 2022 13:07:20 -0800 (PST)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2F6DC3F34C;
        Thu, 22 Dec 2022 22:01:50 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-sm6125: Fix compatible string to match bindings
Date:   Thu, 22 Dec 2022 22:01:40 +0100
Message-Id: <20221222210140.278077-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

According to generic rules the SoC name should be first:

        arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: clock-controller@5f00000: compatible: 'oneOf' conditional failed, one must be fixed:
                'qcom,dispcc-sm6125' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+-.*$'

And this is already reflected by the bindings submitted prior to the
addition of this driver.  Any DTS following these rules will end up with
a non-probing driver because of this mismatch.

Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/dispcc-sm6125.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm6125.c b/drivers/clk/qcom/dispcc-sm6125.c
index b921456a2e0d..87b27053ddb6 100644
--- a/drivers/clk/qcom/dispcc-sm6125.c
+++ b/drivers/clk/qcom/dispcc-sm6125.c
@@ -667,7 +667,7 @@ static const struct qcom_cc_desc disp_cc_sm6125_desc = {
 };
 
 static const struct of_device_id disp_cc_sm6125_match_table[] = {
-	{ .compatible = "qcom,dispcc-sm6125" },
+	{ .compatible = "qcom,sm6125-dispcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm6125_match_table);
-- 
2.39.0

