Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3AAC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 21:41:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFF2C213F2
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 21:41:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JKl9rSLE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfCSVlv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 17:41:51 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54915 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfCSVlv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 17:41:51 -0400
Received: by mail-wm1-f65.google.com with SMTP id f3so18609268wmj.4;
        Tue, 19 Mar 2019 14:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NP0o+Dum7qIR8HK+czqLfsIjPpZypc6hUmbpXm6PNGs=;
        b=JKl9rSLEEpaTTjhsFU6kZmcJ7Ch6FBKrgo9rUwHRFds04Qsg8XTgiMbD85bRZRZcrx
         y4KXFDRPA5wgvfME+qL0/0TIjmZB4pSJwNQIcpjU7pUgGAiMM71+7foQonLZkMWtA6ce
         OKj28fAdBjxC4+FzEDqTlXYc7FSdROFkd3PaRaoDgcgWA0mAAwSUIV2L242Acac5lQuu
         eawkSonUnLp1L+2aOGOA1vHpos5wlEi7MhDCmhFkjP3WQ9m/Z8+X9kHCaRJG19wFlb5q
         XLYUYMDq6+6m8WmN1mdnPnRWwCdTFK3wEfREvDY47BPu2H0GKU4M5zmHNBSN2RbJsc4s
         jf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NP0o+Dum7qIR8HK+czqLfsIjPpZypc6hUmbpXm6PNGs=;
        b=GkW+Y0wq4x0z0EAV8wD0CKxs+NkZO+WOBBiiOXU668/3RVq0DwaV3HcqbLMkSg5UcX
         VFVHKoHo4Wk8W0sD3VXQXUC8SX/wbOZdliYvTgtrReS2dLAdMHEDWwesM8mN/PMU2xIu
         enGs+HayK1LFwGYoo8NEwdpBupFNEA06bkuBAwxSWrrKedCT7QMqd4n1+u7RCgnPsSOr
         GpDzpT+Is+JtfH94uRhtLEH5+8IBp/srkIg9eXxlio+vvMq5/NAK4ysOArrOk6qxpnnO
         FJKoGBQ/dJns6/WgIc7KugR8h5Ssuvfs0WheRb7LqJbpC3YuDAC9srbHu+/6P4T5UIP3
         qnmA==
X-Gm-Message-State: APjAAAWHjj4ukFK8AojYTZIaU+85psjF90Rnm+OdqKlwgirwzuHgLQze
        paedCbzdsCWexaw36H54/BA=
X-Google-Smtp-Source: APXvYqw7v8Q8khQjqT8vHFS7ndZ/FDmwtdtQOPCznB5+H6GlaDj4BsFkQxvOqwv9vFhtaVW3PJoJKA==
X-Received: by 2002:a1c:1c5:: with SMTP id 188mr1740165wmb.52.1553031709284;
        Tue, 19 Mar 2019 14:41:49 -0700 (PDT)
Received: from blackbox.darklights.net (p200300DCD739990039EE738515149D3E.dip0.t-ipconnect.de. [2003:dc:d739:9900:39ee:7385:1514:9d3e])
        by smtp.googlemail.com with ESMTPSA id n19sm139675wmk.35.2019.03.19.14.41.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 14:41:48 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     narmstrong@baylibre.com, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/1] dt-bindings: clock: meson8b: drop the "ABP" clock definition
Date:   Tue, 19 Mar 2019 22:41:23 +0100
Message-Id: <20190319214123.27219-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post
dividers") added a new clock ID "CLKID_ABP" which contains a typo. This
was fixed by adding a new (typo-free) #define CLKID_APB in
commit 40d08f774c17ad ("dt-bindings: clock: meson8b: add APB clock
definition").
Now that the new #define is used by the driver we can remove the old
one (because the old one is not used anywhere).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 8067077a62ca..cd11628f50f8 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -103,7 +103,6 @@
 #define CLKID_MPLL1		94
 #define CLKID_MPLL2		95
 #define CLKID_NAND_CLK		112
-#define CLKID_ABP		124
 #define CLKID_APB		124
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
-- 
2.21.0

