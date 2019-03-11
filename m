Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0897C4360F
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 727B22087C
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lyfEr09b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfCKNh1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:37:27 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46708 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfCKNh0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 09:37:26 -0400
Received: by mail-pf1-f195.google.com with SMTP id s23so1615909pfe.13
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6wckgVcjU0hTcLberbqeJXR3An8TYASrxW/s4B8OxZU=;
        b=lyfEr09bGOqXzjjck6O/FzYRUS3RRZsGXHVfHpxs0wQQYzhAxvofdKaz41SR54j38n
         H5HUzqYLRmc4iiEYH+DVwPdt6bLjMTTD2SKa7cs/VF4FwKFHfklBBxKUhx02QuKlhQ1T
         93vjicGo4KTsRaFXstXtyiFaQUxW7QGZ0TvCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6wckgVcjU0hTcLberbqeJXR3An8TYASrxW/s4B8OxZU=;
        b=OdcPE49itr3yJhQVF6lEkcbF/7PyPYWMqJWgcNjldx464YaN5y0d3s0XaiHtC1wpv3
         aPXDuEvTlVx833OxThhdjC3yZL6oN1mt/O83q+axzHvez72ofgYc38YlvDXUYlHdQFrC
         2lJT7DlELsbh6ai0yTJPQcOvDQJRdjdDGMFNkO+b1JoXglNAxZbD/jkEcForpf7hbeOb
         ObOj3h/CucXB3+Z7KycRXGIlgXSGFuj2t7J/nRA4x55Wr0X4Atu5KCgC7dFfDe77MZLQ
         7GMd8wYIKZOEOQNXH1v7LwZ8iHYvmZnfC0m17Gs49eYUyaxJCeFHOPBJc7GOe4OTkX7O
         KGcQ==
X-Gm-Message-State: APjAAAV4B+/ab/CqTdZFASvirk1O7gTyYMtWMnVrSeKp9HgIh4Dh7VSu
        IRdG6uZnrb8zsNC1KS1xd2aptA==
X-Google-Smtp-Source: APXvYqyFmFPKFsY7HV959IgiWajMsjYgGW978PjdXK1xhbdXEvcELPjcnz0AXQdkcM55PBCwZ6LzDw==
X-Received: by 2002:a17:902:ba84:: with SMTP id k4mr34530252pls.103.1552311445782;
        Mon, 11 Mar 2019 06:37:25 -0700 (PDT)
Received: from localhost.localdomain ([183.82.224.199])
        by smtp.gmail.com with ESMTPSA id s79sm9960397pfa.61.2019.03.11.06.37.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:37:25 -0700 (PDT)
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
Subject: [PATCH v8 03/15] drm/sun4i: tcon: Export get tcon0 routine
Date:   Mon, 11 Mar 2019 19:06:25 +0530
Message-Id: <20190311133637.18334-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
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
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 3 ++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 339f9b1f5745..6cf9661807aa 100644
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

