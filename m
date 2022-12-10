Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23ADC4708D
	for <linux-clk@archiver.kernel.org>; Sat, 10 Dec 2022 19:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiLJTHS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Dec 2022 14:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiLJTHQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Dec 2022 14:07:16 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA482E0AF
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:07:15 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id q7so8382527ljp.9
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WGA3CE1U6R6bJ/377jev2Um8kAhck2W0ep0wN2HF6s=;
        b=k/XiHFjXATVRZi8jK9CRKg/tT5rAv3ADytboTWHeaJhOvNEH70ISUs+129IdQw0Q6/
         twivCw38QMOLD0TbbCbHWp5vFSIntOm8Hl1jkr7M3oKl5WhS4o+WOdt+keEAKwZQ8sPI
         8Y70ZH9y0MKe/e/mPwUMECEN8cgVSHl38NnQlKqZsOMOo3hkH3+7i98/KZGViPMryxpx
         4dANqhuqJvhYKvz8g/7SmNGXYDChFKMcJKPCr2FupaAjtU3fvp6H+E0Cbb611EIeusqC
         0PHbJOG7+EB/qdoMQxJXZXHuC81EEOb2YsvSp+ZTtG5ZcII4o/Bka4UBQw+htyqcmbVn
         jpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WGA3CE1U6R6bJ/377jev2Um8kAhck2W0ep0wN2HF6s=;
        b=UsrDvj/OgfcX93iuuYjI4cvolQYVs1nxQqHvxAcTMjp2HVHLN/LaydmHHTluhikoUM
         yEfQHT9hjsF3X/44lWDncn40CCske1eX2v2r1IwKOG/I4ooPgSR8Xzx7h9lXnvuuYRbK
         L+RM8F3J3sNWSlWi/xeiG6N8fFdNyxP2beuiUdAsmMzcM65vHuTi0HnBd9Eak7vZPAMn
         NzBNZnnkoVqP9WQTL026Ge1LQ3KxltYBnXy2dSgq53Qp8cVL7/N8HWjtx5pE4rQ/8VBX
         Uc0PAJCMg/M+BYFaKYBi/KGS5g+9WUMmurvUKQiW/p82k2L/udKFIOGrrmi6m1juZo1K
         djEQ==
X-Gm-Message-State: ANoB5pnFo8EkX6Dv2X47YCgVsdiZXoXMvOAjfxpC6cd1ZyudcjMk5oTr
        vSjm75vhNfTL7zrMyU8NUqcfGA==
X-Google-Smtp-Source: AA0mqf7QS7GXgY0sTOmYy20gHq3UwQAOvQuFpkXlgf+9oixgvPbcG3GsHsd7DLdGxHt0B+XT7/gOFA==
X-Received: by 2002:a2e:be28:0:b0:26f:db35:2e96 with SMTP id z40-20020a2ebe28000000b0026fdb352e96mr5076627ljq.8.1670699234142;
        Sat, 10 Dec 2022 11:07:14 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v14-20020a2e7a0e000000b00279e93c9c25sm701622ljc.29.2022.12.10.11.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 11:07:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 2/3] clk: qcom: gcc-sm6375: use parent_hws for gcc_disp_gpll0_div_clk_src
Date:   Sat, 10 Dec 2022 22:07:11 +0300
Message-Id: <20221210190712.451247-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
References: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change gpll0 to use parent_hws instead of parent_names for
gcc_disp_gpll0_div_clk_src clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/gcc-sm6375.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index 89a1cc90b145..6d75f735a7a6 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -2330,8 +2330,9 @@ static struct clk_regmap_div gcc_disp_gpll0_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_disp_gpll0_clk_src",
-		.parent_names =
-			(const char *[]){ "gpll0" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
 	},
-- 
2.30.2

