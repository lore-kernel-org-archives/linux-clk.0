Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21BCC4321A
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A515D23339
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731356AbhATKby (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731374AbhATJb2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:31:28 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F1EC0613D6
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:47 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id s24so2926294wmj.0
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PqNANroWmMHlO1pRmhfJauWaSkV5jIwl7ipaqnMtcdc=;
        b=r0xJj3iB0NP1VzuG0B7s27YaKBg2dVt5KTN1XK54fbdJh0jq3G54zNMhnwwnyHT/PE
         tdsDlrHxHhQyOfxYkld8cwEZY9gbcAuJ87kUf6Fi2u7nqvFZ/lY+tMnvnavmzSybTP5a
         THX6J+XYLf/EDt62ObOWuQzrnu5L68ef/NL8d+2In/tmQaq98NILRUzgTy91mue5ljku
         QEb6rPIVAGiYwD2p1k1gqAcR5ZEDUcdpTTpOqoAonBKL2XcyYjHkuciDAt/4/4s/w788
         aYnWkFiI9ezQgbL8qWVj77H+i4lyNQEbtuF1/HgDSyM9gLCNRWieZJ6f889c5RAWifpI
         1e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PqNANroWmMHlO1pRmhfJauWaSkV5jIwl7ipaqnMtcdc=;
        b=EnodZ7Czegw6UHqBOC1gIMokAQXHhs3/NMMHpoj5VcXZHfLH5J4xUF9Ml4AxLcorWS
         7HYC2bhe+JNUMt2ssSDm2JNvSbZlJkCU7nttp31RZ9RMwaeW0ljZDAqkuu9XaRa0zBGU
         WMEF7Y0YsUSIwfTDG+HnhbW/CuPBFGuusVVbt4VdrCA/g5yeQ2zduDRPNvxmIlIKUjSC
         uMLKYg9o5Rl/7lboEvwIOokHHJz9uZB+AsizF14bjHd/+lHQJK45ivqtP2Rpbk2LCVyw
         lH/SZm/3xx5B2E36X21momkfk9/ZIw2xA6OYeXfmn346oopW6TJwrtKjknA6p9TyHeGH
         +R5g==
X-Gm-Message-State: AOAM533UxH4SLX9bgO+dAkRxq3zjBx5ZQTcWossQeN/+C+awgFCFBpJN
        VW/4oOjMRCoSZaNqSMf8GFfJkw==
X-Google-Smtp-Source: ABdhPJwsXAxMF8Ve1yt/YsnaYPprvYXsGFiL+2XiIwlYnp0wwtvGw07v4C3WFGTMZ5NOkVV9nw9TSw==
X-Received: by 2002:a1c:9c84:: with SMTP id f126mr3505815wme.152.1611135046604;
        Wed, 20 Jan 2021 01:30:46 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:46 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 02/20] clk: rockchip: clk-cpu: Remove unused/undocumented struct members
Date:   Wed, 20 Jan 2021 09:30:22 +0000
Message-Id: <20210120093040.1719407-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/rockchip/clk-cpu.c:65: warning: Function parameter or member 'cpu_mux' not described in 'rockchip_cpuclk'
 drivers/clk/rockchip/clk-cpu.c:65: warning: Function parameter or member 'cpu_mux_ops' not described in 'rockchip_cpuclk'

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/rockchip/clk-cpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index 0dc478a19451b..fa9027fb1920a 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -51,10 +51,6 @@
  */
 struct rockchip_cpuclk {
 	struct clk_hw				hw;
-
-	struct clk_mux				cpu_mux;
-	const struct clk_ops			*cpu_mux_ops;
-
 	struct clk				*alt_parent;
 	void __iomem				*reg_base;
 	struct notifier_block			clk_nb;
-- 
2.25.1

