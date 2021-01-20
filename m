Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA3EC4360C
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F97E23339
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387419AbhATKjw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:39:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731456AbhATJdw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:33:52 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1E1C061383
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:31:06 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id y17so22375144wrr.10
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lmw0jyVjQb9zgrucTAXa+ls8bVgxcyDhXKzVAXRUfbE=;
        b=X9QF3Lr3lN7dfe1V82tisU0Bi6WFV+lr/xGNcVA4sl/jAxKUPqQBTGZJ2/jLXg7T5b
         S/Wsl6ARdue2rFAIO53TtgxLTt0/tvL/mAFPCwzo273AewD2Bmx4M4awO0lzBZLk3x8P
         0S1nH5aC2xTSXqrQV4en+BElaoK7xnX+4e/oy01MQHPAmGCN0xDx+76dfwN8dSfzvGQv
         EMuOV/1x/ihvrAfJe7z8HDDGWusTxMr7qGr9+TZYxrHJayz+guwpPoyhniyX4oLdNnwD
         gfZIlLtL2hsJQkt4WZaEOI0bE+jPDZ/O/Jvj6iLZHsBZrvSDvNmurFnL6z7T8PGDVG7k
         xzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lmw0jyVjQb9zgrucTAXa+ls8bVgxcyDhXKzVAXRUfbE=;
        b=Te0fkM83m7Urx2JIoPvnqfmA3zulJPcyHmGs/DVfITdG61reLmR0+cxpIEZ2CEKKwG
         yHyqHAmqDs0Xw8WF69Bm5yk77SBhG9jEHr6ETm7a1SdXdl3U2WHnwjYZoKc68ToM77Si
         iwiHMvhCUMj17INVmg+LYhV7XqZEwVidXqrxW5xeq+dwPF1PHNFATsjFlhTF5PNeLz7h
         KAfyh/lYbcbxlM+nsG3pyewhfWjgE9Dm2P2R9TNlLHCOIvn/23dByxvO8KsB/0FUg8Er
         dBeMGSshBPE8mUp8H6GcLsbagGpVrE+xqfy2K1PANt9dT8s/rFKneAI3GBHj/rUGRxgB
         uvzw==
X-Gm-Message-State: AOAM531Pd/AX09Y1/J65SkQ1ID9HUBDxAYbTW+rPf04U2VvtBoGylSTn
        asv23wdMATLdwzVNtcYNX8NaiA==
X-Google-Smtp-Source: ABdhPJw5BbnjDe6qfRdwflh1jGaOVIlPHk1+fbLgvVnuE3BkdewXjP9WY4nGwSoTihOU+7wFYSYr2A==
X-Received: by 2002:adf:f403:: with SMTP id g3mr2435594wro.212.1611135065099;
        Wed, 20 Jan 2021 01:31:05 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:31:04 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 18/20] clk: sunxi: clk-mod0: Demote non-conformant kernel-doc header
Date:   Wed, 20 Jan 2021 09:30:38 +0000
Message-Id: <20210120093040.1719407-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/sunxi/clk-mod0.c:24: warning: Function parameter or member 'req' not described in 'sun4i_a10_get_mod0_factors'

Cc: "Emilio López" <emilio@elopez.com.ar>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/sunxi/clk-mod0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
index 0cca91e075a53..f9d715ec99087 100644
--- a/drivers/clk/sunxi/clk-mod0.c
+++ b/drivers/clk/sunxi/clk-mod0.c
@@ -14,7 +14,7 @@
 
 #include "clk-factors.h"
 
-/**
+/*
  * sun4i_a10_get_mod0_factors() - calculates m, n factors for MOD0-style clocks
  * MOD0 rate is calculated as follows
  * rate = (parent_rate >> p) / (m + 1);
-- 
2.25.1

