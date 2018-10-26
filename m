Return-Path: <SRS0=HxJ1=NG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74AEC6786E
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:44:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CF0020651
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="S8p20kBy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CF0020651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbeJZXWN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Oct 2018 19:22:13 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40253 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbeJZXWM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Oct 2018 19:22:12 -0400
Received: by mail-pl1-f195.google.com with SMTP id b9-v6so616933pls.7
        for <linux-clk@vger.kernel.org>; Fri, 26 Oct 2018 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QcyEYMwNoNsH7/pEFnqDrYSAkVmaqVikL9S5nmhdtCc=;
        b=S8p20kByd5U672qL/qHhAOQAL21yOyWqvIAnM8dyfWgKF/juzSBhy8QtKdIDM/l5Lj
         eA85hKtx0/4H1xTPu+bjj2CR8raXV0waKdX7bLn+RuzE7W4hGHadtw39qbmWwnpWdaIp
         jAev7rxS5CfuWX7H8Go/8CYXXMnJCcbafE4bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QcyEYMwNoNsH7/pEFnqDrYSAkVmaqVikL9S5nmhdtCc=;
        b=XlKUy/v0i4xc78J2emXOpDvT00bAgjG15m6Dq5Cj7p4Acrn5dehmhsyASkfwLJyqz0
         4y8S9L0aIXgZ/Zlgr0EgGJvKS77z1hjZMZbs96aE9oPNPdQCPGFuBLu2KK+XQqUgQ6A1
         4GbxWPEbkab2o+tSSO0NE2XIwsPMUuNIwxcTZnDUexAV9wWAQ25LA5vpG/WbwfDn9yo6
         QzKlbaqfzfWvrx6m0i4UytjCKun6/yR9rxTYGMWiN8T5Fta2phIfRT/ppw4yQrLS3biz
         DqpwzSRgBR1as8JTAJq2/o5NUZNhJevPyrs7fr0FGaRWPvFTMlGysQCN8ZhMlmf2HPQt
         gg+A==
X-Gm-Message-State: AGRZ1gIGwm7TrLIW1CD3yXGaGwHD5FyJ7RAo5dwGYurIz1yoz4F05esn
        21NIMF31a7KG5pR4zFrQWs4tVQ==
X-Google-Smtp-Source: AJdET5fRX18D6J+W1oD9KGuQYtj3LLqpIcL390bKaD3qSxmQSYUA00Q2DovPP1eq0FzC/3b/8I13Cw==
X-Received: by 2002:a17:902:8c84:: with SMTP id t4-v6mr3862074plo.188.1540565091986;
        Fri, 26 Oct 2018 07:44:51 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id z22-v6sm12044467pgv.24.2018.10.26.07.44.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 07:44:51 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 07/25] drm/sun4i: sun6i_mipi_dsi: Fix VBP size calculation
Date:   Fri, 26 Oct 2018 20:13:26 +0530
Message-Id: <20181026144344.27778-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181026144344.27778-1-jagan@amarulasolutions.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
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
Tested-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- Fixed proper commit message
- add tested credit
Changes for v2:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index fc8560607147..3a1d48bc1996 100644
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

