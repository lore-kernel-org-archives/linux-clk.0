Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479789;
	b=tl4JvEFQenWLtKaEWlQjzs4EdIl9I1+WsGKA/eyFGHM/kOMKta0ADXskZik8vxRMTTAB
	 n2dontECdigdn1XF4amWi5fftZMZAtaKowLXCRvumX0VKQTySi+vUzUo71z1bkIUaR/A3
	 jzkfNIZuCYegyCBMMV9+ed1/2O0MkYicNO/oI0actaTTrlhPyK+g8XGPh5XRLxhsqZa7q
	 yKnrz97bB+XShYIX6w1TnoSnHjn6dVQYuUkurn/mOAidIgQh12/ez8RmYv7tZTHEeVmw9
	 D96vDbG7kEiR/A7X8KGFx1mfYQyV+uTDifaiGNc4vZPU8VYmYOWqrn9h+9svgCGPfPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479789;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=qhFh7zT1+bzubZ3GCKmZli8T8ugrkRfM7QpmtOWqwF8=;
	b=imE4F5H2SFdjqrE3B8SdTvm8Rded9ZoSmCCE/sJ7vXIdQ6n60S8zmzPwyD+N57RULHpo
	 3P2bdRNmSyy70AABRHAxBjdYeRMbd6UgE/UMbgrdnPelKBIEClQcia4yUZVFkXUvbGrJn
	 RVVvEC641NaV9zs/2t5LcLS3Qxhbeab7nLshcrx+wg8pK99txcyqpRpietDKOvDsCMP8h
	 3c9+LpieoCfvE4L+x2RbNH3202iFYRdNNg04h10CIu+DJCt8ikphCifdU091bE9VOkYKV
	 gaivlTf033fbpIdid37ru40Y17+XZ7DIonb694prNveOUrpH7D7vmhReygpL4WO10wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=LB60c4Db;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71B2606A31E
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D71B2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=LB60c4Db
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261020070305epoutp049d561b70647300467e9b8b380479bb57~gKt4ndQoG0850508505epoutp04b
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261020070305epoutp049d561b70647300467e9b8b380479bb57~gKt4ndQoG0850508505epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792479785;
	bh=qhFh7zT1+bzubZ3GCKmZli8T8ugrkRfM7QpmtOWqwF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LB60c4Dbh0EpkWpRUGkTcugt5S2qEmh0/3qhtzc2eLIKPjbBU4s7fIVj9+FXjZksv
	 FmW/DD6O2cBW680Psq+A8O7NGDv1t4ji7x5G1wY343iNozIuvOqDqtfwTCR1s/Bius
	 tKw4Tkd3NmHk85fmPbirGY2rGAZz2fIAZ7GLF2nM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261020070304epcas5p1c5e785723c85d884ff77d65018de206e~gKt3z522f0096800968epcas5p1M;
	Tue, 20 Oct 2026 07:03:04 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j83K432Nfz6B9mL; Tue, 20 Oct
	2026 07:03:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020065556epcas5p22c45c425489dfa94cd8f729a38106737~gKnpFVULW2225722257epcas5p2y;
	Tue, 20 Oct 2026 06:55:56 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020065553epsmtip1a93cea274de4267621cfa6242e08785d~gKnmPDRZp1278912789epsmtip1y;
	Tue, 20 Oct 2026 06:55:53 +0000 (GMT)
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
Subject: [PATCH v3 05/14] dt-bindings: clock: exynos8855: add usb clock
 definitions
Date: Tue, 20 Oct 2026 12:43:46 +0530
Message-Id: <927327686.61792479784418.JavaMail.epsvc@epcpadp2new>
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
X-CMS-MailID: 20261020065556epcas5p22c45c425489dfa94cd8f729a38106737
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261020065556epcas5p22c45c425489dfa94cd8f729a38106737
References: <20261020071346.1918640-1-raghav.s@samsung.com>
	<CGME20261020065556epcas5p22c45c425489dfa94cd8f729a38106737@epcas5p2.samsung.com>

Add device tree clock binding definitions for CMU_USB

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 21928235d131..c68a64eb35c5 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
+      - samsung,exynos8855-cmu-usb
 
   clocks:
     minItems: 1
@@ -143,6 +144,26 @@ allOf:
       required:
         - samsung,sysreg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-usb
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_USB NOC clock (from CMU_TOP)
+            - description: CMU_USB USB20DRD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: usb20drd
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 67cd97d8fab8..f4261956ab4a 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -222,4 +222,12 @@
 #define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
 #define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
 
+/* CMU_USB */
+#define CLK_MOUT_USB_NOC_USER              1
+#define CLK_MOUT_USB_USB20DRD              2
+#define CLK_MOUT_USB_USB20DRD_USER         3
+#define CLK_DOUT_USB_NOC_DIV3              4
+#define CLK_GOUT_CMU_USB                   5
+#define CLK_GOUT_SYSREG_USB                6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


