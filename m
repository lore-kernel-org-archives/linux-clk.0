Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321B1C43381
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0322D2087C
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="knChio7a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfCKNho (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:37:44 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33141 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbfCKNho (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 09:37:44 -0400
Received: by mail-pf1-f194.google.com with SMTP id i19so3734245pfd.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LwL9AwGWtKYUFgkk+kHgF189NcSW5g0gFHkQNio/TBM=;
        b=knChio7a8E3cVF9gY6oKV7zce39i9wP/0UbX1yclniMsAb6k+WT2WqQ/MECAhS6qpe
         g0hADz/6Tnt/ONR3Px/YQdTPrxtnigpcULWd9JCPe38Nwek+2NJVXTkvRj9GKJt3diob
         ijaWwaKG4rXm/ELrFRBb7iXGhWz3FGl9wIyCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LwL9AwGWtKYUFgkk+kHgF189NcSW5g0gFHkQNio/TBM=;
        b=au5RS1WSX90N/AoNKlu0W57C1MDCat5NPe+iV5lY3WrTskYN0o+9MsdQIoAEd39+rq
         pmlo8Fvuhwa5EsZN+1Kg94dFCAviP+pjXc95DazbMIdR9AyfXCIhrYORWE2eU0raIHZP
         DdW4LQtvMUfLTJ9vJzv0hfbi7/uqIi3w98RZqPyjLPr2XQ40NLEX8+88HGFpUSC5+I1U
         lbtztwQxAsp4cSc3VAVGbt10qM/je1wZZl0QHgJxs6o0cmZehzkjaXGfV90nmbDUO0XL
         F7g+NkTQmnoZsT9IsLMRkoXemdSS5MR9JdQlZ8tUis6v6+HUXNwW1KFj9tn/nbon6o7C
         l0zA==
X-Gm-Message-State: APjAAAUoToCCwoll5Qkq4MNSDLCz3F0Q4AXl+mje5Wb3JOSco9+oyDte
        JkSBWA2deCiuvaC+9+ZFhCwjqw==
X-Google-Smtp-Source: APXvYqyfbA3ylDyMoL7eK8EdVlyMJjpbdPgT6dp78EMM7u9p19QZ21aradx6mL0N0lJCCOTLocF1NQ==
X-Received: by 2002:a63:3f48:: with SMTP id m69mr30353130pga.207.1552311463221;
        Mon, 11 Mar 2019 06:37:43 -0700 (PDT)
Received: from localhost.localdomain ([183.82.224.199])
        by smtp.gmail.com with ESMTPSA id s79sm9960397pfa.61.2019.03.11.06.37.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:37:42 -0700 (PDT)
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
Subject: [PATCH v8 06/15] dt-bindings: sun6i-dsi: Add VCC-DSI supply property
Date:   Mon, 11 Mar 2019 19:06:28 +0530
Message-Id: <20190311133637.18334-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allwinner MIPI DSI controllers are supplied with SoC DSI
power rails via VCC-DSI pin.

Some board still work without supplying this but give more
faith on datasheet and hardware schematics and document this
supply property in required property list.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
index 6a6cf5de08b0..1cc40663b7a2 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
@@ -21,6 +21,7 @@ Required properties:
   - phys: phandle to the D-PHY
   - phy-names: must be "dphy"
   - resets: phandle to the reset controller driving the encoder
+  - vcc-dsi-supply: the VCC-DSI power supply of the DSI encoder
 
   - ports: A ports node with endpoint definitions as defined in
     Documentation/devicetree/bindings/media/video-interfaces.txt. The
-- 
2.18.0.321.gffc6fa0e3

