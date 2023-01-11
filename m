Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4EFC5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235083AbjAKUFo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236055AbjAKUFI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:05:08 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCFD43E45
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:32 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu8so25187668lfb.4
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqckWVN1EW8nGGVGrmVxxAgycA7grXm6YjyhUvZ/LK8=;
        b=xNeCu+Rd5QdYA1QA4uQJj3yUife2h+H/5njbViWSLG8bRuzhVLviqXXG1z68mQn5FF
         FkLWHYJ4xaQx8zC6hgZgva0rD4kZM5rH/3ymMNCXxOFkmjv5cDudmwIbcJhu97ZgqdHk
         ydg9KWAPob4n8DxiGzobiKXxlg/qsaBEv3iqbg2cBFu256OE2AuHUPZlzY/aVl3jrYyv
         gtB+rZJlUYfmISasC2RUVxXLQRP3lux/TgYPMSBcvMdqBClcNjCb7z8+4Eh++1Ls22N2
         dFpMpzQcIYXxlt4bkU+qiH4dPuadHdy2lPwVvR1lHBpPCVcy5W3Qi8elR6y1iDw7LX8S
         DOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqckWVN1EW8nGGVGrmVxxAgycA7grXm6YjyhUvZ/LK8=;
        b=rFXpT64WZwdWZAsMidbKZfoClQ3Kv8TnMfBuiEa2y7zNl18nNTOWMt/GGOeiJsAIrq
         6ECQw5GsrYzd2Lh5wX2pW7EFN1P6inPwedIkEKL81cxhNennKmkgMHpaFmt0CK94yAkt
         DW3sM8ZzYpQFDBGxfm3p4kfk+Ge31aYz65VawnXjhmOMkkxt//r9WiH64/Tv5Bd+FxEz
         NNQ+0+KdtxBMMh0TYks4qvXOGHUgnI+Z151cvWV2ohsj6kusVjKcRE8KZcAUwQNEbBru
         n12Pi9mNlMVSroulb178CLa/HQ2Ok/k4CYP9IPXLLn6n7varHMsq3Z2MboDY5zvsiiaE
         HcJA==
X-Gm-Message-State: AFqh2koiDDI9ua6/BKlGNXQv/S7ciMJ2cj+ufcvuNGkc1Zo2I2y6Zsgq
        k2P8bTvvP7PdTBz9cNg3svl25Q==
X-Google-Smtp-Source: AMrXdXtC1qHCdqhA1iA1ASNLgcAUL6h47wf6APDkjpPlzBB0dwMR54IXsBxt/TSb574g4Zi8vXOkwA==
X-Received: by 2002:a19:5517:0:b0:4b5:6042:d136 with SMTP id n23-20020a195517000000b004b56042d136mr19079107lfe.22.1673467291291;
        Wed, 11 Jan 2023 12:01:31 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:30 -0800 (PST)
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
Subject: [PATCH v2 03/14] clk: qcom: cpu-8996: correct PLL programming
Date:   Wed, 11 Jan 2023 23:01:17 +0300
Message-Id: <20230111200128.2593359-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change PLL programming to follow the downstream setup.

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
2.30.2

