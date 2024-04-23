Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CA144306
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905427; cv=none; b=Z8psoCA0XRKp4907czlaAbboITUimZGE5hwpkiBO+yG3/0cX6MeYK+mmPyThCNEWlw0wxFQKY1l99aSdSmWNHMPcpSTpJwmrci6GSL7FgelB5/PpN3IUqcg6J/KfUX0SOye1ycWDGJo8kx0G4IBv5HtzDNJSJAMzm0T7Tj1H0QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905427; c=relaxed/simple;
	bh=+RaAFBfD8JBvVGyPOAJvYEVcisOAJ3VwqXUMi6+CcIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkYYDr5NjsQ4B44I8x17PzhMVRfFo8wr5ET5dpk+99lZzBxRKN2oGd1jALNpuGanXONIUy7GKrFVUJlOAQph/fJQTxo6wx/T4gqAg71acrDi5wlVVAp1rTofECJDc540UKxie6LLTWPtxYRdENtpqrUZVLvzgABworZQSLf7TZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rV3tZUDe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rV3tZUDe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41af670185fso920355e9.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 13:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905423; x=1714510223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZaHsEnykzbkaLyrdeRNzCHKySUXlEaH/7u1GIxPjlw=;
        b=rV3tZUDeRsZQLxa6/c4JJAy85SoaJt6O+z6M3tnVewuBEOPmTGi/PkmRdTiC+LGvgD
         3TkbT4fTxUbHlZm3TFYrcJEDeE4QWyJhA6TPsP6mhsf2MhO2D645RRKk2n03PLMVKypR
         RLd3fJPRIozLsWZBvchBqLykOySUfvtTihH+uimEJp4kpqOD7+246HEOMqQj+GXB16XQ
         auE5cNpD4MnGtepVqapdb3k0Uzvg90F0sayoDxWVB0xTWhQqoe1BtVggO9yjZj5Ll72S
         0t+TA//6WJMeCvVZHFXc8xcKUlxOyM0JgTKGmyfSusAYuh2RGyzRZFJyWdIUR8RRNxGU
         YjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905423; x=1714510223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZaHsEnykzbkaLyrdeRNzCHKySUXlEaH/7u1GIxPjlw=;
        b=pSU4ge06GGxbAgIQuxUXkkHIzksRUjGk6Dk4ldS7kWiTAijgg9cpKzbvI69GDO8KkB
         rwD9kVsIGXjiZ1I8LoklK7X9UmQsgSW2te1YM5KKDMLA46DdbEfAuc0R24vqqMoDVo1I
         +9c6jrbPOeNLcl18RMa5BFKkczHY2XLxRmSnkjgP8lEvl5jpNPo8YCtXzF+UQ72P7fPJ
         q24WzbBKdxwM8R81sGo0L/XcCOTmlkmkTLUpV7CGqgWULEq17CkI9SFxkeYnoKkEdYbF
         l9bnxM2byrICY3GAThB4KcEjS7N/yAabOfdZzJa5TzbMhqvVjXC58voAy9fjWIoT7oOa
         z3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUH4bHZDKfR5Mlc/ohjyY/KuaBH/Aw3BrjkbCwFwvo76/Hlz62ls9rplybObou22iv3EnspgnfFFpYpO6qLxGRviip/TunRNNtL
X-Gm-Message-State: AOJu0YzAW6U+pgYgpbGP6657gUj4I/BSE3Kx770HgRY0tkklNAk57fdt
	krnRBGESN2ubDGMIVcUqQHxqJ0Nzui1FYZ/XiGXSUeGw7WYtNpYSCaf0hSCIsII=
X-Google-Smtp-Source: AGHT+IFV4foP1YjTUjHVZLvlZh3ThdkL/KFKrbzjBs05jhoRtVosblg5RiTrD+m1RmUQ7V2qNroKQg==
X-Received: by 2002:a05:600c:4f49:b0:41a:ade4:4168 with SMTP id m9-20020a05600c4f4900b0041aade44168mr302091wmq.9.1713905423609;
        Tue, 23 Apr 2024 13:50:23 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:23 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 06/14] arm64: dts: exynos: gs101: Add ufs, ufs-phy and ufs regulator dt nodes
Date: Tue, 23 Apr 2024 21:49:58 +0100
Message-ID: <20240423205006.1785138-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the ufs controller, ufs phy and ufs regulator in device tree.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../boot/dts/exynos/google/gs101-oriole.dts   | 18 ++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  | 36 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 6be15e990b65..fb32f6ce2a4d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -53,6 +53,15 @@ button-power {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once S2MPG11 slave PMIC is implemented  */
+	ufs_0_fixed_vcc_reg: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs-vcc";
+		gpio = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
 };
 
 &ext_24_5m {
@@ -106,6 +115,15 @@ &serial_0 {
 	status = "okay";
 };
 
+&ufs_0 {
+	status = "okay";
+	vcc-supply = <&ufs_0_fixed_vcc_reg>;
+};
+
+&ufs_0_phy {
+	status = "okay";
+};
+
 &usi_uart {
 	samsung,clkreq-on; /* needed for UART mode */
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 09044deede63..baf630b13154 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1277,6 +1277,42 @@ pinctrl_hsi2: pinctrl@14440000 {
 			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		ufs_0_phy: phy@17e04000 {
+			compatible = "google,gs101-ufs-phy";
+			reg = <0x14704000 0x3000>;
+			reg-names = "phy-pma";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+			clocks = <&ext_24_5m>;
+			clock-names = "ref_clk";
+			status = "disabled";
+		};
+
+		ufs_0: ufs@14700000 {
+			compatible = "google,gs101-ufs";
+			reg = <0x14700000 0x200>,
+			      <0x14701100 0x200>,
+			      <0x14780000 0xa000>,
+			      <0x14600000 0x100>;
+			reg-names = "hci", "vs_hci", "unipro", "ufsp";
+			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_ACLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_ACLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_PCLK>,
+				 <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
+			clock-names = "core_clk", "sclk_unipro_main", "fmp",
+				      "ufs_aclk", "ufs_pclk", "sysreg";
+			freq-table-hz = <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
+			phys = <&ufs_0_phy>;
+			phy-names = "ufs-phy";
+			samsung,sysreg = <&sysreg_hsi2 0x710>;
+			status = "disabled";
+		};
+
 		cmu_apm: clock-controller@17400000 {
 			compatible = "google,gs101-cmu-apm";
 			reg = <0x17400000 0x8000>;
-- 
2.44.0.769.g3c40516874-goog

