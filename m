Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1013DC282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:01:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE4C821726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MzCBl01/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730989AbfAXUBE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 15:01:04 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33477 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730486AbfAXUA6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 15:00:58 -0500
Received: by mail-pl1-f196.google.com with SMTP id z23so3393468plo.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 12:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NM8sVvN3Te6g1rqXOdAqs2KSOeU1frtX72ddxyLNR30=;
        b=MzCBl01/KEWGjIvWEHBS8QjD6yS7sBjuX8vMC1wntVcgcKGdBBB6xfLjy62P7oXNGc
         ClR+2tbn6U1g2/wbTV4rignbYp91Q6e4q+1SEBY05XnGZfzPc1ZQdgQytM+d/B/78ZII
         v2R66+PdrttXkbBTjj9YJ5wHCZPspEmS8pdlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NM8sVvN3Te6g1rqXOdAqs2KSOeU1frtX72ddxyLNR30=;
        b=jJRa30lVbB53/yY2cmrm/belbP2aSO15yNSE9isonVli9WWfObbLTJzYeYBhoBtCIu
         Eu8r3TIi+ojlRZl46+CudkCLERH5uF/NlN7+ZMhGA5v+mSvh8FkddBnoR7DwNo5zJOcL
         iYqyipZoE7EnZSJacH744MBcNi2EMN4h9YgxR2PlqgzzMQsVKr8cg77LowIe5j1upO23
         fMcdHeURjy2u3vV/6lzrkatL7JCBoX3h7nqMxzTY0FSzsdOhU34bEVMAzyUjtFhORpLa
         BKswBpovl8ZPybd7O+UOsnfTcI2FGjr7VXIwlkRn/tI0QJyq2UgDPolYM6kaP0I1k67v
         byqQ==
X-Gm-Message-State: AJcUukdJHIt+uPYrmDN9tonguz7dRNgSQsr0d6atmdEJGml0uSDXCgmZ
        +4VhvPUzPVfN9enp3a8MnKtinA==
X-Google-Smtp-Source: ALg8bN4qeWnLZUxwNxKPUT5z6WnCfVKyW3VbHKtNjoOBm1gRK3mCVUtBVWmtP016p/gOy0jyHQd6dA==
X-Received: by 2002:a17:902:2969:: with SMTP id g96mr7811174plb.295.1548360058106;
        Thu, 24 Jan 2019 12:00:58 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.12.00.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 12:00:57 -0800 (PST)
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
Subject: [PATCH v6 18/22] drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short write 2 param transfer
Date:   Fri, 25 Jan 2019 01:28:56 +0530
Message-Id: <20190124195900.22620-19-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
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
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 9be414131460..58bda0928aef 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -983,6 +983,7 @@ static ssize_t sun6i_dsi_transfer(struct mipi_dsi_host *host,
 	switch (msg->type) {
 	case MIPI_DSI_DCS_SHORT_WRITE:
 	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
+	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
 		ret = sun6i_dsi_dcs_write_short(dsi, msg);
 		break;
 
-- 
2.18.0.321.gffc6fa0e3

