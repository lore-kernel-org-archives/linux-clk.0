Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB8D4E5331
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546267; cv=none; b=GaEJmyqyDAmFLx2r3SAJTIfmxa17ljrRL/nRcWVjy2RaFsWQ3muD6Nejm979rpD+td0pPfnQ7BvY04czw8Rl2fVINR5byBq0gf3Vrcm01oH7jU1nRq5rDF1j6fOjkAhsO5UoIHaLRY8XBQ0NUSzO6VJD1ETD79PpV6eEFaT0Seg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546267; c=relaxed/simple;
	bh=3P72wUnoK2IzFlxFY8Bsu3oi1AKWqlgvlO44BGNkHPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=KwNmWE4pQUMTihVdKp592tSvljulp641njug7abqjfVL41b/q6hrDLqw7rY+EuW2c5tAnMfCRKP1ka+AinrUPhbCQfXZFV4POkD7P7g+jhLAZd6Ax6AUkvYfjSkhgnTOSxwSAg4g2+JMdK+xkhesL20kt5nxJgsMjtkuY9jxEoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=axMGCz0K; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="axMGCz0K"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261009114410epoutp01a5a0c5c37ea00282adb1ddfb2fe8ce5a~c2dKx8IO31424414244epoutp01J
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 11:44:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261009114410epoutp01a5a0c5c37ea00282adb1ddfb2fe8ce5a~c2dKx8IO31424414244epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546250;
	bh=tWkaG3M1ybkYTdaWSTR7V1saFfsOuJsMAGwFO7f5RRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=axMGCz0KPCMOg2qWrGHwIcVhpJZHz9Q/SVZYIROa1TLWNz5EyBe4U6xDsAmt+XfOa
	 euYMy4i9iIofjZdeOhE95tSd+0zrVwsU1zrzX8aiAFmkYHhLOZkZFSSlYbLVNk8iu3
	 RX3LBA9/yz5R+5r6J2JzMbiKwxz722WsfoDGr3O8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261009114410epcas5p39115d141968c5104cab01f9d308c96bc~c2dKKkU020308303083epcas5p3G;
	Fri,  9 Oct 2026 11:44:10 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j1Q4T0wCSz6B9m7; Fri,  9 Oct
	2026 11:44:09 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261009114408epcas5p343508b4fd7022f917fcdda74e58ab154~c2dIWCu-C0308303083epcas5p3D;
	Fri,  9 Oct 2026 11:44:08 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114405epsmtip257f486d0868423adda5142a5b734251f~c2dFmPQOI0916809168epsmtip2e;
	Fri,  9 Oct 2026 11:44:05 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 13/14] arm64: dts: exynos8855: add cmu_hsi clock DT nodes
Date: Fri,  9 Oct 2026 17:31:36 +0530
Message-Id: <20261009120137.2801911-14-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114408epcas5p343508b4fd7022f917fcdda74e58ab154
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114408epcas5p343508b4fd7022f917fcdda74e58ab154
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114408epcas5p343508b4fd7022f917fcdda74e58ab154@epcas5p3.samsung.com>

Add required dt node for cmu_hsi block, while at it add
sysreg_hsi node which contians bits for DRCG and MEMCLK
which are used by clock driver

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index b461de6a7548..3dd7a4c4c609 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
 			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi: clock-controller@17000000 {
+			compatible = "samsung,exynos8855-cmu-hsi";
+			reg = <0x17000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_HSI_NOC>,
+				 <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "ufs_embd";
+			samsung,sysreg = <&sysreg_hsi>;
+		};
+
+		sysreg_hsi: syscon@17020000 {
+			compatible = "samsung,exynos8855-hsi-sysreg",
+				      "syscon";
+			reg = <0x17020000 0x10000>;
+			clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
+		};
+
 		pinctrl_hsi_ufs: pinctrl@17040000 {
 			compatible = "samsung,exynos8855-pinctrl";
 			reg = <0x17040000 0x1000>;
-- 
2.34.1

