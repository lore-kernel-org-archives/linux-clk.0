Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E634C43382
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 189C621531
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UrQt3Oh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 189C621531
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbeI0SIH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 14:08:07 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44990 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbeI0SIH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 14:08:07 -0400
Received: by mail-pg1-f193.google.com with SMTP id g2-v6so1765537pgu.11
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 04:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V0R68Y/KzwdIumM6zfyEnPevd749hoDtm4cNpSj8lHM=;
        b=UrQt3Oh+h3lHXl9yq+YbsI4BIj37f6E/418FWFbw2leiym7BkzqO0wDW7L66LC8hQH
         dMw3mR4yfjL0UttZBbUvKBghOkokwFcBlP/r9iRVIVqgQOD+sU9RiBOJc0oZH2Foweny
         Tf7Ckqitg+pcY9xhvI1zuRPmP4SQxg3XEpeu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V0R68Y/KzwdIumM6zfyEnPevd749hoDtm4cNpSj8lHM=;
        b=d7yIcOxX84VsGc1NA8zNl7OvMepfYByoMlDtYdHKnyP94SWavtTM9hwJngiF0YUlrM
         25iAn8nd5qGpxLQgKC2gm+e1+y4eML3dBNrliO8s3SKIw/av6HFZyKJ+r/+W+dvRbrbr
         WJFBE34U5gHESlZrM/Y710IHBwzcmGumj6k0Yb8jImp/pwiCzfPZ91KThpcVrgjkJJBY
         GPZSlzkp/6shH+GKSbHd4RyJ/rWSx4ySRwR1hGqifo622av0d9YsdyagsX+5koeu2Ty0
         06AyqHk9FCdYE37bVJb6NSFnCHrWM6OIZv4LRzr3tnMdLtzO6HyjvgzVwBW1LJE6XfeE
         /dEA==
X-Gm-Message-State: ABuFfogCpqpfQtbi41pArbFw1RcUd1/4/fQ/CQFzmGMWMCZzWIok/ubJ
        xP4VxKtO2yPaVTQPaxycJ33ggw==
X-Google-Smtp-Source: ACcGV62iZgr6a1wPuCr8fIWrr0mf1eoTyBfPRoHo5BLUU2Swc38AUSdthHx5XNtUnk+Nngsr4XPO7g==
X-Received: by 2002:a62:8145:: with SMTP id t66-v6mr10902156pfd.192.1538049011667;
        Thu, 27 Sep 2018 04:50:11 -0700 (PDT)
Received: from localhost.localdomain ([183.82.230.83])
        by smtp.gmail.com with ESMTPSA id v36-v6sm3744872pgn.85.2018.09.27.04.50.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Sep 2018 04:50:10 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 08/12] drm/sun4i: sun6i_mipi_dsi: Refactor vertical video start delay
Date:   Thu, 27 Sep 2018 17:18:46 +0530
Message-Id: <20180927114850.24565-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20180927114850.24565-1-jagan@amarulasolutions.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927114846.-M7mQ9j4JFq4if_R86dVT9h5zjpZS30iv9Wrzzu3kJ4@z>

Accordingly to BPI-M64-bsp DE DSI code Video start delay
can be computed by subtracting total vertical timing with
front porch timing and with adding 1 delay line for TCON.

This patch simply add the start_delay logic from BPI-M64-bsp,
w/o this new computation, the DSI on A64 encounter vblank time out.

[CRTC:36:crtc-0] vblank wait timed out

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 9918fdb990ff..217db74c6dc3 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -358,7 +358,17 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi *dsi,
 static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
 					   struct drm_display_mode *mode)
 {
-	return mode->vtotal - (mode->vsync_end - mode->vdisplay) + 1;
+	u32 vfp = mode->vsync_start - mode->vdisplay;
+	u32 start_delay;
+
+	start_delay = mode->vtotal - vfp + 1;
+	if (start_delay > mode->vtotal)
+		start_delay -= mode->vtotal;
+
+	if (!start_delay)
+		start_delay = 1;
+
+	return start_delay;
 }
 
 static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
-- 
2.18.0.321.gffc6fa0e3

