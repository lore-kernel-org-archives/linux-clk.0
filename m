Return-Path: <SRS0=jKhQ=UT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F67C48BE5
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:00:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EFA72084E
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q7N99tjj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732105AbfFTPAg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jun 2019 11:00:36 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:41032 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732078AbfFTPAf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jun 2019 11:00:35 -0400
Received: by mail-wr1-f47.google.com with SMTP id c2so3365126wrm.8
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2019 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C68d+qcYguHz3zXhv5eHfQ0ZAq7PycGdrc5Cah7BDk8=;
        b=q7N99tjjzhN3+LiLDy4XSG+Gx7+YBnKRo480RP/3ZjsunVDNZDHveRkH/fnqlxH7gD
         /1G4pCqT4MeJ18eq9ir+0HgAJR6JKyYdRD/DbF7xBlUXfI3t/UajywczG0oY1fICNK2H
         MrCPZmxutbZ6yCXVV7t3gsjA8tRtZzj4Y0ONAzVb4wRs4BMP/bReGXley9Sqo/XsjzoP
         4wTPRi8VIIjf7kiySou96AwTW4CNtm3OWC3TSQj37L/SSNqyG/wYegbtv47GTVgBvlFT
         azXZdbCCDMP6bb1j/ehf5HawzD+uHHfihTOUcox/C/pq/+k783QM/nhqc9ytGfdacg8O
         MzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C68d+qcYguHz3zXhv5eHfQ0ZAq7PycGdrc5Cah7BDk8=;
        b=nmNd0+ceBirNE8x2tbzr5YJt3mS4JinCdD0pWYAAQU0x5wK5H60S3Lz2yjalYlfb3A
         YD8xfCnEMXWH9jm6wW6phRLqtjgZ54B9x7jcEBgiAukzr1fe1b3OSos3vSdD5v68EOPc
         PNNBIVCE6txcc+ESnI6Q5rsNOfKjnZ265jHKy6VKw5Hlqy/jLSMnxC+I3TLNA2yPtR7t
         4FC4O0ebuxe7plYJXCAaDIJCIoe+vTC3yYaC2nd1Mzo1EhsYi01KaEGEFDYlD/UHLpXR
         ncCyJb7xewb8waHdbaG6O7IxpjZPw75KKC2UrsCmq9awaqZSwpU/4cjsJp9FIHQrereJ
         2kug==
X-Gm-Message-State: APjAAAXnIQd4FlbaW8NGEit4q+m8fHdXqGQlJwFG4zEC6zK69M7XD5w9
        IKhhtx/+r2tQrbT6KHeXKpw9og==
X-Google-Smtp-Source: APXvYqzErbqy4BohHinkppm/dPifMbl7dbPGdWxW8WZ7N66gJ3ZM2HTJNXQ2nC2N7QCBPq1HW1MRaA==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr4725863wrp.245.1561042832953;
        Thu, 20 Jun 2019 08:00:32 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 08:00:32 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT 11/14] arm64: dts: meson-g12a: add cpus OPP table
Date:   Thu, 20 Jun 2019 17:00:10 +0200
Message-Id: <20190620150013.13462-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the OPP table taken from the vendor u200 and u211 DTS.

The Amlogic G12A SoC seems to available in 3 types :
- low-speed: up to 1,8GHz
- mid-speed: up to 1,908GHz
- high-speed: up to 2.1GHz

And the S905X2 opp voltages are slightly higher than the S905D2
OPP voltages for the low-speed table.

This adds the conservative OPP table with the S905X2 higher voltages
and the maximum low-speed OPP frequency.

The values were tested to be stable on an Amlogic U200 Reference Board,
SeiRobotics SEI510 and X96 Max Set-Top-Boxes running the arm64 cpuburn
at [1] and cycling between all the possible cpufreq translations and
checking the final frequency using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 62 ++++++++++++++++++++-
 1 file changed, 59 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index ac15967bb7fa..ba9aab39fd95 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -48,8 +48,64 @@
 			compatible = "cache";
 		};
 	};
-};
 
-&sd_emmc_a {
-	amlogic,dram-access-quirk;
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-667000000 {
+			opp-hz = /bits/ 64 <666666666>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1398000000 {
+			opp-hz = /bits/ 64 <1398000000>;
+			opp-microvolt = <761000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <791000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <831000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <861000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <981000>;
+		};
+	};
 };
-- 
2.21.0

