Return-Path: <SRS0=PuqA=TY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4AFC072B5
	for <linux-clk@archiver.kernel.org>; Fri, 24 May 2019 09:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB45220879
	for <linux-clk@archiver.kernel.org>; Fri, 24 May 2019 09:16:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S14lc7U+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389708AbfEXJQV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 May 2019 05:16:21 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36204 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389569AbfEXJQV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 May 2019 05:16:21 -0400
Received: by mail-wm1-f68.google.com with SMTP id v22so1186823wml.1
        for <linux-clk@vger.kernel.org>; Fri, 24 May 2019 02:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=PT0AaQP061TOYcM2hXnRk+ed9dR7uRWzdoW54xfdMmU=;
        b=S14lc7U+KF5ITtN/juxsI4VUUpiAX5EFgZZHhY+92XixdwAcaaGuS3aFVdGLJey4ya
         0iwt9oHOhWEkC++aEDGPahApNIo+10e1G5C+c4RWoCXzYG7ZQ0uXKCeuhO5PczfkS0C5
         96Gry102lZ7RNTIllChSbxObTtRHoeCtyWLVw8T2UoHpkAWeriKLNn0+TZeL183YWqXB
         kf/qNMxQLcj9xY5h6GcH4V4rrK71oOFrjiJR/hx+21jurNlvhl/WRou+9+jVM8SixMtq
         PJx9SWSrvMHEKbT0EH84ve4cD9CLg6aNpykylVgqi8DQnwuFVdZVVpnZU3vIf2llXPUR
         AF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PT0AaQP061TOYcM2hXnRk+ed9dR7uRWzdoW54xfdMmU=;
        b=dmEAnsp3jw7eHn3XnliiLRcX7F27O5XGgIdOvSeLUjgSJc8J8uf6XUxi/UT93tlaQU
         Ztr2aBIqFYmJ6NgnD+1yv6U2QfmAiacauERKo3emw0GuaMF/PCV4tCog2ZDmCc8L2uSg
         L7pf/z4BU/XBOhhV8YXha8PKcanIjEYB1o4dWxJNt1/tPrQjKymRDmDZoE76HHjrX4/b
         P8OHNcL8/ZaJHXNuDm96vnDi04QWdGLW/983MeFio61k1mSLyjl/x8M3mBMb8ueD4Qgg
         AiUb5r4h6HLmRNjUpPY7MDMrxZvgJZG6dcukIHxL9MMqfYkYkxIfp4WxIK7Rvp14dNSb
         rOYQ==
X-Gm-Message-State: APjAAAXA3xyg2U4zJEKdQ97CNz7ePy8pgY5vQkZpKKHBTBji6PChy3PH
        fDGrWggJTRSEtp7vwtiXUWOkhyv9JesRmA==
X-Google-Smtp-Source: APXvYqwdUQtjD//cAN8dDTVeReAe0AvEoQ2TL/mHEjeOW6pNZC/JiI26R2WDDxPurMjQS0K+blEyaA==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr14731074wmk.67.1558689379211;
        Fri, 24 May 2019 02:16:19 -0700 (PDT)
Received: from pop-os.baylibre.local (mx306-1-88-173-34-203.fbx.proxad.net. [88.173.34.203])
        by smtp.googlemail.com with ESMTPSA id d26sm1822903wmb.4.2019.05.24.02.16.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 02:16:18 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     narmstrong@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] clk: meson: g12a: fix hifi typo in mali parent_names
Date:   Fri, 24 May 2019 11:15:32 +0200
Message-Id: <20190524091532.28973-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replace hihi by hifi in the mali parent_names of the g12a SoC family.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Cc: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 739f64fdf1e3..e16fe882789e 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2369,7 +2369,7 @@ static struct clk_regmap g12a_hdmi = {
  */
 
 static const char * const g12a_mali_0_1_parent_names[] = {
-	IN_PREFIX "xtal", "gp0_pll", "hihi_pll", "fclk_div2p5",
+	IN_PREFIX "xtal", "gp0_pll", "hifi_pll", "fclk_div2p5",
 	"fclk_div3", "fclk_div4", "fclk_div5", "fclk_div7"
 };
 
-- 
2.17.1

