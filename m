Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEC3C282C5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B66B21726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:01:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CC7tbdyL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730752AbfAXUBL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 15:01:11 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37678 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729693AbfAXUBL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 15:01:11 -0500
Received: by mail-pf1-f193.google.com with SMTP id y126so3532065pfb.4
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 12:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p/fJ1iw2WcKuA3279PZCjqMz7GBGf1KE2XCGX061XcE=;
        b=CC7tbdyLxoRdfqqHGpLeXCUiQEbgaexutUTQRuVYuirYw0CEJF6xTKYaBdsFyFzMgl
         +mOf3fjdQjDVA496o1n4r6lNRvIDETxD1zWANt0JNbj7Xzp1gr57NASbumpuLDLCBOXs
         Li2ZfTWYkQZStwDJUpN5TcGcvwK7FaR4lW5eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p/fJ1iw2WcKuA3279PZCjqMz7GBGf1KE2XCGX061XcE=;
        b=ORhYDsvyrrzAxi88fTzQyUWiDY1GeKBxD4wlU3v5ityfCiR//CnquFJZKu2dLHVJ/0
         HX9hll0O4v/HSS9zhOTdH6cAt8MZ4uFgTkd3KRyQnW3TzfgaY57s8lUPhlb3EUWy9/ZZ
         5rRRmeFteabPy2FGR3Y60SSIJ+1e884vOiQVGbqzaP6erWBfP9oYPgJ2XE3TbRWN6Ed8
         fG3dwxxZUIMw2aSe6pxzV/lkLdzQYAlCkzTTZpiZ9VryjDU+F+AAzdFdPxIal6VkVd8l
         8UarskDwUfcPmnQjwGqi7yVT++/gEJhHBxn5DCF+VzddmTTor7lDzKdO5f5MC3XrTIrX
         95qg==
X-Gm-Message-State: AJcUukfD2MBp/JbxJthxV4hQOvP/YXFTOYrFGdBaAdI26/IGR+W7yjxw
        W/Kw6WsCvLIwNoBny5YwJMKHOA==
X-Google-Smtp-Source: ALg8bN5s9ZdKUPSLcjyahaie8Nxi1A3bxmx5c2bMvR7xMCSOGff1YPDujEn8dCM/B/3aSm4tatnYrw==
X-Received: by 2002:a62:1b83:: with SMTP id b125mr8204996pfb.42.1548360070231;
        Thu, 24 Jan 2019 12:01:10 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.12.01.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 12:01:09 -0800 (PST)
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
Subject: [PATCH v6 20/22] drm/sun4i: sun6i_mipi_dsi: Fix DSI hbp timing value
Date:   Fri, 25 Jan 2019 01:28:58 +0530
Message-Id: <20190124195900.22620-21-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
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
index 58bda0928aef..e24719cabba2 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -578,7 +578,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	 */
 #define HBP_PACKET_OVERHEAD	6
 	hbp = max((unsigned int)HBP_PACKET_OVERHEAD,
-		  (mode->hsync_start - mode->hdisplay) * Bpp - HBP_PACKET_OVERHEAD);
+		  (mode->htotal - mode->hsync_end) * Bpp - HBP_PACKET_OVERHEAD);
 
 	/*
 	 * The frontporch is set using a blanking packet (4 bytes +
-- 
2.18.0.321.gffc6fa0e3

