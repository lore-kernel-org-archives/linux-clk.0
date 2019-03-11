Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A26C43381
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 291032087C
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GE40YkM+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727694AbfCKNhV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:37:21 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40611 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727435AbfCKNhU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 09:37:20 -0400
Received: by mail-pg1-f193.google.com with SMTP id u9so4058880pgo.7
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ET2SANK/wHVq0QXTm2x4G8KkMw/va+BLQnLjopmn8Q=;
        b=GE40YkM+ZtlVQujTvvWvz08Y0k50Gs4IFQSnWhXytWqhMAQvtUTh851ppkbGr3m7Tn
         Nj8IteZ6gBkbX3BN/RPEs/iDiD62mXrsqzEK983QlGLrpXODx8LQh18hCbwVjyZtGQVC
         pn0h6vOSoVPIClJDZYYeRojApw/n4+Oj7iwOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ET2SANK/wHVq0QXTm2x4G8KkMw/va+BLQnLjopmn8Q=;
        b=gnUD8qIbImnxw8IecRFtQCmq4AEmCk0rzJtP0e/h3nJS6iHTmwUqJK82K27w86btS/
         UxGYARIDdnSGZXfKNYEEGHxURQxHPHfUSK39fANQy0orQD7kTD8s1yhzGaoYBF9rE2mt
         npbaqMVaXJ8b7XAodn4Qv69+MKQouE/Ck9v7jTEJWyRIa2mbjQ97dJWUxIp9VU6gkcc3
         0QjCG7vHBtrYjIXdzbMGQy5cC8jyBRzU54VTQAC4lyjeWHxLE+akNSl8KITPrlyNWh0H
         ilTUmauuaPPhzm37CY4BK96njpjlv95hrQR/i9t+6u1DWdWF9KW/1XzU05GNo7Enp+4q
         hlkA==
X-Gm-Message-State: APjAAAWtJIz9StkzU+FBcbzzx4QMIJIo1pFDTr1x1QeGdkqRTpgz5pyj
        RMzdWYrHwuE5vTcFtFzEnHR1nQ==
X-Google-Smtp-Source: APXvYqwhenf7qGpkwbdKLmXya+DJF9KRSA/4ff40kcLVV9BisaDGzvPeZllZF+e0BN1f6mu538eh/Q==
X-Received: by 2002:aa7:8847:: with SMTP id k7mr32426578pfo.99.1552311439648;
        Mon, 11 Mar 2019 06:37:19 -0700 (PDT)
Received: from localhost.localdomain ([183.82.224.199])
        by smtp.gmail.com with ESMTPSA id s79sm9960397pfa.61.2019.03.11.06.37.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:37:18 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v8 02/15] drm/sun4i: tcon: Compute DCLK dividers based on format, lanes
Date:   Mon, 11 Mar 2019 19:06:24 +0530
Message-Id: <20190311133637.18334-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

pll-video => pll-mipi => tcon0 => tcon0-pixel-clock is the typical
MIPI clock topology in Allwinner DSI controller.

TCON dotclock driver is computing the desired DCLK divider based on
panel pixel clock along with input DCLK min, max divider values from
tcon driver and that would eventually set the pll-mipi clock rate.

The current code allows the TCON clock divider to have a default 4
for min, max ranges that would fail to compute the desired pll-mipi
rate while supporting new panels.

So, add the computation logic 'format/lanes' to dclk min and max dividers
and instead of default 4. This computation logic align with Allwinner A64
BSP, hoping that would work even for A33.

Tested this on 4 different DSI panels.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index e75f77ff8e0f..339f9b1f5745 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -341,8 +341,8 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	u32 block_space, start_delay;
 	u32 tcon_div;
 
-	tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
-	tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
+	tcon->dclk_min_div = bpp/lanes;
+	tcon->dclk_max_div = bpp/lanes;
 
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
-- 
2.18.0.321.gffc6fa0e3

