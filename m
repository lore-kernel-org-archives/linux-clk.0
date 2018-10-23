Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD70AC67863
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F4AA20665
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ldbXb9NS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4AA20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbeJXAVp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 20:21:45 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46828 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728313AbeJXAVp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 20:21:45 -0400
Received: by mail-pl1-f194.google.com with SMTP id bb7-v6so821339plb.13
        for <linux-clk@vger.kernel.org>; Tue, 23 Oct 2018 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p3aFHpTKU3qefOsg4DLfdoXMokwXsPOj3/DyH66KHsQ=;
        b=ldbXb9NSJR/oBGl3iWn7edmu7K4HF556Hw+3Q+IwzUwE3FCFDrPgZ9fQBgxta2OrWV
         hXdbIVTCuADXIJif6Eddf9jHKg7jUuks+im6ISs/hYvchijHH9L+EeRDIcpaFx+kph7o
         0HXCH16UojRJIcqeUMobFlNCmu39Kj4lT1CUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p3aFHpTKU3qefOsg4DLfdoXMokwXsPOj3/DyH66KHsQ=;
        b=Inl68gDgRfteFSb3q4gPrVZwRNTrQnRNOxh2FpHcJmjd9BbKQFU9X74mP4nZFATTuD
         AbG15sIaGOuDko1InupBd0YtkPw/CC8G+yJtok6OWmQizyHOZsswEHW1OsuyCzMK2Y1J
         xR73z9ev0NEaVBsEUsVe1HsnUGuAeaHSi8ONTskU7Bcquals2bCNfXYQJYhmnR1v0h73
         BVJMgbXAVC2DPUxnI7nKC8IrPlIoVvcIl/7fRrILyuivoI26xiqnQxZa6rh2BvbPMzYM
         x9jgRsT+qlr2VVoNiFpA77cJA2WyU3u9nO0dWqH8Tt6BZEONpDuC/C3RLdp1c5bqizlI
         Haog==
X-Gm-Message-State: AGRZ1gLPT2gmXYPssWoddAoIh0rHAOCAsCAAsVw4C5/Kx9QJ9FmYHl2m
        nHSKg392agLXattjwO7ogLF6gg==
X-Google-Smtp-Source: AJdET5dY3Vn603+mhxfsCVrhLjKWDf/O2JY2s2e/G3Zqdqs6/N5+xKqCwtfjQFXEM1X5PRe4A4nNQw==
X-Received: by 2002:a17:902:1744:: with SMTP id i62-v6mr1786970pli.250.1540310266533;
        Tue, 23 Oct 2018 08:57:46 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id l2-v6sm2207609pgp.20.2018.10.23.08.57.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Oct 2018 08:57:45 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v5 2/4] arm64: defconfig: Enable DRM_SUN8I_MIXER
Date:   Tue, 23 Oct 2018 21:27:25 +0530
Message-Id: <20181023155727.9383-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181023155727.9383-1-jagan@amarulasolutions.com>
References: <20181023155727.9383-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allwinner Display Engine 2.0 Mixer is need for ARM64
Allwinner SoC's, build it as module.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5:
- Enable it on defconfig 
Changes for v4, v3:
- none
Changes for v2:
- Enable for SUN8I

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4b3844480a77..7f271178d421 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -446,6 +446,7 @@ CONFIG_DRM_EXYNOS_HDMI=y
 CONFIG_DRM_EXYNOS_MIC=y
 CONFIG_DRM_ROCKCHIP=m
 CONFIG_DRM_SUN4I=m
+CONFIG_DRM_SUN8I_MIXER=m
 CONFIG_ROCKCHIP_ANALOGIX_DP=y
 CONFIG_ROCKCHIP_CDN_DP=y
 CONFIG_ROCKCHIP_DW_HDMI=y
-- 
2.18.0.321.gffc6fa0e3

