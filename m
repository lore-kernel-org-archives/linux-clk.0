Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96442C282C5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:00:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6283821726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Af2f5X94"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732331AbfAXUAq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 15:00:46 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43784 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730650AbfAXUAk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 15:00:40 -0500
Received: by mail-pg1-f193.google.com with SMTP id v28so3120736pgk.10
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 12:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nTC/8lptSez4amD4f7Lu7tHja/dD9UCt2oa1EGJJvZM=;
        b=Af2f5X94ZBjtQ11n/A5b7Aw/KB8nKICv//dxt5sSlx4I30G3uZ6MUD5W24gW6+MyOb
         rXLTNErf6wqgAIJEmNvz2PDAjAElEvZT8X42vm/rfRayCsRNZqOCgsbY+OzFauuqps0M
         ANN2ieL0X6tqmqcDZCAxOPhg9KKfyz1DKM3Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nTC/8lptSez4amD4f7Lu7tHja/dD9UCt2oa1EGJJvZM=;
        b=ZLz1EIE4MLmkxhOAP3JqDCMjzReEmL+9Kjt5apSsQp8GCpgeOl3AdsuzIqk8+bujF+
         XPotnNbjuZe5whN5NzbCzpYaQSDOLmSo2yWm34TU9x5rM02riIYYYhXTksZ+j5fO2Buu
         gFVDpdwgmjfhwLvtV0P+xVEcm04qWO3I3pJwG2EzRHxBNkutSkMWpW/OY6o58QFyU3Bn
         NvG5F7RyUZjTUQR0fzuhztSCDdk43DN6XCopOLzX7+75bh872jCOVaW55Ssx402VHve/
         9wrVUfaypRsP+FIPzk8ffkWRwPxPH3uZHms9JKyP5MNHSoS9CEC0DtaO1c/jCBjBLN3W
         rLdw==
X-Gm-Message-State: AJcUukcOJgdI9Qod0SAtDp/k5NlsQA1eF2MMACv7gLEoBkGU9ZDyz/ZR
        r1Vk9aYAbDj5tlWYdH2BEVnCJg==
X-Google-Smtp-Source: ALg8bN5Vnh9E8n1JL6NCQVZJYWVrp5QTLTb669TJdzflI6wU5Y4q2w+OWRkRtXGBm23GM8DGZD7FNw==
X-Received: by 2002:a62:32c4:: with SMTP id y187mr8155312pfy.195.1548360039513;
        Thu, 24 Jan 2019 12:00:39 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.12.00.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 12:00:38 -0800 (PST)
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
Subject: [PATCH v6 15/22] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
Date:   Fri, 25 Jan 2019 01:28:53 +0530
Message-Id: <20190124195900.22620-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
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
index dbda2e567760..9c553637c72b 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
@@ -40,6 +40,7 @@ D-PHY
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun6i-a31-mipi-dphy
+    * "allwinner,sun50i-a64-mipi-dphy", "allwinner,sun6i-a31-mipi-dphy"
   - reg: base address and size of memory-mapped region
   - clocks: phandles to the clocks feeding the DSI encoder
     * bus: the DSI interface clock
-- 
2.18.0.321.gffc6fa0e3

