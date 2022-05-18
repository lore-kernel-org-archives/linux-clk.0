Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CB3C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 18:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236213AbiERSZl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 14:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbiERSZk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 14:25:40 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A1A1CA34B
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 11:25:39 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id eq14so2154606qvb.4
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CVGtSDjxtUlLWvvetgGRiUZg3RmuWi7A88eHZqwiyZg=;
        b=lRGutispnHq6m+luptKyIFq685ZKFMADIpH5jZddkQznt0UdqhHyIicw28abv63fL+
         X36rzDVceNC2YnyXX12UHCqFjT5uvMEC5fFqPZKvxObixtH5u1lTnxLq8/f7NWXR+Cu9
         BES8iz6Hq7D0xkKjXhHVLV+aMqR45v9aHv9kkcoppxLXU2bChp9jyeu8FYKTI+sxFuzG
         g8zCo1lOZWv7fMv3gwf/qr0EhW2yVbpCLc3jD6eL8bp2v+eun33JqfrAoNGr4+an8e5T
         44xuhLxqbfXbzFOBtXbFj2H9P9r5297eYP9RUHvxUYtPeDztY6WLRiclqW/r3260kVVY
         WbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CVGtSDjxtUlLWvvetgGRiUZg3RmuWi7A88eHZqwiyZg=;
        b=cN2vG9O/COChxivXA9BUm2v3UxRL9Mfy1PkgQoLFYylrpBymB/4lbQ4rLVy/Eg1ynU
         eE4PYgK/fi7GjobhvORF0QEkhIJ2ng1f8Zm2L4NhIJMOsTGQVbdLphM1Wm7v/hpJe8uq
         Qtm0a02MduTogZfu+e+0FefYUQWkjl43ghLWdE7vIyJJXp040MT/BvlGHgwQKXMjJm9i
         hFxr2nRZT8Oeux7EB59K91lcvBSu9RWaZiiVjeVUZduSYkSNnb+GAz2A/T8Uv79KYvav
         qTXZZ/rOvo6FVxiiGhGrGmtHLHkppoyfEJmIVuzhFz/u8DHizs4h+IKUeE/j5YocY1jL
         cDsg==
X-Gm-Message-State: AOAM531zR2bGPqMjRBcCJ7qBC8pm9hUy5+i1lB6FD3mmAcmVvMUB3mBM
        9bgeTsi/yLEdI0X3ZR9+hja50Q==
X-Google-Smtp-Source: ABdhPJz8bZUpOLUyws4VEIBREZFYVwJBoIDnKP1B3V4SGYcehuOp3jsAxnXGo8uZo5tK59GkuTRzeQ==
X-Received: by 2002:a05:6214:c66:b0:45c:538f:21b2 with SMTP id t6-20020a0562140c6600b0045c538f21b2mr850277qvj.90.1652898338283;
        Wed, 18 May 2022 11:25:38 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id l19-20020a05622a175300b002f39b99f670sm1798361qtk.10.2022.05.18.11.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 11:25:37 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     ralph.siemsen@linaro.org
Cc:     geert+renesas@glider.be, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, phil.edworthy@renesas.com
Subject: [PATCH v2 1/3] clk: renesas: r9a06g032: Fix UART clkgrp bitsel
Date:   Wed, 18 May 2022 14:25:27 -0400
Message-Id: <20220518182527.1693156-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There are two UART clock groups, each having a mux to select its
upstream clock source. The register/bit definitions for accessing these
two muxes appear to have been reversed since introduction. Correct them
so as to match the hardware manual.

Fixes: 4c3d88526eba ("clk: renesas: Renesas R9A06G032 clock driver")

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
v2 changes:
- reverse the comments as well

 drivers/clk/renesas/r9a06g032-clocks.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index c99942f0e4d4..abc0891fd96d 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -286,8 +286,8 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.name = "uart_group_012",
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_UART,
-		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
-		.dual.sel = ((0xec / 4) << 5) | 24,
+		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
+		.dual.sel = ((0x34 / 4) << 5) | 30,
 		.dual.group = 0,
 	},
 	{
@@ -295,8 +295,8 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.name = "uart_group_34567",
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_P2_PG,
-		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
-		.dual.sel = ((0x34 / 4) << 5) | 30,
+		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
+		.dual.sel = ((0xec / 4) << 5) | 24,
 		.dual.group = 1,
 	},
 	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0, 0x1b2, 0x1b3, 0x1b4, 0x1b5),
-- 
2.25.1

