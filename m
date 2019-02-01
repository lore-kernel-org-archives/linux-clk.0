Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69820C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38F2420855
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="T9xbKLou"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfBAPnG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:43:06 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33006 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729525AbfBAPnG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:43:06 -0500
Received: by mail-lf1-f66.google.com with SMTP id i26so5421150lfc.0
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LwL9AwGWtKYUFgkk+kHgF189NcSW5g0gFHkQNio/TBM=;
        b=T9xbKLou+YYzTb7vsInTFQ4hJHJKIgaD6jdrOH/x7BqslOkfMjcR80XTmg5zuTRnbH
         J379SJC1zUanC/pjMN1iSliblVoSm5UcZRiouZ9eDOGbt1SjF5LSd4f4Oj681beyenSb
         XpAnZoqJb/w5NkTjk0Z5e0Clfcn9p1iJB8nOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LwL9AwGWtKYUFgkk+kHgF189NcSW5g0gFHkQNio/TBM=;
        b=W5+UMCGhQus4cZpiz60guCmCUEvy5j2mubCNTrm//Se5QODD8WsyRNC3SWj5IImj9v
         Qp4q6yzsbCW5VXJoSn0yzEn29oo8Ec4VmzbuJuer3ghtWWK8ET6oIX3zMEfndEqUw/MT
         CpbTXWwb/SkRqJp5o3deSD91P33zMU5ScJPNAZBaJLp4V457KSbaYm7oEkX4FvOgokZX
         uYDogWBAV+lT924vGb7HyEVQyP7tcohxkSSt/1PY6UOwR6w/NH/5UncHKUcCr1fWOP5P
         cPF5ifR0B0+YcNspUDaHRuyfFOnKSBo/I5yk2uXq4MPVI00esutDSvTlF7wzoIwg0dr1
         l4lw==
X-Gm-Message-State: AJcUukdPKcbKq6LZrzA73NtWPTg26um8+F3oCY8HP56tnf5dnpc76Y5W
        WhfqoM+w8SL7WjKnJvK1n5FNpQ==
X-Google-Smtp-Source: ALg8bN7W0afO2/5f8oyYpC6gy6IJMm1inSnlPS3TXUKEJJL4w7yiydvNGX5mlUum3341zT/+a7DOFw==
X-Received: by 2002:ac2:42c5:: with SMTP id n5mr22488995lfl.115.1549035784118;
        Fri, 01 Feb 2019 07:43:04 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.43.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:43:03 -0800 (PST)
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
Subject: [PATCH v7 11/23] dt-bindings: sun6i-dsi: Add VCC-DSI supply property
Date:   Fri,  1 Feb 2019 21:12:20 +0530
Message-Id: <20190201154232.10505-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
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

