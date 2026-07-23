Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C222ED154
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 01:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769883; cv=none; b=PEpYzBi7eaXd+2JgVq61PXWV+arcpV6IKxSAUuzmd+WFfdCtBwPgHXQq3ztnqWZ4WVyfNkr7Pw+3NvElcvxb4cSUfxGO/DV/lk1Jh5GjRzeLsSacuAKx5Rz4BztT+NtFyNlqkByjybLRJTMj+bwT8zZVdoqNDT0SC623Qjg2SkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769883; c=relaxed/simple;
	bh=hTd3h3VxTALSklNhT0IksuMtRzrl+XxlcJ1+mdrTpZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5irCjaRcSRqiZ9ip8dJBQlkgS7Wx39TQrKU3SPiHmWHb76U4R7+tqdYsXqiaeMZQIlyxkFzXAqD/dVP80vob86eVeyLG5SrvilF1hDIsIXaJu1Dk4Q59q+Qh97afUjzL5YZBbCqJDMkDsQmPwXEKde61OvqJ0pdJgNafOwoCRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSvgpPlR; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSvgpPlR"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66771ded50aso58749d50.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 18:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769880; x=1785374680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLowm9yPPCKZHT18/X3l7xeAM/unwsKjqK8LU5h41mU=;
        b=bSvgpPlR+L069yIw4kHaf5l2cRuWhLY4ZVyeNRaA4yqFArCH+SLe+Wo9OzcC2fHlOz
         60fmurVM7m0ZJwaU0meTPhbiIulV5cao8Bmc4KzcgqMxWCkfd+GLx+MXAiVWpG/aNgpk
         OcYQgVvQi6nvqRjmLtdeau2405wwJvXWP5IGJrZx9/WQaCgSclV3H9tbFJqwdNB3eqLw
         cUSKw4PJYdDVrPfonnPekmk39ii5RTTWCkANj+Y0D6+1v1zXb245FovxG3SHnYxaFhC7
         EYWy/JWBKU4BkYMSXCASwip5+InY6P6IY1of+CGkx2UqXGHT6UjELeIKuDp4mwl57KXF
         yl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769880; x=1785374680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fLowm9yPPCKZHT18/X3l7xeAM/unwsKjqK8LU5h41mU=;
        b=iaMbsIetwx06pEDNZeWfpoJ79UxsiTrxbtcorGgNoa/F6umSdOUwnY/m3B9pHh36xE
         8ZgAiyASIuR407vjyvEfhAhigNy3sW0/gTznnduuYD5m59idBWSqIC9XUU+8K7J4JKrX
         EVY6IUj5MZsyw0HKrhrHpnY2NA8DZ6uYHyJq+1Z3suIXiFUEMnGyAGM+Ja+vjjiGX/nJ
         k9lmT1CKhuQJbM4uUKtABE19jTRU3ULZSj7NYGFfiLpkq8fwKKwiUWMwrSgEViPn2G7g
         SMx2AWPw7GsL9J0qwLqr6wbzbOUq5OSTVG7MYz/m+RB8ci/bucrt0OWA/1b12J23d3Xq
         OB2g==
X-Forwarded-Encrypted: i=1; AHgh+RrZo8hyV1EWanlpPxO2+K1+aSILUdQEvBru/Rjj7dDP3mlzUzC29CYZqkLnhCsKzqKxLf0Q80iuOHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHTAFSJaEdTXUJjb7vfv2H9aWzuZZu162j9pMcxpwYFkPwLcm
	GYpZWJK/HNAL6SJ3mKrY93UniGvhs4w8EL6xoyH5VbGhJcO8P2XMXiLM
X-Gm-Gg: AR+sD13YZmo9L7S4SpuN/69zQbKLsLsANVPPnw4rW4b7wPsrDM8ma5GabSJAu2a2IiU
	coy04vmxnslGBTdSjm4zEIez4yObXiqOo0eFYtXH94IVThRPVuTCIBDIviuqmrZLHIjAjLNj+k1
	8YY8zau45TASaemcuKFoaoz27ZHRpsc7ISNilTu15sS63VE5hgIee73l4FaHtfT8NMdFF0kPJLV
	clclD/cHLPQDe16/iu44on6+ED5+DeJ6LdIswBA4MT6I2XkYMasWCNE2UmaFNb6uTS9IZbapnfD
	iy5WxRhUoE3SUvH6IBevVNHJTlSM1rFh5NuHGrrsjrpcDzOC6wB9DbHbxbgVAiTo6WRLno96MVi
	+xXGwNTLL719+jIH+BfBXdR/rnArec31RyOmj3i1RHStbre/jpgiIe6Iy4bsUUNlZGfTnWT7do+
	3SZ1Lvgi3GsyzKVE7+UmCwDSNeRIRjQj3Gb54hVc0=
