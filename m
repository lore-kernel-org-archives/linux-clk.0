Return-Path: <SRS0=Adza=ZH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208C2C432C3
	for <linux-clk@archiver.kernel.org>; Fri, 15 Nov 2019 16:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E995D2072D
	for <linux-clk@archiver.kernel.org>; Fri, 15 Nov 2019 16:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oy/O4BqG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbfKOQ3T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Nov 2019 11:29:19 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43572 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbfKOQ3T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Nov 2019 11:29:19 -0500
Received: by mail-pf1-f196.google.com with SMTP id 3so6910517pfb.10
        for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2019 08:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aiDt5t52KW99BwDzbhRa8ElOQ9bHTmHQCFgO82CwQAI=;
        b=Oy/O4BqGl/cYIaUeSeBVIA1VgGxIh5tfnMB5Dwc+UgTdmMx7bk64U5C+VRdzu/xN95
         3EQUhetkGTfikrqkG9rHFqi96AH6DcTeIhL1orxGmc+OXRnALWOr8RncE5relrzlVDOm
         o9qjzgh/PzuJX4wVCSBe4bHyeDLrXb5ziLfUma/W3NuXJ2oogiYo0m0i55JuNdE8B/3r
         USdzAfy00rL79N9/btkoxDonDHjFh/KKeQ8zywbDrwRaAPfvMxo7VtBBEUo7arH1ejUk
         wZsocSxzPXkK0U3FEv0WNjgv0k5kiR3Zx8cwu2b+ZojKAWNcdXQt9bha5j8vZkILVim2
         x2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aiDt5t52KW99BwDzbhRa8ElOQ9bHTmHQCFgO82CwQAI=;
        b=NZ/rgG+9vztvzRMFOEK5ok6I0WU216cJgyWhA/buHTi0qQRSHvY3AE/Q8CY9acks8x
         rUlRhUOmIvmNXhSvgVdmwAyg1XtHMhBQfu/m53f6zBArGh2W7N3Byj4x/M15GRPsrHJL
         UulA1TagZJgUNKRma4TexuX/g8VuUeW4H8Pst+ZKSRi9xWT2Xv9flBHvRhzZAbmR9mOk
         EgRoqaku8Sn7HZWhQv1tANpz2LJSXZUs8yM3yCgcUKDuwmttdpd/o2sOgIr/rUNOozWZ
         q/5Z0yzghCLKv1xgVnFG+upJs2OMJieNPpBLc5TPB4TMdggSZF8J3rWzJhD+f59Vdrt7
         cXKA==
X-Gm-Message-State: APjAAAWXneR8gR2Vp9qQYVDC9Jo0nTe3bEchqmz1xIjTwep8jTH1rjRB
        L1TJTCN7nKii7bNLJkqwLBfNgjK3v5Uu
X-Google-Smtp-Source: APXvYqwH7MWs5hSnZfDuOau27gTdOifRG82hxWJYo6xozoqDnyQa+H79g7hPxhqMk00goHcrqEY5XA==
X-Received: by 2002:aa7:9aea:: with SMTP id y10mr17998100pfp.16.1573835358376;
        Fri, 15 Nov 2019 08:29:18 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6183:6d55:8418:2bbc:e6d8:2b4])
        by smtp.gmail.com with ESMTPSA id y24sm12295288pfr.116.2019.11.15.08.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 08:29:17 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 1/7] clk: Zero init clk_init_data in helpers
Date:   Fri, 15 Nov 2019 21:58:55 +0530
Message-Id: <20191115162901.17456-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191115162901.17456-1-manivannan.sadhasivam@linaro.org>
References: <20191115162901.17456-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_init_data struct needs to be initialized to zero for the new
parent_map implementation to work correctly. Otherwise, the member which
is available first will get processed.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk-composite.c  | 2 +-
 drivers/clk/clk-divider.c    | 2 +-
 drivers/clk/clk-fixed-rate.c | 2 +-
 drivers/clk/clk-gate.c       | 2 +-
 drivers/clk/clk-mux.c        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 4f13a681ddfc..28aaf4a3b28a 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -207,7 +207,7 @@ struct clk_hw *clk_hw_register_composite(struct device *dev, const char *name,
 			unsigned long flags)
 {
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_composite *composite;
 	struct clk_ops *clk_composite_ops;
 	int ret;
diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 3f9ff78c4a2a..098b2b01f0af 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -471,7 +471,7 @@ static struct clk_hw *_register_divider(struct device *dev, const char *name,
 {
 	struct clk_divider *div;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index a7e4aef7a376..2c4486c09040 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -58,7 +58,7 @@ struct clk_hw *clk_hw_register_fixed_rate_with_accuracy(struct device *dev,
 {
 	struct clk_fixed_rate *fixed;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	/* allocate fixed-rate clock */
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 1b99fc962745..670053c58c1a 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -141,7 +141,7 @@ struct clk_hw *clk_hw_register_gate(struct device *dev, const char *name,
 {
 	struct clk_gate *gate;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 66e91f740508..570b6e5b603b 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -153,7 +153,7 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 {
 	struct clk_mux *mux;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	u8 width = 0;
 	int ret;
 
-- 
2.17.1

