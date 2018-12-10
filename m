Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9572AC5CFFE
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:19:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58AE720672
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:19:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iUDo70yl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58AE720672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbeLJQRz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 11:17:55 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34018 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728550AbeLJQRz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 11:17:55 -0500
Received: by mail-wm1-f67.google.com with SMTP id y185so6989360wmd.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Dec 2018 08:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0G2Cm6yl0hA4By0n3opJjvWD4CEYft0z/6JnEL+u5rs=;
        b=iUDo70ylsxbw31KSTQNl5zLd47rgtT8gzDjZUFM2Uytf7J7H3BEaghRCvwtYg0Smek
         91cLB4+6QeyZXk1lRnruo/ODwDJBb2HRJEunozV+R27S0bDcVNJurGw/myGHdHQbF7iM
         g+c6gYO4UxF2sNQUpTrLdQLx1vYxqOd5Rc01M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0G2Cm6yl0hA4By0n3opJjvWD4CEYft0z/6JnEL+u5rs=;
        b=DABPYnvhiXesvJ6X0bE8lDNJUMdnfNRusgld4G0M3CYlUxjrmNRZ2jL2QkGYdEDpyD
         SKsrjZsRQSc6McG5kdjWCgP6xerKSIppH7lM8pS8XrFPiOI8WtcDTbi3g9bDhpdTXH+N
         h6AHARq3D9Ol3dDUN5H72l7OCWvjL5I3LoypI/FW0XActpHmNpMm87SzP2qwh9z8RLgQ
         yQv6VLHEU2nkTLqR8X3yv69QCnzzsag7JT76dJCWC+D7FjANhUNiQUKGWsTe15jA3mWj
         elWm2JqIGNkVDGIhVO+LYdaOw6nG8fvetS7/u8JPfzx3Gdb+i4l+fRkPGPVKSUdx3Ir2
         qFFg==
X-Gm-Message-State: AA+aEWaFdtnLKnqmy3I7qqkSkiWe593aNzsVOah4pbyh138SETe3FOaY
        zWPHt3I5KWpXbPuDDPVAcztPMkqMYhk=
X-Google-Smtp-Source: AFSGD/VgVCcVXfXR6IgQH8Ctvc2lTvygISQ8DSmGKfU4RYD/M85sJu1tV6MPzTuEmSwpAC8ZIb3/IQ==
X-Received: by 2002:a1c:990c:: with SMTP id b12mr11709720wme.106.1544458673231;
        Mon, 10 Dec 2018 08:17:53 -0800 (PST)
Received: from localhost.localdomain (ip-162-59.sn-213-198.clouditalia.com. [213.198.162.59])
        by smtp.gmail.com with ESMTPSA id b13sm8397503wrn.28.2018.12.10.08.17.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 08:17:52 -0800 (PST)
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
Subject: [PATCH v5 05/17] drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short write 2 param transfer
Date:   Mon, 10 Dec 2018 21:47:17 +0530
Message-Id: <20181210161729.29720-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181210161729.29720-1-jagan@amarulasolutions.com>
References: <20181210161729.29720-1-jagan@amarulasolutions.com>
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
index 50f535ae57e9..cdd44a1307b3 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -871,6 +871,7 @@ static ssize_t sun6i_dsi_transfer(struct mipi_dsi_host *host,
 	switch (msg->type) {
 	case MIPI_DSI_DCS_SHORT_WRITE:
 	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
+	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
 		ret = sun6i_dsi_dcs_write_short(dsi, msg);
 		break;
 
-- 
2.18.0.321.gffc6fa0e3

