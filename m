Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168ACC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:24:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E655E64E7C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:24:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhBKFYU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 00:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhBKFYM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 00:24:12 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220CEC06121C
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:44 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id m2so3097616pgq.5
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F9waNMxdjZkseiYOX3kXTCR3uxm3G9WfxrGuahm7HHQ=;
        b=LTMGFcz5c9P23sKxt0RAscVZauH9WjAnAL3XbRYgIZOhTCsSKfNQVW4LF8uA03ZnFQ
         LqJf7Su6Bb3QEKjgzaDPZF4u5xWb4ph7+wGPTFcaLIXxqLF/c55koYsQbD7exR8RZDAJ
         zyojOufOBjVuqHWOln/vywd2LvUCfsTuV4nm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F9waNMxdjZkseiYOX3kXTCR3uxm3G9WfxrGuahm7HHQ=;
        b=JkT265IOgmgJdaxawpdW38NRidJ4lvsyb9qLvZgIUSbOWF/RvAOJmaePVxvh7r8xL2
         GqOw4nQ1PQrH59qqSJWK+J07QyPKt9mVslgKbc/BnN9dBlGywjTyqo7Rt3rQ2VXD2iKF
         eha+HKv7aMz38Jjz97n6P4xCyKBuhV9Q8TDhg4JqXStQqaXx5urq9KhxOPJHCHOA7aNr
         /8NYUDA0QoayReyY/uFAhyWqUlwTAA1Nn6/EjXRRP9jB/pe8qd8I31ryvWLG065XB53p
         SG1RXlPze5OyCcYjnJqympNfwvvk0zKgAGMcawuU2fFlIZqIoUP4cJA2rUDzb7es/hs7
         Y2Qw==
X-Gm-Message-State: AOAM533Vrx4anag2U4YdGkjdRH9UdTKBxI2Cn4QhEF0N7+1DrdU7OohJ
        y0fhMORd0cnTyDwdZb88ymJuOjjrXdSIyNM+
X-Google-Smtp-Source: ABdhPJyNwjsIBTwjMT0feofmg7/YIbPDYHynlYW5zY3XQ5a27uXBDEeqpN6pN9NT7sSqtG1JXwoY7Q==
X-Received: by 2002:a63:d304:: with SMTP id b4mr6513819pgg.299.1613020963473;
        Wed, 10 Feb 2021 21:22:43 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id o21sm3493511pjp.42.2021.02.10.21.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 21:22:42 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        devicetree@vger.kernel.org
Cc:     w@1wt.eu, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 5/7] ARM: mstar: Select MSTAR_MSC313_MPLL
Date:   Thu, 11 Feb 2021 14:22:04 +0900
Message-Id: <20210211052206.2955988-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210211052206.2955988-1-daniel@0x0f.com>
References: <20210211052206.2955988-1-daniel@0x0f.com>
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
2.30.0.rc2

