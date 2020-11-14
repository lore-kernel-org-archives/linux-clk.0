Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033F6C64E69
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 13:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF3C2222C4
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 13:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="tabb1NqY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgKNNwe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Nov 2020 08:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbgKNNwa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Nov 2020 08:52:30 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BE3C0617A7
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 05:52:28 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id y22so5867477plr.6
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 05:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=knRDqUwLArt/cH+Tqwve+3iR/MhGzrnefGMWYKE+wNE=;
        b=tabb1NqYQxtCKgmPgxtbaPibihWkntu6RSY0c673ZnyqaahjS+4MnWiuuX10n5/SgT
         mZfVST1yb3XP3hfgOEkzK/A82wgXwWiDxXPefad6bsPcyA18i4McOgNvjHmUdOimTOma
         tYeawHrRe82fPXLEYCIOoh6hWTEaYh3Tbtfeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=knRDqUwLArt/cH+Tqwve+3iR/MhGzrnefGMWYKE+wNE=;
        b=DzwHqiBXw8fRjMnm7OtJvQRbPhX3GGnuUx+r2wCdgc713lUzyiJaK8V/1oWl+NV2bs
         Lp7U7oj1oB/j0uA09lDnRCgbx5gdse/WSb8CRbNpyvJW6HVVythbc366bEDxiwlDiI7f
         dO6LDKg7YtVvIzoNtqQsm//jzbp/uw/iCgQGa/YXOZijiQhc8BLtOT54JZfEuGU3x9xU
         ESsDb/CRKcidrzQa3OzHaqh/OGu+30+uEAc5dd4zmvn9pDo3qR/1LMM2FGcW4noFOdWz
         OI+jiPLTkTwVX4cbDQ9c96EvIHXDBN85deRLvGjhgBAL+qrJH3g+tp5oLJvZoeEX1+8f
         Ysjw==
X-Gm-Message-State: AOAM530f1ySpLjIIR0rMpB+687kGt4OBLg2liFI4H1QybmhyiE7nd7cf
        RbqVPb/a8PIClYFN5QWOphUR5BxZ3oNODA==
X-Google-Smtp-Source: ABdhPJzMSVAnooVmia8Cb5+VWp9XK6kfgXDWdqNR6ykSsQtis1fYeAAxs6GOyE6QtsRdesLRuivNzw==
X-Received: by 2002:a17:90a:4802:: with SMTP id a2mr8323284pjh.22.1605361948045;
        Sat, 14 Nov 2020 05:52:28 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id r205sm13008023pfr.25.2020.11.14.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 05:52:27 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 4/6] ARM: mstar: Select MSTAR_MSC313_MPLL
Date:   Sat, 14 Nov 2020 22:50:42 +0900
Message-Id: <20201114135044.724385-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114135044.724385-1-daniel@0x0f.com>
References: <20201114135044.724385-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All of the ARCH_MSTARV7 chips have an MPLL as the source for
peripheral clocks so select MSTAR_MSC313_MPLL.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/mach-mstar/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mstar/Kconfig b/arch/arm/mach-mstar/Kconfig
index 576d1ab293c8..cd300eeedc20 100644
--- a/arch/arm/mach-mstar/Kconfig
+++ b/arch/arm/mach-mstar/Kconfig
@@ -4,6 +4,7 @@ menuconfig ARCH_MSTARV7
 	select ARM_GIC
 	select ARM_HEAVY_MB
 	select MST_IRQ
+	select MSTAR_MSC313_MPLL
 	help
 	  Support for newer MStar/Sigmastar SoC families that are
 	  based on Armv7 cores like the Cortex A7 and share the same
-- 
2.29.2