X-Received: by 2002:a53:db08:0:b0:668:9a6f:3373 with SMTP id 956f58d0204a3-668a4c48cd2mr229097d50.27.1784769880440;
        Wed, 22 Jul 2026 18:24:40 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66890521188sm2310775d50.1.2026.07.22.18.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:40 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 3/3] arm64: dts: qcom: add initial Motorola Moto E4 (perry) support
Date: Wed, 22 Jul 2026 18:24:31 -0700
Message-ID: <20260723012431.48499-4-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012431.48499-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012431.48499-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

Add MSM8917 and MSM8920 board files for the Motorola Moto E4 (perry)
sharing a common dtsi, shaped against in-tree msm8917-xiaomi-wingtech /
msm8937-xiaomi-land so every referenced label exists on mainline.

Initial subset: regulators, eMMC/SD, USB OTG (gpio extcon), gpio-keys,
Synaptics RMI4 touchscreen, BMA253 via i2c-gpio, WCNSS Wi-Fi
(qcom,wcn3660b), PMI8950 WLED.

Deferred (missing mainline SoC/PMIC nodes or drivers): DSI panel/MDSS,
IPA, QDSP6/WCD audio, PMI8950 FG/smbcharger, modem/ADSP/Venus remoteprocs.

Validated on XT1765 under postmarketOS with a fuller fork DT carry; this
is the trimmed upstream-first subset.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: rewrite against mainline msm8917/pm8937/pmi8950; drop fork-only
 nodes]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../qcom/msm8917-motorola-perry-common.dtsi   | 412 ++++++++++++++++++
 .../boot/dts/qcom/msm8917-motorola-perry.dts  |  20 +
 .../boot/dts/qcom/msm8920-motorola-perry.dts  |  20 +
 4 files changed, 454 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..d92bd2863ef2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -109,6 +109,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-tiare.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-motorola-perry.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8920-motorola-perry.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
