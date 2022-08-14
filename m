Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A59CC25B06
	for <linux-clk@archiver.kernel.org>; Sun, 14 Aug 2022 21:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiHNV3m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Aug 2022 17:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiHNV3m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 Aug 2022 17:29:42 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFBCC4A
        for <linux-clk@vger.kernel.org>; Sun, 14 Aug 2022 14:29:41 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y3so7501884eda.6
        for <linux-clk@vger.kernel.org>; Sun, 14 Aug 2022 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=AqecQy6KL+dyrHbPbN0H6O069pqDD1q//SRpEmJs3Tk=;
        b=ZV4rvAz8j4OiykMmfmEqslHAfRQi0/ErQS12ZPDLOugqNBJOO1Yl1VAOJVeIsa27LX
         JZdPavEDOpXeBMxQ8aoOnRyrlgBPCh7qNWNBWtjJwfUgpk+WSZQDi1P0eo7AYTX4D3/t
         V5i3Q1EV7JV9qE7Cr8wmUQlInqkmdFcSDaOvchlguj0E04zGkS76kpOz2peyPyFTSkFi
         FciIn+XmJIRWhGwow82ujQ/Zbk1q2V0PgYBPB5m8qHfQXVf1/YTWjgHvy+DAwT3s1F5P
         CsLRHQqSoojtlUYd1mP20OBf3B66ZduZLSHEfO4VYo1XG52/kLPRvewKRjA0BavDQ11m
         BDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=AqecQy6KL+dyrHbPbN0H6O069pqDD1q//SRpEmJs3Tk=;
        b=pGSh3NvYdkcZegzu8U6noNRaimtGDjsruQFoXuMFC+WcT1/3PHq56CbY5HiYN/Sark
         twReZqcVIYnBJqQ1PpaPeKfc2gDYwHT+SDKhheeZEcpDyOh3lyONKOkmU2tuwhkUR6vy
         l9IRQ82MDXmLrhVvanPJLT6CjggE9HkACrvOYgtGWgmpewc7fdsbY3nwinwvGvGf9pBa
         6EXmaCaWlYAFhuN+XjxBDdP8bJRWU7zH9z4R/zEcLpx9AznpkBMda98xhoVg97zcC7TI
         /onl/5HO16p/pVPZDTaq9ZZMdj84FnMxMV7hKWxx9rpFD1N6OAXD3S0SXMMNyjmqC39A
         Lgkw==
X-Gm-Message-State: ACgBeo3jN217U29NyI46xdJZkFVZOP5UjP7Eq5JJTsnPEAnYzAHFn0IO
        qga0SXeTeKePXKRt8/d68Sc=
X-Google-Smtp-Source: AA6agR4yRNP/AbhzJeM/gy+WgKeyWQZBV/HqoJ3i5RlhlPeywYgPQj8AjdauI0fnoGinAD4Vf/Dltg==
X-Received: by 2002:a05:6402:42cb:b0:43d:bf29:cf89 with SMTP id i11-20020a05640242cb00b0043dbf29cf89mr11640068edc.400.1660512579811;
        Sun, 14 Aug 2022 14:29:39 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c1a2:1a00:2049:10ba:dbb:6620? (dynamic-2a01-0c23-c1a2-1a00-2049-10ba-0dbb-6620.c23.pool.telefonica.de. [2a01:c23:c1a2:1a00:2049:10ba:dbb:6620])
        by smtp.googlemail.com with ESMTPSA id gv11-20020a170906f10b00b0072af4af2f46sm3325740ejb.74.2022.08.14.14.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 14:29:39 -0700 (PDT)
Message-ID: <22f1d799-a3bb-3d71-a3fd-f6128b205231@gmail.com>
Date:   Sun, 14 Aug 2022 23:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] clk: meson: pll: adjust timeout in meson_clk_pll_wait_lock()
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently we loop over meson_parm_read() up to 24mln times.
This results in a unpredictable timeout period. In my case
it's over 5s on a S905X4-based system. Make the timeout
period predictable and set it to 100ms.

Whilst we're at it: All callers of this function return -EIO
in case of failure, therefore we can return this value directly
in the timeout case.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/meson/clk-pll.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index daa025b6d..d70bee331 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -277,17 +277,17 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-	int delay = 24000000;
+	int delay = 5000;
 
 	do {
-		/* Is the clock locked now ? */
+		/* Is the clock locked now ? Time out after 100ms. */
 		if (meson_parm_read(clk->map, &pll->l))
 			return 0;
 
-		delay--;
-	} while (delay > 0);
+		udelay(20);
+	} while (--delay);
 
-	return -ETIMEDOUT;
+	return -EIO;
 }
 
 static int meson_clk_pll_init(struct clk_hw *hw)
@@ -350,10 +350,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	/* Take the pll out reset */
 	meson_parm_write(clk->map, &pll->rst, 0);
 
-	if (meson_clk_pll_wait_lock(hw))
-		return -EIO;
-
-	return 0;
+	return meson_clk_pll_wait_lock(hw);
 }
 
 static void meson_clk_pll_disable(struct clk_hw *hw)
-- 
2.37.2

