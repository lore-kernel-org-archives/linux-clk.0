Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92B2C0044C
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:18:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FC4A22507
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="H+CM64Jc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FC4A22507
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732737AbeKMVPi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:15:38 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35813 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732736AbeKMVPh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:15:37 -0500
Received: by mail-pl1-f194.google.com with SMTP id n4-v6so5858486plp.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D5aorguBzgFaeno0vSryYlUmgZEQ0xASVydW10sQ7HQ=;
        b=H+CM64Jczyd+LORW/lL12eYfpWN3JDdI+Re9wVJiPhMeYsRaKt9+QRsF7kTrxS/xI4
         Th7f+sxHCY6s4wWc5R6skD0IHvzCfHZz2/AJUqhHvfBrGRCvG8GeU8pDGC5CeKI4+FK/
         elWmXUAt/MBX1MXhKzIA5d+R689b7HD0cIm+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D5aorguBzgFaeno0vSryYlUmgZEQ0xASVydW10sQ7HQ=;
        b=b1/NpsF7kXXFJhbYcJhqNDOEMxkH/4pteFauEILv0AjPRwQIdxszbKRcrvk9Wq/bTJ
         sRuw9oWbxVzFqZaCD5s6+wrDKZ8dfT0GTo34L4kueC7zDX6jE0q+9gCH8tG4i9wkJ5ht
         U0Y7fMANiBPRi0rnxJh5ya0RI8FTBK2mCHSJrwuOeAwzSBOwia48V6jXKMwJ7D86nFqa
         EYZRatE780BlAeFWJkJAQf367Y/FKbDt+0iBrCmZSLTDQWa84B9REwIcG+lBWytcWeyu
         m8XqYcWbgCa2Cia5yygVmQK1Zz3khLFlvpg07i6Ehya2HbS4c747ISw2SDlDJbjyHdUN
         X+qg==
X-Gm-Message-State: AGRZ1gJejJO1uU5whavBvW3j17f+b7KajvJ7Rg15mik4zGkTphFPUDP+
        3FVwfdNZHhep60zf3/5mkdww7Q==
X-Google-Smtp-Source: AJdET5cTIzMDc08V05Z41yDOHL/XXmlckpZgqo3tzgOPa68Qrl2AJa6EG1UTbt02avvjpgvJgQxQ2g==
X-Received: by 2002:a17:902:8a88:: with SMTP id p8-v6mr4582115plo.94.1542107879320;
        Tue, 13 Nov 2018 03:17:59 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.17.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:17:58 -0800 (PST)
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
Subject: [PATCH v4 11/26] drm/sun4i: sun6i_mipi_dsi: Fix DSI hbp timing value
Date:   Tue, 13 Nov 2018 16:46:18 +0530
Message-Id: <20181113111633.20189-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Current driver is calculating hbp maximum value by subtracting
hsync_start with hdisplay which is front porch value, but the
hbp refers to back porch.

Back porch value is calculating by subtracting htotal with
hsync_end as per drm_mode timings, and BSP code from BPI-M64-bsp
is eventually following the same.

BPI-M64-bsp is computing hbp as
(in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
dsi_hbp = (hbp-hspw)*dsi_pixel_bits[format]/8 - (4+2);
=> (panel->lcd_hbp - timmings->hor_sync_time)
=> (timmings->hor_back_porch + timmings->hor_sync_time -
    timmings->hor_sync_time)
=> timmings->hor_back_porch
=> mode->htotal - mode->hsync_end

So, update the MIPI-DSI hbp value accordingly.

Tested on 2-lane, 4-lane DSI LCD panels.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index f6e3df8d2490..de0992052a90 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -482,7 +482,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	 */
 #define HBP_PACKET_OVERHEAD	6
 	hbp = max((unsigned int)HBP_PACKET_OVERHEAD,
-		  (mode->hsync_start - mode->hdisplay) * Bpp - HBP_PACKET_OVERHEAD);
+		  (mode->htotal - mode->hsync_end) * Bpp - HBP_PACKET_OVERHEAD);
 
 	/*
 	 * The frontporch is set using a blanking packet (4 bytes +
-- 
2.18.0.321.gffc6fa0e3

