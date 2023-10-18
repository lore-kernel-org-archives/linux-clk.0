Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0454DCDB484
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 16:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjJRQS7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 12:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbjJRQS6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 12:18:58 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A67B8;
        Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b2e308a751so754419b6e.0;
        Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697645936; x=1698250736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5RlhUqBqM3g+4MPGnE7ouhmH0KrUx/6TtzKaaWSu60=;
        b=Iqcv243YtuUItPMMbC6cRC1kXQy+VVmuI2f5Yh4QtigEEIIxGStd6Z4VhofwgYOZIK
         aHdWkkhMEfJimRwjK7H5rU7AX6tTRQKjm7SHv5XDL+LgJb5hnYuNfieuVkDzMTUJ7j3I
         Zbr72lnekGKKgqHobuL69fjWiuuXfmw/+msJb5yFYaKzClKow8W1ZkEVohgqoGv997yB
         BnFnnVQSw8CmcSBcL4s6uPk/osht8zP34+ehBHsrYQ5DWVtiV1AYhr4C3RQPTEpVnumW
         IKcTUB/giF9EIM9RHJrjP5S3zDrJBw7KH7TyT1y9quiFx8LaU9a1zINjiks6mSDrB4ri
         jC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697645936; x=1698250736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5RlhUqBqM3g+4MPGnE7ouhmH0KrUx/6TtzKaaWSu60=;
        b=qdAp4Fu9N4rOb7wLZevHqbYMmblsFquHs+yaYMP0lfQiucZfYYneTEDlGgJ8XC4kHm
         JYGYtA7NhHoQC+Pwo7ufRNLF+fr6RrZvzyTUidR6tLOqI7Ff2pFkoC86e+GT5Xeh7lv4
         Uyr/3vJiPFnVvFq7Q/s8mRcYyA/wjLCV3eFOewl1Fk3HjoERZOt6TA0ypB+sQMdJ9fgP
         jf889JVErchUiuJZIG2975aDot7i8Qz8cP9soSXde6QEiEkCXCt5jL5WuYlZsShXQXdu
         3pzyMz9VXzMrGRgXfcYOUMt5tO+/VXal3n2QRd8dAtjCJf5JMtSTENPseOTKxWFJMQxQ
         SyXg==
X-Gm-Message-State: AOJu0Yz6ipAI0ng0P1x0EwqSvS2rBx9P4ww4TGfZ8gfJRMesZRQU9+lw
        Si+8RROCK8HRfyZpb8pIqh0=
X-Google-Smtp-Source: AGHT+IEYc+5ohz4jYnwR7FiV33p5sIPOaesEd2oV9q3jHLHsmLR4rbrebzo3oxbolWRtBOaueSf98A==
X-Received: by 2002:a05:6808:2020:b0:3b2:e4b7:2af2 with SMTP id q32-20020a056808202000b003b2e4b72af2mr1658264oiw.6.1697645936268;
        Wed, 18 Oct 2023 09:18:56 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:18:55 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, sebastian.reichel@collabora.com,
        sboyd@kernel.org, mturquette@baylibre.com, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, neil.armstrong@linaro.org,
        heiko@sntech.de, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/5] drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
Date:   Wed, 18 Oct 2023 11:18:45 -0500
Message-Id: <20231018161848.346947-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Refactor the driver to add support for the powkiddy,rk2023-panel
panel. This panel is extremely similar to the rg353p-panel but
requires a smaller vertical back porch and isn't as tolerant of
higher speeds.

Tested on my RG351V, RG353P, RG353V, and RK2023.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 56 +++++++++++++++----
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 79de6c886292..d24c51503d68 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -28,6 +28,7 @@ struct nv3051d_panel_info {
 	unsigned int num_modes;
 	u16 width_mm, height_mm;
 	u32 bus_flags;
+	u32 mode_flags;
 };
 
 struct panel_nv3051d {
@@ -385,15 +386,7 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
-
-	/*
-	 * The panel in the RG351V is identical to the 353P, except it
-	 * requires MIPI_DSI_CLOCK_NON_CONTINUOUS to operate correctly.
-	 */
-	if (of_device_is_compatible(dev->of_node, "anbernic,rg351v-panel"))
-		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	dsi->mode_flags = ctx->panel_info->mode_flags;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
@@ -481,18 +474,59 @@ static const struct drm_display_mode nv3051d_rgxx3_modes[] = {
 	},
 };
 
-static const struct nv3051d_panel_info nv3051d_rgxx3_info = {
+static const struct drm_display_mode nv3051d_rk2023_modes[] = {
+	{
+		.hdisplay       = 640,
+		.hsync_start    = 640 + 40,
+		.hsync_end      = 640 + 40 + 2,
+		.htotal         = 640 + 40 + 2 + 80,
+		.vdisplay       = 480,
+		.vsync_start    = 480 + 18,
+		.vsync_end      = 480 + 18 + 2,
+		.vtotal         = 480 + 18 + 2 + 4,
+		.clock          = 24150,
+		.flags          = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+};
+
+static const struct nv3051d_panel_info nv3051d_rg351v_info = {
 	.display_modes = nv3051d_rgxx3_modes,
 	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
 	.width_mm = 70,
 	.height_mm = 57,
 	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static const struct nv3051d_panel_info nv3051d_rg353p_info = {
+	.display_modes = nv3051d_rgxx3_modes,
+	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
+	.width_mm = 70,
+	.height_mm = 57,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+};
+
+static const struct nv3051d_panel_info nv3051d_rk2023_info = {
+	.display_modes = nv3051d_rk2023_modes,
+	.num_modes = ARRAY_SIZE(nv3051d_rk2023_modes),
+	.width_mm = 70,
+	.height_mm = 57,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
 };
 
 static const struct of_device_id newvision_nv3051d_of_match[] = {
-	{ .compatible = "newvision,nv3051d", .data = &nv3051d_rgxx3_info },
+	{ .compatible = "anbernic,rg351v-panel", .data = &nv3051d_rg351v_info },
+	{ .compatible = "anbernic,rg353p-panel", .data = &nv3051d_rg353p_info },
+	{ .compatible = "powkiddy,rk2023-panel", .data = &nv3051d_rk2023_info },
 	{ /* sentinel */ }
 };
+
 MODULE_DEVICE_TABLE(of, newvision_nv3051d_of_match);
 
 static struct mipi_dsi_driver newvision_nv3051d_driver = {
-- 
2.34.1

