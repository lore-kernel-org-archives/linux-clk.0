Return-Path: <SRS0=Bykf=7G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F4DC433E0
	for <linux-clk@archiver.kernel.org>; Sun, 24 May 2020 21:06:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AEB620899
	for <linux-clk@archiver.kernel.org>; Sun, 24 May 2020 21:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="grjGwVpX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388209AbgEXVG0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 24 May 2020 17:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388207AbgEXVGZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 24 May 2020 17:06:25 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A19BC061A0E
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2020 14:06:25 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 205so2852223qkg.3
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2020 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JZAgaP5woLxgcXHosrZpunWOJzCPGNVUHXsQchER0OE=;
        b=grjGwVpXkxkvehF3ztGVZ0+axZxgywMdVt4bJocVsGxrb+bw0vddmaiMSIMqBdOjKP
         ltzQ3mlmFx9Hr6xi3UlPe4bE2Ze1kB6hYHPojLVgoXvkmIVqaVbvDXezUQmln3gJOj6u
         e3odFIAaeDWc48ZX0MqUFFxOt8z1w4mc8h348d69r6BKDMyE1xiyEiOv23FUUIWnJW+G
         P/C5HD5wzUEsWXXphH4bCTibInsn5Ew0OsuUETxn/7IP1mWxEzUmUZ0qoGPGmo42cblJ
         F80Wh9FEYAGq5fXEzcWqPVV22LmSw1gpVwaPIjTJewH6rygmRGa6nxUfWjUKOcaz2Kn2
         Gwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JZAgaP5woLxgcXHosrZpunWOJzCPGNVUHXsQchER0OE=;
        b=mWmvN0HRnjUoVLFpnqTCTcU5Djuh/CT4s4WEGrShKbYDTOzjcx5jekVjRmFXDXZKUi
         ahv2m9NgNTMOuVuY+8MwETVqsKONxMVL0eJ3plMOJoZYTMzYxO50AYlTMlVhXnQBoq7N
         2I14zLO5v2/kDY3ofTMIFlVG+eyxlqXKPy76TnLK9V7OSJRGLAHDmx/rQXMolnpIjmDJ
         gyAi+aDFnpdspyLMpi4QYUodJFHd+b/g+ozf3C3Z0KuJgyD7fin/++aXVUZc9Jhjw8a6
         N20eC+pRh4RRNL2dJBhQ+x6cqsng7jnVVFZtdv1Pa7rDIUxjHb3ugmC6zb7jOv3pEjBP
         nCOQ==
X-Gm-Message-State: AOAM530Bk60kzVpTawLjC9iA8Z9+TYtXDqZ/OnJXfNESkTxP4kBWwhWD
        Ai4TSF5WzCEQh0bsTk9AmM3I2A==
X-Google-Smtp-Source: ABdhPJywDSNHrQwVhkcv/CtEnu17VHvnh5/74RzgGULsJTA5VsvEtaFEw59eIUXI73jOwG7ZB57nlQ==
X-Received: by 2002:a05:620a:136e:: with SMTP id d14mr25455161qkl.9.1590354384546;
        Sun, 24 May 2020 14:06:24 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g51sm4401769qtb.69.2020.05.24.14.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 14:06:24 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 04/10] clk: qcom: gcc: remove unnecessary vco_table from SM8150
Date:   Sun, 24 May 2020 17:06:05 -0400
Message-Id: <20200524210615.17035-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200524210615.17035-1-jonathan@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The fixed alpha pll ops only use it for clamping in round_rate, which is
unnecessary. This is consistent with SM8250 GCC not using vco_table.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/gcc-sm8150.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 46dc67157eba..b14de0f35559 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -34,14 +34,8 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static const struct pll_vco trion_vco[] = {
-	{ 249600000, 2000000000, 0 },
-};
-
 static struct clk_alpha_pll gpll0 = {
 	.offset = 0x0,
-	.vco_table = trion_vco,
-	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
 	.clkr = {
 		.enable_reg = 0x52000,
@@ -85,8 +79,6 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
 
 static struct clk_alpha_pll gpll7 = {
 	.offset = 0x1a000,
-	.vco_table = trion_vco,
-	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
 	.clkr = {
 		.enable_reg = 0x52000,
@@ -105,8 +97,6 @@ static struct clk_alpha_pll gpll7 = {
 
 static struct clk_alpha_pll gpll9 = {
 	.offset = 0x1c000,
-	.vco_table = trion_vco,
-	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
 	.clkr = {
 		.enable_reg = 0x52000,
-- 
2.26.1

