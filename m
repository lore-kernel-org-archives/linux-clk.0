Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266DDC43610
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:18:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D68372250F
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BB0oFzby"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D68372250F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732709AbeKMVPc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:15:32 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42732 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732711AbeKMVPb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:15:31 -0500
Received: by mail-pl1-f193.google.com with SMTP id x21-v6so3132274pln.9
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2wK0OObhLhsS0pPHJTLpMNcuasLFqviyg6C5I9uXCbM=;
        b=BB0oFzbyBv5R7z1uYdcQbXYHZO2ke8Q0JSzmYAAJZWqmBU7W5Tqu/qJ7oju5yLh+M0
         BTgV76I3UqbTdBHAm6BjcOzNihrwYjRHiwEmhnLY77udO6WGyS3Ex0jEM+Ha0K21l5bw
         cMEldJXuCOXLShiEljxcKqsYpiIALUufk/jAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2wK0OObhLhsS0pPHJTLpMNcuasLFqviyg6C5I9uXCbM=;
        b=YfuysOgSexzaNjMz+TVnH9q5I6R0wru5V6G+/kavr26rPGVDUB8wfag+YRHSnOS+f+
         3REVBHKE+ksCO8DbndiFk5pK8k6oFu9HhdfBYL3GGQlz9DHODtvX8tGaB+IRfwgVl4qP
         vpc146WyHYfFMM35Wnb+QSWdT6nEfy87OUdHCM+yDKgMRaGdkepJ8emplnTqqk4ZcGWR
         Zampaj3wrCMhM74bQElnvLd5hI7L/KzWjZfZ2Ua52b0JdTlNam9O3zF9t61GGrT7hOxT
         l54k3ZNiUkqMscnuV1qHsjlfDVi9Fn7Eo2l9IwNMv5ODKBM5bJj9IT7/jKMnT6PuswcY
         3llA==
X-Gm-Message-State: AGRZ1gIOcCftuqy8gogNYqYA4ef2j6YmpaGlv+TTHMxnDlrru0MGZFUu
        iy7fTRLctKc63Mp6PAN8WFjVVw==
X-Google-Smtp-Source: AJdET5f+mrDZ5bDWWWhgJXCxIJAe+4fTOZKOyI/2QC3uHKEtUb3GM5vh0xIjgXuvGZyREvsF1uH0fQ==
X-Received: by 2002:a17:902:b689:: with SMTP id c9-v6mr4796087pls.306.1542107873098;
        Tue, 13 Nov 2018 03:17:53 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.17.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:17:52 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-amarula@amarulasolutions.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 10/26] drm/sun4i: sun6i_mipi_dsi: Refactor vertical video start delay
Date:   Tue, 13 Nov 2018 16:46:17 +0530
Message-Id: <20181113111633.20189-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Video start delay can be computed by subtracting total vertical
timing with front porch timing and with adding 1 delay line for TCON.

BSP code form BPI-M64-bsp is computing video start delay as
(from linux-sunxi/
drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)

u32 vfp = panel->lcd_vt - panel->lcd_y - panel->lcd_vbp;
=> (panel->lcd_vt) - panel->lcd_y - (panel->lcd_vbp)
=> (timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y)
   - panel->lcd_y - (panel->lcd_vbp)
=> timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y
  			     - panel->lcd_y - panel->lcd_vbp
=> timmings->ver_front_porch

So, update the start delay computation accordingly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index fc4252d96c38..f6e3df8d2490 100644
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

