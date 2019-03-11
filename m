Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCF8C43381
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E8962147C
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aUQHXHHu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbfCKNiN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:38:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46824 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727557AbfCKNiM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 09:38:12 -0400
Received: by mail-pf1-f196.google.com with SMTP id s23so1617316pfe.13
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lLaXdMfskoRPTGZByJafsf5LDMgcrgF2xzpvJ4wAjTE=;
        b=aUQHXHHumq98rviMFe8QK1+rjAfzuUeNkuobadbtcqsO9opduWj/TMeOY7is7ydvmn
         wdBqPkee7jmLWszPW6qVPH5SLgfKWhHhXmZeZr2pdJQcoB7Ck/6sGxePm52xVVgGrs8W
         xEgrzRI+OJAxT5S2FExW4LOJLWyUIgu8ws9FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLaXdMfskoRPTGZByJafsf5LDMgcrgF2xzpvJ4wAjTE=;
        b=oMXXhooFgd2WgI8meCM+q+W3Yv9+IINMnXA/trhtNnt1tcwDg4Zm83DgrrdFAhGZ0+
         UesSOzRFliZ0LUZX298o78I/VAnjQoWDKJUNFUOM90KZMj7VZF39vMLzFv+JphCUoEES
         jzguNy3ruzQvEEDAqZ545pejaJlr7jtZWDWBUA8WPxC7jW1DHzoejQZO26Qt/Otbx4aX
         Av7jqwI+dzfgksl3iIeSKdQMYhuC7LustuEncPvHdfwBHhhsGGop/gSgvEcS1oXKQ+iP
         HyoEE5kaKhHuJF1XsfLZT1SqNjdfWw9DZZnFzu6hDYNzv17G9o4vShKFUFoUUxGrFn91
         Ycew==
X-Gm-Message-State: APjAAAV1kBmb8l4Bgi4ZSfDgKdr0FxDwJwiWkJ4gL6ITWRhrwCnWmj5e
        zb8jf5piItziHM+uDLJbqSa4vQ==
X-Google-Smtp-Source: APXvYqyaIfdcz7BrGilI/zcOJlSwWlwGFweg4DjPvmG2RM86KrZrIJB7rrPohyJkQ0QWKLm2BA0bmg==
X-Received: by 2002:a65:5108:: with SMTP id f8mr29993630pgq.441.1552311491700;
        Mon, 11 Mar 2019 06:38:11 -0700 (PDT)
Received: from localhost.localdomain ([183.82.224.199])
        by smtp.gmail.com with ESMTPSA id s79sm9960397pfa.61.2019.03.11.06.38.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:38:11 -0700 (PDT)
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
Subject: [PATCH v8 11/15] drm/sun4i: sun6i_mipi_dsi: Add Allwinner A64 MIPI DSI support
Date:   Mon, 11 Mar 2019 19:06:33 +0530
Message-Id: <20190311133637.18334-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MIPI DSI controller in Allwinner A64 is similar to A33.

But unlike A33, A64 doesn't have DSI_SCLK gating so add compatible
for Allwinner A64 with uninitialized has_mod_clk driver.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 2a63e96aaff9..0960b96b62cc 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1276,11 +1276,18 @@ static const struct sun6i_dsi_variant sun6i_a31_mipi_dsi = {
 	.has_mod_clk = true,
 };
 
+static const struct sun6i_dsi_variant sun50i_a64_mipi_dsi = {
+};
+
 static const struct of_device_id sun6i_dsi_of_table[] = {
 	{
 		.compatible = "allwinner,sun6i-a31-mipi-dsi",
 		.data = &sun6i_a31_mipi_dsi,
 	},
+	{
+		.compatible = "allwinner,sun50i-a64-mipi-dsi",
+		.data = &sun50i_a64_mipi_dsi,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dsi_of_table);
-- 
2.18.0.321.gffc6fa0e3

