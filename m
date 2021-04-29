Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CBBC433B4
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 09:03:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE31861449
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 09:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240044AbhD2JEj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Apr 2021 05:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240039AbhD2JEj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Apr 2021 05:04:39 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19529C06138B
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 02:03:51 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id q6so18369875edr.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+HLzXbkNngIE9tkgHqx97GNCxRpXGXx8Ojt9z/evco=;
        b=GBItjtMHIl9+fy1sfAPi2drO9fIPPAf3u5xufxexjqsbdmF4uIINYvXOAIEZgiqqNo
         Wsdh5SY6oBaU0E1YBTd6SU1JID0yqbCaxQnC2QDGLRJDbsf2jA9M1uy6tP9NMdj/TI7O
         0SmHpAVj7lb1ZtvDMcU9EZ6CvFVspZUa6fbJzCGMuw3GbAz9due6dTzo5homhF8iyNJ6
         /XpUIyOnfqwtLwANoXjV3u/TaAUj8Z51+IELjYn2/NvqFiyGamW/0fe71ZpTDQUWqOIv
         N8Tl3L99t3uQNKJ7edqd2pawkvQ66odmZ9Z1yKetCmS56MWyapKxPrweuxY0hGLmW2Ru
         0hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+HLzXbkNngIE9tkgHqx97GNCxRpXGXx8Ojt9z/evco=;
        b=AlmoCR7/Q9rsA2xEvwqhjd/+rrHKf7QG7XoRLl8VMGVlT9kW+cpuPpnanFoY/fenyi
         fazGe9o0gUh1/jz5pW1zuBfvDW4qsjq1PpQchb8HA31J5d0SsyGI3bTP065FwZX8iuB6
         Y2i5ipYy9Zc7DDrNO8QdHpirmJwcPi9rg4pxVoBrHiFhSQh9dsdUyeXzGM9JQGdKW6de
         2K8o+rnoMOU7Wx9/y0hlX9U5FDPgqUuE+pNimAQaXSAhULgR0fa5yreKgbziYA5i+799
         rImX64CDyuFZ/QPlYmGhiNXrodPABTU7fYErqXuivLucr1upUXMreurbw/cqbYpJ4HL4
         ccMg==
X-Gm-Message-State: AOAM533CH0AQGhW/z0upn/Kpa18p/4ud7nsgQeWbIB7R4eSf/Qc1HoW+
        ualpq09xdM/ejqOIFbUncd6efQ==
X-Google-Smtp-Source: ABdhPJwI3INalSk/5D1+Nz2RIt7IqV/JfVEmFAdW+NvqkU08BDtWe79kNgj0WIjvOe3XIFipym9Zjg==
X-Received: by 2002:aa7:d413:: with SMTP id z19mr16987380edq.37.1619687030544;
        Thu, 29 Apr 2021 02:03:50 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id j4sm1441152ejk.37.2021.04.29.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 02:03:49 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
Date:   Thu, 29 Apr 2021 11:03:25 +0200
Message-Id: <20210429090325.60970-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While some SoC samples are able to lock with a PLL factor of 55, others
samples can't. ATM, a minimum of 60 appears to work on all the samples
I have tried.

Even with 60, it sometimes takes a long time for the PLL to eventually
lock. The documentation says that the minimum rate of these PLLs DCO
should be 3GHz, a factor of 125. Let's use that to be on the safe side.

With factor range changed, the PLL seems to lock quickly (enough) so far.
It is still unclear if the range was the only reason for the delay.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index b080359b4645..a805bac93c11 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
 };
 
 static const struct pll_mult_range g12a_gp0_pll_mult_range = {
-	.min = 55,
+	.min = 125,
 	.max = 255,
 };
 
-- 
2.31.1

