Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F368C282DA
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F8E120855
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="APv9oV/P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbfBAPm7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:42:59 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34568 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbfBAPm5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:42:57 -0500
Received: by mail-lj1-f195.google.com with SMTP id u89-v6so6228987lje.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yb+noxi69zQOu7k+JslI3G7pP5MYsH91QeSM30jJfwQ=;
        b=APv9oV/PqBKX0Lnwopd7p67DYrueF3honf/B8EziKXHh/Pt43sjd8oCsTgEzAwfgvk
         jDp527SdJ5xe54oX7Mjh0paH9byvjdEto5uUyGATHDr+VYO7Md1dQM78a/FDZCYeLBTw
         geL1BHYUl1a/vm1clYe/NzkUnlcfXQzNR09Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yb+noxi69zQOu7k+JslI3G7pP5MYsH91QeSM30jJfwQ=;
        b=nonm0t8ltf2btsrMHz8JUM64iSaipEDWNzaWQXju9Mfq4g7okD3zrM2+SphwkENtJo
         5JpOHU4T1Ng/KuQXEdcyAnnl9YUAV0BjHP+9ya+ZjPK8cE2ywC+EhgccgB/xYsA6epqR
         FniEJYClfSKCyEIzti2u0EB+W7/TIpgf07ktb/E2Zo1NZyEfjgYOG7RQdoVO/WmVnhVy
         4vS3Vx3qUr9empgM/Mei1AMKAJAZ8MWmnE45EbSKrKNJ1TQoj3B9WSUw82DCUElWBvMN
         FS495rjn2YPnniMWZfvNRNPNTYgdyt0syFZwVCh48Lr3YYYKdJK4Yly2EGj4OgXLvckz
         lG6Q==
X-Gm-Message-State: AJcUukfd5K608LJ/qgR3x+3EbHyK91NOJndOMdloJLIGqoFKbaYUxuWU
        Y/Lno5m61NO4wUHoS53mOi1YFg==
X-Google-Smtp-Source: ALg8bN7/wQSinHisGGaql3kcec2ekLGLreLus3/j+iTO/2x/47Ych+ECPa4/rLbZskFzRIzooYX1ZQ==
X-Received: by 2002:a2e:974a:: with SMTP id f10-v6mr34782408ljj.61.1549035775668;
        Fri, 01 Feb 2019 07:42:55 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.42.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:42:54 -0800 (PST)
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
Subject: [PATCH v7 06/23] drm/sun4i: sun6i_mipi_dsi: Probe tcon0 during dsi_bind
Date:   Fri,  1 Feb 2019 21:12:15 +0530
Message-Id: <20190201154232.10505-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Probe tcon0 during dsi_bind, so-that the tcon attributes like
divider value, clock rate can get whenever it need.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 7 +++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 16a86d35dc5a..2aeaa19a8d1e 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -24,6 +24,7 @@
 #include <drm/drm_panel.h>
 
 #include "sun4i_drv.h"
+#include "sun4i_tcon.h"
 #include "sun6i_mipi_dsi.h"
 
 #include <video/mipi_display.h>
@@ -947,6 +948,7 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
+	struct sun4i_tcon *tcon0 = sun4i_get_tcon0(drm);
 	int ret;
 
 	if (!dsi->panel)
@@ -954,6 +956,11 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	dsi->drv = drv;
 
+	if (!tcon0)
+		return -EINVAL;
+
+	dsi->tcon = tcon0;
+
 	drm_encoder_helper_add(&dsi->encoder,
 			       &sun6i_dsi_enc_helper_funcs);
 	ret = drm_encoder_init(drm,
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index dbbc5b3ecbda..257cca660da0 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -33,6 +33,7 @@ struct sun6i_dsi {
 
 	struct device		*dev;
 	struct sun4i_drv	*drv;
+	struct sun4i_tcon	*tcon;
 	struct mipi_dsi_device	*device;
 	struct drm_panel	*panel;
 };
-- 
2.18.0.321.gffc6fa0e3

