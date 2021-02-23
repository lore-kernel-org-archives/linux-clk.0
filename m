Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9774C433E6
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C1D164EC9
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhBWGWY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Feb 2021 01:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhBWGV2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2021 01:21:28 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5884AC0611C0
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:32 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id c19so1128254pjq.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aI5IVkQJA7PDNbBU/+1PZqGp3m7b3MnBtGAvzpqE9DI=;
        b=krfujBl0J3RTa+9MxhJ1pPz8nrwfBTvIuo2aMFitjGAWxGPWV7xeKZzzG+bMU+3iUy
         Mc5Us7xmjCKRjKJsudStwDXQ5GMoRh7bmyzyoFgQlsU0Or3Ww9ad+a7WksQ9IzdZLbay
         MULJZM57YvPqTgUTD2YUj/28tKRa7nzcg8ztI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aI5IVkQJA7PDNbBU/+1PZqGp3m7b3MnBtGAvzpqE9DI=;
        b=Ckvl0pJOhuk81Hj7dqGSwSjf3z5L4a0nuOOP9cEJ6nmXgVVCjp91sg1g2jrxHwwCAQ
         tmwpljb1ITdylY5KCXCkTu2cfWkWHAgEzQ7XmXXProHZN0RDkYIF/4+3GnTAeUQJl+Bt
         QqSxmaU1w+qLq27rMRKCVTWMwjAUTUDeFfEeEqY8HFqHfLYAF/nxUVgYo948/rQCWk+j
         X9y3CmQC6FRSTkV6C0v1KsHmPxufXnG+IZGVhRoaoKeyjXzQPVXKulbJVMPcx+niR4fK
         +m5/NrAp6Nvl6bz7KksuuZLX1/NSDqYcC2U4kR659aVK9r+UqlYqoBZSo7sf6E+R0xyv
         q3Kw==
X-Gm-Message-State: AOAM531N8Mj4EImckRQrkYdSmM6B2D+B7gDaV4Oi5VSDxlM/w5OFAoiC
        UgUP4GoKi1ZPVTlrXQ0vY3ac4A==
X-Google-Smtp-Source: ABdhPJxKcQ0XdzH66RpqYbTQ6lbBZie3kabhudXrxsFNyvw+rqjI5s3m5LdmnSloa1eUTFccWA5bRQ==
X-Received: by 2002:a17:90a:7e0a:: with SMTP id i10mr26715766pjl.152.1614061171969;
        Mon, 22 Feb 2021 22:19:31 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:31 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org, sboyd@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 8/8] ARM: mstar: Add OPP table for mercury5
Date:   Tue, 23 Feb 2021 15:18:30 +0900
Message-Id: <20210223061830.1913700-9-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add an OPP table for mercury5 so that cpu frequency scaling can
happen.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-mercury5.dtsi | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-mercury5.dtsi b/arch/arm/boot/dts/mstar-mercury5.dtsi
index a7d0dd9d6132..80a19bd23c9c 100644
--- a/arch/arm/boot/dts/mstar-mercury5.dtsi
+++ b/arch/arm/boot/dts/mstar-mercury5.dtsi
@@ -6,6 +6,42 @@
 
 #include "mstar-v7.dtsi"
 
+/ {
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <800000 800000 850000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <850000 850000 880000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <880000 880000 890000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <900000 900000 1000000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <900000 900000 1000000>;
+			clock-latency-ns = <300000>;
+		};
+	};
+};
+
 &imi {
 	reg = <0xa0000000 0x20000>;
 };
-- 
2.30.0.rc2

