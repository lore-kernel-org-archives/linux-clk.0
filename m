Return-Path: <SRS0=HxJ1=NG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9044C6786E
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A236120651
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jxjJGsVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A236120651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbeJZXWl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Oct 2018 19:22:41 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43974 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbeJZXWk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Oct 2018 19:22:40 -0400
Received: by mail-pg1-f194.google.com with SMTP id n10-v6so632850pgv.10
        for <linux-clk@vger.kernel.org>; Fri, 26 Oct 2018 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4csUWAGh39LPVgyuP+BQQjALYVYKTKyjREVujLRWfRw=;
        b=jxjJGsVQTf4etw0gieZ0E4SLLyhVdfXzLDPUOBbqTFMgj1yDnsshq5HreLLziEINQU
         eVXpfdh6aUPZJyK1aIK0hQIbJ+KcrGMVYHmH+h3NukXPerPpmNMWhipOw8LpR1h1aVKs
         T2dRZo68+VnxS0ga8BiznjUjHC9dhOfbSfaEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4csUWAGh39LPVgyuP+BQQjALYVYKTKyjREVujLRWfRw=;
        b=dif4UJ6CSfnq+kCWZyLhuITO3N/sAnXxJKBh7gSTq5zKyzcatSLy4CmwPDVob1S3QA
         wC/XB0uVdWlXflCKzpHGLTReQ17kqwJ697sArMqgNOZNj4/aSDDAb9QtaRwjm73J2FI0
         gZXQncuG+YbAs8QYIKwkO6hnFTMSMIVR112N4OKKJB7TYCOPoJ7Uxf4JX2PX5n3EX5Su
         PT2PNtEga1ig5Y8El3q1rUTFxBf7OLsbYJp5SRvaLR6Vkp2xBYLIkg/GvoI1GKacYmY7
         ejORm9vVRbVq7uq5J8XXZLZ7a3/dRJ2+YaUuuDSPdjw+k7Xn8XSbeXweT0qttcDRHWFB
         Oh1A==
X-Gm-Message-State: AGRZ1gKWl2pQQwNnr9OmunC9HJxMusqac7YMlOfMDbk7rF6tCtvq6TM/
        B1YtFKrJaVYoMEewtpvuQK8FLA==
X-Google-Smtp-Source: AJdET5c0tXb2s+1FRPYuGryZehtZmX1lbn3/l7r7tI90/Q924c3f00RKXW9dcyKBilDNBUefaClUeQ==
X-Received: by 2002:a63:cd45:: with SMTP id a5-v6mr3833382pgj.43.1540565119859;
        Fri, 26 Oct 2018 07:45:19 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id z22-v6sm12044467pgv.24.2018.10.26.07.45.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 07:45:19 -0700 (PDT)
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
Subject: [PATCH v3 12/25] drm/sun4i: sun6i_mipi_dsi: Add DSI hblk packet overhead
Date:   Fri, 26 Oct 2018 20:13:31 +0530
Message-Id: <20181026144344.27778-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181026144344.27778-1-jagan@amarulasolutions.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add 10 bytes packet overhead for hblk where blank is set using
a blanking packet like (4 bytes + 4 bytes + payload + 2 bytes)

This is according to BSP code from BPI-M64-bsp
(in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
dsi_hblk = (ht-hspw)*dsi_pixel_bits[format]/8-(4+4+2);

So, add 10 bytes packet overhead for DSI hblk.

Tested on 2-lane, 4-lane MIPI-DSI LCD panels.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch
Changes for v2:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 596e560263bf..cf42be1f1ba1 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -461,7 +461,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 {
 	struct mipi_dsi_device *device = dsi->device;
 	unsigned int Bpp = mipi_dsi_pixel_format_to_bpp(device->format) / 8;
-	u16 hbp, hfp, hsa, hblk, vblk;
+	u16 hbp, hfp, hsa, hblk_max, hblk, vblk;
 	size_t bytes;
 	u8 *buffer;
 
@@ -494,8 +494,13 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 
 	/*
 	 * hblk seems to be the line + porches length.
+	 * The blank is set using a blanking packet (4 bytes + 4 bytes +
+	 * payload + 2 bytes). So minimal size is 10 bytes
 	 */
-	hblk = (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp;
+#define HBLK_PACKET_OVERHEAD	10
+	hblk_max = (mode->htotal - (mode->hsync_end - mode->hsync_start)) * Bpp;
+	hblk_max -= HBLK_PACKET_OVERHEAD;
+	hblk = max((unsigned int)HBLK_PACKET_OVERHEAD, hblk_max);
 
 	/*
 	 * And I'm not entirely sure what vblk is about. The driver in
-- 
2.18.0.321.gffc6fa0e3

