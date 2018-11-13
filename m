Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C31C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E379022507
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NdohmiLl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E379022507
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732721AbeKMVPc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:15:32 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37267 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732683AbeKMVPZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:15:25 -0500
Received: by mail-pf1-f195.google.com with SMTP id u3-v6so3203931pfm.4
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7xZtqhtyLeCo2JvRyz6iw0Lru8qOAi+ZigmyrveCcU=;
        b=NdohmiLlSkoZU7Pzu7EoT+xyfs525WMqHYtleWbiEdZFZ1GATwXlfcGC90RJWZ5kwb
         w2EXCRbbCqznsVVXsab5wiw0n8Z9t711nNCvvRfyahH41P24/DgeZduvUTAlxXU85tw2
         5qBx8/DLB//dgneadmMZXbi9sEZHGbC/yr8Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7xZtqhtyLeCo2JvRyz6iw0Lru8qOAi+ZigmyrveCcU=;
        b=CPrdoW3Fw66oZxVfK2sGhBJn+X7sI4Fo9p70Uf4j2RrqLk/3IkwaKjYwugpOhxKZn2
         3jIhzYU5vhdMD26F4UiEg5l+Pa0osB9nHsA4AxTxmphLb89mKQRs8qhxsryGoUUxy9Wt
         /xg+z8tjRQ61gZKMvsk1uOyRBwKw4bOEulpRUjY7ou2tdmQQdg0lH7OwjRGrsyRm+wy6
         5fDQTkpnm1PBz8TffTUeIbSJVOs0Ai+4qFYdg7DPob92hmErpqw5MSh6zWT1G7WJ0CT9
         RAkYD7bmwIdHwarBejyXRL3+mQYFBQbhSgpQLaUc6IdWuV99Z93iQPkYhlQ6Yp/jxRsh
         iHaQ==
X-Gm-Message-State: AGRZ1gKJebN+8pQJ4dty3+0f9CeKbJ3okeXAz6dM9KIMTsUCTLoRtLIO
        gYELayXGdBfLH4W5gyotgUSXEA==
X-Google-Smtp-Source: AJdET5d7bo5xPOLc4beVgRh49IcW0C5gyV1OcsOSQF9PK3wCiSAKHP0magBN9Xl7LmfHgj2oXkUFRA==
X-Received: by 2002:a62:9f42:: with SMTP id g63-v6mr4692347pfe.144.1542107866653;
        Tue, 13 Nov 2018 03:17:46 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.17.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:17:46 -0800 (PST)
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
Subject: [PATCH v4 09/26] drm/sun4i: sun6i_mipi_dsi: Fix TCON DRQ set bits
Date:   Tue, 13 Nov 2018 16:46:16 +0530
Message-Id: <20181113111633.20189-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

TCON DRQ set bits for non-burst DSI mode can computed via
horizontal front porch instead of front porch + sync timings.

BSP code form BPI-M64-bsp is computing TCON DRQ set bits
for non-burts as (from linux-sunxi/
drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)

=> panel->lcd_ht -    panel->lcd_x - panel->lcd_hbp
=> (timmings->hor_front_porch + panel->lcd_hbp + panel->lcd_x)
   - panel->lcd_x - panel->hbp
=> timmings->hor_front_porch
=> mode->hsync_start - mode->hdisplay

So, update the DRQ set bits accordingly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index eeea977604ac..fc4252d96c38 100644
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

