Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF8ACDB474
	for <linux-clk@archiver.kernel.org>; Tue, 17 Oct 2023 14:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344024AbjJQOHG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Oct 2023 10:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344006AbjJQOHB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2023 10:07:01 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C0FF5
        for <linux-clk@vger.kernel.org>; Tue, 17 Oct 2023 07:06:59 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4065f29e933so60349095e9.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Oct 2023 07:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697551618; x=1698156418; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlwwFMRACSsUlwqNfTsi8M+bx9LmW0A46F96Cg6Qp3E=;
        b=c31kmMYBsC4MN/h0o5bi+9SdSwiY8T6KWUzMRUxOzo1YqRuYgSGA0foa+rv4xASCMm
         lF4IiNkBoCc07W2nJ7sIUOj7tqzMbmEHH/mWGaNbjAIdV1N4lJhk2rQhjCm7Nj2H5G7z
         T0d+wpmXi0kS8RkgI8chUvpadd/N+Ny9gmKXQsdH7xZZc4b6z7xC55JfLEWlT3ICX7qb
         We1M9Icf4LK3LzYbFc5lqIACVxJ09cPRVx+S6XrL+3ZPPVeCzV0XCBbaL3FYtD7DU5nQ
         VZmPIZ/bL0a3xe95AXFiIwtsYV7Nj8QexJZaidqvTDuxoHa3OTWTznizhnXZI0t+Nchb
         4BVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697551618; x=1698156418;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlwwFMRACSsUlwqNfTsi8M+bx9LmW0A46F96Cg6Qp3E=;
        b=LyzbTWRT83BeWoNIP1vpkCgeZIqcCSQJPJ85QqxKbBttCk9VIKyFWSFJ+ZQfA/T7iV
         q8EFdjqMovhMuuK04H+ciHQTKNvMueWrsPfal5O5PXO/mDL227KxjyFLbPXyDbT+ReSa
         1cfQnxA0Ebp1RWjEX0OHW+dukSer0lK2LQz8AJ/7CO78VFEdu+YaSsgFmtaSHgpQCyGS
         QUG4A6YYeLMLf96vd11mYD+88s+vzBVTCuELCodXJl5FOvOrDZkpTdILe0UzcA8b2ykn
         rxCstp/32xkd+w8u4sz02ALPXfioaB+NhfV/DHcVo4WO2CWXwYjmCIGeS4QLlH1JYHXm
         cTuw==
X-Gm-Message-State: AOJu0YzPVz4sjelgxJjqQPPnYf3EClNiJ1/7+0tqrDFfzU2yIAvsV94o
        ZnClaNN9zpg1XZXFcMSDrJs1BA==
X-Google-Smtp-Source: AGHT+IElkgM7RSL3FOTXdHu+CEAbodkap74uXGoj9xrE4AZmarxqeuWMC6vTAHtVYesdvhJ8Bd8fUQ==
X-Received: by 2002:a05:600c:5487:b0:401:c338:ab96 with SMTP id iv7-20020a05600c548700b00401c338ab96mr1766952wmb.34.1697551618146;
        Tue, 17 Oct 2023 07:06:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m11-20020a05600c4f4b00b004068def185asm2047137wmq.28.2023.10.17.07.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:06:57 -0700 (PDT)
Date:   Tue, 17 Oct 2023 17:06:53 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: at91: remove unnecessary conditions
Message-ID: <7782b4f1-deed-49dc-8207-b6ea06d7602f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This code checks "if (parent_hw)" is non-NULL, but then it has more
checks if parent_hw is non-NULL on the lines inside the if statement.
It is a bit confusing.

For the else statement, keep in mind that at the start of the function
we checked:

	if (!(parent_name || parent_hw))
		return ERR_PTR(-EINVAL);

That check ensures that if parent_hw is NULL that means that parent_name
is non-NULL.  At least one must always be non-NULL.  So here again, the
checks inside the if statement can be removed.

In the original code, it was a bit confusing and you could easily get
the impression that "init.num_parents" could be zero.  When we remove
the unnecessary checking it's more obvious that it's always set to 1.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/at91/clk-utmi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
index 40c84f5af5e8..b991180beea1 100644
--- a/drivers/clk/at91/clk-utmi.c
+++ b/drivers/clk/at91/clk-utmi.c
@@ -161,13 +161,11 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 
 	init.name = name;
 	init.ops = ops;
-	if (parent_hw) {
-		init.parent_hws = parent_hw ? (const struct clk_hw **)&parent_hw : NULL;
-		init.num_parents = parent_hw ? 1 : 0;
-	} else {
-		init.parent_names = parent_name ? &parent_name : NULL;
-		init.num_parents = parent_name ? 1 : 0;
-	}
+	if (parent_hw)
+		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	else
+		init.parent_names = &parent_name;
+	init.num_parents = 1;
 	init.flags = flags;
 
 	utmi->hw.init = &init;
-- 
2.39.2

