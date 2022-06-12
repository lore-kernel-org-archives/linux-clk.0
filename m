Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB690C43334
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbiFLTae (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234915AbiFLTaM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:12 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7905C42480
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:11 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id r1so3425188plo.10
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jYyuIzkRUZ/ETLXLEkF1edqBOnsRUFVhHuMnqcsR9Qs=;
        b=lXBMN4yL9tG8E5eDzs1gqAi/J40Rv2XEosqThocMSbyGQivFRAJWI45CbYoB4vMK8B
         iu5AyiXp8XGevTmk16J2ARicLVDg06Z86lWRLVNW8iRiMByjdVYyJeyJgQMlyh6GDaU7
         6vz42RzRueDjXxCwip7rHeyeQkvqpBv/SxfH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jYyuIzkRUZ/ETLXLEkF1edqBOnsRUFVhHuMnqcsR9Qs=;
        b=3tjt/FiUNV7H61j99RVepBbuZ35FvHmnoZvOiZ6tdgdiaQyv7RdI9EHAQogEaGdMML
         ADDYJjvk1Wm60Cr5mN0waiB9sm4L5QcGXDyGEVAJlpDqlKIfCbn0FKHw6TjnFCXvmeoP
         FCn8TeF4sy+Y1zI9QkOzTQuw/LXaSTikiSe44DGr/w8cvqAwB6MCWKOqkwGQPUYnEtiA
         r1ixa3NqfLGs5qYl6mlPgrrC5KCNrXijYcZam41lJwYC4//ZZtVtBAScsoq8+gTgeBT6
         kd/lCKXStC9+6L7lMX3OlXz6sZ8SUrdpIhDtZCCUeOd33VBM2KKOY26vw/lziuzt8Sym
         kcyQ==
X-Gm-Message-State: AOAM531GhupGRE7mFuzHj3tPb1rBBNEHmzJNfbPgHWN//evPcxrw+LuC
        tOl4zHExdsPih7RClQvYcZCZ5w==
X-Google-Smtp-Source: ABdhPJxmilQFpnr19n+NZ92iuTDCn8cjeBQBoehAKcO8xfKGUrEE+3EsZ2HApI2j4BOgzs4d/DUuMg==
X-Received: by 2002:a17:90b:287:b0:1e3:45c9:9a93 with SMTP id az7-20020a17090b028700b001e345c99a93mr11842774pjb.80.1655062210958;
        Sun, 12 Jun 2022 12:30:10 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:10 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 03/12] dt-bindings: marvell,pxa168: add clock ids for additional dividers
Date:   Sun, 12 Jun 2022 12:29:28 -0700
Message-Id: <20220612192937.162952-4-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds a few new clocks divided from PLL1 and CLK32 that are
potentially used by a few peripherals with muxed clocks.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 include/dt-bindings/clock/marvell,pxa168.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/marvell,pxa168.h b/include/dt-bindings/clock/marvell,pxa168.h
index db2b41f1b127..8686bc7bf7b6 100644
--- a/include/dt-bindings/clock/marvell,pxa168.h
+++ b/include/dt-bindings/clock/marvell,pxa168.h
@@ -20,8 +20,11 @@
 #define PXA168_CLK_PLL1_2_1_5		19
 #define PXA168_CLK_PLL1_3_16		20
 #define PXA168_CLK_PLL1_192		21
+#define PXA168_CLK_PLL1_2_1_10		22
+#define PXA168_CLK_PLL1_2_3_16		23
 #define PXA168_CLK_UART_PLL		27
 #define PXA168_CLK_USB_PLL		28
+#define PXA168_CLK_CLK32_2		50
 
 /* apb peripherals */
 #define PXA168_CLK_TWSI0		60
-- 
2.25.1

