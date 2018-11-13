Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37784C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F205F20685
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Lp6RzImk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F205F20685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732459AbeKMVPG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:15:06 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38384 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732585AbeKMVPG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:15:06 -0500
Received: by mail-pl1-f195.google.com with SMTP id p4-v6so5852267plo.5
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/FobAdk1F/zKxxqm1vIJo/CC8EUNzQ/B2arqE/fLkis=;
        b=Lp6RzImk9zFDdByGIZQ22YEdQrE7uHU0DNLy4iGOCKR/rj7ThaKZsH/7WW5KOXEOnc
         0uQom4DLJkIv4V+lflKspqub1Q9MD8DWs/lJmXtUb0AgySySGt8z/uR3H6pe5HNqHdiy
         ZUgFnTxQoVQDMjSRjgpzALwURivXeucMmPjAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FobAdk1F/zKxxqm1vIJo/CC8EUNzQ/B2arqE/fLkis=;
        b=pvN72BBxBhb0qRpc8kB1HOa36z7YzXvno4SuE6/3l5S/4lnGb4liT/5Xd5UszxBrpR
         QWXT+nRhYxDoM9ZuNyjQ0i87AfAPx+qdOzAxOsJqNJBE4YwhEYhCRECapqz5td6EyYpH
         j7/xwHLA3R8+prVIUc6FZz7lkT70q5zA65iK2VOJGg2Fwo4VSYK0mUAWGNsavNNQPh/G
         2kUcxvG/McSZd1UK8R+YKZ/4p+agxbQkDNa9Gbm0Jjkrdd6cBPIiq7+cXX7Rq00/GAnv
         LMNx0MOkgdhctsTpcrXWVamzELbQUdMDl6ztljbqKe2XJdUGUaAWj7ifUFOxPYaDRFfQ
         S//Q==
X-Gm-Message-State: AGRZ1gJxopoz/FkfIIB/PDFdDezQTurHFHDIZgNXR3UUbJGmJDExIWcP
        VCeQVcCHDShDKJKC5gF8MUGQ+g==
X-Google-Smtp-Source: AJdET5fTaQ+FfQnyD51qgCEnp5Y3G48fpwTUV2horBazemheZqC9R97OWEihi14MAuMxJDHR4WTFeA==
X-Received: by 2002:a17:902:c5:: with SMTP id a63-v6mr4683490pla.201.1542107847654;
        Tue, 13 Nov 2018 03:17:27 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.17.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:17:27 -0800 (PST)
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
Subject: [PATCH v4 06/26] dt-bindings: sun6i-dsi: Add compatible for A64 MIPI DSI
Date:   Tue, 13 Nov 2018 16:46:13 +0530
Message-Id: <20181113111633.20189-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MIPI DSI controller on Allwinner A64 is similar to
Allwinner A31 without support of DSI mod clock.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
index 6a6cf5de08b0..9fa6e7a758ad 100644
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

