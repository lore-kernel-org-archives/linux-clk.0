Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14B4C282DA
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C166E20855
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:46:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="E8nhCi+5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbfBAPoX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:44:23 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38952 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730708AbfBAPnJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:43:09 -0500
Received: by mail-lf1-f66.google.com with SMTP id n18so5376366lfh.6
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ckydVo2IPZQfXMKYGz1uqlUzm7n70fMIZ1xjq1PJknE=;
        b=E8nhCi+51LFS/kCsQ1K0KO5+96kzYaeX7hDXRUYltlI6GmQF3+G8oEy6e0xFYms18b
         vZRdpwrd1Ds1h5VfxOPgZFMabM7zq0/aRARe0iYvgzPEbJSk89y0exU+yNvSzCgj0q7d
         8dhqP53svf3j5DCMJccHQgTKYIx346UKMJg5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckydVo2IPZQfXMKYGz1uqlUzm7n70fMIZ1xjq1PJknE=;
        b=BcmFHwAVjdyhoFbLjJUD8/z8KErJQNnoojwXW3BReRUsXoYDNpgiI50JqCT947bBKu
         KfPf1f6oxT6wlOsD4KCZl0pjj8HUyO8GAimNLAOgdDC+VaXnxKSCy+E/LTJh6u9pR0iW
         2Azd0CFbyZS2HU4M2DGMq3NFHLm74SlUt8TUmMIIpCRRwPLCUCKm4bTh9Dz6pA6yQ4ju
         Xz3hssLEvgSwmW1HdrJV+ZNZlstFDfS5g9IIOB4Z8fRem8kEWNHO9iFDSILq9Q3eWOt7
         tz9DMNryX/YJYN/L6GcVXeTMPHVQnytltNYP2eKia1T6BCqfPxcZUbgP36kC3PIbPDoi
         Ui5Q==
X-Gm-Message-State: AHQUAuZ52RAdHPT1tQd/74lmgON9zfJXgi2TxIFPFFaehuEQsTGyDiW5
        hnHNRD44FIH7mULlP4jJZg8hew==
X-Google-Smtp-Source: AHgI3IZXZu3/LqaYemTmfQvJ+qkjvAYaHJ7++ebH1U4g7xMEGGgRaGFNyutXQx6O1Wipu4jnjxT0rg==
X-Received: by 2002:a19:c18d:: with SMTP id r135mr1692116lff.59.1549035787575;
        Fri, 01 Feb 2019 07:43:07 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.43.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:43:06 -0800 (PST)
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
Subject: [PATCH v7 13/23] dt-bindings: sun6i-dsi: Add A64 MIPI-DSI compatible
Date:   Fri,  1 Feb 2019 21:12:22 +0530
Message-Id: <20190201154232.10505-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MIPI DSI controller in Allwinner A64 is similar to A33.

But unlike A33, A64 doesn't have DSI_SCLK gating so it is valid
to with separate compatible for A64 on the same driver.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
index 1cc40663b7a2..9877398be69a 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
@@ -12,6 +12,7 @@ The DSI Encoder generates the DSI signal from the TCON's.
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun6i-a31-mipi-dsi
+    * allwinner,sun50i-a64-mipi-dsi
   - reg: base address and size of memory-mapped region
   - interrupts: interrupt associated to this IP
   - clocks: phandles to the clocks feeding the DSI encoder
-- 
2.18.0.321.gffc6fa0e3

