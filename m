Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF32C282DA
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:47:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86C6320855
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZQdq2pFn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbfBAPq6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:46:58 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41330 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730304AbfBAPnE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:43:04 -0500
Received: by mail-lf1-f67.google.com with SMTP id c16so5363756lfj.8
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yk/U6hXU4zCg+Op+yVQKMkhjMNz4ubnzKdMp3LxXZ40=;
        b=ZQdq2pFnqDsK++7A+JvhcdHIQD6k/YFnnrrcHPljQGOF9RoZyrKnwp/PwN7RMmJz5X
         2uiQzQogI9miNZvrNYG4CMX8i+KupLfMvG4cJZKduI2Bed1EequW0O8leiVAXKUxV4hR
         RjyU53bgk+CvNDfB2+ANUKyjWfLEENJiVlMWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yk/U6hXU4zCg+Op+yVQKMkhjMNz4ubnzKdMp3LxXZ40=;
        b=Dfp1QiRhb/yYoI40L9bvthnkhe0hFVopAn1W55almRTbU4ilXZyh8mtAoaaJkwufE2
         Z12UYmxQLmJ2CGLcoeFXMP77dtM+KH9OKHLolj5oLNuCMEGYP0UQqoxDL1+Jw9MHgjgj
         slrPqajTKvVaidWWeV2V0bEUYyk6dgq60G15zbDCB2NVVpoKkUQtO1R0nxcpoLOFqmLf
         5svZtrTqbm5YeD0mm3sPSAPp0fOwWhSU/hKG5EVI3VMF20SZ1f5zs88czoSgBFtrTKwD
         PQoX9z+8ekdMIyXjXJONoUvvx/YcT7KKZ/u1oMmB/u7WhsWBeCerkQ3bAKA9bkrYG42x
         6QYA==
X-Gm-Message-State: AHQUAuZwGiYJMtcb9JciIS71qTEVtyErJxqeyU7QOwGLksajgwYfEqMo
        bPSugPNgX3JcOo569fofV+aY3A==
X-Google-Smtp-Source: AHgI3IZV4AIj+RosBDNAeANSTISoFIXCUZjjZCxY+J6BXTdc2zait+tt9hGpWbv/8Q5MWbY08Jujlw==
X-Received: by 2002:a19:ae12:: with SMTP id f18mr678396lfc.155.1549035782384;
        Fri, 01 Feb 2019 07:43:02 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.43.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:43:01 -0800 (PST)
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
Subject: [PATCH v7 10/23] drm/sun4i: tcon: Compute DCLK dividers based on format, lanes
Date:   Fri,  1 Feb 2019 21:12:19 +0530
Message-Id: <20190201154232.10505-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

TCON dotclock compute the desired DCLK register divider based on panel
pixel clock along with input DCLK or DSI clock dividers from tcon driver.

The current code allowing an input DCLK dividers ranging from 4 to 127,
but the existing dclock logic is unable to compute the desired output
DCLK divider value for new panels instead it ended-up producing unknown
divider values which no longer exists.

So, add the computation logic 'format/lanes' to dclk min and max dividers
and indeed it produced the desired DCLK divider even for the new panels.

This computation logic align with Allwinner A64 BSP, hoping that would work
even for A33.

Tested this on 3 different panels, and below are the desired divider values
with respect to pixel clock frequency.

- 55MHz pixel clock with 4-lane panel, and the desired DSI clock divider
  is 6 with the output parent clock rate of 330MHz.
- 30MHz pixel clock with 4-lane panel, and the desired DSI clock divider
  is 6 with parent clock rate of 180MHz.
- 27.5Mhz pixel clock with 2-lane pane, and the desired DSI clock divider
  is 12 with the output parent clock rate of 330MHz.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 3da75a0c5c5d..4d5a158d9a25 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -342,8 +342,8 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	u32 block_space, start_delay;
 	u32 tcon_div;
 
-	tcon->dclk_min_div = 4;
-	tcon->dclk_max_div = 127;
+	tcon->dclk_min_div = bpp / lanes;
+	tcon->dclk_max_div = bpp / lanes;
 
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
-- 
2.18.0.321.gffc6fa0e3

