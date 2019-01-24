Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBF4C282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:59:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B1C821726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:59:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Mr+1LHQb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731990AbfAXT7l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 14:59:41 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41496 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729180AbfAXT7k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 14:59:40 -0500
Received: by mail-pg1-f194.google.com with SMTP id m1so3124550pgq.8
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 11:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=anHsrjMbLEFT68kAkE2t/9/N/A+LioJPwdjsAaUWV6M=;
        b=Mr+1LHQbGiGFa9RRSZEvmtvsm2fe15PzViT5Ls9dOEOJBDRMewkDbH+rFr+ohoXcRW
         yuQgBYFuy7z0M6CXzdfYUqwUxIE0QEikvpvuRXGf/52K1ghAEpq9fnWC7JDdBTmAh0sB
         nnud8zcmJgemxCqCzVmw7LD/rm+zBvoWVSZ9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=anHsrjMbLEFT68kAkE2t/9/N/A+LioJPwdjsAaUWV6M=;
        b=ctjZrn+YAC+7apeMdcHkoGHlyDHOwt96RsWl0nMN4wNsisahkO1KcwD3rh1AABLkYA
         vAWJFk83V+hgb1ZHd8RO0OXO/wjXyTWpk/7vwRBz84RDUJqzWRg1idCWtoBuFQnTgIdC
         TH37jg1SY4xy3MSZzX5XQC+xVuEv5eFsE5mwGQaot1UdQvPwwyfttspKIJ1gxcP1a/oV
         Vu1ePejtG3XMJfq2ud4T0Ctzt6A/NErseGrXAKTYD5LXnfxEd0OqtROjwWGvj2xzaGqk
         viljTBlqwihNtgYpflrzEF2SUUB0zZuvN9wJcZSjgxm/Iu4cc9vuoq9pJf/ODOVI79Y/
         4zcA==
X-Gm-Message-State: AJcUukfG12K+Ugcr0Uu2oWW2KIr6lH9hr2hBIMb1JvveUhgEk7S/hz/T
        wEU4NVEojfYSsflZIcEvaFd2tA==
X-Google-Smtp-Source: ALg8bN4mq0xPurqMf/0RAVMft7fSNwSdm3nfmoE8i/Vp1Tl0U0YR5qs/NZVNeCxU/34qzXtNSfQMYQ==
X-Received: by 2002:a63:2109:: with SMTP id h9mr7134428pgh.277.1548359979766;
        Thu, 24 Jan 2019 11:59:39 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.11.59.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 11:59:39 -0800 (PST)
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
Subject: [PATCH v6 04/22] drm/sun4i: sun6i_mipi_dsi: Simplify drq to support all modes
Date:   Fri, 25 Jan 2019 01:28:42 +0530
Message-Id: <20190124195900.22620-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allwinner MIPI DSI drq has enable mode and set bits.
- for burst mode, drq need to set enable mode bit.
- for non-burst video modes, drq need to set enable mode,
  set bits for those front proch greater than 20 and for
  rest drq is not used.

This patch simplifies existing drq code by grouping into
sun6i_dsi_get_drq and support all video modes.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 39 ++++++++++++++++----------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 0f02bcc997a5..16a86d35dc5a 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -354,6 +354,28 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi *dsi,
 		     SUN6I_DSI_INST_JUMP_CFG_NUM(1));
 };
 
+static int sun6i_dsi_get_drq(struct sun6i_dsi *dsi,
+			      struct drm_display_mode *mode)
+{
+	struct mipi_dsi_device *device = dsi->device;
+
+	if (device->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+		return SUN6I_DSI_TCON_DRQ_ENABLE_MODE;
+
+	if ((mode->hsync_start - mode->hdisplay) > 20) {
+		/* Maaaaaagic */
+		u16 drq = (mode->hsync_start - mode->hdisplay) - 20;
+
+		drq *= mipi_dsi_pixel_format_to_bpp(device->format);
+		drq /= 32;
+
+		return (SUN6I_DSI_TCON_DRQ_ENABLE_MODE |
+			SUN6I_DSI_TCON_DRQ_SET(drq));
+	}
+
+	return 0;
+}
+
 static u16 sun6i_dsi_setup_inst_delay(struct sun6i_dsi *dsi,
 				      struct drm_display_mode *mode)
 {
@@ -381,21 +403,8 @@ static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
 static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
 				  struct drm_display_mode *mode)
 {
-	struct mipi_dsi_device *device = dsi->device;
-	u32 val = 0;
-
-	if ((mode->hsync_end - mode->hdisplay) > 20) {
-		/* Maaaaaagic */
-		u16 drq = (mode->hsync_end - mode->hdisplay) - 20;
-
-		drq *= mipi_dsi_pixel_format_to_bpp(device->format);
-		drq /= 32;
-
-		val = (SUN6I_DSI_TCON_DRQ_ENABLE_MODE |
-		       SUN6I_DSI_TCON_DRQ_SET(drq));
-	}
-
-	regmap_write(dsi->regs, SUN6I_DSI_TCON_DRQ_REG, val);
+	regmap_write(dsi->regs, SUN6I_DSI_TCON_DRQ_REG,
+		     sun6i_dsi_get_drq(dsi, mode));
 }
 
 static void sun6i_dsi_setup_inst_loop(struct sun6i_dsi *dsi,
-- 
2.18.0.321.gffc6fa0e3

