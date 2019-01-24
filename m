Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D848C282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D9B121726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ebTKTuOV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731760AbfAXT7f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 14:59:35 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34472 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731158AbfAXT7e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 14:59:34 -0500
Received: by mail-pl1-f196.google.com with SMTP id w4so3393226plz.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 11:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a8vOl3skF2N3dkaRRYLofdwZfQDV/6WD5CsnhZdLWdk=;
        b=ebTKTuOVkL11ASo0UBwv/Mx+SzrHJ5oxFw3eMUKqwdsqzM4HdFzzv/TA4aIK7Y3Ftw
         TcXzrmY5ETcR8XSeYVhErcnmF+JPo+UL0E/derqnYwa+gopPyOAQPmygRzw2jvMdg71o
         V12iSQzJ2QeiT7Lxi5VBYJwZbP/np+wp/leXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a8vOl3skF2N3dkaRRYLofdwZfQDV/6WD5CsnhZdLWdk=;
        b=s8t6uJSYP3cH2oAjkSG8hUo4YA7Txfbxojce1pjW6ogFuyXbMHQ05TCVgqywtCzTPI
         jL9hXz8NYI1CF0/tG2HYLlZ9OxIIMWKSUdFvATyOCuLIKHrm7xti06p5t1rXsGv4ipMU
         o15vHx95P0RORtTNq3BT0J3+MZDV2DxdgJ6dKZMT2QbhgYcvEfpUPw2uUtAZkHDWBU4Y
         lE0hsuKEwbYuyuARIv0QpYPEwajeCBIvMRehpWb5v09XOQcAkzF6WjYTg3HUNj0YqVrX
         EG3AisXArizPrjpIM/RR7VpvQjhYUzUDgOkeMPIxHA9IQi8CkyjjeCYi6lPiVTkhfEPu
         0fIQ==
X-Gm-Message-State: AJcUukdETh0q+abNPlzYVmPJqoc253oQrbtDWF3BprzvVczcAHv4xXmO
        oTyPZj6xzyFny3XnlKExQj7mvw==
X-Google-Smtp-Source: ALg8bN600OaZSBVU1MphHnvnL6Q/ASOz8fdtUlZH15Pf1qk+U2hWLSI1BdNwhM2H3XNJJT28S7ntjA==
X-Received: by 2002:a17:902:848d:: with SMTP id c13mr7959131plo.257.1548359973705;
        Thu, 24 Jan 2019 11:59:33 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.11.59.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 11:59:33 -0800 (PST)
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
Subject: [PATCH v6 03/22] drm/sun4i: sun6i_mipi_dsi: Setup burst mode timings
Date:   Fri, 25 Jan 2019 01:28:41 +0530
Message-Id: <20190124195900.22620-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Burst mode display timings are different from conventional
video mode, for burst mode most of the timings hsa, hbp, hfp,
vblk are 0 and hblk is computed as (mode->hdisplay * Bpp)

This patch add burst mode timings and directly goto alloc buffer.

Reference code taken from BSP (from linux-sunxi/
drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)

dsi_hsa  = 0;
dsi_hbp  = 0;
dsi_hact = x*dsi_pixel_bits[format]/8;
dsi_hblk = dsi_hact;
dsi_hfp  = 0;
dsi_vblk = 0;

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 813d5523f1c7..0f02bcc997a5 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -477,6 +477,12 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 
 	/* Do all timing calculations up front to allocate buffer space */
 
+	if (device->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+		hbp = hfp = hsa = vblk = 0;
+		hblk = (mode->hdisplay * Bpp);
+		goto alloc_buf;
+	}
+
 	/*
 	 * A sync period is composed of a blanking packet (4 bytes +
 	 * payload + 2 bytes) and a sync event packet (4 bytes). Its
@@ -515,6 +521,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	 */
 	vblk = 0;
 
+alloc_buf:
 	/* How many bytes do we need to send all payloads? */
 	bytes = max_t(size_t, max(max(hfp, hblk), max(hsa, hbp)), vblk);
 	buffer = kmalloc(bytes, GFP_KERNEL);
-- 
2.18.0.321.gffc6fa0e3

