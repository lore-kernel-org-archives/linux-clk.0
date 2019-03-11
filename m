Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B23EC43381
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BF272087C
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ccJ5Jpwk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbfCKNhj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:37:39 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45765 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbfCKNhi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 09:37:38 -0400
Received: by mail-pf1-f193.google.com with SMTP id v21so3707380pfm.12
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 06:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wkMsNwyY53cH+tA381Ozy9jdybtcb0xlgRRfpGP+ijE=;
        b=ccJ5Jpwk5iya7fy6+FYdzI3y//jbG8FwKwLp3maPcEUhkdqMcgImfcFYsnmCIRbJ8J
         D9sqATKEcMccjrz5PpgoxBoNF9QhZ8AhSMy1VkGWf/XVfRooWQ+WGMzhUGyHv6MZ4kk8
         XvvDIQvgQdv/UFPJdEwvOhOgzKooTmckFRDlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wkMsNwyY53cH+tA381Ozy9jdybtcb0xlgRRfpGP+ijE=;
        b=uCumREO0xUD++yVsNrZaRoHbNXUteoP+FBkm344gQGPfQJ42D6PcA7xOYJI/Tl/9gu
         3xrJUwhzLb2OJp9N59aH4Eoq7ArPwFMzgF0eWSmbPThkX/4kP9H5+EFBcSuzpBWg3Oqp
         bZ3Jnt9P2pUia5k6qEP8HC6kflfnqiF+sfKudXq1Th9Nv0S4vPu2keyYMAn+ufoB17dF
         AHukZopkVfgK1ojH2EfsxWzWaaLOsDTtgkw26RGzAzAcYbXWHRQ9SNCwD0e7w1udQvFE
         TxSpTxwuc1HZXvUk8eLVazikFHrWqphFnMxQW/RwGKz/mdNH2IldCGtedFfloX1aQLMJ
         ZjOg==
X-Gm-Message-State: APjAAAW6x7GDscQ+kKV2Zz/2WmktDW1jPL0KCmjXaIVYIdmxOMv2w+f7
        BOIFgZngFHsR/sGIOh7Z9G/Kww==
X-Google-Smtp-Source: APXvYqwAVXXS+sEAJWk9MVNbPfsJiVpvNsXJ11YLk6uHl8kGqCkvFhGOQD4cpCoVCtaUNvjnaQO6AQ==
X-Received: by 2002:a63:5813:: with SMTP id m19mr30213063pgb.294.1552311457673;
        Mon, 11 Mar 2019 06:37:37 -0700 (PDT)
Received: from localhost.localdomain ([183.82.224.199])
        by smtp.gmail.com with ESMTPSA id s79sm9960397pfa.61.2019.03.11.06.37.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:37:37 -0700 (PDT)
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
Subject: [PATCH v8 05/15] drm/sun4i: dsi: Get tcon0_div at runtime
Date:   Mon, 11 Mar 2019 19:06:27 +0530
Message-Id: <20190311133637.18334-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tcon0 divider is used while computing drq edge0 for burst mode
devices, currently driver is using default macro value 4 via
SUN6I_DSI_TCON_DIV.

Unfortunately not all the panel devices are working with this
default divider value 4, so to make future changes on this divider
value get the divider from tcon dot clock at runtime.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 8 +++++++-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h | 2 --
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index a8d3df0ea8f5..388e1161974c 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -392,9 +392,15 @@ static u16 sun6i_dsi_get_drq_edge0(struct sun6i_dsi *dsi,
 				   struct drm_display_mode *mode,
 				   u16 line_num, u16 edge1)
 {
+	struct sun4i_tcon *tcon = dsi->tcon;
+	unsigned long dclk_rate, dclk_parent_rate, tcon0_div;
 	u16 edge0 = edge1;
 
-	edge0 += (mode->hdisplay + 40) * SUN6I_DSI_TCON_DIV / 8;
+	dclk_rate = clk_get_rate(tcon->dclk);
+	dclk_parent_rate = clk_get_rate(clk_get_parent(tcon->dclk));
+	tcon0_div = dclk_parent_rate / dclk_rate;
+
+	edge0 += (mode->hdisplay + 40) * tcon0_div / 8;
 
 	if (edge0 > line_num)
 		return edge0 - line_num;
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index 20516f7ab179..747c451a9a20 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -13,8 +13,6 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 
-#define SUN6I_DSI_TCON_DIV	4
-
 struct sun6i_dsi {
 	struct drm_connector	connector;
 	struct drm_encoder	encoder;
-- 
2.18.0.321.gffc6fa0e3

