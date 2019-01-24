Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A032C282C6
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59EFB21726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:00:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eVLx2Scb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbfAXUAg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 15:00:36 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32859 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732358AbfAXUAd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 15:00:33 -0500
Received: by mail-pf1-f193.google.com with SMTP id c123so3552491pfb.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 12:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tfGb6WOVY/NDozRdyqo5VBI3IXqzYkAU2KTM1oN3JpM=;
        b=eVLx2Scb54qXLYKHQhAIy8GjghcY+WNLEcnq1+AwxpJbrX8t7UoCTNy9dWt9tXhIYC
         gu059x4BEqGJQn8NorjkQMj23JRjWw+JCt3C2VXhPiRDDdJaCUGQQkk+9IaSd+gWT2js
         d7DZW1hYeQ+yJT5ibGVIxU0TAYY8+uKGnvd1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tfGb6WOVY/NDozRdyqo5VBI3IXqzYkAU2KTM1oN3JpM=;
        b=lLBBj3cYxHLqg9v9BMZ+68iJky6mWL+TGBeanQ5SesBQHF0t4oQ68TpFn9agbC2r2D
         VJ+LyHaQWWDgjhBS92a9tbv/e0GWqvlnLiHVmBS3mJ9aNuJHAO5KCm01ZMY5x4kdleWX
         laOYt4ua9KzMfedjvf6kcLlyBrXQNCkvW/iaKPVVCAnJJxAJNI02LSS/hegzDlHifsNK
         Fzw+fvYOSUBgLYP4yj48AdDC1ayvooUamvzBkEHDwxOtBYg+A66qy54lmjMfDzdnZReY
         3RwrrhN+GictFid45QYf947E8Qy9yDLZfFXrL3rXpju69IWCfQURFLoWRb3cIfiFTGt8
         s1kA==
X-Gm-Message-State: AJcUukcX6kMEnaxSrg9FCVa+RSf7CKXvaF3aUp1eP8DYiomNKWGyeLqA
        +u4Q814D+EdXeg87eLTbMLCuiw==
X-Google-Smtp-Source: ALg8bN5zmYWSAPZjYomfF7mFoGKlUGobeKyjO/hE41V45BdXSRRWP3tXd9FVoYY6eSB/NMn3NEw4Pg==
X-Received: by 2002:a63:5455:: with SMTP id e21mr7255476pgm.316.1548360033058;
        Thu, 24 Jan 2019 12:00:33 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.12.00.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 12:00:32 -0800 (PST)
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
Subject: [PATCH v6 14/22] dt-bindings: sun6i-dsi: Add A64 DSI compatible (w/ A31 fallback)
Date:   Fri, 25 Jan 2019 01:28:52 +0530
Message-Id: <20190124195900.22620-15-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MIPI DSI controller in Allwinner A64 is similar to A33.

But unlike A33, A64 doesn't have DSI_SCLK gating which eventually
set the mod clock rate for the controller.

So, use the DSI_DPHY gating for the similar purpose of mod clock
so-that the controller can operate properly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
index 69e233e8fad1..dbda2e567760 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
@@ -12,6 +12,7 @@ The DSI Encoder generates the DSI signal from the TCON's.
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun6i-a31-mipi-dsi
+    * "allwinner,sun50i-a64-mipi-dsi", "allwinner,sun6i-a31-mipi-dsi"
   - reg: base address and size of memory-mapped region
   - interrupts: interrupt associated to this IP
   - clocks: phandles to the clocks feeding the DSI encoder
-- 
2.18.0.321.gffc6fa0e3

