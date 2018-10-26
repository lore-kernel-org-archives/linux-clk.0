Return-Path: <SRS0=HxJ1=NG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47435ECDE44
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D56A20868
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="V5YdT1/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D56A20868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbeJZXWH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Oct 2018 19:22:07 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35941 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727962AbeJZXWH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Oct 2018 19:22:07 -0400
Received: by mail-pg1-f193.google.com with SMTP id z17-v6so650778pgv.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Oct 2018 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cVRNMokL+W5QoyKoWUV5pE0kc2iWWL0MLvzndReDF1w=;
        b=V5YdT1/l3Yz1J970D4epM3oWJ2wjiQLWGohq3RBi3Ppq+eJLE1CRCHQOrYsh4U/VDq
         Z52ug+9VwZr+NmHpz3f6QIPib5DfU+z/j/GmZaOgZ3H07tP7SYt5HLfvxyJYdQNctPV1
         cMYu5Lak1vTDgYSQuyjDpJfjCTMfuprH2yyOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVRNMokL+W5QoyKoWUV5pE0kc2iWWL0MLvzndReDF1w=;
        b=eCZoijlW//aH6yFcMTGlUIbhjk+RwWpyPFOO/ntID0m0Nui+M3z3X1jy03275zPvZ+
         NFeCg4KXwPdSfZ2CXM0HJ7pHn4jbIjnwB+gwDsiPtB+uznp48DxUU2s2w5AJdMB6MPFL
         JuFbCbzV0/o7e2l6Y4imX+LM1AttRXCcsl+bOBRPIdQlpnpZCEATPh5EzJe36u0HrqEd
         1xgId+OtZI2VfkThewAZIfm1En2b9m3tSfDaSradvQzzge0rE8sCupXgRG+N8arBOOXP
         yXJ4wXZGIdUYSm+hzRLOXmLeioKv4d/QRMoIvtp0vzNgfdmczCZeiwNozi7OO5Rqv4t5
         XmCg==
X-Gm-Message-State: AGRZ1gKOmy2iAn3ITeFzCjXiJ2gBFz7iW3oS7FASAMf+G0u8QzGJDlAF
        qkujTuh1Ny3fgSLw7zD5dOgM2Q==
X-Google-Smtp-Source: AJdET5etpZ6TDNZrXZ5prFQGg/uyFIFNwVuKmkoddw6Y1yZkMR8kNgOj7/B1IDhcatC9qSq6ohWbYg==
X-Received: by 2002:a63:4f61:: with SMTP id p33-v6mr3749528pgl.71.1540565086365;
        Fri, 26 Oct 2018 07:44:46 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id z22-v6sm12044467pgv.24.2018.10.26.07.44.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 07:44:45 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 06/25] drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short write 2 param transfer
Date:   Fri, 26 Oct 2018 20:13:25 +0530
Message-Id: <20181026144344.27778-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181026144344.27778-1-jagan@amarulasolutions.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
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
Tested-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- add tested credit
Changes for v2:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 8e9c76febca2..fc8560607147 100644
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

