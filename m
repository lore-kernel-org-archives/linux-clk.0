Return-Path: <SRS0=QqMK=XO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D50C3A5A6
	for <linux-clk@archiver.kernel.org>; Thu, 19 Sep 2019 09:38:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08CFF21907
	for <linux-clk@archiver.kernel.org>; Thu, 19 Sep 2019 09:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DR+/dAJA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388617AbfISJiQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Sep 2019 05:38:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38932 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388502AbfISJiQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Sep 2019 05:38:16 -0400
Received: by mail-wr1-f68.google.com with SMTP id r3so2333373wrj.6
        for <linux-clk@vger.kernel.org>; Thu, 19 Sep 2019 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6nXme50vIoJjH0UMqXkc64d0qIp6gNTAIlH2LyUHGog=;
        b=DR+/dAJA+mXD4C0wvuRVF9pzBcCVjEtQwJPyj0zCVNJOEg401UobN787J4oOZpXKrQ
         +f+BOYs73Nv0gtvuItI0CcFXErrIwgD2tJK62f1i45wv9RCUbJmyu/eb7r2oltv8xoxs
         nkGKCv3Puy4/NxyG4dLBQeY4XnsgQ30JObE1PptvfkK6g34hPZXoNiPdoOJNj2H+SAqT
         6q0qi8f070u2KK0YPBra8fiv3oI+NdT7gqUlXmRETx79C5sYCfTTqOJ8bWKaOZNXTIYN
         bHzvNGiElGTzjKowEdl3Rl+vLF0xVSu+pqjb0xnqAyVEA9nXcnbgcV37IhBK19wOjXq1
         ku6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6nXme50vIoJjH0UMqXkc64d0qIp6gNTAIlH2LyUHGog=;
        b=HNQ7D222rvtHtm0RiAs3T8JRmUxeVDJmazaAMvRtCu9XhxSOIZeFqCracClF3glbn8
         QEwYEJ2Y1oWwjpTd6WrApW7au95szKhMszWRP2KL/bUlkWyIYChnFHJ6AjcDa8RaHM1r
         olijsVMst7G4Q0Jp8lkoR3XTP0CTTCXLuyrs6d8N7WtPIiLjzlpvatNJA9fbHPGIplon
         Ovn8aP7kYUJVbnmR7SSuiXcL30kPASzjpNm+URTdk0THO+J5cm5UXjZOIGH79XuQz0jb
         OKj0uPvM7itL6cH4v6rHtyIXMZmOgeKnPPa6OagdNxbNZ41xhvJjp+I3yorr7NHxcO3Y
         ByGQ==
X-Gm-Message-State: APjAAAXAZ642FbPtanhTrHiDA83TM1WNoeF/4RGCzSpWO37PGLaDPM+v
        u2XLJYERPFb/1Quys1yuvFVqlQ==
X-Google-Smtp-Source: APXvYqzosaotPCD9Wry9JaxxWXkNUfADDM/jre6SiXpPoSFtALqDV+2F8/XxHOyItGVvmyF72/tECA==
X-Received: by 2002:adf:e443:: with SMTP id t3mr6338044wrm.181.1568885893871;
        Thu, 19 Sep 2019 02:38:13 -0700 (PDT)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id a10sm9997797wrv.64.2019.09.19.02.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 02:38:13 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: meson: clk-pll: always enable a critical PLL when setting the rate
Date:   Thu, 19 Sep 2019 11:38:09 +0200
Message-Id: <20190919093809.21364-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190919093627.21245-1-narmstrong@baylibre.com>
References: <20190919093627.21245-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make sure we always enable a PLL on a set_rate() when the PLL is
flagged as critical.

This fixes the case when the Amlogic G12A SYS_PLL gets disabled by the
PSCI firmware when resuming from suspend-to-memory, in the case
where the CPU was not clocked by the SYS_PLL, but by the fixed PLL
fixed divisors.
In this particular case, when changing the PLL rate, CCF doesn't handle
the fact the PLL could have been disabled in the meantime and set_rate()
only changes the rate and never enables it again.

Fixes: d6e81845b7d9 ("clk: meson: clk-pll: check if the clock is already enabled')
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index ddb1e5634739..8c5adccb7959 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -379,7 +379,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	/* If the pll is stopped, bail out now */
-	if (!enabled)
+	if (!(hw->init->flags & CLK_IS_CRITICAL) && !enabled)
 		return 0;
 
 	if (meson_clk_pll_enable(hw)) {
-- 
2.22.0