new file mode 100644
index 000000000000..1870958976fb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
@@ -0,0 +1,412 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Catherine Frederick <serenity@floorchan.org>
+ * Copyright (c) 2026, Aneesh Pradhan <aneeshpradhan@acm.org>
+ */
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "pm8937.dtsi"
+#include "pmi8950.dtsi"
+
+/delete-node/ &qseecom_mem;
+
+/ {
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <4000000>;
+		constant-charge-current-max-microamp = <1000000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* Early console deferred with MDSS; panel driver not upstream yet. */
+		stdout-path = "framebuffer0";
+
+		framebuffer0: framebuffer@90001000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
+			width = <720>;
+			height = <1280>;
+			stride = <(720 * 3)>;
+			format = "r8g8b8";
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_BYTE0_CLK>,
+				 <&gcc GCC_MDSS_PCLK0_CLK>,
+				 <&gcc GCC_MDSS_ESC0_CLK>;
+			power-domains = <&gcc MDSS_GDSC>;
+			status = "disabled";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		key-volup {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
+	};
+
+	/*
+	 * Bitbang on TLMM because BLSP is TZ-protected; sensors are normally
+	 * proxied via ADSP firmware.
+	 */
+	i2c-sensors {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>; /* ~100 kHz */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imu@18 {
+			compatible = "bosch,bma253";
+			reg = <0x18>;
+
+			interrupts-extended = <&tlmm 41 IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply = <&pm8937_l10>;
+			vddio-supply = <&pm8937_l6>;
+
+			mount-matrix = "-1", "0", "0",
+					"0", "-1", "0",
+					"0", "0", "-1";
+		};
+	};
+
+	reserved-memory {
+		qseecom_mem: qseecom@84300000 {
+			reg = <0x0 0x84300000 0x0 0x2000000>;
+			no-map;
+		};
+
+		framebuffer_mem: memory@90001000 {
+			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb_id_default>;
+		pinctrl-names = "default";
+	};
+
+	vdda_touch_vreg: vdda-touch-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdda_touch";
+		gpio = <&tlmm 59 0>;
+		startup-delay-us = <300>;
+		enable-active-high;
+	};
+};
+
+&blsp1_i2c3 {
+	status = "okay";
+
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <65 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&ts_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
+
+		vdd-supply = <&vdda_touch_vreg>;
+		vio-supply = <&pm8937_l6>;
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+/* Panel / MDSS DSI deferred until the panel driver is upstream. */
+&mdss {
+	status = "disabled";
+};
+
+&pm8937_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8937_spmi_regulators {
+	/* PM8937 S5 = VDD_APC (same pattern as in-tree msm8917 nora/wingtech family). */
+	pm8937_s5: s5 {
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1350000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&pmi8950_wled {
+	qcom,current-limit-microamp = <25000>;
+	qcom,num-strings = <2>;
+	qcom,ovp-millivolt = <29500>;
+	qcom,switching-freq = <800>;
+	qcom,cabc;
+	qcom,external-pfet;
+
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm8937-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+
+		vdd_l1_l19-supply = <&pm8937_s3>;
+		vdd_l2_l23-supply = <&pm8937_s3>;
+		vdd_l3-supply = <&pm8937_s3>;
+		vdd_l4_l5_l6_l7_l16-supply = <&pm8937_s4>;
+		vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
+		vdd_l9_l10_l13_l14_l15_l18-supply = <&vph_pwr>;
+
+		pm8937_s1: s1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8937_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8937_s4: s4 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8937_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8937_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		pm8937_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l8: l8 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8937_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l10: l10 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		pm8937_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+			regulator-system-load = <200000>;
+		};
+
+		pm8937_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8937_l13: l13 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8937_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l17: l17 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-always-on;
+		};
+
+		pm8937_l18: l18 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8937_l19: l19 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8937_l22: l22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8937_l23: l23 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8937_l8>;
+	vqmmc-supply = <&pm8937_l5>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&pm8937_l11>;
+	vqmmc-supply = <&pm8937_l12>;
+	pinctrl-0 = <&sdc2_default &sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_cd_default>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>;
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio97";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_default: ts-default-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb {
+	extcon = <&usb_id>, <&usb_id>;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&usb_id>;
+	vdd-supply = <&pm8937_l2>;
+	vdda1p8-supply = <&pm8937_l7>;
+	vdda3p3-supply = <&pm8937_l13>;
+	status = "okay";
+};
+
+&wcnss {
+	vddpx-supply = <&pm8937_l5>;
+
+	status = "okay";
+};
+
+&wcnss_ctrl {
+	firmware-name = "qcom/msm8917/motorola/perry/WCNSS_qcom_wlan_nv.bin";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+	vddxo-supply = <&pm8937_l7>;
+	vddrfa-supply = <&pm8937_l19>;
+	vddpa-supply = <&pm8937_l9>;
+	vdddig-supply = <&pm8937_l5>;
+};
+
+&wcnss_mem {
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <19200000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
new file mode 100644
index 000000000000..190602908a3e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Val Packett
+ * Copyright (c) 2026, Aneesh Pradhan <aneeshpradhan@acm.org>
+ */
+
+/dts-v1/;
+
+#include "msm8917.dtsi"
+#include "msm8917-motorola-perry-common.dtsi"
+
+/ {
+	model = "Motorola Moto E4 (perry)";
+	compatible = "motorola,perry", "qcom,msm8917";
+	qcom,msm-id = <QCOM_ID_MSM8917 0>;
+	qcom,board-id = <0x48 0x8100>,
+			<0x48 0x80b0>,
+			<0x48 0x80a0>;
+	chassis-type = "handset";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts b/arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
new file mode 100644
index 000000000000..4b78cf76149a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Val Packett
+ * Copyright (c) 2026, Aneesh Pradhan <aneeshpradhan@acm.org>
+ */
+
+/dts-v1/;
+
+#include "msm8920.dtsi"
+#include "msm8917-motorola-perry-common.dtsi"
+
+/ {
+	model = "Motorola Moto E4 (perry)";
+	compatible = "motorola,perry", "qcom,msm8920";
+	qcom,msm-id = <QCOM_ID_MSM8920 0>;
+	qcom,board-id = <0x48 0x8100>,
+			<0x48 0x80b0>,
+			<0x48 0x80a0>;
+	chassis-type = "handset";
+};
-- 
2.53.0

