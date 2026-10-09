Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFFE4E36C1
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546243; cv=none; b=Y8kGedrLtfxq3Jrn1658OQ7B8YgbSZ9CR2+LvFWAzJGADGRCD6rwUN4cJBVk/cT7tYhAeBzYz+MY0v2YgTGmGJLbRNRqTxiSwle+Vx8BycUr/4a9v36bOLWPpk240QfScOB1edXzxupCPNd4j1ltPd79G64JrgzG153pD3OKrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546243; c=relaxed/simple;
	bh=YSlC7t8+ztggUkgDduTfP89/sfj67Kb+YBOgmwNqFZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=awreutVeb0j0I3hKy+35XGRJo8v2aUPPUCqD0oEj+gJ9wug6FekgL7UP8MzCpLl8Cojsu+6wMolEuTL/9FNE0MB1EC6/3WlNxqXWIlHJpQmHSiXUL7FHcdNGTrxW3Lx7ZoYee7X6+olsQ2yYYfKXBQJqPhXkonOVITkMWQVkpYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nkvXfCRo; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nkvXfCRo"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261009114343epoutp04f5eb92daa227ee9f7ff9d09eef9faff9~c2cxBKrZM3087130871epoutp04f
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 11:43:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261009114343epoutp04f5eb92daa227ee9f7ff9d09eef9faff9~c2cxBKrZM3087130871epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546223;
	bh=I4IF84AKQgoIUQqEy8aM/ont0mARoi71FwMJKl7TtHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nkvXfCRoACFBJ+fFawTOrQPPf8Lemml2GSc2xvcZ33wF0CYXWmf6JFSbAhHnu1Nzd
	 WWDnPJsWh2r7ZnorwsDDR40OFf1aooa4uGmgonRNA6xWLj/vFpXo04dEwMGoHveKRh
	 RFGCopTiEeDvDXdFgUKoTcjQ0iMlZEd4zLH578cE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261009114342epcas5p2ce26092595400dbfc934291446d56bc0~c2cwiaWb-2795927959epcas5p2x;
	Fri,  9 Oct 2026 11:43:42 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j1Q3x3lc4z3hhT7; Fri,  9 Oct
	2026 11:43:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2~c2cuFGQsn2880428804epcas5p43;
	Fri,  9 Oct 2026 11:43:39 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114337epsmtip254c9cac88316ba16df247f09957fa887~c2crvqve01160511605epsmtip2o;
	Fri,  9 Oct 2026 11:43:37 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 03/14] dt-bindings: clock: exynos8855: add peris clock
 definitions
Date: Fri,  9 Oct 2026 17:31:26 +0530
Message-Id: <20261009120137.2801911-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2@epcas5p4.samsung.com>

Add device tree clock binding definitions for CMU_PERIS

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 11 ++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 073c19debd0d..62277c67fec1 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -29,6 +29,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos8855-cmu-peric
+      - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
 
   clocks:
@@ -68,6 +69,26 @@ allOf:
             - const: mmc_card
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-peris
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERIS GIC clock (from CMU_TOP)
+            - description: CMU_PERIS NOC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gic
+            - const: bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index cd445bb45070..5d8b38a744b5 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -203,4 +203,15 @@
 #define CLK_GOUT_UART_DBG_PERIC            25
 #define CLK_GOUT_USI_PERIC                 26
 
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_NOC_USER            1
+#define CLK_MOUT_PERIS_GIC                 2
+#define CLK_MOUT_PERIS_GIC_USER            3
+#define CLK_DOUT_PERIS_NOCP                4
+#define CLK_DOUT_PERIS_OTP                 5
+#define CLK_GOUT_CMU_PERIS                 6
+#define CLK_GOUT_SYSREG_PERIS              7
+#define CLK_GOUT_WDT0_PERIS                8
+#define CLK_GOUT_WDT1_PERIS                9
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1

