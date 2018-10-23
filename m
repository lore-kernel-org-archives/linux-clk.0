Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E95FC46475
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 163EF20665
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ioly+0z7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 163EF20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbeJXAPl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 20:15:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39291 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728559AbeJXAPl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 20:15:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id c25-v6so887887pfe.6
        for <linux-clk@vger.kernel.org>; Tue, 23 Oct 2018 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgo287Yan4wJCzR1Tu9+/fvGRpj2dOPV0KdcK2/NbdY=;
        b=ioly+0z7xD9HR2uoTZWvPZlsyWFjvRAbAMYpCBou5yJk/KkAcuLCjJu6n6f8PE3HD/
         JR1cOvdXZIMLsv1o76e2HqcVGXsyQiSgVlbCI2XehtkLvWo4g5peg9439v+g05KDq4yw
         OiMTFaah+Hd9zOJe0tTc43KlCqPzXs4/XhXvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgo287Yan4wJCzR1Tu9+/fvGRpj2dOPV0KdcK2/NbdY=;
        b=bD0Z7FxGGlbwaJDqZTy1h8lb3IrdGx1AmE7NmGDNbI9lQOjotJavlpoycN/Sxoa/HS
         9iOETHwodOVpY2mvGsnHomsxK3tf2tZoei5aEyLxBeJoasNlUGtWaz/NSssneRUVABC8
         pTIW5ASpN3JGv7zZUpCZRNF1mEBjLNXzzV0sUfFzG30vOESGEfPP1nGRaEfd0VELdX7W
         WEsYEy2AG3P3rouOMpBcs0I43ATN/O2d0Vlq7EGYkrz5xWjrdXwND+hS/oaq12qvrgfO
         PjDT123Ct4dR9wds8VwPOsMLU6Pv9WeP1FIyAkLlrRwLKcmFHavU6lgLRVI6/RZl7mST
         UcPA==
X-Gm-Message-State: ABuFfoiluFiCXxZDba5NM7rmwnCah+yQ9ry6hx+eU4ug7oYgP3aiLgnH
        LFMX9maRZpMnbEG4sEo0nxuDzg==
X-Google-Smtp-Source: ACcGV61EWJA4KzZg5ExM6xaHV5J0VPKvzVF0Z7lMPLRI9Bt/Uagm3c3METIhZxqn+WafjU3zV5u10w==
X-Received: by 2002:a62:808c:: with SMTP id j134-v6mr49709353pfd.47.1540309904196;
        Tue, 23 Oct 2018 08:51:44 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id o75-v6sm7442829pfg.0.2018.10.23.08.51.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Oct 2018 08:51:43 -0700 (PDT)
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
Subject: [PATCH v2 08/15] drm/sun4i: sun6i_mipi_dsi: Fix TCON DRQ set bits
Date:   Tue, 23 Oct 2018 21:20:28 +0530
Message-Id: <20181023155035.9101-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181023155035.9101-1-jagan@amarulasolutions.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

TCON DRQ set bits for non-burst DSI mode can computed via
horizontal front porch instead of front porch + sync timings.

According to BSP code form BPI-M64-bsp in
linux-sunxi/drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c
TCON DRQ set bits are computed for non-burst mode as

=> panel->lcd_ht -    panel->lcd_x - panel->lcd_hbp
=> (timmings->hor_front_porch + panel->lcd_hbp + panel->lcd_x)
   - panel->lcd_x - panel->hbp
=> timmings->hor_front_porch
=> mode->hsync_start - mode->hdisplay

So, update the DRQ set bits accordingly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- Add detailed commit message

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 3a1d48bc1996..8d154cf2e6d6 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -367,9 +367,9 @@ static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
 	struct mipi_dsi_device *device = dsi->device;
 	u32 val = 0;
 
-	if ((mode->hsync_end - mode->hdisplay) > 20) {
+	if ((mode->hsync_start - mode->hdisplay) > 20) {
 		/* Maaaaaagic */
-		u16 drq = (mode->hsync_end - mode->hdisplay) - 20;
+		u16 drq = (mode->hsync_start - mode->hdisplay) - 20;
 
 		drq *= mipi_dsi_pixel_format_to_bpp(device->format);
 		drq /= 32;
-- 
2.18.0.321.gffc6fa0e3

