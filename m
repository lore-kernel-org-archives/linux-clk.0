Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D752BC282DB
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A73A3218EA
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="a6XRj6mc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfBAPmx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:42:53 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34220 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbfBAPmv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:42:51 -0500
Received: by mail-lf1-f66.google.com with SMTP id p6so5415626lfc.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KSKVSjXuDqX8qVP7wbNkntCeAwoHR9UN0XE4gqIgPW0=;
        b=a6XRj6mcKzdddh9NgF8xjIWhC6Pxg3NCcHQ0ThD3sb6SPtVIm6gWJxvP3O998vZPbV
         uWHr31dWA4d384palxO0CBW1rzlT+uCPKakDnEjb5mQlbLhaAhcH3ZBEcA9OYgoczKGf
         cdp2PtfXGzhu9DkpSQ4GGc8Ng8RTWxxHN6QDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KSKVSjXuDqX8qVP7wbNkntCeAwoHR9UN0XE4gqIgPW0=;
        b=DQ6niM9gYzS8hakWore01QVN3C9IDtoD8FVOGMfCCb6a3NrsOFD1GKgbIl7KdZdDlF
         7Jwt4Rv5+JPYT1aC6W2YZHKj8CIN1VhlqQIKFziEbloMl96OJnkX0oLv5l+GIjzuR0Wk
         DXkwq1xICcy/V6nNqOpAQkFjmwWG0G2QCJT7TKJj7SnIKnh+aBqxupxFLOW1c1DDbOeu
         2MfFRO6DqoZFc03BBoN7K2AGOhs2evQ4DWgGCpMrLFEd6YBXciv8vN4ZoLeu7Yoj2doq
         P8JZGGU3pOT9Q3d9Ed10SopGRSc4GQcviymT2WCOaqAJKqVJOQo/fECdEXI15a4QdQRr
         BiTQ==
X-Gm-Message-State: AJcUukdMyDq67TCURSdI0zlRs2nPrcOOuPuJBYAZga/vdh/kTnEWHT9Y
        gznxaadZrYp49ghSQxKxQsVoYw==
X-Google-Smtp-Source: ALg8bN69BbOfJ2VajX52TeZC1kbyZ8eT25C4noLsYruftgcvouYiue/ElAIGOlEuYE0hTGFw+X3WtA==
X-Received: by 2002:a19:59c2:: with SMTP id n185mr30250576lfb.118.1549035768170;
        Fri, 01 Feb 2019 07:42:48 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.42.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:42:47 -0800 (PST)
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
Subject: [PATCH v7 02/23] drm/sun4i: sun6i_mipi_dsi: Support instruction loop selection
Date:   Fri,  1 Feb 2019 21:12:11 +0530
Message-Id: <20190201154232.10505-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Instruction loop selection would require before writing
loop number registers, so enable idle, LP11 bits on
loop selection register.

Reference code available in BSP (from linux-sunxi/
drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)

(dsi_dev[sel]->dsi_inst_loop_sel.dwval = 2<<(4*DSI_INST_ID_LP11) |
	3<<(4*DSI_INST_ID_DLY);

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index a5fcee750bee..813d5523f1c7 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -403,6 +403,9 @@ static void sun6i_dsi_setup_inst_loop(struct sun6i_dsi *dsi,
 {
 	u16 delay = sun6i_dsi_setup_inst_delay(dsi, mode);
 
+	regmap_write(dsi->regs, SUN6I_DSI_INST_LOOP_SEL_REG,
+		     DSI_INST_ID_HSC  << (4 * DSI_INST_ID_LP11) |
+		     DSI_INST_ID_HSD  << (4 * DSI_INST_ID_DLY));
 	regmap_write(dsi->regs, SUN6I_DSI_INST_LOOP_NUM_REG(0),
 		     SUN6I_DSI_INST_LOOP_NUM_N0(50 - 1) |
 		     SUN6I_DSI_INST_LOOP_NUM_N1(delay));
-- 
2.18.0.321.gffc6fa0e3

