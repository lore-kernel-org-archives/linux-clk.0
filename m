Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016577;
	b=wpQRc/cEtWyEWbBgvMGQvAnR8muJsgoZhY8mpj48MYYrjghzPQdGJ0nPPkJS6K/v3cSX
	 bFI8VGDGdvwoXfVmBYsC6d+cUmih0o6kroHYFpn0m7vAmNbdRJfqp5tUQra13gQuqkX6E
	 nlEY5fjS+L5dOmCJJ7y3TPPMHqi9J+/pRMQOR8EQ30RKs3mVqclrxShedg6FnHzxPq5PK
	 35F+eGT0mjVx/nBtW14SlTRfQOp0BvD8OWxdoy1dfljs8rKKMyOo19aAW2TF4PHgn/xKE
	 ApF4XByZO/Ey3PkT/dXUuYTh5UmrCxTcOhP43m9Vxs5xoH8RM1OLA/U9szgLzBhIhTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
	b=mJo7C9Hf8qmyCMfbVD4ol4NV0RsGsCte3Vb2XA53DsYb3L12q3sq14D/pk3UYTTxtTKy
	 09DyD4mDQOGqA0C0GtIRFykUyVt0e/RNpuSI3mexOm+xvOP1P8tBIH8cn5dyfTrqpuPIQ
	 z4J2+B4pNekCBQLfrz7M6NkijqGuAt7xilxkanajaiXTgqyOZ2chlgz7/2gNNiZPMm2Gx
	 AhmF0BDmxCmQlDoZfC1YlY4g69xO3C1nwW/jRyr2e7E88COSLoaBJl/R1Yj0zcvtNKn+g
	 pJro82umE4lBPMkl/okUWe4QKJBMQWKMvELUbAauCgJwpOdiZnYbtotbpW6y1dr3tlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="IQs2v/0j";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD0606A334
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 12:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37FD0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IQs2v/0j
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso22198405e9.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 05:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016576; x=1793621376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
        b=IQs2v/0jC8aDeoR5P+VbANJ7GL91aY0Nfs2pVHNy3kzjK3e0LNrpttJ2VkKaCz60JU
         SJJu2wEmAqxG8I2srwK7U6Cvg2noGm2Yax8ylVX/AcOsQHasnUVzieRYN2P7l8ToyrgJ
         zxLZN9DcYU7hQ6muYRJ4VTvNwJACEormO7ZV+tzApPKQ20xuYiEaqTudSHuxDqcktWN8
         mCohN/TFVUZ0+c89kiIn6RgTL60cZ4EmzX4WMoDyBVVscwyrpkaTUYBf1BpwG5PtlNyZ
         l4D0/bVzD1TNFNuOvmDNPE23gdPz58SGq6iMr3/hE1lYTiqX2URfk1wkIC+QNh9IcvtL
         r76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016576; x=1793621376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
        b=YlKUn2LMOqm16+XxpVrigGJYOlAzUCkay9Mww2rBowW94MeekfglIDZylUKXomnGxw
         hyUxfplfn4GA3QfVQk8YP/y3LxmFJxGGRLEu5+1PC2AgwL/3mOuTRb6QHRgPIqB9B/Zb
         9hAQiy3Lc/1qTYJkMFzNV8+oARrnzkK4OE2mkJPx0wdtuBW1z6R2QB4u6zHFt7AoMfNQ
         N7IJW7j4O5LJNv8GrVNPYQ8XzkHiGcltqk3xehvdk4XkKL6/TPBlDz2BKzBae3NNc5X9
         M9jMn1F9g/jCnQfQxmaJMo6NUZe+Ga9OTLy0UEkxqyDC1F8jk4cMU7Dv/fYOLA1IW1tG
         akJg==
X-Forwarded-Encrypted: i=1; AKwUvBwE5k/T+FIWCjF4InaWLiRtgU6uB08RoTCr01A76QssqQdOglfSj0SLacdpbRZWjc+NfVlOMH/vIrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXzZWfUTQQlQuCkc8btDrbZirQbTxo7hXDZYo3erpjuie12z+g
	BiKB/fz9FTpqywoM1xJLg8CYxmZQzV17/PAM0t9hE2k8dnIkMfCOxUSw
X-Gm-Gg: AYBFou3PdCo4PuN3z+jPdHSZsRSRHSXMqgwf8lCjZP2xT6Zp8LQEMQMrFOmg4e/wrqm
	3tfYGAWFERPwg8W7/PhJc+/V6Nw+0tT0Z4kXmQDX0oVVafWKDT+xztDmJ2LcczoOepF6GVhh6Tj
	bFO7sQ0rZ7pYWdAqAo7Z84g4srGup3JDWxuJhFFhoZS3fdGTKO59LbvS5blsOiSzjNqSDn8be5l
	Dj+oblmkYFGsTOsiBOa9QwQIsRpRtUag5N10q4Tmc/v/l2btVDa7xCUibGvizC4d1tl4iZ9jXqz
	EaFIaP6+1GxgWdnRfxrnXcdwhbmFg1niQFsR8poa4IPKNt0PVJmIEF8F+1qiont8y4JYUdnEVFb
	o1GtJqhQOrE95oYRJTfXI2rJqqBh3ZpVsdGoak2NxY3nfKMgsj/Dw99fJG9MKjReOUse5OGn3eT
	iIeNu9Ntj+rbA4ModQZwlhhHPZWVYBI/j5bGxSjyNWNOMi5kvEhonHHTpxtOCaVeGpRIbswkCSk
	OBhWepWpv8T7q0IjQeqtjeOcmsEm+0onKXyZhBVPLb61JSoqqWgel55wr6wsRaIxspKjL1aDrGG
	m5rdSRWeZ4K5NI5yS+T5vOHGxyYG3OPIr5gM657pKILoJgKX0t4vrr/02wLjWIcdl7wNYivKRPK
	m08Tn
X-Received: by 2002:a05:600c:a012:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a35ac95b2dmr110048655e9.16.1793016575542;
        Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Mon, 26 Oct 2026 13:08:15 +0100
Message-ID: <20261026120920.1667982-4-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

Add the CMN PLL node, it will be used to feed the required fixed clocks
to networking subsystem.

CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- Drop the _clk suffix from the GCC CMN PLL input names.

 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..b08efc959379 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
+#include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
 / {
 	#address-cells = <2>;
@@ -15,6 +16,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <48000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep_clk {
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
@@ -257,6 +264,18 @@ mdio: mdio@90000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq8074-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ8074_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		qfprom: efuse@a4000 {
 			compatible = "qcom,ipq8074-qfprom", "qcom,qfprom";
 			reg = <0x000a4000 0x2000>;
@@ -369,11 +388,15 @@ gcc: clock-controller@1800000 {
 			clocks = <&xo>,
 				 <&sleep_clk>,
 				 <&pcie_qmp0>,
-				 <&pcie_qmp1>;
+				 <&pcie_qmp1>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_CC_CLK>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_NSS_NOC_CLK>;
 			clock-names = "xo",
 				      "sleep_clk",
 				      "pcie0_pipe",
-				      "pcie1_pipe";
+				      "pcie1_pipe",
+				      "bias_pll_cc",
+				      "bias_pll_nss_noc";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.56.0

