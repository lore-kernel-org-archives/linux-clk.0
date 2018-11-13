Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4083BC43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 12:15:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B81D3224E0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 12:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lnXEP2gP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B81D3224E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732766AbeKMWNp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 17:13:45 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41915 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732675AbeKMWNp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 17:13:45 -0500
Received: by mail-pl1-f195.google.com with SMTP id p16-v6so5916653plr.8
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 04:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S3DG26x2ZzBe5sEydH2iew8fE0iU1Xab92LGdzXFxh8=;
        b=lnXEP2gPlf5x7Ayqp7+PcrjUV3IuWTgquiLNWfMlkeLYytIe7a/ZFj13sepwHTCI6d
         ajuIXvNfCjzhhDAZ0Tz3oFyCyrvx4hlUxADkFqjpZABKp3juw11NbDqCaDObP0Exs8QU
         d41nlaT2jfLphXjP1Rry2aeWe7QzNZcuPpCXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S3DG26x2ZzBe5sEydH2iew8fE0iU1Xab92LGdzXFxh8=;
        b=LduSnULCH4/d4dR0WR4D+IVNTb/XMvWyYfcxaRynKEdmRr5DdXMaXzVFGEXgdccnoa
         fV7E06aCg70kCDBM6/VxcLwSg/9y0w8UAalBAWNUETd48T7l1MIboc0iDQPYWiGhNiZe
         zD2THvlZu8cfErn20pkQu6VXWKO38VQ7ORYveKC1C7mycN4agnm3C+x8ADYgKAepvsjN
         Oa+8oQDHg6lVvMb2rP9EfJKQ9Sq2C2GZ8PXV48kHIprS8T8IVzkpqypPXqMQJuXMxHIb
         jY6gj/CAW60aoACBVCQ74HigY/2Fsk3ujmD9RjaXUKUieJT+dHU6uGSImvcFMbQ9Tl5k
         ksvA==
X-Gm-Message-State: AGRZ1gJ5ZRLwGSUgUQK47XihbIP5Qpw+30BLr0nxX75OFKdWfviM1Sf1
        GVkNWnt7wQBwMkxaKF2bSwiWtA==
X-Google-Smtp-Source: AJdET5d6Jeix63qVc1m1vM2Vm+VgMztjxybqE61XkEhpipUpd3rh+6NfKzaZPOPRLd7quDrlw9qKeQ==
X-Received: by 2002:a17:902:4623:: with SMTP id o32-v6mr4849659pld.187.1542111352633;
        Tue, 13 Nov 2018 04:15:52 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id g65sm14312614pfa.63.2018.11.13.04.15.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 04:15:52 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-amarula@amarulasolutions.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v6 1/4] clk: sunxi-ng: Enable DE2_CCU for SUN8I and SUN50I
Date:   Tue, 13 Nov 2018 17:45:32 +0530
Message-Id: <20181113121535.24137-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allwinner SoC like SUN8I and SUN50I has DE2 CCU so enable them
as default.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- droped "depends on" since the CCU select based on MACH defined. 
Changes for v5:
- remove DRM dependency
Changes for v4, v3:
- none
Changes for v2:
- Enable for MACH_SUN8I

 drivers/clk/sunxi-ng/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 826674d090fd..abbd518833b5 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -63,6 +63,7 @@ config SUN8I_V3S_CCU
 
 config SUN8I_DE2_CCU
 	bool "Support for the Allwinner SoCs DE2 CCU"
+	default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
 
 config SUN8I_R40_CCU
 	bool "Support for the Allwinner R40 CCU"
-- 
2.18.0.321.gffc6fa0e3

