Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479006;
	b=UvS6c+FfhMxPbyCAmvkqKrhLcnb5zf138PnrjMyAysfJacqvYdSgT6+rEFM7KXNmQ2ej
	 jiSQlKs7jwdyDj0xDyDZP7+Aq6bViLoIdR4I8fDN1uONH5RhKnA/Fq/EsGOLHroFZTIdA
	 icov1v6DYBc95IjP8LwMo0bV8CUkvXBg8eI2FZTGo+jo6OUasp/ywgST6ui6pXNMoBmzp
	 q221pAt6zxxHJam44IUBIBITWw+XFBJqYP3l8/HK8TzFPD1Ay4cWehNCmBahBae4jVGQA
	 TtR1vnxNHKPYqFgDfE1Uqbl1PsnPAioeJB4OCOdJKKiBCWoL6R/tYLT4M2uSw2Ix+4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479006;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=1hJ0aQ7fGA2QuLMADJWwMmxygYV3IJuA53iBt1oJi10=;
	b=iR9PyDXtoMf4PYvJU+WtF38LUpM01e6oOid/QJvpXK6iyhGMv8qYQxSa7pIJmDwWPwN8
	 7g+oHlHJiTzTuIMCJoTcI6cDiV3EoktboL/HMr5TY14HXOomvHMixU4fk57Dd+xcPJvs0
	 RRTjGIBHqDRUBZuiM4ECpQfX87oLJV3wuxXXidVdbGPCW6Xp5uQsMa3SGaxB04EkLW2A+
	 IoWJIth/YKecdDmRdadSkDJcDFmjd38+HsCuhqaeqZq/WmR+XtRaMcWVbyMypLccoxcyg
	 rqx2jIzxoOqWUulbKdf6tI2UMuVCs2Ptj/pG6yO8unf58ldpLYB41VzTwkYFGQk6NzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="K4La02/7";
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3E606A330
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BC3E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=K4La02/7
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261020065003epoutp0386884df27b5706896b5ac133910f0e43~gKigzbRRs0511605116epoutp032
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:50:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261020065003epoutp0386884df27b5706896b5ac133910f0e43~gKigzbRRs0511605116epoutp032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792479003;
	bh=1hJ0aQ7fGA2QuLMADJWwMmxygYV3IJuA53iBt1oJi10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4La02/7uL8hYSw1rOZzAu76bVFJxuVjbCVA/CxuXwy+txENIbaZEbIQyAYQ54cOS
	 nH9AoWVihRE2WQ6urrS6nqSZ9K6wFwESy0TuOsrDH+qC+TTl7cm+81NIxXLYexta16
	 tH1ffbegYU0D+QehEQCbAecSSpBy97MIy1HI1Vt0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261020065003epcas5p494ef041799fe8dee90182375c6f60d23~gKigS9rM60089400894epcas5p4X;
	Tue, 20 Oct 2026 06:50:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j83222PKMz6B9m9; Tue, 20 Oct
	2026 06:50:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020063838epcas5p29bad3adea6f1dff99c3362a3d5d4094c~gKYiu_9-42333523335epcas5p2K;
	Tue, 20 Oct 2026 06:38:38 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063836epsmtip17c0d399fee97e034ef9399f4af327565~gKYgVQ_pD0324703247epsmtip13;
	Tue, 20 Oct 2026 06:38:36 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 14/14] arm64: dts: exynos8855: add cmu_usb clock DT nodes
Date: Tue, 20 Oct 2026 12:25:58 +0530
Message-Id: <20261020065558.1829402-15-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020063838epcas5p29bad3adea6f1dff99c3362a3d5d4094c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063838epcas5p29bad3adea6f1dff99c3362a3d5d4094c
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063838epcas5p29bad3adea6f1dff99c3362a3d5d4094c@epcas5p2.samsung.com>

Add required dt node for cmu_usb block, while at this
add sysreg_usb which contains bits for DRCG and MEMCLK
which are used by clk driver

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 3dd7a4c4c609..dcf1e58c6367 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -192,6 +192,27 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_usb: clock-controller@13000000 {
+			compatible = "samsung,exynos8855-cmu-usb";
+			reg = <0x13000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_USB_NOC>,
+				 <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "usb20drd";
+			samsung,sysreg = <&sysreg_usb>;
+		};
+
+		sysreg_usb: syscon@13020000 {
+			compatible = "samsung,exynos8855-usb-sysreg",
+				      "syscon";
+			reg = <0x13020000 0x10000>;
+			clocks = <&cmu_usb CLK_GOUT_SYSREG_USB>;
+		};
+
 		cmu_top: clock-controller@13900000 {
 			compatible = "samsung,exynos8855-cmu-top";
 			reg = <0x13900000 0x10000>;
-- 
2.34.1

