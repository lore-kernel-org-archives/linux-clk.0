Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B47C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08AE62311B
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391341AbhAZNLF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391941AbhAZMsg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:48:36 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEC8C0698DD
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:58 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id u14so2627421wmq.4
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HC9oGmsVO5oAzKPG00K8ovLaaiSlGT3tZa2rImR2jdE=;
        b=qtT+KJH+lKspIgo6IvnRoDbAhFLYau59bLEimbXlVRgym8AoBAMHvXmGYOOhCg4Igh
         gzwZXnfHKm+51ASEJvjnO1w1SIXW+N9KH4kNgtDG8b7y0kT5hjeIZvo3e0SdZZJol2HG
         elgJs/kVgO8UPCbWORn7Vo6GMjdaYb8L9icnkKVwRWKxbAbJJnxkWPsyauZGNPI3Udj+
         0rKtEex+MeckBdtl1VLSa7eliuAuYpzRf7b0JnJ3+wsOKCOj9w/ZVjkGWVvLyQYBkW4+
         3vI/Erlh+URfZV3eV0r47vz+QbO90L2yMztxUhxBNz6eWrv7vdmjvVwJ7OhnEuD8wHaR
         2hvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HC9oGmsVO5oAzKPG00K8ovLaaiSlGT3tZa2rImR2jdE=;
        b=EYwAx1v81c7Geusi24KL26FiHA/GzX+dP1kmlJcY7d5oQytFLQWY0B0Yg/non+1ul4
         xJtMmxS98938NARdPfU9/UzaCdFJGmZRHZ9MK1xPkkKNvk+G59s3zo5tYa1S7XR3er1d
         Af9yRCfam0rjJpU+tyub7JWU1PczUJrv8aeBbhYcVCQ6f2DTXxGInK0vpqXEWyLXWe3P
         F1pTkYvqCYtJc4ttsQaU+0p/W9RMv2qwunaOdC8vnG9sIHPdsQJijGmYmJ1abG+eaNbG
         f3XbSmnRzET/+Kp6hg+u74Cb9FHopJnnlIhCu7yuExHCcbBzMmOifCP/Qxx+JNe0XIZL
         4e+A==
X-Gm-Message-State: AOAM530YCusNrqtZ8vSYm4Hj98Sgu+p2bBAgMXJsslj5v/3hMgg97GL6
        QS7ltx+Tl0P0V0+6j7Kr3j4qYw==
X-Google-Smtp-Source: ABdhPJx+9ryinrcrzNqRBnQheOhsDKyqDTA69GbijOK1wMVO2OJRSAEClu1EGu535Mt4uLL9Slra/g==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr1944888wmg.66.1611665157661;
        Tue, 26 Jan 2021 04:45:57 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:57 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 11/21] clk: renesas: renesas-cpg-mssr: Fix formatting issues for 'smstpcr_saved's documentation
Date:   Tue, 26 Jan 2021 12:45:30 +0000
Message-Id: <20210126124540.3320214-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/renesas/renesas-cpg-mssr.c:168: warning: Function parameter or member 'smstpcr_saved' not described in 'cpg_mssr_priv'

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 1c3215dc4877c..bffbc3d2faf5f 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -136,8 +136,8 @@ static const u16 srstclr_for_v3u[] = {
  * @control_regs: Pointer to control registers array
  * @reset_regs: Pointer to reset registers array
  * @reset_clear_regs:  Pointer to reset clearing registers array
- * @smstpcr_saved[].mask: Mask of SMSTPCR[] bits under our control
- * @smstpcr_saved[].val: Saved values of SMSTPCR[]
+ * @smstpcr_saved: [].mask: Mask of SMSTPCR[] bits under our control
+ *                 [].val: Saved values of SMSTPCR[]
  * @clks: Array containing all Core and Module Clocks
  */
 struct cpg_mssr_priv {
-- 
2.25.1

