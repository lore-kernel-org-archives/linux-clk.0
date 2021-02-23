Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0890FC433DB
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B36EE64E2E
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbhBWGVH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Feb 2021 01:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbhBWGUl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2021 01:20:41 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAD9C061356
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:23 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id z5so4952279pfe.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F8U0f9JNY8hRMi39WPkD4ASf4aAhKNDuZAqXYiDMPnc=;
        b=OdafbEs6apuScIxtpkC5hbqj2hdH2BgCZ/p6xtr5NI/8lYsH/8jqbSc51l3+G+oxdm
         /HTWGZWDK2BndoVcYAnXd0cjugjc+PqdTeqTCSYl4njHNY1e7RWaWUsyGsoI42armolR
         q0pkImbhFou/3iRgFAQDzcMf3nJvz1jrtqflU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F8U0f9JNY8hRMi39WPkD4ASf4aAhKNDuZAqXYiDMPnc=;
        b=Z+fXWtYZCOomrC48APPO1L9DCu4WYeOYgRqVZih1SfMb23joXWYOrDTC47qcwCRhl/
         ++fwCyOjp5pehp7OUrEz6Dcajy8YP6z8eDeh+xUVQ3V6J0QqAxVm5fMPWL9anL3lvrQC
         PzbQx/8kcKQbbT58VaL/XuqdaULFnv6PKRt8oh1CTrZjqgA7h1aJDIBCxIhX9N9RBGZ/
         AyVCXoz0YXncfHmNgKamtRDEF+d0iVCVzqgN4XYXP6lzXEDHnDEYBYkd+FXN4F4Do5lZ
         S6RZKXARh3avO7Cj7B9cRbbRu8/4sB8tUSnTeWFzE3S6M4Oc21uByu8z6dXjGv3wtkx5
         49fw==
X-Gm-Message-State: AOAM532oxxPSTx4VK8wY8A7qqwohxVsFiBuQiA2bwJFRkzDShWq1tRO8
        HXW/cbIixQYkfRm8+jhS6nE1Nw==
X-Google-Smtp-Source: ABdhPJxc6Ul/6qH9CfSEt6s256nfdmu2EHwQomQ8gqEAsR960hE9xL7M7oKKwskSClxqWd9Szf2f+A==
X-Received: by 2002:a62:dd01:0:b029:1ed:6b67:1377 with SMTP id w1-20020a62dd010000b02901ed6b671377mr938433pff.48.1614061162681;
        Mon, 22 Feb 2021 22:19:22 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:22 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org, sboyd@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 4/8] ARM: mstar: Link cpupll to cpu
Date:   Tue, 23 Feb 2021 15:18:26 +0900
Message-Id: <20210223061830.1913700-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CPU clock is sourced from the CPU PLL.
Link cpupll to the cpu so that frequency scaling can happen.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index d323c1a3f3c2..4d9991294f7c 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -21,6 +21,8 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
+			clocks = <&cpupll>;
+			clock-names = "cpuclk";
 		};
 	};
 
-- 
2.30.0.rc2

