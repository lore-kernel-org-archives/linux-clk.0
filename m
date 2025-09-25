Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12FB1E832E
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804987; cv=none; b=p0ISrslSbo4dURoPEtXxG7Y2+N0cANjkUEY9Ra7dpkbgUU7yV5zVfNwi39XJdm2nwptJYrMICIM/J6f5UGZzHhQ7EStnzO26W2d+GWRD0GXDTBImQiLPdJPTkD00G5QLFPc9JSgOiqOpL3FO26YTClADKba+1ZZlsAQl/if3jMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804987; c=relaxed/simple;
	bh=tqCczwitiJZp8F4Vzz6Z79TJ9m0TRwjeobfrVc/L3F4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=j/ElelI72W2kcAdwManwoDtbVEWoHKtqPeU/xuUm7fq+84js9Lv2gdfPhImi5JUhVkirwE84gllZhJK8DrvjONZm58x1D6MY3NVFBPd2kRhR8lhJmKaGqLInNnMEh+fD9UOPrsuNJyQqDpUJTuYp5BuiFWrdkocehHjQUPsdglc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ftnoyTJN; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ftnoyTJN"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250925125618epoutp028d00682bd458a6732ee54bdcef933bed~oh88xG5Lq2292322923epoutp02T
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 12:56:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250925125618epoutp028d00682bd458a6732ee54bdcef933bed~oh88xG5Lq2292322923epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758804978;
	bh=sbBTIKlUsm+fUMo3p93EQYKgatFHNs8/LrncSrVknJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ftnoyTJNDnuE3wMklZVGTR3uyvAsjzVEtYe7tttcG0/aF75gofmPA9Ez6+DPo+Glm
	 O1bwAks9mZkWFIuPctC3pKWszKdfzG+gXYNu+GUdToYdk+8ec74GStvSU+Jz3kpoD6
	 Q98te0MBO39beQNyGE1d5nkWUOQPP+gNqQeluhRE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250925125617epcas5p258f1d5eb1ab6ceb3591d600ccf2cb517~oh88IYSCa1889718897epcas5p27;
	Thu, 25 Sep 2025 12:56:17 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cXYcc5b6Bz3hhT7; Thu, 25 Sep
	2025 12:56:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250925125616epcas5p37346312c6a788a5398212f671d8a369d~oh86sofha0855708557epcas5p3x;
	Thu, 25 Sep 2025 12:56:16 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250925125612epsmtip26569cab259c9303bb01922db01796ca7~oh83iUIpg1532515325epsmtip2S;
	Thu, 25 Sep 2025 12:56:12 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add mfc clock
 definitions
Date: Thu, 25 Sep 2025 18:34:55 +0530
Message-Id: <20250925130457.3476803-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925130457.3476803-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925125616epcas5p37346312c6a788a5398212f671d8a369d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925125616epcas5p37346312c6a788a5398212f671d8a369d
References: <20250925130457.3476803-1-raghav.s@samsung.com>
	<CGME20250925125616epcas5p37346312c6a788a5398212f671d8a369d@epcas5p3.samsung.com>

Add device tree clock binding definitions for CMU_MFC

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index b2dfe6ed353a..5bf905f88a1a 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -39,6 +39,7 @@ properties:
       - samsung,exynosautov920-cmu-hsi1
       - samsung,exynosautov920-cmu-hsi2
       - samsung,exynosautov920-cmu-m2m
+      - samsung,exynosautov920-cmu-mfc
       - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
@@ -247,6 +248,26 @@ allOf:
             - const: noc
             - const: jpeg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-mfc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_MFC MFC clock (from CMU_TOP)
+            - description: CMU_MFC WFD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: mfc
+            - const: wfd
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 0342a988565a..970d05167fc6 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -300,4 +300,9 @@
 #define CLK_MOUT_M2M_NOC_USER           2
 #define CLK_DOUT_M2M_NOCP               3
 
+/* CMU_MFC */
+#define CLK_MOUT_MFC_MFC_USER           1
+#define CLK_MOUT_MFC_WFD_USER           2
+#define CLK_DOUT_MFC_NOCP               3
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.34.1

