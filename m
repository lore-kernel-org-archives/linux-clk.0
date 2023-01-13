Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8385AC67871
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 12:12:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238573AbjAMMMy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 07:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241168AbjAMMLs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 07:11:48 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E907DE0F
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:06:14 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b3so32837925lfv.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 04:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cmnuPgg6nrYuVy6oT9pdU5a4QKL5OlhnalZq+EKhBE=;
        b=mZxeFbl0loKEWYflwP6nYQLdu5mXdKBvOd+FMJG3rA+vqhmOBTD2uKZOm6c+W15NhH
         mhCOIHOau6L0Ok3Q09g14YT6pr/oS4UHbb8rAbrVbX8WpVuSNmsWDLHV9IZSKYuYy85T
         wya6TZ92vl4VUmCOQYLy5ydFClekSHtTL4M9Wr2yJwlYbkuPcPamWXFP1NXFSsWMQWs7
         wRD/iuCYsrq4GDhrJi8p3odSwyKFVEd4lC4Oa9fafMWytOYGbro7BKRhFfD3zV1fH1aN
         +ajzXWRtK71akQ6QsG+c8Bc4Ezxq0owM797GfPkSzNuvfPecPeCSv34e3JEjBPpMbNpX
         S7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cmnuPgg6nrYuVy6oT9pdU5a4QKL5OlhnalZq+EKhBE=;
        b=BLGHEpSuDaa65h8qUq1ZocRImjmUIgeD+5kTrvhJxLPYWxWPj3x/3fwl8Twb9dN5Ov
         8fCNHtNe2fT4JuQRBa8c/thV+TPncYtY+ZVkh1OjKU31jtJcIywp5Vkz9EUfa/h0HB29
         fdGwRkZuiRAKEv8aJeMUofXNVXjSp7XFn+XQIU0q8XhdXltBIoXEiR1u0/K/gqOqS74u
         INSJeXz85+KRv4yEhtAyEv46qqp57KIa/PIM5Gzv363vrpeTJBJ5HkbVtSb/DaAJeaSP
         N+7lbQEQcudh2IQiktdHk28ke7h0pVS6slIbbsNKOWvcASEEUeoLyuFu1tYDJSt+0PkK
         jyuw==
X-Gm-Message-State: AFqh2koiN1uyuWrSO59tsKqgWVventzLap4VdqlHYRphTar4Ae4FoWxz
        Xys0EqP/HOUiWJvoGaoAaUy61g==
X-Google-Smtp-Source: AMrXdXvyNW46RX6TBbQcQg2ZW+l5U4DNtpuHFj072THT8O/3v6PwPrWr+fMiT7nIKvugTwAIJWCkBA==
X-Received: by 2002:a05:6512:31d6:b0:4b5:7817:419d with SMTP id j22-20020a05651231d600b004b57817419dmr26783383lfe.41.1673611574238;
        Fri, 13 Jan 2023 04:06:14 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:06:13 -0800 (PST)
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
Subject: [PATCH v3 03/14] clk: qcom: cpu-8996: correct PLL programming
Date:   Fri, 13 Jan 2023 14:05:33 +0200
Message-Id: <20230113120544.59320-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change PLL programming to follow the downstream setup.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index ee76ef958d31..ed8cb558e1aa 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -93,12 +93,9 @@ static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] = {
 static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
 	[PLL_OFF_L_VAL] = 0x04,
 	[PLL_OFF_ALPHA_VAL] = 0x08,
-	[PLL_OFF_ALPHA_VAL_U] = 0x0c,
 	[PLL_OFF_USER_CTL] = 0x10,
-	[PLL_OFF_USER_CTL_U] = 0x14,
 	[PLL_OFF_CONFIG_CTL] = 0x18,
 	[PLL_OFF_TEST_CTL] = 0x20,
-	[PLL_OFF_TEST_CTL_U] = 0x24,
 	[PLL_OFF_STATUS] = 0x28,
 };
 
@@ -106,8 +103,10 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
 
 static const struct alpha_pll_config hfpll_config = {
 	.l = 60,
-	.config_ctl_val = 0x200d4aa8,
+	.config_ctl_val = 0x200d4828,
 	.config_ctl_hi_val = 0x006,
+	.test_ctl_val = 0x1c000000,
+	.test_ctl_hi_val = 0x00004000,
 	.pre_div_mask = BIT(12),
 	.post_div_mask = 0x3 << 8,
 	.post_div_val = 0x1 << 8,
-- 
2.39.0

