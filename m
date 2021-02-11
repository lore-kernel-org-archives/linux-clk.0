Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46364C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:25:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 166F364E8B
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhBKFYt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 00:24:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhBKFYk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 00:24:40 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE007C061223
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:48 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 189so3006258pfy.6
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vk7Z0AS7ak4J0BwIBs0zSntFuze/upcDQo3SRk3ydVI=;
        b=m4hEkGAhe/bsNcOv9Y6cZl08ZjTGXhVFHQvUJtbARWhP3WYfyhNlc9HVPtW0kFkBLt
         6Fq+zWLqWe8hlBhKhY68VS5cA+5RjXodulpr2PmzOb1NmT3Q4pfkqUFgq685zVyNEhz2
         PNG1xv3+zvMSVcujr9L6wd7ahhwYtmyqROBTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vk7Z0AS7ak4J0BwIBs0zSntFuze/upcDQo3SRk3ydVI=;
        b=b7JG0EgHN9xg9HpiiuDFZLTYbhz99zw9rIQf5ecgS5HDpv0fjwygjDYo4KVXvibZEN
         vDxL+HEHJdRbBI7a+kAduM0IQ/CMjG1ffVYkQ6ZmmTZK/MTiUkvVocA9NZBDTOYYrCX2
         68r4uKeCP97ad/rbMbUlVxI9th+9EEKl8Lr28Dhf1THtyR4N0dlUv8nt0Kd1GJbAkfgL
         t4Fvzd8pZn5hUGWIIB0EqXUftHc2Z0F/bJW3qYZ5bousVj8vl3K79dUsM8wV5NsR9gqD
         Vmje6HYhIMvGdtA16FRDT5QQF7Rt3sjaWUppH9ig+s3zvpL+8KpY61z6JsZ79ilBnokI
         EmBg==
X-Gm-Message-State: AOAM533+gwM4Ml5jT6V9UBFRta18K0AAaSWr6VkpxHX7/9dSCFe7vFQp
        JTeuQ3dGuzz2/CTmzJ8ecoQdgXLwtUwFMCt/
X-Google-Smtp-Source: ABdhPJyISaJ8cwyL7Zx0SCuhZTeWSCJmZ3TmVwLz+shRCM5N9O/vaXtiCDAHszb9as31QHnl+NVk7A==
X-Received: by 2002:a63:c741:: with SMTP id v1mr6379922pgg.316.1613020968122;
        Wed, 10 Feb 2021 21:22:48 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id o21sm3493511pjp.42.2021.02.10.21.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 21:22:47 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        devicetree@vger.kernel.org
Cc:     w@1wt.eu, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 7/7] ARM: mstar: Add mpll to base dtsi
Date:   Thu, 11 Feb 2021 14:22:06 +0900
Message-Id: <20210211052206.2955988-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210211052206.2955988-1-daniel@0x0f.com>
References: <20210211052206.2955988-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All of the currently known MStar/SigmaStar ARMv7 SoCs have at least
one MPLL and it seems to always be at the same place so add it to
the base dtsi.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 889c3804c251..075d583d6f40 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/mstar-msc313-mpll.h>
 
 / {
 	#address-cells = <1>;
@@ -124,6 +125,13 @@ l3bridge: l3bridge@204400 {
 				reg = <0x204400 0x200>;
 			};
 
+			mpll: mpll@206000 {
+				compatible = "mstar,msc313-mpll";
+				#clock-cells = <1>;
+				reg = <0x206000 0x200>;
+				clocks = <&xtal>;
+			};
+
 			gpio: gpio@207800 {
 				#gpio-cells = <2>;
 				reg = <0x207800 0x200>;
-- 
2.30.0.rc2

