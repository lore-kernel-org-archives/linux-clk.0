Received: from mx-relay95-hz2.antispameurope.com (mx-relay95-hz2.antispameurope.com [94.100.136.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61272D8378
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 15:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072713; cv=pass; b=I4khJFfcmTLicgVj3KlG6R/fYv8NzqRhyajoBAAInbOC1O8NsY1EPXsUACDZ3fdMNaoWTQOmNJVc1ZJ/5oSz0Bgsrg5qLqh8JBX3+LyQEiFAOsez0VYfD28F9r0MuqJ1LFC2glxZBCubBi9tMmvXZBodVY2jYYnySdWcJKtQaCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072713; c=relaxed/simple;
	bh=lYmjpxP0uO6WQqzTJeVwXGBg09KGDuuPwir+lNZhhrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WycsX9VOz7uZS433hEWiLtrPO8s0wLLpeYoOMk9IpVzctB20WkbwY1qCJyFydhwXP4hg/hOVchf6BGgrTUqLfMRjNofSTzZAQm6SvELdpZwK7dc8wu41o9ah+PGwAHA+bDBTfB5P1Bn4qSAosRTancPmdELIagOBMnwxc8HDojI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Rmp3LxSA; arc=pass smtp.client-ip=94.100.136.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Rmp3LxSA"
ARC-Authentication-Results: i=1; mx-gate95-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=cNktqPdORa2qnhbyWV/LXLPJYGLHHIks8TSaavnZQv8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766072681;
 b=khWscoxyg9PEu+Jv09E+MFbKAu6PXCRW2HST1DugFdoInCzQhWWvWc/00ZupqshofF6TaYQ8
 9W1bXoDX9aFPHeuH9LklP7j9Osn+1+zy/ubaCRZbEl6vyZFUC/2/ojbNvSkGGICUg8TSQRg31yP
 edg4AnXSUmujGwv6s/LoaMTthw6/Tpd2sGHfidB6mQkaOTcX04e9oRuFTfW2NI2KYP0DvqbgpY/
 v/Q0C1Q2icUXDKYcsQzUKdJn0k2uISvFyQd89CPSFrYtLsAWQj8RvDI29Epz+hXVlb35rPe/iPa
 YjQ8dDbrVF+9dATy+v3mlYZzgeI5EEAWLU3QLkXW4htBQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766072681;
 b=fMZ3WMliH6TK13M4Yum52LFjQkvCPix3dx4PaGJFrQbBg1mxrHBHENE3uGv+Yf2tBa4zCG+G
 R1SVq6a7GA9+i4b60vE/QPROQ0HzRa7S32x0YSKfZ/N2nueJOGYOEH3pmqFiIgmTmpGlTMpv49N
 Ff8E8Kc2CFJbFh9sIiwu3VlM/FZgl8PEEB8ZwJkkUijHklYJ11DS665P4RpJE3StPlYP9KZa8uV
 zSmv5S97jXdcwhXSWVMux+W8e0GuggvvDc1GztXewBGe+61gg84O1l6K535+2bsc3h+6HX6Whzq
 lVJgXryNARCoN1iXQq7yyIap6I6q9LTy1Jy8FxMn038Hg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay95-hz2.antispameurope.com;
 Thu, 18 Dec 2025 16:44:40 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6EA1B220619;
	Thu, 18 Dec 2025 16:44:25 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 6/6] arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster
Date: Thu, 18 Dec 2025 16:44:08 +0100
Message-ID: <20251218154412.1524249-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay95-hz2.antispameurope.com with 4dXFMt4MRFz2F8Jm
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:30ac5d452f02eb17521dada3ca6d72f8
X-cloud-security:scantime:1.560
DKIM-Signature: a=rsa-sha256;
 bh=cNktqPdORa2qnhbyWV/LXLPJYGLHHIks8TSaavnZQv8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766072680; v=1;
 b=Rmp3LxSA2KfsydHLMaI+7T5h8Zh5i4N52IVNX5xs/4VXEmzvr9FrNf5cJi4mOhKGg4VAgEEd
 F4/SSD5H0PpYZDQWhrkfP5F3hZaIsngPo+pB97IC4S9MRgJgg21u2/xUn+mhftyNcj0pExAoS13
 3mBLcCUnc4Pbhe3D1nbxfTzrEGQZlb3sqMLANSprCXwU4biliFNlFlmnwwQi+4doIb8kgYevgs2
 9Ld4VI7jr2cqy28JoMRWrkcfB9KmE6A32+Dw1Coue2/08ggtPR6ZgT7Mu7QVXZxJ965CFpPluYD
 3cdhlJnQAYIFq+mPrCDkQNvTxKpl3ElCrWGDfTF9+j59g==

Due to missing workaround for "ERR050104: Arm/A53: Cache coherency issue"
disable the whole Cortex-A72 cluster.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 39 -------------------
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 13 +++++--
 2 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
index ba19c3c17c496..4a5ab14ddc550 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
@@ -296,45 +296,6 @@ map3 {
 				};
 			};
 		};
-
-		cpu1-thermal {
-			trips {
-				soc_active1_0: trip-active0 {
-					temperature = <40000>;
-					hysteresis = <5000>;
-					type = "active";
-				};
-
-				soc_active1_1: trip-active1 {
-					temperature = <48000>;
-					hysteresis = <3000>;
-					type = "active";
-				};
-
-				soc_active1_2: trip-active2 {
-					temperature = <60000>;
-					hysteresis = <10000>;
-					type = "active";
-				};
-			};
-
-			cooling-maps {
-				map1 {
-					trip = <&soc_active1_0>;
-					cooling-device = <&fan0 1 1>;
-				};
-
-				map2 {
-					trip = <&soc_active1_1>;
-					cooling-device = <&fan0 2 2>;
-				};
-
-				map3 {
-					trip = <&soc_active1_2>;
-					cooling-device = <&fan0 3 3>;
-				};
-			};
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
index 718c792259a65..57d06817aab63 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
@@ -11,6 +11,13 @@ / {
 	model = "TQ-Systems i.MX8QM TQMa8QM";
 	compatible = "tq,imx8qm-tqma8qm", "fsl,imx8qm";
 
+	/* Due to missing workaround for ERR050104 */
+	cpus {
+		/delete-node/ cpu-map;
+		/delete-node/ cpu@100;
+		/delete-node/ cpu@101;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/*
@@ -171,6 +178,8 @@ &mu2_m0 {
 };
 
 &thermal_zones {
+	/delete-node/ cpu1-thermal;
+
 	pmic0-thermal {
 		polling-delay-passive = <250>;
 		polling-delay = <2000>;
@@ -196,9 +205,7 @@ map0 {
 					<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 			};
 		};
 	};
-- 
2.43.0

