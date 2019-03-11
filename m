Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B0BC10F06
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 381452087C
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MmxC2i8x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbfCKNhd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:37:33 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45022 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbfCKNhc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 09:37:32 -0400
Received: by mail-pg1-f196.google.com with SMTP id h34so504485pgh.11
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 06:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ptl+5hneR2t7UWZEtSZkUl01CD0BP2fXJcHeyJDA6xo=;
        b=MmxC2i8xC4jvR9E6pnxJ5Xd7UPRT+U+xQgAbDcTCAOIlbN4jx8nE4R9BNTWmFy0AiE
         ceFdtcoKUQEKHNEm/DjVSIasKsllnwpY9mY093tQjYm3ppxl6rXCnNgx/1DAjS28V/Nd
         JXfMefJdNcMuLo9G6RiHpSjKJpBoJIeJCtGcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ptl+5hneR2t7UWZEtSZkUl01CD0BP2fXJcHeyJDA6xo=;
        b=WlTf0Eg2VTTVUr32iS5/zJU0jnaBoZ6gyJ4B6lvB6SsSz2vob1C6NDe5pC41lyZcfm
         tJCVfQLqamSLmnVhHz/3J1CBjg0seU3md4ukv2s/ZAVUsL5xAjsGbqfTnKUFpDqJxa1y
         Kx4EeANIMs0pH2O7fuoklcNaICSgF+V/x8L4hWVTsdLSDTvj+UPe6PmkS5wsHZ7E3/bE
         CGgUBHV3oZUk3xEVFxuiHORcpPwGUG8qOdqBgHl2q/fjChdyZj0oO656QB3S1WGzZaVj
         0AJ32I8cNpJFp5jTUfZq7zTrorXeBkkDUCNtNN9Y77aNVlm6kqOethVP0YIa0VH4J+oL
         SO5Q==
X-Gm-Message-State: APjAAAXk3sHlEDWtFiF7j0mRMJEg/Oe8NTEghAW2VkI2KHymEhB7b693
        6U1ou5S4aBE4XMSjf7H2hk3/AQ==
X-Google-Smtp-Source: APXvYqzxjLw/ZIF991dQ/3orLt6X9ACHu9PJZ8Pvr3SGqkHTrPg6Dti2vfjibsATx1zVHP1gjKlsRw==
X-Received: by 2002:a65:44cb:: with SMTP id g11mr30386292pgs.29.1552311452012;
        Mon, 11 Mar 2019 06:37:32 -0700 (PDT)
Received: from localhost.localdomain ([183.82.224.199])
        by smtp.gmail.com with ESMTPSA id s79sm9960397pfa.61.2019.03.11.06.37.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:37:31 -0700 (PDT)
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
Subject: [PATCH v8 04/15] drm/sun4i: dsi: Probe tcon0 during dsi_bind
Date:   Mon, 11 Mar 2019 19:06:26 +0530
Message-Id: <20190311133637.18334-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
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
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 6 ++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 8d6292c0158b..a8d3df0ea8f5 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1045,6 +1045,7 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
+	struct sun4i_tcon *tcon0 = sun4i_get_tcon0(drm);
 	int ret;
 
 	if (!dsi->panel)
@@ -1052,6 +1053,11 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
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
index 5c3ad5be0690..20516f7ab179 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -28,6 +28,7 @@ struct sun6i_dsi {
 
 	struct device		*dev;
 	struct sun4i_drv	*drv;
+	struct sun4i_tcon	*tcon;
 	struct mipi_dsi_device	*device;
 	struct drm_panel	*panel;
 };
-- 
2.18.0.321.gffc6fa0e3

