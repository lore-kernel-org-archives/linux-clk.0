Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B77C43334
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbiFLTbR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234885AbiFLTaL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:11 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7CF41FBF
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:10 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id i64so4017770pfc.8
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9BD6fOCQDuXGNvvC7Eq1XdWqHijpUDxeMXf7cXPhn/U=;
        b=ekaOO6grv5yZSjOghiSIAjlDOGcAb0wyh+MxZ0id8V3LmNUBEPzMMpQ12bPnVe6yVS
         TvbYZdXPOqT5xIhZ/68CB6UlAw4w+G18Gt2DMh5RdiF2jyeAJHDQUHm2h+gTAVbzolCB
         ysrR9VidY0hW9ZOuS2R+J8Jjr5AKLayp0Q078=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9BD6fOCQDuXGNvvC7Eq1XdWqHijpUDxeMXf7cXPhn/U=;
        b=T09mE5sHJJ4YV0fz1hLnRhtGzZWn3hsFKLwIeZzjApQTI+9TqaPRN+U2SQCCCpZm5C
         LQqJfBvbP4ryx/SR5rQC+sCjBFQ8hSSr2Qi5bvDYVgmwsPCKNXljnf1qHGYWaCnoane4
         4i+VdhHDaPF/QQS6tOp6FMEDZsyJy57YqBc5XR0roB2wFmvi/R5/eGplAbj90zv8oizb
         4QI6W2AsxP4Lr0dT+gthuChWHEdw0TqqCzXNqS3mLxakCwkeuyIvcTJNMWDOtgxlFuHP
         hiRSyrC2BKZ/SRSc+AVv02yWGf1NcUNLsZHxmEOAU+FZ13HSHwQQgLcMoQeLPxso9wO2
         P/ZQ==
X-Gm-Message-State: AOAM530p9jeiZ0WO5D1JOS5GqZpBBXAykV4kghGK5PryBGQ2tT5wqENQ
        F8HFeuoRuE5SkDzEndzUVd4nnA==
X-Google-Smtp-Source: ABdhPJwQfhdGxJV30Cbdr17NLWpeB0QvwXwA+v81ZoNaXLnOReUnmy/Zue4tDZXVeFwkx3v/d7TLng==
X-Received: by 2002:a63:2a16:0:b0:3fe:192a:2d3 with SMTP id q22-20020a632a16000000b003fe192a02d3mr23720346pgq.39.1655062210302;
        Sun, 12 Jun 2022 12:30:10 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:10 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 02/12] clk: mmp: pxa168: fix incorrect dividers
Date:   Sun, 12 Jun 2022 12:29:27 -0700
Message-Id: <20220612192937.162952-3-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These two clocks had multipliers and dividers that didn't match their
names. A subsequent commit goes through all of the existing peripherals
and ensure the correct clocks are being used everywhere.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index c975a45f9bb6..42569cf3f42f 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -91,8 +91,8 @@ static struct mmp_param_fixed_factor_clk fixed_factor_clks[] = {
 	{PXA168_CLK_PLL1_96, "pll1_96", "pll1_48", 1, 2, 0},
 	{PXA168_CLK_PLL1_192, "pll1_192", "pll1_96", 1, 2, 0},
 	{PXA168_CLK_PLL1_13, "pll1_13", "pll1", 1, 13, 0},
-	{PXA168_CLK_PLL1_13_1_5, "pll1_13_1_5", "pll1_13", 2, 3, 0},
-	{PXA168_CLK_PLL1_2_1_5, "pll1_2_1_5", "pll1_2", 2, 3, 0},
+	{PXA168_CLK_PLL1_13_1_5, "pll1_13_1_5", "pll1_13", 1, 5, 0},
+	{PXA168_CLK_PLL1_2_1_5, "pll1_2_1_5", "pll1_2", 1, 5, 0},
 	{PXA168_CLK_PLL1_3_16, "pll1_3_16", "pll1", 3, 16, 0},
 };
 
-- 
2.25.1

