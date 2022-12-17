Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41934C54EF1
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbiLQAYK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbiLQAXS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:18 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C897E2A8
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:42 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so5843546lfb.13
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zB971vjjlGzYY9aOTnazP2S8Uv00bCfU0Q8L3jdsBk8=;
        b=bUGnX7Tvz3hGwUsSJeNgVmfaa0fIP/zDST+oVnvh2l3Eel+WH3DZ8W5J+jBn/+3ww0
         QXqGo3k3bu2iQGxkU1UZyhy+OcOKNGFyF0QNTRyt3eh2Bao7ld6c6DINFRgPbGugnnOr
         VDMrOs9t/WXQ6eDxKp7WKWnDBg7BJeNhREvoF9cUYmGFdsGjMT6U+L3fU+MWuDwRkO/V
         x0Ido0GrurMEnfyornEW2WMwso96FC/xczNG2PLNw1UxrPuNIHxPiXXZY8A/7vlh8n5b
         ubMFuiniNnbn1vMGrdS50BtrJYW33cBHKXqCF35CMBRgg06VKSf0w7cTDYKaHSM93/LY
         uXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zB971vjjlGzYY9aOTnazP2S8Uv00bCfU0Q8L3jdsBk8=;
        b=nNvT6ECoThyrmt5Sjz6X3hv5/rUEJfTVAmlC0NNHOizxzFITi9k5Zy9WoLvqHsigWN
         BIBmDjYGlJnM3mBxY0gUIIT7QCU5CH1daszRjNfF7Wb+mp+U499c7jH3AgCyvHR+FTCO
         tGunS+lkbKnmJfmnZbbA8k4UjCuEqwLzh9eUJSIFrffpjiHKK9l2B5kC3aScc8NO7g7m
         XgLtuMXTi/LkjzvpMx1NIKe2DoqkLfkE4ZLBEbCzZMQHBdsSoDdTcvcJ1ktgBvQBQgaF
         qLtzgcDzBMAfk92rNE3URY+OO7xL3IcNP/hwvyT387mjiRVfwPaKBjCIcIkhr/EytKz5
         N4gA==
X-Gm-Message-State: AFqh2koSQv5a5bk9/eSyHRRTgyfZnKOl0ijVlphIQQi57yY1FvLBaugr
        secVqThLOUH+IL23jGe85iVShg==
X-Google-Smtp-Source: AMrXdXsMbkd/3oTPmDncu4ohCfhkGURCkilGLFR8Gc8DX4to1hrpw9gZ2j9APwlHADDKa+ZH1lAJBQ==
X-Received: by 2002:a05:6512:224c:b0:4b9:f5e5:8fbd with SMTP id i12-20020a056512224c00b004b9f5e58fbdmr4161583lfu.52.1671236261103;
        Fri, 16 Dec 2022 16:17:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 12/15] clk: qcom: gcc-qcs404: add support for GDSCs
Date:   Sat, 17 Dec 2022 02:17:27 +0200
Message-Id: <20221217001730.540502-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for two GDSCs provided by this clock controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 8fb268671f0c..f8dbfffc2b8e 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -19,6 +19,7 @@
 #include "clk-rcg.h"
 #include "clk-regmap.h"
 #include "common.h"
+#include "gdsc.h"
 #include "reset.h"
 
 enum {
@@ -2598,6 +2599,22 @@ static struct clk_branch gcc_wdsp_q6ss_axim_clk = {
 	},
 };
 
+static struct gdsc mdss_gdsc = {
+	.gdscr = 0x4d078,
+	.pd = {
+		.name = "mdss",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc oxili_gdsc = {
+	.gdscr = 0x5901c,
+	.pd = {
+		.name = "oxili",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_hw *gcc_qcs404_hws[] = {
 	&cxo.hw,
 };
@@ -2748,6 +2765,11 @@ static struct clk_regmap *gcc_qcs404_clocks[] = {
 
 };
 
+static struct gdsc *gcc_qcs404_gdscs[] = {
+	[MDSS_GDSC] = &mdss_gdsc,
+	[OXILI_GDSC] = &oxili_gdsc,
+};
+
 static const struct qcom_reset_map gcc_qcs404_resets[] = {
 	[GCC_GENI_IR_BCR] = { 0x0F000 },
 	[GCC_CDSP_RESTART] = { 0x18000 },
@@ -2790,6 +2812,8 @@ static const struct qcom_cc_desc gcc_qcs404_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcs404_resets),
 	.clk_hws = gcc_qcs404_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_qcs404_hws),
+	.gdscs = gcc_qcs404_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_qcs404_gdscs),
 };
 
 static const struct of_device_id gcc_qcs404_match_table[] = {
-- 
2.35.1

