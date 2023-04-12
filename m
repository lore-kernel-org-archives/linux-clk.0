Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7918C7619A
	for <linux-clk@archiver.kernel.org>; Wed, 12 Apr 2023 14:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjDLOxW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Apr 2023 10:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjDLOxT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2023 10:53:19 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16B16A54
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 07:53:16 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id q26so2869565lfe.9
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681311195; x=1683903195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzXitOAB7i9wPsi0RU5jPhBlfKzrQ5/zxTpphCz2cOw=;
        b=kHjLP0f69MHCgc+2DS0cqFj1Oc6/l0E/zz1wpP/iosDA5+4Fb3UjGzu0FI7Be9vZ0u
         JW8/vnc3srHNBA1OZaFu92W53W9pDgKqk7kIE1cTzsuJoUdO/imTOsE3kMnfC+V10Scj
         RI1c8pgxNzyfxCwDNXkdmg829MY9ZAC9GbO1tdnvknofKm4yeDePKHnWV06Ymruyz9ER
         aUblXOsRWKGx85+e02BK4EBgAURy1B3ZiOSGQRg4MinKmcH7LWiaY6Svu+bccxFeYsc7
         a/d/JWf9kALpdw3pauP8ISeNNwqWP/3VwpGupWMrYb63T1sTpuAmPIRhPVaBnAKk+lA6
         opeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681311195; x=1683903195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzXitOAB7i9wPsi0RU5jPhBlfKzrQ5/zxTpphCz2cOw=;
        b=KF3kB/V3AMlcpBvyejRMEtlpmhLAfRK5M0Ap0F4fKDC3rySAENT1JQu2Z1XbGjs/jc
         Ez6vLqHquuf4VXbQSi4kpuc63Uy3yPdoWJV5+3upYlLUeD6mn3WHIZ59bMLiPnNjyoN1
         yyo78t13OAtqW2Z0jjGzlRw4HD+WeSe4Gl7sH+eylJ43f1KCpGkg0fBusGMORxI4US3t
         hGyGOWr3JZGWVvnU6rjr+FBTTM05LcxBQFbr4dm5ueYFbr7VKQXN4YZjrF6kpAc5vAdf
         x72HW6WRHhE+GYDLOJ2Nd9bVKBwLIjAO8+48O+mnawxFPY0FWoscPelsGnXfM/d9+QgF
         xONw==
X-Gm-Message-State: AAQBX9c9iRz+mMqzrDo64qMyxp8xqGhAbE4o/eCUHn9R4BV80gALji0S
        QTctkOign/UFH3+q2CPF/5pu9A==
X-Google-Smtp-Source: AKy350bAzp0vsxDGVnboU2R0wJXBJGE/OaQ//CXpJSRoNvxsuoLNlfmlbkMm+tPLjv5hfmbAxjh2xg==
X-Received: by 2002:ac2:5444:0:b0:4eb:274b:a69 with SMTP id d4-20020ac25444000000b004eb274b0a69mr1831189lfn.26.1681311195192;
        Wed, 12 Apr 2023 07:53:15 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id w5-20020ac24425000000b004e95f1c9e7dsm3015367lfl.78.2023.04.12.07.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 07:53:14 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 12 Apr 2023 16:53:06 +0200
Subject: [PATCH 2/3] clk: qcom: dispcc-qcm2290: Remove inexistent DSI1PHY
 clk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230412-topic-qcm_dispcc-v1-2-bf2989a75ae4@linaro.org>
References: <20230412-topic-qcm_dispcc-v1-0-bf2989a75ae4@linaro.org>
In-Reply-To: <20230412-topic-qcm_dispcc-v1-0-bf2989a75ae4@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681311191; l=1245;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5FJ0glA+UfMPhOkTxeP63CncmUlAPOn1NSBFVZ9Bnf0=;
 b=/3Ufj2N/TAX1seIFCdp47zWL0iEhSQFuyc58fzJfbSw5uYaUX0Sp4fwvk2LHwtZ8o9SxOn6bDFJd
 1RB781VIDPpSL8YMBFJbrqvR0PZrTZAapCdxgYwhEH/fZdsb/Uci
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There's only one DSI PHY on this SoC. Remove the ghost entry for the
clock produced by a secondary one.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 0f516c72e624..ee62aca4e5bb 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -28,7 +28,6 @@ enum {
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
-	P_DSI1_PHY_PLL_OUT_DSICLK,
 	P_GPLL0_OUT_MAIN,
 	P_SLEEP_CLK,
 };
@@ -108,13 +107,11 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
-	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
-	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {

-- 
2.40.0

