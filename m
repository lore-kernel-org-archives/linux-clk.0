Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54153C282DB
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:43:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24E0A20855
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:43:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JobGz/n5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730788AbfBAPnU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:43:20 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42231 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730778AbfBAPnU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:43:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so6159956lja.9
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SlZdSxfBuDHFfxIddevdjQVhgEUV7gSx1dHVPI1InaA=;
        b=JobGz/n5O2PIfNMLcOY4LXUWKgthtj/6/kt6rgaBt7ceZJuH1doHiSi8Sxlx1qkAxE
         eYatjXNsn6RYSGBG3tqbyHdDNGAqu0rz8nJbY7elVAG5xYFBmu2LXYF1KQFX/XRjaocd
         CjgCFQmwmUxiDlbMNg2S8He1oShBKfyaKYKNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SlZdSxfBuDHFfxIddevdjQVhgEUV7gSx1dHVPI1InaA=;
        b=bRckbztl8HOwGgUWt+B4dA1a2xusfUAoASvd5vloLRrVy8gkD7c4ZWa70/gqifb2+T
         yUDLS7/wJPTd11j3d+YeYqow/cuUtZfToUxjIXS28RvLO6Oun9ZlwKMLqb65ptA4ng91
         xc+IoOOrQkBkT+DZ7ouPb5cLiko6ckooDWD8EKiBwCXAG7oyTRaKqErZ01Cl+lh0Isj1
         5WHV00ZOxrv1y2cX22uINVw/I/YFxeUASgjNPsXC7uv+QfbXUkOKRptXhMQljC2lkZ3p
         cC8AGj6Jh88tzLwS2EAC4OqOBMIL/GiStC1FvumZbHW2wZiXwLzAKi6LinIPxgmDziXp
         yjhw==
X-Gm-Message-State: AJcUukdJcG8EBXciM5YazuZ+ZcEef5TUuYjOl8WqtwN2u+43PtuhiOLI
        pq3s/73+0IKz+19Rwn1sTFGoMQ==
X-Google-Smtp-Source: ALg8bN7mYsorlikrfb8l+3cpdMLiswSisF1oFLlmJ0ydWjBcb4QtmAd6YG6o2C4/DXjHq4rlRbe7cw==
X-Received: by 2002:a2e:4299:: with SMTP id h25-v6mr32297109ljf.5.1549035797544;
        Fri, 01 Feb 2019 07:43:17 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.43.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:43:16 -0800 (PST)
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
Subject: [PATCH v7 19/23] drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short write 2 param transfer
Date:   Fri,  1 Feb 2019 21:12:28 +0530
Message-Id: <20190201154232.10505-20-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Short transfer write support for DCS and Generic transfer types
share similar way to process command sequence in DSI block so
add generic write 2 param transfer type macro so-that the panels
which are requesting similar transfer type may process properly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index a0697d78b915..09569938c20d 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -984,6 +984,7 @@ static ssize_t sun6i_dsi_transfer(struct mipi_dsi_host *host,
 	switch (msg->type) {
 	case MIPI_DSI_DCS_SHORT_WRITE:
 	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
+	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
 		ret = sun6i_dsi_dcs_write_short(dsi, msg);
 		break;
 
-- 
2.18.0.321.gffc6fa0e3

