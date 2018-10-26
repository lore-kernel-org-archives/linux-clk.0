Return-Path: <SRS0=HxJ1=NG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0494AC6786E
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C183620868
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CXj6JMYz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C183620868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbeJZXWC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Oct 2018 19:22:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43280 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbeJZXWB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Oct 2018 19:22:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id h4-v6so654449pfi.10
        for <linux-clk@vger.kernel.org>; Fri, 26 Oct 2018 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9riTQ9ZUQloojan2IQ3yvqR1uY++RI/JA1qd1PVuxxo=;
        b=CXj6JMYzpt19nF8RCdog67DMukbYMr7N12u8gq6N357OOjnRvkhJqmGOFFVq0oAReO
         g1t2eAnpew4KnK+SLIYPDboFo6nJ8gSFI1o3jSBjHtKXOp/eCCrkhOXLh/5zr63QwlgO
         6QzbHMkUGB36l8yrLVxHydeH8kxpXCJOS/uFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9riTQ9ZUQloojan2IQ3yvqR1uY++RI/JA1qd1PVuxxo=;
        b=WWiW50fUvT3ul+jn5kkEyZRDXVbFooqwvoyaki2r2WfgjYpUDu/PiiiPl0L0ErRQ3t
         S9jBU8m5RXtmdDojMffpFnyGB6TDuENn5XuYuRSd7dxYpNpGAPO+HI4NRELhvIuoWtNp
         iqihag2iUR5no/UMT+Llpsln46jI0WbCZoQrtaCwKnfzj3vFJv3D7NcTf/HkstqPfB2j
         Vx9hz7dsm3tjXxdPVjhfHyWqNlBVpJSrfNLtyookqAxGMUnYPdL7/x/yxQJwFNBiVJEr
         VGxh1vNxnrUGWEqVkMixqdWX7SThN5w+cYSo0+M2M6LRqRhdmcUGvggPMbNRiX4jPFAX
         5mOA==
X-Gm-Message-State: AGRZ1gKZ9M7thX7a/7pNY3bEkv8JVTgsmFPT/vYiI2NMopnlYp9TZ4Gf
        iiFEg5BseroDvEaIWCxbO+pKEQ==
X-Google-Smtp-Source: AJdET5fIDV0oa38s49ddMH0fRlRTaZ6oYCU6o5Evm1+pJ+bzTzN2Uh6hDhktwHJ2s3QBgBuighWIiQ==
X-Received: by 2002:a63:1555:: with SMTP id 21-v6mr3681066pgv.383.1540565080777;
        Fri, 26 Oct 2018 07:44:40 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id z22-v6sm12044467pgv.24.2018.10.26.07.44.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 07:44:40 -0700 (PDT)
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
Subject: [PATCH v3 05/25] dt-bindings: sun6i-dsi: Add compatible for A64 MIPI DSI
Date:   Fri, 26 Oct 2018 20:13:24 +0530
Message-Id: <20181026144344.27778-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181026144344.27778-1-jagan@amarulasolutions.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
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
Tested-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- add tested credit
Changes for v2:
- none

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

