Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF58C5519F
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 19:09:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFAA52220B
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 19:09:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lM+Fn1he"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgKRTJe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 14:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgKRTJe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Nov 2020 14:09:34 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEADC0613D4
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 11:09:32 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id j19so1843008pgg.5
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 11:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yT0JMSmjJM6U+7Voml4XWy09ugN1e8X3pPDba2CCdew=;
        b=lM+Fn1heA0cHwA3lCopbawYfhE4BSJ+FOOfbghj7Oopy/7+J2tOdqU5GoWNFR8CQfI
         6NeRq6MDoHVpA70uf4gHwsyKAoAKRntrmkYKe/zISSmdLzrfa89vfoY9TBGtrc3bPRuu
         rBA8yKcaeu712x0Ko7n7FKvruPpbtCUKrlNhOMBh8lz6AnRDqa2oWTL8eLgXQuicvJzX
         aO2py0eglkfFdBEiKTxMa5ObV8OrNEAJzDXZth4DopzL2zL+GJJTcMb+MHe6ZTvPN4Gc
         QtpdQbZnRRdKQm+LrMeFQIYxcwg52XYfw//emNd4WD+j/HHJkqAjnz6KEP19JvPSeBAF
         o3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yT0JMSmjJM6U+7Voml4XWy09ugN1e8X3pPDba2CCdew=;
        b=B1vhV7ZD3c0vUBoqMUfiQYNuo2QtghQPLJIfwVteDbNNpq2A+2gMv8gTCOoNAdegU2
         J64vPwhY/6Nb0I113Ld8e3Z8U1i8bK2FTKB04IYmXN55Ur5CY6SF32XyV0cUnArqfxVw
         GJGdgaEJCDuti6520KNOEwkaLhl8KQHa+buVO6+Wbi1NkZKNz+doeTV0gyP3O3OjA143
         1auX7eAvwhcAY/YgrhZPfFQsbcqlz2u2Qu1GIrvoRz2gLIzcluv4QTtY5SPturEA7l31
         WwrqHsbJJG4KGxYsrZgybYe1t7sp6klRs7WEGFqO48wElI1m+5lLLYSUOPq+43vyGlpq
         k2Qw==
X-Gm-Message-State: AOAM5322y7iuaxxcvlUQhj6woMJg/U5YEyltQeXR/PhjyflKjEPd3QRm
        A5YdDp4q1YqkyeiGDUdwW/BTWnFtLAdu4OgsnAw=
X-Google-Smtp-Source: ABdhPJxEo1Z+jodqK4KA4P3NmUTQuVHgeaweqOSsEp7aVfQzsmMcyGbRKn75qeIXTySiJ0uF24ilcA==
X-Received: by 2002:a63:fd0b:: with SMTP id d11mr9271002pgh.50.1605726572110;
        Wed, 18 Nov 2020 11:09:32 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id z9sm3243505pji.48.2020.11.18.11.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 11:09:31 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH] clk: meson: Kconfig: fix dependency for G12A
Date:   Wed, 18 Nov 2020 11:09:30 -0800
Message-Id: <20201118190930.34352-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When building only G12A, ensure that VID_PLL_DIV clock driver is
selected, otherwise results in this build error:

ERROR: modpost: "meson_vid_pll_div_ro_ops" [drivers/clk/meson/g12a.ko] undefined!

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/clk/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 034da203e8e0..9a8a548d839d 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -110,6 +110,7 @@ config COMMON_CLK_G12A
 	select COMMON_CLK_MESON_AO_CLKC
 	select COMMON_CLK_MESON_EE_CLKC
 	select COMMON_CLK_MESON_CPU_DYNDIV
+	select COMMON_CLK_MESON_VID_PLL_DIV
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
-- 
2.28.0

