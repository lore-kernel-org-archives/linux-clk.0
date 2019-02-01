Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3333C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90A4D218F0
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fuSJpcZN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730738AbfBAPnM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:43:12 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43417 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730717AbfBAPnL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:43:11 -0500
Received: by mail-lf1-f65.google.com with SMTP id x201so4081485lff.10
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RkT9METwUUSf5QTEToG7HBPINV4tos+GivD1TLgNTbs=;
        b=fuSJpcZNCoygctJX7n5myqfviNkMrtTfal+KUTcqzhZTYZmOUvONI/NqQktM7dDAAz
         g88EPytgTbpF6fIHV9zFZMMFRWHYW7+O8+U2X7CM4EhFHOz8X4fJ2w+i5HWv2/JvzyL5
         lvVaORZInY6yDpy6pfIzCa/81v2xbhksnRNFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RkT9METwUUSf5QTEToG7HBPINV4tos+GivD1TLgNTbs=;
        b=GLGdASc7Eqh7LxGSllYwFnTGgJ8Tb2eShV9ymgY0QXSexQhrPjYl/pQnSavNPfeMMF
         whJjMMruYL/0hsZ8jM82AWyF43W1KVH7nkb2RNsQXQY7RUrKXpz5Fmf7+WcHvUqgywTr
         vfw7KUeP1l94Sz9ge/UNq6XOwa1cJEd1NtsTYhGPUKk0nN1XCyzhZo+3Veql/hmj7IFD
         0FHv+d3PIkv9s5+Fk2FIUqFxBNzuac/dYvEICIoSBwpGgrHFhyu6Ym04643IDXCsFsBI
         pdV0aTX7xSh/vYtMX2LbT8nIiVCrt2p4GqB5Fcy+CqSJjqOQYZJTbmtjmYNnoqF8ZBAl
         1PHQ==
X-Gm-Message-State: AJcUukfk9SEZrZ6UdYyjmNLCmKkycFYGSVV7X6uNM9AGJjMsJ9C8KaKy
        ixrPqtYuwgJSH2n0giu6OzaUCQ==
X-Google-Smtp-Source: ALg8bN7Kxw6Pf/EAOmaIxz8Mx9Obn9sKEf9HWZo8iulGMFl1o3mrN3mA3vv/zvG2r+/EChgFTcCU7w==
X-Received: by 2002:ac2:4116:: with SMTP id b22mr30132103lfi.19.1549035789216;
        Fri, 01 Feb 2019 07:43:09 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.43.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:43:08 -0800 (PST)
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
Subject: [PATCH v7 14/23] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
Date:   Fri,  1 Feb 2019 21:12:23 +0530
Message-Id: <20190201154232.10505-15-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
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
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
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

