Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE57FC71156
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 13:52:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7841122252
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 13:52:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="l5FsBr48"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgKNNwY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Nov 2020 08:52:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgKNNwX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Nov 2020 08:52:23 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C748C061A47
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 05:52:22 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f27so9179780pgl.1
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F/nq3JnunleBEPmOqQ59JVNiFyN2h6AIwG//l7PiMiQ=;
        b=l5FsBr48D12H3HK8mLGUuPcnIWvJp1vzinlvLgFfovlMFugm7gKec4ctCEOoBdkoDz
         fSuT4W75rbTt7t2WFPTCG2GevKdL2TeqeE6PJhpx2Iy4vFvvncr6EhL35l37w+6Fe+G6
         oV//uwgXt1OunaaouRB1KY7CSrhOl2eeo93qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/nq3JnunleBEPmOqQ59JVNiFyN2h6AIwG//l7PiMiQ=;
        b=fijcjkNM5M8tfQuwskVs+j2y7+e454GayGtS1zf6jlaIryTrhPjStORmJFiZD05SlZ
         OdBjDdOOzLQYC/SqY7Z2nQXLk6lIg4tpWLy8I4V9w8QI2LMe/vWvGYyCbLq4k5XwP26k
         INpeBbU3N7XwJh9u1fFb1+qi8MY6QH5rcqSnlcuIhNKkAp6eIgrKO7eLW/s2flOxsxbl
         Yx8A4VnQoSOyjB9PZJs9qChJKf9XxA9pFyFJUnpFBUKll2ZLcvvDjp6RpfdqVJfbFtww
         faKwtHJEFqXuOhPmwabne3ONAxtAl0xPImIsnqcTMzmneSHumkV71Bs1bZqi8TRF5tl4
         09Lg==
X-Gm-Message-State: AOAM5338oy5TlPjd5//0jPzWiiktGHtiarU1sD83Oe4PRMoVgk1shbMP
        hOUWJb9uqvRLg+WM7Xi3mN092HNvLKMYbg==
X-Google-Smtp-Source: ABdhPJzq4Ydud7WeDfpMytkX7tslUBQ49azEQ7XkLoSKZEyI0EoGIy2e/XTGLLSPG5v8hRo5NIhAKw==
X-Received: by 2002:aa7:8b12:0:b029:18c:7b88:d7fc with SMTP id f18-20020aa78b120000b029018c7b88d7fcmr6241210pfd.53.1605361941458;
        Sat, 14 Nov 2020 05:52:21 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id r205sm13008023pfr.25.2020.11.14.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 05:52:21 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/6] dt-bindings: clk: mstar msc313 mpll binding header
Date:   Sat, 14 Nov 2020 22:50:39 +0900
Message-Id: <20201114135044.724385-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114135044.724385-1-daniel@0x0f.com>
References: <20201114135044.724385-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Simple header to document the relationship between the MPLL outputs
and which divider they come from.

Output 0 is missing because it should not be consumed.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS                                   |  1 +
 include/dt-bindings/clock/mstar-msc313-mpll.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/clock/mstar-msc313-mpll.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a3f0aa46d0d8..1e874fda810e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2135,6 +2135,7 @@ F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
 F:	drivers/gpio/gpio-msc313.c
+F:	include/dt-bindings/clock/mstar-*
 F:	include/dt-bindings/gpio/msc313-gpio.h
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
diff --git a/include/dt-bindings/clock/mstar-msc313-mpll.h b/include/dt-bindings/clock/mstar-msc313-mpll.h
new file mode 100644
index 000000000000..1b30b02317b6
--- /dev/null
+++ b/include/dt-bindings/clock/mstar-msc313-mpll.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Output definitions for the MStar/SigmaStar MPLL
+ *
+ * Copyright (C) 2020 Daniel Palmer <daniel@thingy.jp>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MSTAR_MSC313_MPLL_H
+#define _DT_BINDINGS_CLOCK_MSTAR_MSC313_MPLL_H
+
+#define MSTAR_MSC313_MPLL_DIV2	1
+#define MSTAR_MSC313_MPLL_DIV3	2
+#define MSTAR_MSC313_MPLL_DIV4	3
+#define MSTAR_MSC313_MPLL_DIV5	4
+#define MSTAR_MSC313_MPLL_DIV6	5
+#define MSTAR_MSC313_MPLL_DIV7	6
+#define MSTAR_MSC313_MPLL_DIV10	7
+
+#endif
-- 
2.29.2

