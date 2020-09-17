Return-Path: <SRS0=whDF=C2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B876C433E2
	for <linux-clk@archiver.kernel.org>; Thu, 17 Sep 2020 13:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8C6C21734
	for <linux-clk@archiver.kernel.org>; Thu, 17 Sep 2020 13:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhtNwsS5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgIQNs1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbgIQN3k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Sep 2020 09:29:40 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C61CC061225
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2020 06:29:02 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t10so2097350wrv.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2020 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VXnokbFwaIT7VX7ySLaYW+p97LOfw5oIrujXpIr02w0=;
        b=YhtNwsS5EvW9wWdW0ET2SOg7FW6/fm0TOPmHQKipPLCr3EfGF1dYktxktoMauq3MyG
         Gtc3F4EdJm7Skmycwfiti1rvHXn5w5Y+pIYmtfz13lf8DovTFs5+WjrgOttK2mGIVDr4
         zO2h4zetldL4/9owZvYijsqtb4D3ppFAcTZ8rJdchatZnRbckqS4T9VAkUO4YrAN0DGt
         u8B+VB+3oyqvl6kYwKaYfrnVUEEf0fzPGxl+jWb/LCHto6aXmR1hOeWB0luqBgcw3Rlq
         P877I2RYE/VhlaQzsra3l3wYNn9/ADDUZ3Cn//OBjx9/4s+8gFiAtN+nA3kkLgls4TXp
         K1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXnokbFwaIT7VX7ySLaYW+p97LOfw5oIrujXpIr02w0=;
        b=i2Bs3sOYN1hiMcq3xwKAnO/iMqNRdkmUDiQWPYBzRWzxYOWuKlZ+aioGJGBFkGjOKl
         ouhVChSMozdlIpKW1uYiHcwEwpqsJUpSkMPPliBoVmHEn8XcjDM5O2Y2EyhQQGqdp9pV
         x8OvAfVOSpbGjmBxiAZFOsZwXtb1dK694Bse3T0w96U8n1iL8mQzdoXENS5mXHspzfoi
         Rip6OU2J1w2hrkP/EfE8qLwZ5Q6MiSYq3d23gzVE3Gg5AyQEEjmdDHWOaPXNHcpwv2Cg
         p+pNpyy5Q9lU8B1lUImpaH9MJJ2fH72kjFhX29jFmiIfkJCOJBba4tEyLGfO5Fy9uCUG
         imNA==
X-Gm-Message-State: AOAM533NPI/O0dwCMqIfgc0/p11RqqaJteJ7+QVN83VDrxzOYjMRRNOK
        L5hiY9PsLgdJ/JU2rBfrqj4Pdg==
X-Google-Smtp-Source: ABdhPJxwtR7oBdq4afBifC7Rg+K/286K5d8bHf/oiQjz59hxtnrtlu7e7eCW1oFzS8JgGdVTD3B3GA==
X-Received: by 2002:adf:e304:: with SMTP id b4mr31131498wrj.141.1600349341564;
        Thu, 17 Sep 2020 06:29:01 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id n10sm11486910wmk.7.2020.09.17.06.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 06:29:00 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/4] clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks
Date:   Thu, 17 Sep 2020 14:28:50 +0100
Message-Id: <20200917132850.7730-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200917132850.7730-1-srinivas.kandagatla@linaro.org>
References: <20200917132850.7730-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

LPASS Always ON Clock controller has one GFM mux to control VA
and TX clocks to codec macro on LPASS.
This patch adds support to this mux.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/lpass-gfm-sm8250.c | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
index 2d5c41ae4969..6b11bea912bf 100644
--- a/drivers/clk/qcom/lpass-gfm-sm8250.c
+++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/of_device.h>
 #include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
+#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
 
 struct lpass_gfm {
 	struct device *dev;
@@ -61,6 +62,44 @@ static const struct clk_ops clk_gfm_ops = {
 	.determine_rate = __clk_mux_determine_rate,
 };
 
+static struct clk_gfm lpass_gfm_va_mclk = {
+	.mux_reg = 0x20000,
+	.mux_mask = BIT(0),
+	.hw.init = &(struct clk_init_data) {
+		.name = "VA_MCLK",
+		.ops = &clk_gfm_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.parent_names = (const char *[]) {
+			"LPASS_CLK_ID_TX_CORE_MCLK",
+			"LPASS_CLK_ID_VA_CORE_MCLK",
+		},
+		.num_parents = 2,
+		.parent_data = (const struct clk_parent_data[]){
+				{ .index = 0 },
+				{ .index = 1 },
+		},
+	},
+};
+
+static struct clk_gfm lpass_gfm_tx_npl = {
+	.mux_reg = 0x20000,
+	.mux_mask = BIT(0),
+	.hw.init = &(struct clk_init_data) {
+		.name = "TX_NPL",
+		.ops = &clk_gfm_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.parent_names = (const char *[]){
+			"LPASS_CLK_ID_TX_CORE_NPL_MCLK",
+			"LPASS_CLK_ID_VA_CORE_2X_MCLK",
+		},
+		.parent_data = (const struct clk_parent_data[]){
+				{ .index = 0 },
+				{ .index = 1 },
+		},
+		.num_parents = 2,
+	},
+};
+
 static struct clk_gfm lpass_gfm_wsa_mclk = {
 	.mux_reg = 0x220d8,
 	.mux_mask = BIT(0),
@@ -137,6 +176,19 @@ static struct clk_gfm lpass_gfm_rx_npl = {
 	},
 };
 
+static struct clk_gfm *aoncc_gfm_clks[] = {
+	[LPASS_CDC_VA_MCLK]		= &lpass_gfm_va_mclk,
+	[LPASS_CDC_TX_NPL]		= &lpass_gfm_tx_npl,
+};
+
+static struct clk_hw_onecell_data aoncc_hw_onecell_data = {
+	.hws = {
+		[LPASS_CDC_VA_MCLK]	= &lpass_gfm_va_mclk.hw,
+		[LPASS_CDC_TX_NPL]	= &lpass_gfm_tx_npl.hw,
+	},
+	.num = ARRAY_SIZE(aoncc_gfm_clks),
+};
+
 static struct clk_gfm *audiocc_gfm_clks[] = {
 	[LPASS_CDC_WSA_NPL]		= &lpass_gfm_wsa_npl,
 	[LPASS_CDC_WSA_MCLK]		= &lpass_gfm_wsa_mclk,
@@ -164,6 +216,11 @@ static struct lpass_gfm_data audiocc_data = {
 	.gfm_clks = audiocc_gfm_clks,
 };
 
+static struct lpass_gfm_data aoncc_data = {
+	.onecell_data = &aoncc_hw_onecell_data,
+	.gfm_clks = aoncc_gfm_clks,
+};
+
 static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
 {
 	const struct lpass_gfm_data *data;
@@ -218,6 +275,10 @@ static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lpass_gfm_clk_match_table[] = {
+	{
+		.compatible = "qcom,sm8250-lpass-aoncc",
+		.data = &aoncc_data,
+	},
 	{
 		.compatible = "qcom,sm8250-lpass-audiocc",
 		.data = &audiocc_data,
-- 
2.21.0

