Return-Path: <SRS0=jGYp=XI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF80C4CEC7
	for <linux-clk@archiver.kernel.org>; Fri, 13 Sep 2019 02:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB43E20856
	for <linux-clk@archiver.kernel.org>; Fri, 13 Sep 2019 02:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pX8GfKNl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfIMCke (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Sep 2019 22:40:34 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44008 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfIMCke (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Sep 2019 22:40:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id u72so14451862pgb.10
        for <linux-clk@vger.kernel.org>; Thu, 12 Sep 2019 19:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=yK99CWDEV+GMLXWhJb+XNR1rZIzkOo1KcI+8O5gSgak=;
        b=pX8GfKNlP3H7LubXCrt3O4BEUxhmJt5lfVF3cSVQwZNgT5bWdx5ZLLkyRecsMHl3RP
         gsomj7G6Cp+CUjvJngWvlC/cu+iNAJU1hSO48bbEBwN7PTvJKOjBqf0xEJI3hnCjxA+v
         QgY8zJ0VFKbmzYwY3tEZf8LczcsqMCX04A8OLXyTPaqCFiRw+L9TOK9lidjYLjpOyCT6
         F/+NAI3zDnmEkFJlZEjm7jmzPwbiiwUB4wBm28tMwDEEfe/j4Nrh2/SB1PaPtD8pQgI1
         m7G0FmmvO+iVSQh3qt+tJMcoChqooWEsaG8jfHh64uq4j/aJl1wvycdfCj3sMtgXRVQt
         pCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yK99CWDEV+GMLXWhJb+XNR1rZIzkOo1KcI+8O5gSgak=;
        b=in8ZGxftzFgKSe5Ybrp6BjmOOO7tps+Ih0uJF1AtAK4h9UpxXWod6a/MfUzz+jX8Dt
         PZtwTPlaaJRm6uj06D5YtmE0OxqVPCeSRnxWJPBjs7kQXhFr3Fxv9Zhhp8jOWRHnKnhd
         7eOJGfZ4bmP6zC+NYWdHJMvTYwPAmkdXnXgO5B0D7nXESGEck9ilDZpwaN86mLEYAQkr
         rgvZEstE0bLn8Wj+G9Iu7HZfchzRLy2iqK/MQreSOsXhgiyIH100p/cRBRcfOF31PA9r
         EvfadacFL4NPwZBcwMIyUZox2Qz9umHSCl/UZG9VIyESIwg6LuF0Wja1GTQH5s2rrdEK
         asFA==
X-Gm-Message-State: APjAAAXBj/jta16A8YPtufKSfVLtKdeha7kt/hFtP+VcpOOiTSNG5OvQ
        qv2mwbyl8rWjxQ7Z46x0PIWHUA==
X-Google-Smtp-Source: APXvYqwtiQkm2M/xKlHGAxKnIsR+ZI2Lqsa2MEw3Q53WdznmG4Z/bpTDe/Tk3NIvdO/QXK8Zax/CBA==
X-Received: by 2002:a63:9249:: with SMTP id s9mr39988094pgn.356.1568342433021;
        Thu, 12 Sep 2019 19:40:33 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i74sm40222938pfe.28.2019.09.12.19.40.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 19:40:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH] clk: Make clk_bulk_get_all() return a valid "id"
Date:   Thu, 12 Sep 2019 19:40:29 -0700
Message-Id: <20190913024029.2640-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The adreno driver expects the "id" field of the returned clk_bulk_data
to be filled in with strings from the clock-names property.

But due to the use of kmalloc_array() in of_clk_bulk_get_all() it
receives a list of bogus pointers instead.

Zero-initialize the "id" field and attempt to populate with strings from
the clock-names property to resolve both these issues.

Fixes: 616e45df7c4a ("clk: add new APIs to operate on all available clocks")
Fixes: 8e3e791d20d2 ("drm/msm: Use generic bulk clock function")
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/clk-bulk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
index 524bf9a53098..e9e16425c739 100644
--- a/drivers/clk/clk-bulk.c
+++ b/drivers/clk/clk-bulk.c
@@ -18,10 +18,13 @@ static int __must_check of_clk_bulk_get(struct device_node *np, int num_clks,
 	int ret;
 	int i;
 
-	for (i = 0; i < num_clks; i++)
+	for (i = 0; i < num_clks; i++) {
+		clks[i].id = NULL;
 		clks[i].clk = NULL;
+	}
 
 	for (i = 0; i < num_clks; i++) {
+		of_property_read_string_index(np, "clock-names", i, &clks[i].id);
 		clks[i].clk = of_clk_get(np, i);
 		if (IS_ERR(clks[i].clk)) {
 			ret = PTR_ERR(clks[i].clk);
-- 
2.18.0

