Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18321C67863
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:51:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D57E320652
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SKwRUoCu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57E320652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbeJXAPf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 20:15:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36299 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbeJXAPf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 20:15:35 -0400
Received: by mail-pg1-f195.google.com with SMTP id l6-v6so862262pgp.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Oct 2018 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NlgASVRlNX+ALqEjtYF3sm1E5YI3hOJ6Lz3xqdNlUFw=;
        b=SKwRUoCuPWk11pAUkiNGBqeHeZLkKJh618KwzDJ01LmNIlq42ZYy9LxDrkddubq3oX
         TykXJjlDB1+v7EXF+wDHX195vHqLDEbE5MMOBEr6FhlJKoxW95DEqF1H8dms2/6rBR6+
         F3r9ZLjTCJ/R7HwpG4SNwurOdH4RePqcSTYiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NlgASVRlNX+ALqEjtYF3sm1E5YI3hOJ6Lz3xqdNlUFw=;
        b=B9zykSM7KSIB8Ea+eBBKh5WHE4uYYSp81ilvUJOOAw4lupIvWA8S9vUYNy4UgGCOqN
         j+7SU5R95+0wDwNsSEV/DM87q5BrmEOfC38xGIlCEFsFuXBVck0bdsk0Ora5smKD3O6j
         wd7dY5g7XUYkwH+1BfQjU3SBDrQf5u5fPgKdSRe6JaOocZc5FCKsNHZAIBoWGaJboUxy
         9f15lK+HlaD+xnTCqqCVbYePRE0t5pNHyWSsM5MGiihf7kODYAoGk50X2RSpVjux223a
         +24bd8tEIS0cXSkimx2CytSMwSfj/LZptCPDHG1u+P2VCg0UeEgTENVpQM2tRiY64tp9
         tHWA==
X-Gm-Message-State: AGRZ1gIKYBbbRzUyOjo1qX2eXrtvf5va0fReLvry0EJnEI1SGNI1oc21
        XOCpq1G/uMu+L11wocnsM5X6ibqjUbw=
X-Google-Smtp-Source: AJdET5czfKeMo4WdpKorjXN7oSgKMFLettza7vTigo3eYGZAoObGBmiWE8R1oWBnJQRj2vkFeHCspQ==
X-Received: by 2002:a63:734e:: with SMTP id d14-v6mr9580018pgn.397.1540309898443;
        Tue, 23 Oct 2018 08:51:38 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id o75-v6sm7442829pfg.0.2018.10.23.08.51.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Oct 2018 08:51:37 -0700 (PDT)
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
Subject: [PATCH v2 07/15] drm/sun4i: sun6i_mipi_dsi: Fix VBP size calculation
Date:   Tue, 23 Oct 2018 21:20:27 +0530
Message-Id: <20181023155035.9101-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181023155035.9101-1-jagan@amarulasolutions.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

According to horizontal and vertical timings are defined
per the diagram from include/drm/drm_modes.h

Back porch = [hv]total - [hv]sync_end

So, update SUN6I_DSI_BASIC_SIZE0_VBP calculation as
mode->vtotal - mode->vsync_end

Horizontal or Vertical back porch calculation in BSP code
is simply following the Linux drm comment diagram from
include/drm/drm_modes.h which is

[hv]back porch = [hv]total - [hv]sync_end

BSP code form BPI-M64-bsp is calculating as vertical back porch as
in linux-sunxi/drivers/video/sunxi/disp2/disp/de/disp_lcd.c

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
Changes for v2:
- Add detailed commit message

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

