Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108D8C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4AB520685
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="etDac7bq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4AB520685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732658AbeKMVPT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:15:19 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33008 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732657AbeKMVPT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:15:19 -0500
Received: by mail-pg1-f196.google.com with SMTP id z11so2909992pgu.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rCYzhNJFb/CoGYAKzI3iqrtOUmQxW0PESvSyXzaqWC0=;
        b=etDac7bqHT32dF8RDX2MwDIBVJA/i0V11AP17F+Ht2+YiDq0pYU76iV+/vj9hlp+ds
         8UdgzwRLq/ALedbrmvbMt5CLvl2vtjd3ffOUDwBGtsgKDcqhaQm2xDmFlvT5Vnjo81jn
         HKa2rq2zQpGB37h1+IWwjwkI+y8zjmIPk3uXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rCYzhNJFb/CoGYAKzI3iqrtOUmQxW0PESvSyXzaqWC0=;
        b=OFq4oIZcKho+rqy/iplCfQqkmQRhdVT+ZGnAZDgBC8thBLgEIrMOVOiJEhq7jpdShj
         PVuwxwxexj6jxVapFWjiXRPBQZio3x2rIVUsKhKFzpw2naSts4Is7+QpCmiOSXyFrOwA
         aZE5ZOr1+YKuEYRq1N2E4M5GGvScz76Nq7i6cBimr2Q3f/BXRQNOs4xxFNKn4y7a054X
         kXcLyzQCfiClXOvDKdI6P9LH2p1JcZZ96etNp6z8D7w7F13yxgXaaLzH/m1W7pKg0Y6E
         MW6E4dRrQr7cdChDM3+IR72T+GnPvfWcDJGQj/4n4qgj76VxQEMc0H/qUIRW4talabaQ
         qsoQ==
X-Gm-Message-State: AGRZ1gLoDCwGcwy3uwp3kfTz5Z7FOkkNtPL5/2MOoCDYT7i2AlxTQIml
        UWmhM8ylO9Z/30YAifVuG/BrRQ==
X-Google-Smtp-Source: AJdET5fd6Ak8LnYIZTmTLiUWQkzpPt2VdM1kigR9OO35gNyARjAjey0ihqVua4K4gaL4ztKryT4wkg==
X-Received: by 2002:a62:380e:: with SMTP id f14-v6mr4662628pfa.203.1542107860438;
        Tue, 13 Nov 2018 03:17:40 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.17.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:17:39 -0800 (PST)
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
Subject: [PATCH v4 08/26] drm/sun4i: sun6i_mipi_dsi: Fix VBP size calculation
Date:   Tue, 13 Nov 2018 16:46:15 +0530
Message-Id: <20181113111633.20189-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The horizontal and vertical back porch calculation in BSP
code is simply following the Linux drm comment diagram, in
include/drm/drm_modes.h which is

[hv]back porch = [hv]total - [hv]sync_end

BSP code form BPI-M64-bsp is calculating vertical back porch as
(from linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c)

timmings->ver_sync_time= panel_info->lcd_vspw;
timmings->ver_back_porch= panel_info->lcd_vbp-panel_info->lcd_vspw;

vbp = panel->lcd_vbp;
vspw = panel->lcd_vspw;
dsi_dev[sel]->dsi_basic_size0.bits.vbp = vbp-vspw;
dsi_dev[sel]->dsi_basic_size0.bits.vbp = panel->lcd_vbp - panel->lcd_vspw;
=>  timmings->ver_back_porch + panel_info->lcd_vspw - panel_info->lcd_vspw
=>  timmings->ver_back_porch
=>  mode->vtotal - mode->end

Which evatually same as mode->vtotal - mode->vsync_end so update the
same in SUN6I_DSI_BASIC_SIZE0_VBP

On the information note, existing SUN6I_DSI_BASIC_SIZE0_VSA is proper
value.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index cdd44a1307b3..eeea977604ac 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -526,8 +526,8 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
 	regmap_write(dsi->regs, SUN6I_DSI_BASIC_SIZE0_REG,
 		     SUN6I_DSI_BASIC_SIZE0_VSA(mode->vsync_end -
 					       mode->vsync_start) |
-		     SUN6I_DSI_BASIC_SIZE0_VBP(mode->vsync_start -
-					       mode->vdisplay));
+		     SUN6I_DSI_BASIC_SIZE0_VBP(mode->vtotal -
+					       mode->vsync_end));
 
 	regmap_write(dsi->regs, SUN6I_DSI_BASIC_SIZE1_REG,
 		     SUN6I_DSI_BASIC_SIZE1_VACT(mode->vdisplay) |
-- 
2.18.0.321.gffc6fa0e3

