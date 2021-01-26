Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F0FC433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:07:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DFE52310E
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:07:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391208AbhAZNHc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391981AbhAZMtB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:49:01 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBB9C0698DF
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:00 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id c12so16333447wrc.7
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GXshkbgTcCLvcMfQ+97H1sgznjdR4OhpOhHlF1vIaks=;
        b=IOn9WgbgMEw1WvR4hfDIqRJ4J3Q4fLxrLD1v2OpqwriR9g5cu0rvLO6+nG85AJ/I86
         Ro8PQ2sjBGyQ8itEsPu1LMHolkvK1Cbl8WoEY75Xsk3ADB4MZf9bt1A4ZSH0EU2PlBMw
         Sc5DskgxTKOAHIBTdeZDXENQWvFhRtZ0Lr8D2V0z41ZSMBZEaDSiZ0f81qn3glbEYkSs
         Vu0zl0pCaTfQU8kULHC3G0u2eeXePBlgB3YoN9e9y37FL3PXnxP2NKMoYKVrAk31qgPB
         vb1BmBZE7tJ9MVZl/ix+VgWY9rWHLNzqeCdyH1r1M1hGI9eOa/YUy1AjZxC0WLLHPCzo
         ljkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GXshkbgTcCLvcMfQ+97H1sgznjdR4OhpOhHlF1vIaks=;
        b=f69qDWn216Z089iUjX79vGHrX8YogkA7/JjTryfsMh1Eh7GXMZ0z+tUvbQ7dCvTTJJ
         X5AmM5bF81kX3szljZ1rp3bIv/vkpProV52qED428RiShIsViTIsaG4p1CDg2HaHAj0J
         GEq6TMuMFfwXAFYpC9MZxxxDF+2elOKBUnKajroQAy2PMCuX5CywO56VwL9rrq0rjiB7
         kiCCX2roTGpOFtpIHlPcypvfFtTYgwGYuUGwwCHjCoG/domvBUb0oKH0ycaQY0Gkul3t
         upV3Up6kLvS/FqYt+bcELA6oX43+HJ6qNaZFpJja6lZoEGV3RXpdt6lulvbPQ+v4SNvi
         JuAw==
X-Gm-Message-State: AOAM531HOG38fRHMkoeLdyT/gWeS63dn+TLotSFs8vGVbi+4VZMqQzoS
        EDmm8e/eatY1aEPP8jL4fyJ9jA==
X-Google-Smtp-Source: ABdhPJwoPA9vG6jciVxwrfEtCx9Pr5x7tBugNW6dJqWbI+z0Z16Pw40r5QCFS8r+cJNaiWfnt5Y3CA==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr6306888wrw.244.1611665158774;
        Tue, 26 Jan 2021 04:45:58 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:58 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/21] clk: sunxi: clk-sun6i-ar100: Demote non-conformant kernel-doc header
Date:   Tue, 26 Jan 2021 12:45:31 +0000
Message-Id: <20210126124540.3320214-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/sunxi/clk-sun6i-ar100.c:26: warning: Function parameter or member 'req' not described in 'sun6i_get_ar100_factors'

Cc: "Emilio López" <emilio@elopez.com.ar>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/sunxi/clk-sun6i-ar100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c b/drivers/clk/sunxi/clk-sun6i-ar100.c
index e1b7d0929cf7f..54babc2b4b9ee 100644
--- a/drivers/clk/sunxi/clk-sun6i-ar100.c
+++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
@@ -16,7 +16,7 @@
 
 #include "clk-factors.h"
 
-/**
+/*
  * sun6i_get_ar100_factors - Calculates factors p, m for AR100
  *
  * AR100 rate is calculated as follows
-- 
2.25.1

