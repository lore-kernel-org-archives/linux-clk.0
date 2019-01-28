Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F82C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7560B2148E
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s9fk6aav"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfA1SEz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:04:55 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34549 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbfA1SEv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:04:51 -0500
Received: by mail-wr1-f67.google.com with SMTP id f7so19209297wrp.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFsiSEWNipF5j/nl4GiByTeXt6gTIo/QNa1h8WqspDA=;
        b=s9fk6aav/smNqwREMwe6B+H4p5UdpW7nkEjbAL+Fcun3b3/M+kxgDzUZDHB3ffeOrx
         SFY8xMWPuBg5lUGBFx2dw3beHsXwoLCQiEGgHMFCiTluBkwSDbD9qn0oSb4B05vWuvXH
         jerhvW/yMoT7ft++LPY2mGXSfES2aqAYXgxqD7zoZK3P+/ChKfDFXwdm1uEG/dE9Trgp
         3nclpK6SIjyYBqOCwJNiRPtPrbaVe1lnGN9a5YZHm9kxBkGKa0zZTUpPBCrdGTsbMxx0
         xW7MlWlrFCM7kRZxRiwfvRWNiznZSEGDAjU7hWP52YunjJPKBx3kDY51aXIjP4JGKkt9
         eAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tFsiSEWNipF5j/nl4GiByTeXt6gTIo/QNa1h8WqspDA=;
        b=XmRVIthbmHkpElZ4p9m2uHZ1s+BXWYfv7/wSNpYyDS2ND5xufhoa9GwZ5rP4WL6WZN
         pC4F/KWkEWZsjxL9hrUXrbelgyi0yHksenMPvBUvD/yZkpv5XkUXSgETn4LQj0z93p0V
         oLU+7Y09dWMT+HsSQLAEtGWCdg9MGgmo33xHaOPeOzhsqdxS/QwzDQV4K0heF73bbie4
         s5EmeZ0SM3kXFsSEAcYZKkIft/3pyHsEnc2W1rzIfV8WWrJ6EypYp6ZNJepfPd7qgMqO
         3gIooiRaf9pKYD3RW9QqLfAwfgtPFEGednQ87eA1VlqTQCWeA8xuxDsc/M/m5kQ4ChJ0
         g8bQ==
X-Gm-Message-State: AJcUuke0I/6PzHPYrlbFhF2J8l419fFv/0xQbrXmc4ptF7effz6nolnw
        u59r3ERLb0WSdFGAY51YVuI1nQ==
X-Google-Smtp-Source: ALg8bN43+P7d4wrn97gV8O0Ak5AVOuyFY/9fHPH1klbLsHnSlllH1qCMuc1gy1HgllQVPkmK6SXfUA==
X-Received: by 2002:a5d:6647:: with SMTP id f7mr22600942wrw.225.1548698689917;
        Mon, 28 Jan 2019 10:04:49 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.04.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jan 2019 10:04:49 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/14] clk: meson: move parm out of clkc
Date:   Mon, 28 Jan 2019 19:04:21 +0100
Message-Id: <20190128180430.28689-6-jbrunet@baylibre.com>
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
 drivers/clk/meson/clkc.h | 34 +----------------------------
 drivers/clk/meson/parm.h | 46 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 33 deletions(-)
 create mode 100644 drivers/clk/meson/parm.h

diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 35768c2327ba..58a343fa94e6 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -9,39 +9,7 @@
 
 #include <linux/clk-provider.h>
 #include "clk-regmap.h"
-
-#define PMASK(width)			GENMASK(width - 1, 0)
-#define SETPMASK(width, shift)		GENMASK(shift + width - 1, shift)
-#define CLRPMASK(width, shift)		(~SETPMASK(width, shift))
-
-#define PARM_GET(width, shift, reg)					\
-	(((reg) & SETPMASK(width, shift)) >> (shift))
-#define PARM_SET(width, shift, reg, val)				\
-	(((reg) & CLRPMASK(width, shift)) | ((val) << (shift)))
-
-#define MESON_PARM_APPLICABLE(p)		(!!((p)->width))
-
-struct parm {
-	u16	reg_off;
-	u8	shift;
-	u8	width;
-};
-
-static inline unsigned int meson_parm_read(struct regmap *map, struct parm *p)
-{
-	unsigned int val;
-
-	regmap_read(map, p->reg_off, &val);
-	return PARM_GET(p->width, p->shift, val);
-}
-
-static inline void meson_parm_write(struct regmap *map, struct parm *p,
-				    unsigned int val)
-{
-	regmap_update_bits(map, p->reg_off, SETPMASK(p->width, p->shift),
-			   val << p->shift);
-}
-
+#include "parm.h"
 
 struct pll_params_table {
 	u16		m;
diff --git a/drivers/clk/meson/parm.h b/drivers/clk/meson/parm.h
new file mode 100644
index 000000000000..3c9ef1b505ce
--- /dev/null
+++ b/drivers/clk/meson/parm.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2015 Endless Mobile, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ */
+
+#ifndef __MESON_PARM_H
+#define __MESON_PARM_H
+
+#include <linux/bits.h>
+#include <linux/regmap.h>
+
+#define PMASK(width)			GENMASK(width - 1, 0)
+#define SETPMASK(width, shift)		GENMASK(shift + width - 1, shift)
+#define CLRPMASK(width, shift)		(~SETPMASK(width, shift))
+
+#define PARM_GET(width, shift, reg)					\
+	(((reg) & SETPMASK(width, shift)) >> (shift))
+#define PARM_SET(width, shift, reg, val)				\
+	(((reg) & CLRPMASK(width, shift)) | ((val) << (shift)))
+
+#define MESON_PARM_APPLICABLE(p)		(!!((p)->width))
+
+struct parm {
+	u16	reg_off;
+	u8	shift;
+	u8	width;
+};
+
+static inline unsigned int meson_parm_read(struct regmap *map, struct parm *p)
+{
+	unsigned int val;
+
+	regmap_read(map, p->reg_off, &val);
+	return PARM_GET(p->width, p->shift, val);
+}
+
+static inline void meson_parm_write(struct regmap *map, struct parm *p,
+				    unsigned int val)
+{
+	regmap_update_bits(map, p->reg_off, SETPMASK(p->width, p->shift),
+			   val << p->shift);
+}
+
+#endif /* __MESON_PARM_H */
+
-- 
2.20.1

