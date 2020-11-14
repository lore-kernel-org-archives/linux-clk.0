Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71EAC5519F
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 13:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8233A22252
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 13:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="GPsXkawF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgKNNwh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Nov 2020 08:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgKNNwe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Nov 2020 08:52:34 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26ACC061A4A
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 05:52:32 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id b12so465068pjl.0
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 05:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TmJn3hr+RLmmQX5ys3w8ADM69QUXZfzE0ScMjrcJoEw=;
        b=GPsXkawFTCiDfm+G3kS88/otci7zITPY/HBy1frTfqrJAhPeexLAqopi8TX6GAjVh/
         vMFACaUFE5CcgE4QCFfAbWqgjJmIltVetaVuoxaI5n7j/iQMtTEGI7uFbXYkgAq0fm2O
         C0cGyoLTSOk6YX25cSks4LovwTWiCBrKv0CwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TmJn3hr+RLmmQX5ys3w8ADM69QUXZfzE0ScMjrcJoEw=;
        b=tQmge0UqV8xzy5YMSfiUVlZD1g1Qr9LIlYW35ngG3ZhA0NxsU4YFxQ0ybK527aHWmd
         HAyAPFVMOMDfDaDfHpBub5MRbdtTn8WYMpewbaFxAuSJOSZmxiX0/IDrEXbe2Q/LdLk+
         5x6hP2DOCMBnqqEPFtKvAaw95Qnvpk5W6mgnXBimO1tYaMWaYDc6ka8yRy9RxuorZbdi
         ljDpkh2Z1o7FC9MGEQEc1DqmE1gRXWMV6sDIYGwrZsMUNMkdQQzQz9QZArXKvumCJtaa
         zbCD8STAWu7J66mFo76UUTPzeHAUqoz89K79v7gwiOVbar+3GVCZq73iLdT0OgZuRwk5
         K+OQ==
X-Gm-Message-State: AOAM533hldIIj+nwE9rHFpkFtABfk1SRPsJKM7YTs0XtkjZRtgjZRE5h
        LaHVfTT+7wZlEtamKHvSS1g9Ohd75FdqSA==
X-Google-Smtp-Source: ABdhPJy/eSal4uffFJZ0hVxw0r5qNnxSAm+4AoDTcudEaAoHz5Js3Cpkohoc+aovNShf/PnXEoWXKg==
X-Received: by 2002:a17:90b:368e:: with SMTP id mj14mr8034823pjb.109.1605361952265;
        Sat, 14 Nov 2020 05:52:32 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id r205sm13008023pfr.25.2020.11.14.05.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 05:52:31 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 6/6] ARM: mstar: Add mpll to base dtsi
Date:   Sat, 14 Nov 2020 22:50:44 +0900
Message-Id: <20201114135044.724385-7-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114135044.724385-1-daniel@0x0f.com>
References: <20201114135044.724385-1-daniel@0x0f.com>
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
 arch/arm/boot/dts/mstar-v7.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 6749d421dbf4..07fc46c7b4d4 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/mstar-msc313-mpll.h>
 
 / {
 	#address-cells = <1>;
@@ -124,6 +125,17 @@ l3bridge: l3bridge@204400 {
 				reg = <0x204400 0x200>;
 			};
 
+			mpll: mpll@206000 {
+				compatible = "mstar,msc313-mpll";
+				#clock-cells = <1>;
+				reg = <0x206000 0x200>;
+				clocks = <&xtal>;
+				clock-output-names = "mpll", "mpll_div_2",
+						     "mpll_div_3", "mpll_div_4",
+						     "mpll_div_5", "mpll_div_6",
+						     "mpll_div_7", "mpll_div_10";
+			};
+
 			gpio: gpio@207800 {
 				#gpio-cells = <2>;
 				reg = <0x207800 0x200>;
-- 
2.29.2

