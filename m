Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDB4C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5D1664E57
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbhBWGVb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Feb 2021 01:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbhBWGVC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2021 01:21:02 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8516C061222
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:27 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id o22so1115377pjs.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SE8LvB13EoijNekrwFmw4zAb9BZgnUUKtus/CbxCO44=;
        b=Vzqnw822lH2lfVZnHFzXqgEjRR+CAv1klD1WlOha88yUivgU/HRzplnKxIRyISmh0c
         JbvmMk3JdaI2X1TDHww+2/w7j/gkEVZkZOQZS69erTcEV6JBiWyzuSXvc9JMPyGMs9Kw
         +Dn0H3PI6Wgd7h/fts19GzE8gCfBUHadG09JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SE8LvB13EoijNekrwFmw4zAb9BZgnUUKtus/CbxCO44=;
        b=GKWqWd5c3NOpn8aVaT4ze4dbH3faP1DZ1NMYNAflWYHhRfI02+DVdCUOQfcG00aC2z
         eI1zOmE5UQRoPkVfqtZ3NTlJQRi2D4L1gqxAl/TfmiJ1E6IqP8zA5waSlQiyrXih9zhW
         1bliQE38TuAjM7FeTAwz8i9Eqc6H5jmf/xfrm5ghJTyfbKzxDWJghNjlgyDliEu/iPiU
         YL9eBm/vaNYA0XQfVv7RtvAgf2Y7T8Or97XPRF+TPFWnrMO7egJO2+PlK/oF+8ExsMsO
         HsOaJIVkISCvwfkqf19KMv0ReyP5YMLKc5vObJAL1C26R2mnAZt2YFnr1efGozynEPve
         GpYQ==
X-Gm-Message-State: AOAM533DLGvz55OCze3g+btfl7CsNaESY7/uvsIQPyD0dYBnEbHQICkn
        cR+CxTzAAqxJyff3CzR34oWc0g==
X-Google-Smtp-Source: ABdhPJzoIJDh0x+aPCJvQ3KGczLpHsrN+drRAIc5AD4BKUwfO1ZvK1x/0gzZUZpOaaY3vYvOJ8Z3MA==
X-Received: by 2002:a17:90a:1d0a:: with SMTP id c10mr28899732pjd.142.1614061167210;
        Mon, 22 Feb 2021 22:19:27 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:26 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org, sboyd@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 6/8] ARM: mstar: Add OPP table for infinity
Date:   Tue, 23 Feb 2021 15:18:28 +0900
Message-Id: <20210223061830.1913700-7-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add an OPP table for the inifinity chips so
that cpu frequency scaling can happen.

Co-authored-by: Willy Tarreau <w@1wt.eu>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity.dtsi | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity.dtsi b/arch/arm/boot/dts/mstar-infinity.dtsi
index 0bee517797f4..441a917b88ba 100644
--- a/arch/arm/boot/dts/mstar-infinity.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity.dtsi
@@ -8,6 +8,40 @@
 
 #include <dt-bindings/gpio/msc313-gpio.h>
 
+/ {
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
 &imi {
 	reg = <0xa0000000 0x16000>;
 };
-- 
2.30.0.rc2

