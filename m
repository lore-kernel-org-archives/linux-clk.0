Return-Path: <SRS0=HxJ1=NG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BD8C6786E
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:46:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7854D20870
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fgB+w/jt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7854D20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbeJZXWw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Oct 2018 19:22:52 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46347 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbeJZXWw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Oct 2018 19:22:52 -0400
Received: by mail-pl1-f194.google.com with SMTP id bb7-v6so606397plb.13
        for <linux-clk@vger.kernel.org>; Fri, 26 Oct 2018 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=efp6sFiQWGhKGiEpT9DPizID7xKe3bNjf2I9V30y+Ys=;
        b=fgB+w/jtIZgJ3cUnZ6wBZHi5PXY/IpocFCJWrAWselKgGvHeS0V9aqCXHUEbdEjQ44
         ErNWTafUecoXd3fhSrnYeSt4xcw75Y5R0o04cGYTSrXjiMnk4792xGpiZ62SxA2fnZAd
         0FIzExMCXDksaN/p57I3Lqn531A2ajs+387Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=efp6sFiQWGhKGiEpT9DPizID7xKe3bNjf2I9V30y+Ys=;
        b=tYOw9CMf1Ti4NNDcPdtij5+poNH0nlqsCUjR1ptFxeOl3oHU09FgDwOCtlUPcSFHCO
         gVCiR51MR9p4SXpCWCUncXiPTY4EzlU/dJTKIYPJU8AInwZtXdPUMrTJ9NJSJHx8W/rc
         PwpgOQcRkPoMjKCZiHP127GHaPFgl6hS7nGz/rp6Sq9mXLigJhE+w3TrcAbW3b6XuOVv
         JL7laX7vnU9vVA6HZQvJgo2jaRfzcYNQwjELO64FT6ySPWS2mgmAgo90P+gG3k45c01Q
         vkCAxeXyK/OCth2Q0+4vFdl2KqFIuZvQ03HuJhwwcJ9xWiBrr80QwZoOYm8gg3+h+YWD
         8I8g==
X-Gm-Message-State: AGRZ1gJDW3WwNF6JVHNxunnMjfJ4Cno7d+KUp/DXUOKpT0NYkf7K+4vS
        1KT8dIp4PqOC+2jXcqIv8y4TmA==
X-Google-Smtp-Source: AJdET5fucCB5re78rfZVblg7SE55jUyPO8u1lB6Zs29yTuXi0Svqs/9BYlVGAZ5aL7lBnP6KYNcuFg==
X-Received: by 2002:a17:902:b106:: with SMTP id q6-v6mr3811436plr.238.1540565131346;
        Fri, 26 Oct 2018 07:45:31 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id z22-v6sm12044467pgv.24.2018.10.26.07.45.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 07:45:30 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 14/25] drm/sun4i: sun6i_mipi_dsi: Increase hfp packet overhead
Date:   Fri, 26 Oct 2018 20:13:33 +0530
Message-Id: <20181026144344.27778-15-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181026144344.27778-1-jagan@amarulasolutions.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Increase the hfp packet overhead with another 10 bytes, the extra
10 bytes(which is hblk packet overhead) is adding for hfp packet
overhead since hfp depends on hblk.

This is truely as per BSP code from BPI-M64-bsp.
The real computation from BSP is
(in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
dsi_hbp = (hbp-hspw)*dsi_pixel_bits[format]/8 - (4+2);
dsi_hact = x * dsi_pixel_bits[format]/8;
dsi_hblk = (ht-hspw)*dsi_pixel_bits[format]/8-(4+4+2);
dsi_hfp = dsi_hblk - (4+dsi_hact+2) - (4+dsi_hbp+2);

Example,
u32 fmt = dsi_pixel_bits[format]/8;
=> ((ht-hspw)*fmt - 10) - (6 + x * fmt) - (6 + (hbp-hspw)*fmt - 6)
=> (ht - hspw - x - (hbp - hspw)) * fmt - 16
=> (ht - x - hbp) * fmt - 16
=> (ht - x - (timmings->hor_total_time - timmings->hor_front_porch - x)
* fmt - 16
=> (timmings->hor_total_time - x - timmings->hor_total_time +
timmings->hor_front_porch + x) * fmt - 16
=> timmings->hor_front_porch * fmt - 16

So, increase the DSI hfp packet overhead by hblk packet overhead.

Tested on 2-lane, 4-lane MIPI-DSI LCD panels.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch
Changes for v2:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 6584b51736a9..20e330186b7f 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -461,7 +461,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 {
 	struct mipi_dsi_device *device = dsi->device;
 	unsigned int Bpp = mipi_dsi_pixel_format_to_bpp(device->format) / 8;
-	u16 hbp, hfp, hsa, hblk_max, hblk, vblk;
+	u16 hbp, hfp_pkt_overhead, hfp, hsa, hblk_max, hblk, vblk;
 	size_t bytes;
 	u8 *buffer;
 
@@ -484,14 +484,6 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	hbp = max((unsigned int)HBP_PACKET_OVERHEAD,
 		  (mode->htotal - mode->hsync_end) * Bpp - HBP_PACKET_OVERHEAD);
 
-	/*
-	 * The frontporch is set using a blanking packet (4 bytes +
-	 * payload + 2 bytes). Its minimal size is therefore 6 bytes
-	 */
-#define HFP_PACKET_OVERHEAD	6
-	hfp = max((unsigned int)HFP_PACKET_OVERHEAD,
-		  (mode->hsync_start - mode->hdisplay) * Bpp - HFP_PACKET_OVERHEAD);
-
 	/*
 	 * hblk seems to be the line + porches length.
 	 * The blank is set using a blanking packet (4 bytes + 4 bytes +
@@ -502,6 +494,18 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	hblk_max -= HBLK_PACKET_OVERHEAD;
 	hblk = max((unsigned int)HBLK_PACKET_OVERHEAD, hblk_max);
 
+	/*
+	 * The frontporch is set using a blanking packet (4 bytes +
+	 * payload + 2 bytes). Its minimal size is therefore 6 bytes
+	 *
+	 * According to BSP code, extra 10 bytes(which is hblk packet overhead)
+	 * is adding for hfp packet overhead since hfp depends on hblk.
+	 */
+#define HFP_PACKET_OVERHEAD	6
+	hfp_pkt_overhead = (HFP_PACKET_OVERHEAD + HBLK_PACKET_OVERHEAD);
+	hfp = max((unsigned int)hfp_pkt_overhead,
+		  (mode->hsync_start - mode->hdisplay) * Bpp - hfp_pkt_overhead);
+
 	/*
 	 * And I'm not entirely sure what vblk is about. The driver in
 	 * Allwinner BSP is using a rather convoluted calculation
-- 
2.18.0.321.gffc6fa0e3

