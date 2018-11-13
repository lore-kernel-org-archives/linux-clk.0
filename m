Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD4EC0044C
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A290D20685
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aSMmA108"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A290D20685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732525AbeKMVPN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:15:13 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35696 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732630AbeKMVPM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:15:12 -0500
Received: by mail-pf1-f194.google.com with SMTP id v9-v6so5885943pff.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0G2Cm6yl0hA4By0n3opJjvWD4CEYft0z/6JnEL+u5rs=;
        b=aSMmA1084sc9DatC+qE4VXG7awzpcfUKikd6oTWB7eyTrf9ODoQfuf5Etu96/qBcX+
         03cdvO1sw/9NzdFqX+8zsxaeFlk1p/LR1xaDuBsY93XKDyev69dUD3M20Adl0ZQDf0tn
         U+rNrxAt4RL65nJOm+HVo6d8qkSFnB/Wtqfow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0G2Cm6yl0hA4By0n3opJjvWD4CEYft0z/6JnEL+u5rs=;
        b=mPW0CtpLrEMYn/Z/Jn4OF2AckXAElrwhTmTspw6ArqpZlykSL4DZgonA0ii7WRI62A
         Z/VhhIyUR7FmHOsXA5/ufPGVV3nPQKmxGAhtKGe/FrE0GrDFgCrEWNMc/RIPq3KGmHCi
         HqWL9OPJF2OfRZER0sdAf8lXRt2nNeP/4ud2jyp3PDernNGEKXK7hiX1MEnsPu6zVKUV
         HOVeNLx2ptCX/WrK/O2DXk7kCS/DfQySVFYo1XAfImT8Q49T/MEtxwvYVoEkqNNig2QC
         /9sg7lENud9l6nTFqaKUrgW24c6SpQ8TaA5ysPrbnZrf+dEQFw5PX5KR8E7ukbEnntlE
         7ewg==
X-Gm-Message-State: AGRZ1gK0Bx/F3TjDm/4ZK2XWtxgTncGn0M+pUXI2Ci6705GxS+hHjV+j
        Cq7lzgbV+4nPX6Pr5PMv7cwMkA==
X-Google-Smtp-Source: AJdET5cDlT6XtMHcyOVsrWKniVoN+18C/4yHXDyddrOPtOPRhnF/dieOiDayun0A4sA6Bb/nn3JuPA==
X-Received: by 2002:a62:3101:: with SMTP id x1-v6mr4852009pfx.204.1542107854069;
        Tue, 13 Nov 2018 03:17:34 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.17.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:17:33 -0800 (PST)
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-amarula@amarulasolutions.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 07/26] drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short write 2 param transfer
Date:   Tue, 13 Nov 2018 16:46:14 +0530
Message-Id: <20181113111633.20189-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
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

