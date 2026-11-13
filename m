Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567275;
	b=1aoFwYGbSJXtLXHynSmxhsHsaoDzcNMBNwKCDZrJxjKj4e7TlilLt0qK3pTrc7fO024+
	 keLOycRlXX/C7X3zqICmWiu/bsTzQyWHtg6+EMek0Hvxs3Z0vhy2XMUJdHfzZOZW9YhoS
	 7g6OPbH8a4gx5/0ZSiMQ7Y7J8fMyawUKHjisXrejjNmqGYnu0QbzVAgbXK8p7xCeC8JKr
	 6y8Dwkp1fYUefDRGm1ohieU41k4cgRhzihMN14Rn1p1kDFr3nh5hNPuyrCPQg2HPW5R/H
	 R7eOAbSETvrEcC+O1+oIfqgQo4zhnopDK12NCvbX/tphOJ+dE2GlHBlePfP8mqhBC4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567275;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=CttS6bLkCRkmCK7/rWH8vIsMnUvlXcALwNj2LzjHU/g=;
	b=Rxwg2SitUA0wQkN1FMloo/CUmh+Czd1Mqa6dQ4jUKaT76/+5eIoCLSHd/mrnKQUS4XvX
	 CCVHHUnxkI8L9t4qmF7bkzkWXiM0ycLc9xUGdXSdUJ2d0ni0rvVfVuZ7+APXuHiuqvxgZ
	 MWmk/3gWonz+xMzksx2huaIZlIkt9JnMZ+1lMtBVw4qNche7Aee7piibZPRas0dpy8nYC
	 zwfu8K6frCwqFvWcRiVsoQyHl5b0uk4qvZqsySvzPldQxiJE/mnHGvp9h7oTe7zgH+t3e
	 JYdEm8vDRKZfmaU3ujytjOLajotdhLRFrf0seXYMhQEgYXKsKAI5HIFUdWnDHl6opYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TepBwym5;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6598B606B268
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6598B606B268
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TepBwym5
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261113105432epoutp042f8d0e8a2747b0377392cee2383b376e~nlW0wWpOW1090910909epoutp04U
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:54:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261113105432epoutp042f8d0e8a2747b0377392cee2383b376e~nlW0wWpOW1090910909epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567272;
	bh=CttS6bLkCRkmCK7/rWH8vIsMnUvlXcALwNj2LzjHU/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TepBwym5qF9yuAGJpLpXRq/IYtDjn8h8roQq00lOjxN8RYz8+cTz0pA+LeFqCFNE2
	 Ey5lSU7r1cRKwaQD8a+jPt9gs6sz5lM7/5wx7EFydOxd1tSVm+qEovei9gZtLdlu9G
	 sNVObHLn+sTK0wxzyv7JX+pUHsUyY3fajxPamtS8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261113105431epcas5p3d563b2b9f8b11a21ad9b14921678c7dd~nlWz3xKSK2259522595epcas5p3B;
	Fri, 13 Nov 2026 10:54:31 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jQvK25s6Pz6B9m7; Fri, 13 Nov
	2026 10:54:30 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104901epcas5p26c1b8e9a324f133216b7980ac7ded44a~nlR--phFr1592415924epcas5p2Y;
	Fri, 13 Nov 2026 10:49:01 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104858epsmtip2a8b58f29e1f43e47a6cef65ea1e869d9~nlR9f3VGf2501325013epsmtip2S;
	Fri, 13 Nov 2026 10:48:58 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 11/14 RESEND] arm64: dts: exynos8855: add cmu_top &
 cmu_peric clock DT nodes
Date: Fri, 13 Nov 2026 16:36:09 +0530
Message-Id: <20261113110612.3265841-12-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104901epcas5p26c1b8e9a324f133216b7980ac7ded44a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104901epcas5p26c1b8e9a324f133216b7980ac7ded44a
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104901epcas5p26c1b8e9a324f133216b7980ac7ded44a@epcas5p2.samsung.com>

Add required dt node for cmu_top & cmu_peric block.
This also add sysreg_peric node. sysreg_peric contains
DRCG and MEMCLK SFRs bits which are used in clock driver.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 0333b80eba84..2e5dc79d66bc 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/samsung,exynos8855.h>
 
 / {
 	compatible = "samsung,exynos8855";
@@ -170,12 +171,43 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_top: clock-controller@13900000 {
+			compatible = "samsung,exynos8855-cmu-top";
+			reg = <0x13900000 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
+
 		pinctrl_usi: pinctrl@15030000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x15030000 0x1000>;
 			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric: clock-controller@15400000 {
+			compatible = "samsung,exynos8855-cmu-peric";
+			reg = <0x15400000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
+				 <&cmu_top CLKCMU_DOUT_PERIC_IP>;
+			clock-names = "oscclk",
+				      "bus",
+				      "mmc_card",
+				      "ip";
+			samsung,sysreg = <&sysreg_peric>;
+		};
+
+		sysreg_peric: syscon@15420000 {
+			compatible = "samsung,exynos8855-peric-sysreg",
+				      "syscon";
+			reg = <0x15420000 0x10000>;
+			clocks = <&cmu_peric CLK_GOUT_SYSREG_PERIC>;
+		};
+
 		pinctrl_peric: pinctrl@15440000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x15440000 0x1000>;
-- 
2.34.1

