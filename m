Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EBAC282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9511921726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TCD0TRN3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729830AbfAXT7r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 14:59:47 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34483 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731544AbfAXT7q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 14:59:46 -0500
Received: by mail-pl1-f194.google.com with SMTP id w4so3393477plz.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 11:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkDBLnbNod31G2yEaFX2CmKKS0jTQnqrj15H3QWvn9U=;
        b=TCD0TRN38afPd8Zhe1O+pYkOUH9l5R+moib5iY6n5hpyBrxb53upzWLLGzkDYl8E+I
         gTUUj61LciP1lsUReMlCJjvy9FiZefnOeCTMzcBQ0IwfE1S/WNJFNnF0RLMGmBVLhm1Y
         /4rXYrgXjGbn0Kg6zLVn52zjLpm0bhHsidHbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkDBLnbNod31G2yEaFX2CmKKS0jTQnqrj15H3QWvn9U=;
        b=HYMXvdYbg2xhXiyZPCNaHuCuLW1UuhvDtJCgpigWdxLm24U4UAUqcWHBkUJHlZWKdc
         6y3GZxyl0TW7IMLXPcKhmi0GB4K7Uu8UeNyFzvrJ5miuUw8PSdg+0p+cQDODsz8RvfCp
         +YfyXR8kBMHGcmxn3Wn7yJDyEHD9fytGSK4xm/Q1xCnox/LGYs6xFXtc5gsJMWEQdwRy
         65cFp15OrWeb20cnSB9fb05ljo17MkY7+aXeaxTc0jvqEu8PDp39oLK3OhpjE48b+pdb
         GVTZwfU3GFZveG4LLlcWTd1qsmL6Ad6qaxskQRd1w3W1I92ujAr6RdHG3S55OYl+qtxL
         P41w==
X-Gm-Message-State: AJcUukcy8aaeLVp4sXbqoJv0Ds5wEYQLZv1DZ63l1BYipjAEcnORf+bW
        1OEY+YZ9G/kKn0lqJoxGWAnMGA==
X-Google-Smtp-Source: ALg8bN4QkLSV0WFm3xl4VI9OHOoNMAnX0RC7j2nesGatXwzQg47Fp7+0f439shiK4E3EI2iSUdNhvw==
X-Received: by 2002:a17:902:28aa:: with SMTP id f39mr7941512plb.297.1548359986023;
        Thu, 24 Jan 2019 11:59:46 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.11.59.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 11:59:45 -0800 (PST)
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
Subject: [PATCH v6 05/22] drm/sun4i: tcon: Export get tcon0 routine
Date:   Fri, 25 Jan 2019 01:28:43 +0530
Message-Id: <20190124195900.22620-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sometimes tcon attributes like tcon divider, clock rate etc are needed
in interface drivers like DSI. So for such cases interface driver must
probe the respective tcon and get the attributes.

Since tcon0 probe is already available, via sun4i_get_tcon0 function,
export the same instead of probing tcon explicitly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 3 ++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 0420f5c978b9..3da75a0c5c5d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -221,7 +221,7 @@ EXPORT_SYMBOL(sun4i_tcon_enable_vblank);
  * are located in TCON0. This helper returns a pointer to TCON0's
  * sun4i_tcon structure, or NULL if not found.
  */
-static struct sun4i_tcon *sun4i_get_tcon0(struct drm_device *drm)
+struct sun4i_tcon *sun4i_get_tcon0(struct drm_device *drm)
 {
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun4i_tcon *tcon;
@@ -235,6 +235,7 @@ static struct sun4i_tcon *sun4i_get_tcon0(struct drm_device *drm)
 
 	return NULL;
 }
+EXPORT_SYMBOL(sun4i_get_tcon0);
 
 void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, int channel,
 			const struct drm_encoder *encoder)
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index b5214d71610f..a52696db14a5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -274,6 +274,7 @@ struct sun4i_tcon {
 struct drm_bridge *sun4i_tcon_find_bridge(struct device_node *node);
 struct drm_panel *sun4i_tcon_find_panel(struct device_node *node);
 
+struct sun4i_tcon *sun4i_get_tcon0(struct drm_device *drm);
 void sun4i_tcon_enable_vblank(struct sun4i_tcon *tcon, bool enable);
 void sun4i_tcon_mode_set(struct sun4i_tcon *tcon,
 			 const struct drm_encoder *encoder,
-- 
2.18.0.321.gffc6fa0e3

