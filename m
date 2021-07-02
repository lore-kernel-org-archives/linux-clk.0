Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C572DC07E97
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 22:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6DBD613ED
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 22:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhGBWyj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 18:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbhGBWyg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 18:54:36 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE25EC061764;
        Fri,  2 Jul 2021 15:52:02 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id nd37so18631613ejc.3;
        Fri, 02 Jul 2021 15:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mzYXAwF64f/gxWVFvm1N2KLW8QBmOTpV3947N44jc8k=;
        b=CTn+N6FlnVuDYOdettXBeZiSaNynHJ17hYZHXx3sAgms7Lb5hfK7zuvSjEMiH2Ebn2
         0DJJQqpoH2AEzPIvkIIXgd3Rn1Dxxk2W0rlW7LaQoXA/rz4KTvh+pLWu20RRzl6g0Zov
         Nko+cf1eCkXWv5X6CMLloxIzofX5B7Vzjy1npTMTQL/F5VQVZW09oBNCK2tFhryQykeW
         wMMgBvU7Tdg5krmOsn+33yZAmDGR70B9zFnFXF52QWtHz0fCJoX5e+1nzqDzsF07z7dm
         Q0uc8U5YR4LhLxzeCoaK8TxxTjKU3bKj7bSSPh/76riXlEyVKqAyPKPWRXjfTGgBBqYS
         KPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mzYXAwF64f/gxWVFvm1N2KLW8QBmOTpV3947N44jc8k=;
        b=ollKsedVO7gG5uZcH1xBZw+OC/uvxAL0RbMEwvStXg1Zchb5SwrR5mYoyGln10ev/u
         KR193iMBpy7OS7q0rmYJSfmpISeEFz0SQhEvk2479nm9eotQRUVkltpBrqLy7Zjc3Rtl
         AgXEtxbU/HPQC8C9NUwc7mh5ybb5jjue7tMYshJQn6lB1tP2lbPiTqQ0Cq7icOy+wy7W
         PU9Osdqvtv/Lx112PK3q3blakFY07uqAD+rtl0ZSy1tjEehxRfDEeUYTN035r9kL/OGd
         E2EYk1ERnpRxFbQ+MWpk0j0N23pqOpbXEC0Uh3qPdsmVB0SziIncjukcN53tzIk3btyP
         awQQ==
X-Gm-Message-State: AOAM530jRKpmPquV8cYZX5diGZZSmmNXWw6sMAJ/FBOojGnaMpj5p7F0
        QyndLSVJun79BJ/5XbpxUoKtLgMTWzM=
X-Google-Smtp-Source: ABdhPJwk/IGv7QwyMAJhvJkCoFiMgOpxbkig7bE7F5RSHG2SeyHQsaLmNT8gNJw08Pk5Gn+zfd0bzg==
X-Received: by 2002:a17:907:3f8b:: with SMTP id hr11mr1983938ejc.381.1625266321267;
        Fri, 02 Jul 2021 15:52:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-063-046.95.117.pool.telefonica.de. [95.117.63.46])
        by smtp.googlemail.com with ESMTPSA id r17sm1866964edt.33.2021.07.02.15.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 15:52:01 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v1 3/6] clk: bcm2835: Switch to clk_divider.determine_rate
Date:   Sat,  3 Jul 2021 00:51:42 +0200
Message-Id: <20210702225145.2643303-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

.determine_rate is meant to replace .round_rate in CCF in the future.
Switch over to .determine_rate now that clk_divider_ops has gained
support for that.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-rpi-kernel@lists.infradead.org
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/bcm/clk-bcm2835.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 1ac803e14fa3..a254512965eb 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -805,11 +805,10 @@ static int bcm2835_pll_divider_is_on(struct clk_hw *hw)
 	return !(cprman_read(cprman, data->a2w_reg) & A2W_PLL_CHANNEL_DISABLE);
 }
 
-static long bcm2835_pll_divider_round_rate(struct clk_hw *hw,
-					   unsigned long rate,
-					   unsigned long *parent_rate)
+static int bcm2835_pll_divider_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
 {
-	return clk_divider_ops.round_rate(hw, rate, parent_rate);
+	return clk_divider_ops.determine_rate(hw, req);
 }
 
 static unsigned long bcm2835_pll_divider_get_rate(struct clk_hw *hw,
@@ -901,7 +900,7 @@ static const struct clk_ops bcm2835_pll_divider_clk_ops = {
 	.unprepare = bcm2835_pll_divider_off,
 	.recalc_rate = bcm2835_pll_divider_get_rate,
 	.set_rate = bcm2835_pll_divider_set_rate,
-	.round_rate = bcm2835_pll_divider_round_rate,
+	.determine_rate = bcm2835_pll_divider_determine_rate,
 	.debug_init = bcm2835_pll_divider_debug_init,
 };
 
-- 
2.32.0

