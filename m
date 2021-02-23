Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A02EC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BA8A64DB1
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhBWGV0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Feb 2021 01:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbhBWGU6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2021 01:20:58 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55103C06121D
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:25 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id d2so1184834pjs.4
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d++YVA3eBO844Kl/OHoWYa8zWRWfXAymLgjqBL6Knr4=;
        b=vFAGl7k5isfUzWSj59UQ9XxA40uYRhdmVvNDxnrUzWu6FHtJTNyw0cqTm178md8yLh
         TsWHwYiOjHskw6l2yzhaeG+ZbGYvZa0EpXQq0EZx/4rJrMx5tPfnkcNq0l0o3/z67+mb
         8xVP02vET2/tQ9CnwLCfKQhhhAa5OMwo9v0pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d++YVA3eBO844Kl/OHoWYa8zWRWfXAymLgjqBL6Knr4=;
        b=RgzX9nMXSVIHiUzvJC95JI53Ft8tnwvQxsbSITphwZG9uZEvu7bZmqIy5v4k42PsR0
         KZOuPU84gKPQ+Zb53MxYsR9aGR5ekeTrjQochfkH0M+34vbSQRHj9aqZvxlH8SB5AxCv
         aetL1odM96m7f+ZtLt9yKSaYL8pivc8eU6AC3JsTxRYwnDk4OPob2HAOQ4bsqTUABEDC
         +fr2GhJeBwUlHyHAIBnFO3nlk8VdnSuisAcd1bPU3AJKRlZNMw5wuzLzZ587Z7lwxMUv
         Kn5BICUqk57Vp5qq6E9B95vIJ7psFb0//g8/uerV+jpZ1CLBCnKvGQ7f7AL+K6iEWmJc
         8nUA==
X-Gm-Message-State: AOAM530XhTR/yoPmWGeyYNgU6Gal8eCWfg7VivYni42OnBQ/J3Hc961l
        yIPMPYg/QvMVwFV5iQEFKAlB3Q==
X-Google-Smtp-Source: ABdhPJwBsHIBaGuLGftBLh9hMsJ/IeKYQPrHF8GpHwdEz++2TYtHeK9N5CQJHYgT51bxWKcaM54eIg==
X-Received: by 2002:a17:90a:1b4b:: with SMTP id q69mr25034810pjq.108.1614061164948;
        Mon, 22 Feb 2021 22:19:24 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:24 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org, sboyd@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 5/8] ARM: mstar: Link cpupll to second core
Date:   Tue, 23 Feb 2021 15:18:27 +0900
Message-Id: <20210223061830.1913700-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The second core also sources it's clock from the CPU PLL.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m.dtsi b/arch/arm/boot/dts/mstar-infinity2m.dtsi
index 6d4d1d224e96..dc339cd29778 100644
--- a/arch/arm/boot/dts/mstar-infinity2m.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity2m.dtsi
@@ -11,6 +11,8 @@ cpu1: cpu@1 {
 		device_type = "cpu";
 		compatible = "arm,cortex-a7";
 		reg = <0x1>;
+		clocks = <&cpupll>;
+		clock-names = "cpuclk";
 	};
 };
 
-- 
2.30.0.rc2

