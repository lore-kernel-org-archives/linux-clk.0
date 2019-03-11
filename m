Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85770C4360F
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 533EE2147A
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FXSnlxHg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbfCKNh4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:37:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36911 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbfCKNhz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 09:37:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id s22so3728835pfh.4
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/HOJUJPmu0DEDj06ebaN852o3ZXmTIE5qbyIrE/4RCQ=;
        b=FXSnlxHgR/qYHZVhxw406BUzlv7bcz92Z3LtRp9Bv6FgDIVzeFtOKpJvQ7Orugp7E2
         JN1RJg0Rjwcd/FSyt496oCrqqCWTjxW5pJJl5BapBV4vwLP1jOJnRffu34e/YlfVAprf
         Udn3yw076GrUrSafZtRts/oma2a9n9Jd1g6QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HOJUJPmu0DEDj06ebaN852o3ZXmTIE5qbyIrE/4RCQ=;
        b=BsXLa8REB+YdlnEautSwDZy6IythI4IkNjvVDfYFpKsqbut4xU769vbalyxZk3NKl2
         Dn4DirDRG022EU+vXzzl3LoNFyrUKgGxbKF3rv22rs4zEwfbbIVuoaHCYlDRSmb38PM6
         Sx0SzaeexSiSzoj6ZSCY5RLaY1z/t1Dy+uXxBQbFmDb35N7uvMEZZhVAHEYmPXAG1MAL
         pmwjm5JSNEAw8EkbSyYSuakyWzFogJU59X29/8PAYF/uUiEFoBd95eSqTnMV0h9c+vog
         08cWBLCJxWV3jIuXJbxpN9OAvNRaL7MdtR9Mn8K6ebXrz10ESbAmEWtN+iDRDjwJgH2T
         5dDA==
X-Gm-Message-State: APjAAAVHqEquBMybogSAAuSImI7fnfyGpXsJdR2Ihx+XPZtevZo6wYaL
        fvPvmSOQAhg51nsXBC5/67a66w==
X-Google-Smtp-Source: APXvYqzvcoJ5TkwPI8PFUuqJq5Yih1x64/56VkVo4c2Tp3wVqBG2QZs7s+o3udGRfgnBeqvKxzuJFQ==
X-Received: by 2002:a17:902:f24:: with SMTP id 33mr33075713ply.47.1552311474577;
        Mon, 11 Mar 2019 06:37:54 -0700 (PDT)
Received: from localhost.localdomain ([183.82.224.199])
        by smtp.gmail.com with ESMTPSA id s79sm9960397pfa.61.2019.03.11.06.37.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:37:53 -0700 (PDT)
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
Subject: [PATCH v8 08/15] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
Date:   Mon, 11 Mar 2019 19:06:30 +0530
Message-Id: <20190311133637.18334-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MIPI DSI PHY controller on Allwinner A64 is similar
on the one on A31.

Add A64 compatible and append A31 compatible as fallback.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
index 9877398be69a..d0ce51fea103 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
@@ -38,6 +38,7 @@ D-PHY
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun6i-a31-mipi-dphy
+    * allwinner,sun50i-a64-mipi-dphy, allwinner,sun6i-a31-mipi-dphy
   - reg: base address and size of memory-mapped region
   - clocks: phandles to the clocks feeding the DSI encoder
     * bus: the DSI interface clock
-- 
2.18.0.321.gffc6fa0e3

