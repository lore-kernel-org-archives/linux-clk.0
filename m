Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C69C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DC0C64E2E
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhBWGVk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Feb 2021 01:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbhBWGVD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2021 01:21:03 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018B4C061224
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:30 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id d2so1184940pjs.4
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G4thmjduZ43HX5eyCNJENeVZMcyA8AVKFXPpIRfsEmo=;
        b=amHWH1xFUTFu36kpCUT4l9b90U0fBp3Q9fyx8iXV9r/xiRDq9pDWnJnL5GPlqLxbSj
         HR0yuPTyY+r+HwX+t5dEfOPeVRXaEaI3mggCZWThxuvElg0+eLqgqpVKAuTGcld4bc6X
         MHx5hnu+uT3f4oMN6r166FajTuyU6Mtf+FsqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G4thmjduZ43HX5eyCNJENeVZMcyA8AVKFXPpIRfsEmo=;
        b=R7fV/61H+plx3HwjgmZRxvkg8O4xOCsjFXtpTdNCa/z31W8LeM1fVrQfKsZBAOtNL3
         zkMePsNVXgaJQDE/w26zu9gnd2SJijnUpJ0LtXYacRPnMavSUD8D2NbE+Y8DFBsqgp9d
         wLHVCjf8DP3XhAnGQd28zj9x7UvnocX/Pg8mMRCWAcfcRB8Jz9MeH7mocRN0zmDRzUZj
         sNffU9D/4uwX0XCEEeLI75GEwnTka9Sja6i40NL5NxuspN0QvVFzIahXEnETq+3hDet/
         NBRp5djdvL87EuUAgaFusI803uAS604Nz6CXLVfzf3r83OqYygu66tLzUmyWWFsqvPSZ
         6ciQ==
X-Gm-Message-State: AOAM5306/sjrjMYTrtKZKnMbW0lwNB38SOlrdtuJAihSa2/XZ2m88Vzx
        a7gzOH7vfwaJDw4a1jR6bzioow==
X-Google-Smtp-Source: ABdhPJzKdWD/HPnom8Qx8jH6AAUN43gD8lpStgM44BbHKJBQkB14izYGXPrhe4CCETIu2OGeezBwGg==
X-Received: by 2002:a17:90a:7e94:: with SMTP id j20mr28131038pjl.218.1614061169617;
        Mon, 22 Feb 2021 22:19:29 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:29 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org, sboyd@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 7/8] ARM: mstar: Add OPP table for infinity3
Date:   Tue, 23 Feb 2021 15:18:29 +0900
Message-Id: <20210223061830.1913700-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The infinity3 has a slightly higher max frequency
compared to the infinity so extend the OPP table.

Co-authored-by: Willy Tarreau <w@1wt.eu>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity3.dtsi | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity3.dtsi b/arch/arm/boot/dts/mstar-infinity3.dtsi
index 9857e2a9934d..a56cf29e5d82 100644
--- a/arch/arm/boot/dts/mstar-infinity3.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity3.dtsi
@@ -6,6 +6,64 @@
 
 #include "mstar-infinity.dtsi"
 
+&cpu0_opp_table {
+	opp-1008000000 {
+		opp-hz = /bits/ 64 <1008000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+	};
+
+	// overclock frequencies below, shown to work fine up to 1.3 GHz
+	opp-108000000 {
+		opp-hz = /bits/ 64 <1080000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1188000000 {
+		opp-hz = /bits/ 64 <1188000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1296000000 {
+		opp-hz = /bits/ 64 <1296000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1350000000 {
+		opp-hz = /bits/ 64 <1350000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1404000000 {
+		opp-hz = /bits/ 64 <1404000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1458000000 {
+		opp-hz = /bits/ 64 <1458000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1512000000 {
+		opp-hz = /bits/ 64 <1512000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+};
+
 &imi {
 	reg = <0xa0000000 0x20000>;
 };
-- 
2.30.0.rc2

