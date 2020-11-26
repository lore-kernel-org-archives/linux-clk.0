Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB63C63798
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D090520B80
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="htizOl7v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391076AbgKZOQJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Nov 2020 09:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391075AbgKZOQJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Nov 2020 09:16:09 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEC7C0617A7
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2020 06:16:07 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id t4so2277959wrr.12
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2020 06:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KBjcN4mFZs97LIMNRwXyk/FuZp47lAZQ6VC4MRI2zF8=;
        b=htizOl7v4ehnzI03MkBzd/10tRkGIW8okJkiBVASAK9yFchj/lRdywBhDo5M+J7fBE
         8FB8G+ZbSyH5XHiET9GlaTid00PEun7FKmPo4Iapv1SPIqrM7D9wC+NwCz7EIVd9x+Cm
         G0KFsN3M779XYrNDcrRgJhEa3mys4HJyyQP63P4ZnoHikd+0/cnld++5n3amgKGZJgYD
         B0habab18SeoRLxiS/VUTqqAUYv/8BBvETlyWzV4pQLUVLhBU4ozfsbCBGF6icZK4BuL
         4J9nOL2TxxhNbUROOvQEvVCOYw5na/OVh34DKE0HbsqGfC4ZICOpT6Nklrd16HJ82iJE
         xhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KBjcN4mFZs97LIMNRwXyk/FuZp47lAZQ6VC4MRI2zF8=;
        b=VL+oJETB6d9JJe7HNjl0Nmo2GfE+t6lgsBsq0KvTYIgzkLz9w9yoPFNA4tOqkWPs4V
         6UGzy3BmK/pWEpyUCJC3nUARQAcOPgWoM0YkNGWfmo1r2VS4ec+1gErI1G2k0l8bUSoX
         9rXGIoMwYsbrjfzPO5Rj2kO/K2UovAL2iCAe1SnbmvjdtXr1ji5ZDsUWoJrvDpd/vv1N
         9yfNvEtO0Yv1ZT+v+kQB0cP3vZ1WqlCkBJbtVtKnkB2CPxd1YTIcHBLFxSrxvlawjhcX
         /E6bqo40OBSTC6gPndDqQfDnjR6iQJVEY3DeUbAi4AUjhLdPNVToKdohIryCgVokAbjD
         lSpg==
X-Gm-Message-State: AOAM531PZMbrjuerDAh8xVGArOLQdSaJQ2e6AWBQX2L3l4qQGtLHAUOX
        gJgUmePunsFp+orFoO4ERqWx/w==
X-Google-Smtp-Source: ABdhPJwG49zdXnBJbddYYrxB7AXe25CRpTHBMInjdcCy2QlZh2YETPr8H2tAHE0X46kbNdlg3SLbmQ==
X-Received: by 2002:adf:f143:: with SMTP id y3mr4175165wro.138.1606400166326;
        Thu, 26 Nov 2020 06:16:06 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:193b:ad82:52ad:936c])
        by smtp.gmail.com with ESMTPSA id q16sm9286079wrn.13.2020.11.26.06.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 06:16:05 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
Date:   Thu, 26 Nov 2020 15:15:59 +0100
Message-Id: <20201126141600.2084586-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126141600.2084586-1-narmstrong@baylibre.com>
References: <20201126141600.2084586-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the MIPI DSI Host Pixel Clock bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 40d49940d8a8..a93b58c5e18e 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -147,5 +147,7 @@
 #define CLKID_SPICC1_SCLK			261
 #define CLKID_NNA_AXI_CLK			264
 #define CLKID_NNA_CORE_CLK			267
+#define CLKID_MIPI_DSI_PXCLK_SEL		269
+#define CLKID_MIPI_DSI_PXCLK			270
 
 #endif /* __G12A_CLKC_H */
-- 
2.25.1

