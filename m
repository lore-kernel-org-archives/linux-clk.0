Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31582C43217
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 10:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238865AbiKPK7a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 05:59:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233370AbiKPK7S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 05:59:18 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444AB3F07D
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 02:47:45 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h9so29261821wrt.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 02:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oGrpMNudChVVWokuKrKJ8fs3KmpnLeOml9fMB9Cjgk=;
        b=UqnK/DTnUOLFTa/l2t61pdPoBW9QqdKs9MAuGJuyVtciTdaxyNrOqxn3Ir/o8/hFue
         JZuEeYOK7iT1ytzaIiP1kImICuRMkXz0TMx1S6snmUEMTp6usuZcCSr0u4rI2IYEkOsX
         ws5BgDgQrmVdGtMdOE5SRINQ/KCTxeXh4ETCGlPpOCAyYt9wAWi96llmJTp+Nd42ZCtn
         pOWy+J1bdyDpxwkL2J9m6pRIia+PZyphYkVjfcOXLV4g4tVUJWZHsUVqHL7T/tyLLf2v
         wMefP8o9Ve/vAc2fjLxA7RaaFq2DJAO6T5UApe6NVo3oN+keOulFErnGJi4F9JmQswbR
         hHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oGrpMNudChVVWokuKrKJ8fs3KmpnLeOml9fMB9Cjgk=;
        b=v97U4TFBYJPWJQ+PuZreSugNm/koxDH+DHmH6MSv3KcOu6Y2r287HKffxuNUERCNpG
         k+ThQM3NSt8PqkubT3a6VQpYQJSV8NcnEkRM9ZrdJRzqYtmgY1YCKh9MFMnsfEXT298k
         CauLFCr5Mz+OQVTeTvyXx/0r46gKwqCqhWgTRE+RMdObfeMLolMa1w2BgGlJl0CosmFh
         LSZYSDeFqec9pr3H9ge7SeeZMDI7f1FVw5QXwgTcCiw6UkiaIp5ZEoivQMOBWluRyJy7
         pd6ap3N9bE3tx5UBykm6+Ok9X5p6y9SESxw1VbmZKFqFGzj5+TZqikAum0XIe80+bQ84
         5rbw==
X-Gm-Message-State: ANoB5pmW5tNVnMPUEAiPOFGjNcsdPLVMa90tLRocXT42/WSnlckiWZWC
        x5oxT+IkJeUUridAvzPNZhKRnw==
X-Google-Smtp-Source: AA0mqf7EzkRSZu0jL/L5RVpcZxYbvcO9GCZfRyic+Vt0C7tdi9rZs6P+bJL3hJRu1UT7HfqSeq6RAw==
X-Received: by 2002:a5d:65c6:0:b0:236:80a8:485e with SMTP id e6-20020a5d65c6000000b0023680a8485emr13243203wrw.362.1668595663815;
        Wed, 16 Nov 2022 02:47:43 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b3-20020adff903000000b002366fb99cdasm14674206wrr.50.2022.11.16.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:47:43 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/9] clk: qcom: Add LUCID_OLE PLL type for SM8550
Date:   Wed, 16 Nov 2022 12:47:10 +0200
Message-Id: <20221116104716.2583320-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116104716.2583320-1-abel.vesa@linaro.org>
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a LUCID_OLE PLL type for SM8550 SoC from Qualcomm.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 16 ++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 1973d79c9465..f9e4cfd7261c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -155,6 +155,22 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x30,
 		[PLL_OFF_TEST_CTL_U1] = 0x34,
 	},
+	[CLK_ALPHA_PLL_TYPE_LUCID_OLE] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATE] = 0x08,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_ALPHA_VAL] = 0x14,
+		[PLL_OFF_USER_CTL] = 0x18,
+		[PLL_OFF_USER_CTL_U] = 0x1c,
+		[PLL_OFF_CONFIG_CTL] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U] = 0x24,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x28,
+		[PLL_OFF_TEST_CTL] = 0x2c,
+		[PLL_OFF_TEST_CTL_U] = 0x30,
+		[PLL_OFF_TEST_CTL_U1] = 0x34,
+		[PLL_OFF_TEST_CTL_U2] = 0x38,
+	},
 	[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO] = {
 		[PLL_OFF_OPMODE] = 0x04,
 		[PLL_OFF_STATUS] = 0x0c,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index f9524b3fce6b..2bdae362c827 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -18,6 +18,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_ZONDA,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
+	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
@@ -38,6 +39,8 @@ enum {
 	PLL_OFF_TEST_CTL,
 	PLL_OFF_TEST_CTL_U,
 	PLL_OFF_TEST_CTL_U1,
+	PLL_OFF_TEST_CTL_U2,
+	PLL_OFF_STATE,
 	PLL_OFF_STATUS,
 	PLL_OFF_OPMODE,
 	PLL_OFF_FRAC,
@@ -160,7 +163,9 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
+#define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
+#define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
-- 
2.34.1

