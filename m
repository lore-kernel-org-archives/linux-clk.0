Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11393C46475
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:52:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA656207DD
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lOWcmQ8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA656207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbeJXAQK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 20:16:10 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41771 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbeJXAQJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 20:16:09 -0400
Received: by mail-pg1-f194.google.com with SMTP id 23-v6so851758pgc.8
        for <linux-clk@vger.kernel.org>; Tue, 23 Oct 2018 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c+3tc5fDsnKkB4SijQdkcRb3OP0M7xi1nDtiQqxDBrQ=;
        b=lOWcmQ8EcxQ1zNZqPNGFKa3ZvQt0BCQOgcXpBRDvnICP+Wghvk4tidAbe+AoEX1/Yq
         FFSBuMrKyrpEAj1jMotreodQWeXq4P0QM3IoftPKkQZWFD9gaIp8REqlxFxg1vO1NmdJ
         PNaTbawGm6AMEklFGEyKhFzwpR8xHbUu9weAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c+3tc5fDsnKkB4SijQdkcRb3OP0M7xi1nDtiQqxDBrQ=;
        b=oR6owaMsZWBC3NTLmNdiGGUvgKCYcYPLAY+ijngrBW7mM/kKDNXMNJKaDIBt2+jCg2
         QWBsYutkcf+Z+apXZUtu5h61smyXuwutlOasMFtdfk7Hdl1K2eShYt1Ljy15sE8Z3BZu
         jekQKSkVQipKrlKfb6JT7+hKMrujW2eDSoi3KvvvjqNycmgtTM+8MBHKA+gFjfphV0Dm
         wOvZINY39pTjwfhBkwzWPLd+UGrgZN30SRSN2Q6RPByAKHLrq0QPasWy4g0WO4ve3ufr
         shh9l7DOH1qLY9+5NFhEkt2E6m1bISFYXigH3ruZw80XYQ7EFl2DUHLIoEyn9ENne4j8
         0ysA==
X-Gm-Message-State: ABuFfoj7/MkxqZnlmkJk3aldsmuW1F2mA17LVFu/3B19hnG0Y2PBMYK8
        AG9/kGdOBFamaTLvrN9qSiVEaA==
X-Google-Smtp-Source: ACcGV635CgQMU05qYAGT/fcH4+BfHcLJPnkEZ1RtWvUUr7SuZyeuyZR16pR1i+w874dVcuRfEuHLyA==
X-Received: by 2002:a63:4243:: with SMTP id p64-v6mr48080207pga.127.1540309932389;
        Tue, 23 Oct 2018 08:52:12 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id o75-v6sm7442829pfg.0.2018.10.23.08.52.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Oct 2018 08:52:11 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@free-electrons.com>,
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
Subject: [PATCH v2 13/15] dt-bindings: sun6i-dsi: Add compatible for A64 DPHY
Date:   Tue, 23 Oct 2018 21:20:33 +0530
Message-Id: <20181023155035.9101-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181023155035.9101-1-jagan@amarulasolutions.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MIPI DSI PHY HDMI controller on Allwinner A64 is similar
on the one on A31.

Add A64 compatible and append A31 compatible as fallback.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- new patch

 Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
index 9fa6e7a758ad..704fb31962f2 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
@@ -36,7 +36,7 @@ D-PHY
 
 Required properties:
   - compatible: value must be one of:
-    * allwinner,sun6i-a31-mipi-dphy
+    * "allwinner,sun50i-a64-mipi-dphy", "allwinner,sun6i-a31-mipi-dphy"
   - reg: base address and size of memory-mapped region
   - clocks: phandles to the clocks feeding the DSI encoder
     * bus: the DSI interface clock
-- 
2.18.0.321.gffc6fa0e3

