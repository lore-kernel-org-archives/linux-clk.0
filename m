Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C2DC282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:06:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C09AE2148E
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bLJpQmG4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfA1SF6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:05:58 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38285 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbfA1SEz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:04:55 -0500
Received: by mail-wr1-f68.google.com with SMTP id v13so19103510wrw.5
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbXfyjfqzqGpHsSm+wGVBTSI4vzKOQ2CLwSheFxJ0pY=;
        b=bLJpQmG4xEa3nqZqf2uYPgGgvShCScNAnZJS/q4tIDJxY5DwMpFJZ6mdtcbmCk/HP1
         3O/hdz5zfiulKkSzwA5TFEOFbS7E+gG4O4V0aVFaxQg/TUWTmnOlX+Gk8CHQN4dvuaRr
         SUbrk8P8HqMB2t2froBrbHPnoLt1VOso5vywumJuWHFv5OSv6pGEekrC2TMP0zm1O6P/
         WPJTLq4oZmGIVhUNkKJt7UpP3pANfvFrUzdYdUc9qMG+gqsEvzdeQmmyqzLIZbgtkihu
         4OZ7gqRALpFPdLOzxOIDtLt0efq3sYAqMUIjBg0lMHrIzz0iuXII0gHXWKJU+YuGPbBS
         7jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbXfyjfqzqGpHsSm+wGVBTSI4vzKOQ2CLwSheFxJ0pY=;
        b=pz3UdJNJYMR66baeRH1qSEwxuDcv7WXO+KtDb3zc8gRcUoNyfAoly0ew96QGmE/fC2
         f2ELbAp574G8pBNcMjkYjYk30SPMDTb9cYLOeiCjIXkuiNXTZYfq8/4lUH9MrPFlOO/Y
         t2BNI6O2RNQHWngjKoBGYFRfYeD01uFkcfxa7f1x1etkJdN1EKcS184+9Xt/0tPLH5rs
         n2ymklFB4DjX7VF3wkbVzbA5kImi2BSIOL3pteTTGv4oAT/i17WpR9AmqFWxs9/DfuLY
         1/9XWXw649fY9gs318vDqChIWb5laar7VR/fSggoDeY7YSOR8k9VZIrKCnl6BtDfI7GI
         VeiQ==
X-Gm-Message-State: AHQUAubuCORhFmr3m5cBHOA+nnkXBY8hQX1XKeM99s4i3SFp4/xwXJ/K
        LCnQ4geqQ98DBMVCZfJbveAbpQ==
X-Google-Smtp-Source: AHgI3Ibf86P6JrR4OEXFj0tAJZiXCpcxEJRKZPGFbtTm60QemWO8lWx4yqtwQENi/Hxu6K3Voru+hg==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr15171607wrr.105.1548698693294;
        Mon, 28 Jan 2019 10:04:53 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.04.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jan 2019 10:04:52 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/14] clk: meson: take the mpll driver out of clkc
Date:   Mon, 28 Jan 2019 19:04:23 +0100
Message-Id: <20190128180430.28689-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128180430.28689-1-jbrunet@baylibre.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c      |  1 +
 drivers/clk/meson/clk-mpll.c | 12 +++++++++++-
 drivers/clk/meson/clk-mpll.h | 30 ++++++++++++++++++++++++++++++
 drivers/clk/meson/clkc.h     | 14 --------------
 drivers/clk/meson/gxbb.c     |  1 +
 drivers/clk/meson/meson8b.c  |  1 +
 6 files changed, 44 insertions(+), 15 deletions(-)
 create mode 100644 drivers/clk/meson/clk-mpll.h

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 8a3896fa343f..dc973b4324f3 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -20,6 +20,7 @@
 #include "clkc.h"
 #include "clk-regmap.h"
 #include "clk-pll.h"
+#include "clk-mpll.h"
 #include "axg.h"
 
 #define IN_PREFIX "ee-in-"
diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index 650f75cc15a9..f76850d99e59 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -12,7 +12,11 @@
  */
 
 #include <linux/clk-provider.h>
-#include "clkc.h"
+#include <linux/module.h>
+#include <linux/spinlock.h>
+
+#include "clk-regmap.h"
+#include "clk-mpll.h"
 
 #define SDM_DEN 16384
 #define N2_MIN	4
@@ -138,9 +142,15 @@ const struct clk_ops meson_clk_mpll_ro_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.round_rate	= mpll_round_rate,
 };
+EXPORT_SYMBOL_GPL(meson_clk_mpll_ro_ops);
 
 const struct clk_ops meson_clk_mpll_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.round_rate	= mpll_round_rate,
 	.set_rate	= mpll_set_rate,
 };
+EXPORT_SYMBOL_GPL(meson_clk_mpll_ops);
+
+MODULE_DESCRIPTION("Amlogic MPLL driver");
+MODULE_AUTHOR("Michael Turquette <mturquette@baylibre.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/clk-mpll.h b/drivers/clk/meson/clk-mpll.h
new file mode 100644
index 000000000000..cf79340006dd
--- /dev/null
+++ b/drivers/clk/meson/clk-mpll.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef __MESON_CLK_MPLL_H
+#define __MESON_CLK_MPLL_H
+
+#include <linux/clk-provider.h>
+#include <linux/spinlock.h>
+
+#include "parm.h"
+
+struct meson_clk_mpll_data {
+	struct parm sdm;
+	struct parm sdm_en;
+	struct parm n2;
+	struct parm ssen;
+	struct parm misc;
+	spinlock_t *lock;
+	u8 flags;
+};
+
+#define CLK_MESON_MPLL_ROUND_CLOSEST	BIT(0)
+
+extern const struct clk_ops meson_clk_mpll_ro_ops;
+extern const struct clk_ops meson_clk_mpll_ops;
+
+#endif /* __MESON_CLK_MPLL_H */
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 4857c8fa1ac4..32947bd76bab 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -11,18 +11,6 @@
 #include "clk-regmap.h"
 #include "parm.h"
 
-struct meson_clk_mpll_data {
-	struct parm sdm;
-	struct parm sdm_en;
-	struct parm n2;
-	struct parm ssen;
-	struct parm misc;
-	spinlock_t *lock;
-	u8 flags;
-};
-
-#define CLK_MESON_MPLL_ROUND_CLOSEST	BIT(0)
-
 struct meson_clk_phase_data {
 	struct parm ph;
 };
@@ -54,8 +42,6 @@ struct meson_clk_dualdiv_data {
 
 /* clk_ops */
 extern const struct clk_ops meson_clk_cpu_ops;
-extern const struct clk_ops meson_clk_mpll_ro_ops;
-extern const struct clk_ops meson_clk_mpll_ops;
 extern const struct clk_ops meson_clk_phase_ops;
 extern const struct clk_ops meson_vid_pll_div_ro_ops;
 extern const struct clk_ops meson_clk_dualdiv_ops;
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 813822ec5f57..6a8358f3e0ef 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -16,6 +16,7 @@
 #include "gxbb.h"
 #include "clk-regmap.h"
 #include "clk-pll.h"
+#include "clk-mpll.h"
 
 #define IN_PREFIX "ee-in-"
 
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 9b35d5e08378..91a5306b13f6 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -20,6 +20,7 @@
 #include "meson8b.h"
 #include "clk-regmap.h"
 #include "clk-pll.h"
+#include "clk-mpll.h"
 
 static DEFINE_SPINLOCK(meson_clk_lock);
 
-- 
2.20.1

