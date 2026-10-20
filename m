Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479616;
	b=bGlJdvNiOmHINqsrCTLQ4rsib4oMKsr2tB7exdluCR5sGGWiFvI9HkLi6t8HksY+c9bc
	 8aN3JmjEBggXd4zEKMQRZsB5+x0LDrauOvOXxdHJkh3XHJrSdjuXvh8BJ/fVDRJ1mqUaY
	 ZTJgKL9dEKtSn94gbKaUp0kgsOQwLL0YWb+mxJtj93MowbPfjkV0tfY0ktQ7JxBembQ0s
	 +9L8CSyQz9d5uE2tZ2ZrlfbMSWgXoitBlnrOp5Mg/qaS883AQtBhCZU7SMUmKNKpKCFaz
	 jzXaN7d2v+vzS0gypGBnbVAPOI4PZIdthdH4JfayhQqKFCPttdCYaSj6vJ+t0yMgnlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479616;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 X-Hop-Count:X-CMS-RootMailID:References;
	bh=/mF0XBJwiryCyMPrZszn5OendoJ/4n7hQYYsJtVWvy4=;
	b=VcgHaEkWff9lCgEUToq6gnM8cHFNLg/U2etuOD9L15LhEE1smgi/cCF1W3Pkx5TQZoKA
	 M86MJ5Znu/smU2drUJ2u7TzvpPRbgKMcnnZbM3y5Hc8K9IDhTwpzRB+7FDRwZ1xYSJ6dR
	 6aixsuAZid8T2OsJLb3WH0VFuLZcV/AF6G+BF38lHiLMceBAfMIlFkzUMLYh1sIfb7GE+
	 wculTEX7yHgQMfC6IUF7Pe8pTmzWPk/r/daxuz2vB2HJ7mihm/8OBEu2OCPc/ELvCoziO
	 xfHV/yHsgIp0rwQMWkIpZdg0Mx7Znj6LpC3woxYoFHNoC816qIHMPbtmD6kDnBowlVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=S8J0B0hA;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0BB606A31D
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B0BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=S8J0B0hA
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261020070005epoutp019eab6723580bd604bbb9fc58f022f091~gKrQ4QyHF0152501525epoutp01t
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:00:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261020070005epoutp019eab6723580bd604bbb9fc58f022f091~gKrQ4QyHF0152501525epoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792479605;
	bh=/mF0XBJwiryCyMPrZszn5OendoJ/4n7hQYYsJtVWvy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S8J0B0hAWkkfVGrFmtnS9p3ji5Axjx8O51TuRslimSA7cOBQA6tICN7UriPVwRm6f
	 I6aZ4UO5MnFFN/Yq+hxJeVxpUPfvcXMKnCj8E10aJBNdzryJaZubEvyOR5CjaDWNm7
	 Qky0Jd74FhrXMtqKJPzTT79TnL6fYEFG3MjwAunY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261020070004epcas5p2b58ce68ee17c82fb357d402d9cd32497~gKrQYQ4gs2277522775epcas5p2Y;
	Tue, 20 Oct 2026 07:00:04 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j83Fc4Yb6z6B9m4; Tue, 20 Oct
	2026 07:00:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261020065549epcas5p4838c35bfe29c5a526c2fca12fbf3d1d2~gKnjKTOXn3267732677epcas5p4P;
	Tue, 20 Oct 2026 06:55:49 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020065547epsmtip1a310620e3e4f5224aca386398b376dc6~gKngkgShU1560915609epsmtip1M;
	Tue, 20 Oct 2026 06:55:47 +0000 (GMT)
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
Subject: [PATCH v3 03/14] dt-bindings: clock: exynos8855: add peris clock
 definitions
Date: Tue, 20 Oct 2026 12:43:44 +0530
Message-Id: <1771243284.81792479604624.JavaMail.epsvc@epcpadp1new>
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
X-CMS-MailID: 20261020065549epcas5p4838c35bfe29c5a526c2fca12fbf3d1d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261020065549epcas5p4838c35bfe29c5a526c2fca12fbf3d1d2
References: <20261020071346.1918640-1-raghav.s@samsung.com>
	<CGME20261020065549epcas5p4838c35bfe29c5a526c2fca12fbf3d1d2@epcas5p4.samsung.com>

Add device tree clock binding definitions for CMU_PERIS

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 11 ++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 486b7347ad44..53fc8040e173 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -29,6 +29,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos8855-cmu-peric
+      - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
 
   clocks:
@@ -73,6 +74,26 @@ allOf:
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


