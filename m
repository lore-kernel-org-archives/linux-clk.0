Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479788;
	b=TqdqHnfD9rpY5uoHQDYuH54aFpmJ0nQWPPG87s69Gb7Oi8u027PUQP+0hRsAlkKp+5Xv
	 kRfUQUm5du95RIFRcAeiJg7A9rAkmISYFmaZ4HRpZJ4c6ubyjhcXfhyTSIxolS9tOCbS/
	 ig+s+ZpivtkL7nQFxOcOpUgJ7ohCrNPDy8Epo+uv9FfZD9EtVtlvjxqXUoCSraFEo1FJr
	 KGsS6MY1l9UuyiPP1rrSbjsRTqWcdDtqtC1LPTGIzka4XwnutB4OZ4HPEPXsRYwy2VT0H
	 L4KZqFupLLoubmKXrkBX0+7ITXsEJlIvW2m0n0btPN8+/l/1ySa8Q+cB6YNSjxB6j/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479788;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=;
	b=r323n/bjFxtm1m9kKk3KIafV1n0ZDhCT1zDHr1dpxNx3NKvXbd8yFbtiRbSyBP8s2W1F
	 LqM+AW4X+DphiPghd6OF69faTruz1dj0zjCrJlaiDQJX28aC8tMRzpszZGwHwJjadr+j/
	 FPXWguLVTMZDVeznehEB3RTR0u29fATX4VPFYsnOCX/h8qg63wvXg2kEVu8204TkLN/Mh
	 nAsTcc7DkkJHNcDhppADsq/Vywd8I8ZR5CVFG8X0k5wPnbdfczf/hLELyCHViMwF9rJhV
	 /qkMclhVRXuNuGA0ZwIoptuPSgNjeL+S+urx78KLsFJ/aKNQOC3Tjwhfak88+JlslUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=X1pTw+eb;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D2E606A31D
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D2E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=X1pTw+eb
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261020070305epoutp0429218df1573ec58126f8dab2be073d00~gKt4faWub0850308503epoutp04X
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261020070305epoutp0429218df1573ec58126f8dab2be073d00~gKt4faWub0850308503epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792479785;
	bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X1pTw+ebli3wfAMggxgQhkTbt7mMqM6u+hjsNqcDZbjXrRExdMdlY0+t4tCl9Ks91
	 5TrKpQ/9VlXJIqaX3i66Sx3TIx18OgG90q3BipypiSX+UIUVPC9yrZ/PbqUaiFdeEX
	 JimK48ai6X8E2K6/NV2wRU1s/JjFsQ2FUTdTogRk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261020070304epcas5p18dab9bc6b0923e448f472bcfeeeabe97~gKt3mJnoI0096800968epcas5p1K;
	Tue, 20 Oct 2026 07:03:04 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j83K41Lhzz6B9mP; Tue, 20 Oct
	2026 07:03:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173~gKnl-k2Lr1777617776epcas5p3G;
	Tue, 20 Oct 2026 06:55:53 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020065550epsmtip14bbe41349807f059ef71ef62b6db97ac~gKnjZgNmG1278912789epsmtip1x;
	Tue, 20 Oct 2026 06:55:50 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com, cpgs@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 04/14] dt-bindings: clock: exynos8855: add hsi clock
 definitions
Date: Tue, 20 Oct 2026 12:43:45 +0530
Message-Id: <937773018.41792479784183.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020071346.1918640-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173
References: <20261020071346.1918640-1-raghav.s@samsung.com>
	<CGME20261020065553epcas5p35b4a16d8c277025a08378a5b915c2173@epcas5p3.samsung.com>

Add device tree clock binding definitions for CMU_HSI

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 53fc8040e173..21928235d131 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -28,6 +28,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos8855-cmu-hsi
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
@@ -52,6 +53,26 @@ properties:
       Phandle to system registers interface.
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-hsi
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_HSI NOC clock (from CMU_TOP)
+            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ufs_embd
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 5d8b38a744b5..67cd97d8fab8 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -214,4 +214,12 @@
 #define CLK_GOUT_WDT0_PERIS                8
 #define CLK_GOUT_WDT1_PERIS                9
 
+/* CMU_HSI */
+#define CLK_MOUT_HSI_NOC_USER              1
+#define CLK_MOUT_HSI_UFS_EMBD_USER         2
+#define CLK_GOUT_CMU_HSI                   3
+#define CLK_GOUT_SYSREG_HSI                4
+#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
+#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


