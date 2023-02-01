Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F150C05027
	for <linux-clk@archiver.kernel.org>; Wed,  1 Feb 2023 17:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbjBARXQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Feb 2023 12:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbjBARXM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 12:23:12 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD1465F23
        for <linux-clk@vger.kernel.org>; Wed,  1 Feb 2023 09:23:09 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id qw12so37580816ejc.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Feb 2023 09:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk3rBfWXYWGglBbtHFn72sDtxH1nQI4oY7t4ppOv/uA=;
        b=cg9tcovsWu5OofGQGy0dnQIzHuGQtUFEnVY4TcYrWfYnFmK8u/isiy8qu4pRDGq/4L
         C5ARkoAoame9xBEWNWhsIkHGns78KH+ctJTlVXfNMhXIAWMSfrqZJNn6Il8vyrRyP3yI
         M7jdQA/YO/IMMz9JvrLDOa9cBO1JMwhderWDSgSFGhB7Bj7eo+Yb63MikHKvIWB4flBH
         qHxOl2kFbmhVTDB2To1o7uJhMLsWQYDb7YwBXEEvp78DpNH5c1bc1iSdJSAtX9DAE2vj
         pZeDfT2DQxvvK6XixBppRWOvZbIS15YSvtiZFNlqPJIAImSEiZKnc/8iJiN7ifEHiSIh
         J0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uk3rBfWXYWGglBbtHFn72sDtxH1nQI4oY7t4ppOv/uA=;
        b=updPfuVudP0JHNpEBlxNJkmXaL/qZc0y4sqfGDYM0s3zYzy67+YJDu2kKdz3w1GRIx
         1QPRPB6S2rBtJw0xKS/7Ni0GgZuGVRYSbguNsKuh+BkoNI4hhVUPa8+S/dUBiveWpOjv
         mVSB9+zqag8f6Dg+fG9Q7+xsaVapD6uW9Z+BMC+rzJFYUXWvnMudbay7pnsFZka5n/62
         7R4+DFcxLTHvf4FxLOOQNKUlxGI6MVnBs0a1dP1CI6QGEGqOl5DREvCbzWJieamdu8g6
         P44qG0oJD0u8JdbeMfOeD1W15L8cu9gJCjJ9BtRt+ffsBpHT9rmQoXBDP5FApmgJbubW
         sQdA==
X-Gm-Message-State: AO0yUKVk80sQ/4vBFo45r9upDUkeHRnqiL4U+wy39bO/tR7o2VNnBXw/
        68tefTJR5jmIM+FHzAC9BUydPQ==
X-Google-Smtp-Source: AK7set+rjw+4ID3i6qHlaYQG4SdQ3bhwrqalqusMwnMrmfcFcaSbJuWsEYy+R6siwzOE1Hx6xfNLBA==
X-Received: by 2002:a17:907:7094:b0:88a:72bf:9670 with SMTP id yj20-20020a170907709400b0088a72bf9670mr2936763ejb.50.1675272188560;
        Wed, 01 Feb 2023 09:23:08 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id ci20-20020a170906c35400b0088e5f3e1faesm601873ejb.36.2023.02.01.09.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:23:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
Date:   Wed,  1 Feb 2023 19:23:05 +0200
Message-Id: <20230201172305.993146-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201172305.993146-1-dmitry.baryshkov@linaro.org>
References: <20230201172305.993146-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gdsc_init() function will rewrite the CLK_DIS_WAIT field while
registering the GDSC (writing the value 0x2 by default). This will
override the setting done in the driver's probe function.

Set cx_gdsc.clk_dis_wait_val to 8 to follow the intention of the probe
function.

Fixes: 453361cdd757 ("clk: qcom: Add graphics clock controller driver for SDM845")
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Fixed the _val suffix in .clk_dis_wait_val.

---
 drivers/clk/qcom/gpucc-sdm845.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 110b54401bc6..970d7414bdf0 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -22,8 +22,6 @@
 #define CX_GMU_CBCR_SLEEP_SHIFT		4
 #define CX_GMU_CBCR_WAKE_MASK		0xf
 #define CX_GMU_CBCR_WAKE_SHIFT		8
-#define CLK_DIS_WAIT_SHIFT		12
-#define CLK_DIS_WAIT_MASK		(0xf << CLK_DIS_WAIT_SHIFT)
 
 enum {
 	P_BI_TCXO,
@@ -121,6 +119,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.clk_dis_wait_val = 0x8,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -193,10 +192,6 @@ static int gpu_cc_sdm845_probe(struct platform_device *pdev)
 	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	/* Configure clk_dis_wait for gpu_cx_gdsc */
-	regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
-						8 << CLK_DIS_WAIT_SHIFT);
-
 	return qcom_cc_really_probe(pdev, &gpu_cc_sdm845_desc, regmap);
 }
 
-- 
2.39.1

