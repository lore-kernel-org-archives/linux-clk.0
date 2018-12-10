Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCEAC04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C523320672
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mN9suXNq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C523320672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbeLJQTH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 11:19:07 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34618 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbeLJQR4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 11:17:56 -0500
Received: by mail-wr1-f68.google.com with SMTP id j2so11124806wrw.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Dec 2018 08:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1E70xeoJgFDlzIA3oUYjw8e22CRq5X3bSrjLQMHtvYQ=;
        b=mN9suXNqQg3s1ivOE+Oyt4ThILfe2dCniMwRaX4g401CTmR6aZfqEKhAxLoY1X/IWq
         cc+mzAdvuSgJUStOEfys0Wv2XXVEMBbeHqM5DCC/fL8MBY8mzA9L4B1q3bZI0upLJ2SJ
         BNIgEDmTCD2lkiXC1HXq13almmLQNHmLuT6J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1E70xeoJgFDlzIA3oUYjw8e22CRq5X3bSrjLQMHtvYQ=;
        b=Sr8vjDhUiXs7pgUOupOrJIUiqW1biiqJsFFcX3EHA/UFYTz5hNc1FcluQqO4p3ah3l
         ENx0To+0zonv4/4/xLaPjR7NydSP3Xlpby8bvuYYPcw36FF679Z4JhxDLfi07Qa6JWQU
         oc2IlNP9h6f36B9FZZxNepSNqAMOGUgqLV+D2gi8teCa7gYZZjExcScilTjHl69bhMYf
         1RG/KfNevWRMNCye6Czl/oJoNVR+EXF4Yaymrwc2an8XXzG+5bz1AIqA3MwCLmYIZm8A
         yMj/Z8Y0iZjinKI47JZGKv4cmAkfqySL5pruda/OSAFTrfydiLvecpNZYn5yUC+YBhJb
         KLdg==
X-Gm-Message-State: AA+aEWYwk63GgFkl0mZDyV+kvOcpZhMibQP6ui1gica1vVjAWYIGhEQR
        RGvn3+RbuVnpKtxtU4sEB6EDVw==
X-Google-Smtp-Source: AFSGD/V0RE8LG+FIsAjtBoW76+Ltv5cDn/pbtTDZAbRKucmXo2LBvuD0aJheiCDGz4F9Ll+4+gLGFA==
X-Received: by 2002:adf:9361:: with SMTP id 88mr9946323wro.204.1544458674818;
        Mon, 10 Dec 2018 08:17:54 -0800 (PST)
Received: from localhost.localdomain (ip-162-59.sn-213-198.clouditalia.com. [213.198.162.59])
        by smtp.gmail.com with ESMTPSA id b13sm8397503wrn.28.2018.12.10.08.17.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 08:17:54 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v5 06/17] drm/sun4i: sun6i_mipi_dsi: Fix TCON DRQ set bits
Date:   Mon, 10 Dec 2018 21:47:18 +0530
Message-Id: <20181210161729.29720-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181210161729.29720-1-jagan@amarulasolutions.com>
References: <20181210161729.29720-1-jagan@amarulasolutions.com>
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
index cdd44a1307b3..c9b0222ebcd4 100644
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

