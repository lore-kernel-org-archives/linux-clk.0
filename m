Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE50C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2ECB20855
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kEUDrYKD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730834AbfBAPnZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:43:25 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40876 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728690AbfBAPnY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:43:24 -0500
Received: by mail-lj1-f194.google.com with SMTP id n18-v6so6169031lji.7
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=10WSFhEstsonHJE0sswURBfJEZkL2ZK3lME6HEsPBlU=;
        b=kEUDrYKD9Xbo6Psa7E0LtCwvPkOAmHbcASZG03zVLEdnbikZCucx56s0rnIlXeULTp
         iz/SX4AcKq4myhG4rMKYKNBngRKqBoKveHQBC0XtYrWRD+azJR3IsMZVyys8sZpe6tw+
         0RKL7++qPzcELIxiqtlpvXujXLnVhRvDyPZ6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=10WSFhEstsonHJE0sswURBfJEZkL2ZK3lME6HEsPBlU=;
        b=VF8U4dyUnZsriypUiBrOJTW8vKgn5Nnp1siY1Iq0mKiBfV6R9TR/BSaYh3Bg3xFJsY
         5MjCpnagX2k75yQmMdPElssiIamuyq86yDX3/o5HWJgHgcq9wcZsjnH6jfPPPZ2ShATU
         D/PbzJvEKoRF+FE/T7LdfIv+qupWokkC+0pcXipEO3hDEaRIzx/dGBpZh9Z/cPx0TMfa
         5OCAfuCmGjTY6NuCJkRMroYG+p1OD8+Tes1gW9Bmh8tw81TpZQ+f22ZyLDlEFIROU7xP
         JW232hkvcBXZjpQ67oe2WhKoFBMReUgTokMpKzhCLfUUBgtvvMHSWYuoXV5hL3py9Z/I
         EqrQ==
X-Gm-Message-State: AHQUAuZ8if7B1KYZIpqfemxhKPsBaqwCkw7cdMQnKI+e9llf5KZ3VeQy
        Owqh2enA4gXTEV2rpgSWPQFwfckeX0ehcOwp
X-Google-Smtp-Source: AHgI3IYThsHEMgXZtLVjWdNiadY5ctPaTez8dciRHRzDPC8tJDsYs8nK+O1p37IdiDozDn/TJlmJEw==
X-Received: by 2002:a2e:81a:: with SMTP id 26-v6mr14808402lji.14.1549035802518;
        Fri, 01 Feb 2019 07:43:22 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.43.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:43:21 -0800 (PST)
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
Subject: [PATCH v7 22/23] drm/sun4i: sun6i_mipi_dsi: Fix DSI hfp timing value
Date:   Fri,  1 Feb 2019 21:12:31 +0530
Message-Id: <20190201154232.10505-23-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Current driver is calculating hfp maximum value by subtracting
htotal with hsync_end which is front back value, but the
hpp refers to front porch.

Front porch value is calculating by subtracting hsync_start with
hdisplay as per drm_mode timings, and BSP code from BPI-M64-bsp
is eventually following the same.

BPI-M64-bsp is computing hfp as (from linux-sunxi/
drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)

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

So, update the DSI hfp timing accordingly.

Tested on 2-lane, 4-lane MIPI-DSI LCD panels.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 780b1906c661..3fbe2132eb6a 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -587,7 +587,8 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	 */
 #define HFP_PACKET_OVERHEAD	6
 	hfp = max((unsigned int)HFP_PACKET_OVERHEAD,
-		  (mode->htotal - mode->hsync_end) * Bpp - HFP_PACKET_OVERHEAD);
+		  (mode->hsync_start - mode->hdisplay) * Bpp -
+		  HFP_PACKET_OVERHEAD);
 
 	/*
 	 * hblk seems to be the line + porches length.
-- 
2.18.0.321.gffc6fa0e3

