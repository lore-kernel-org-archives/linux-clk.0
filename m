Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787181;
	b=JEUidx6HW9E4sKhMB3OsAQWJKA5MRn9N12T3osaNEcLRe9rxyL7z+MJ/RrXekCqnAUZN
	 P6dllXQKBI5nzSSN6P1FIOBKeSe1eHWNXqcfW9eGrJx1hAFIkU8CkkYoLp0/Q8widmpCD
	 nlmYd9DEt+GMfL6qkkXGmX29qTdlsg1D6+kL0FA0tFZra0/oNLca3zmNAntNCIZqcX9ce
	 Fx0sYLKjUomG1MqgMuCbFmoSrUUFG14xsTvG2fuMRJmX8V+nborWCLBby1DaQfeuW6W3F
	 sywE4TPSC7B7hNGrDmN7jyUSvY4mhJ8aUJSaE6l6PkdfrEnnBoAvlarMs9ed406Azdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
	b=i3PXxBmqYCJnToAvLJo2LGIO4HsiYDDq9WIyz7BlHTs+gQQezTbqMLXsztQy6fHGJc9j
	 5IN0LCkVReH5DlsYPO5W1oqA3J3xozcgqNPdou4eJ7FjyyR+SnIe4SxYk2cE+kIeHO+Lu
	 gsG47ktNjlvssVSTGRDi6a7voSey//abZk/OWOLTcdw62sw/39BKFED+mQUI3U1iiNfRr
	 V9gRe53tP2GTUubj5jpHGFBhXyLHAhAJZG17zTRsnYR8gdawLFxufszGQoaWyLdf9QP0T
	 J/cnbu8NiAsIY7SUIh765C21gA0YnvlXL7h7uDyLiFsIcYkaY/jkxu6ANytW9IVekhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGAU9Liq;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586AD606A32F
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 586AD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGAU9Liq
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0621eec70so57203125ad.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787180; x=1796391980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
        b=AGAU9LiqypIjJWbA2RTVEHqWz5tvzMFqIsD8s1V5CDz+EW7FfM3OriPXCqsaoNZLgQ
         nqGFaMjS4ne/xpB5yy/LZzPc1VcmsSa0irm6uqtGhsWDLTs8bXCwRpSK1Gv+NiCbX1yj
         bi3khFFKtSsb9eaQ7bGRDEvTyImK0razii0vhPgaANtQwHbgXf8J9+0yklkltlc32nf2
         Sq6z5R+lQF0DYvJi7G7iwrQKd4irmMu06/LWJtdZWchrqPOtPbHPDoygyDLNUyc+t6LP
         4bCmzj8Rg3nk5ZvfJi2xUVwYnxm13ocBw5dvFeK9vnGsPNppJGPRoRFwt76RQOhVgll1
         EaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787180; x=1796391980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
        b=ZKi1kVnsOncLbzLB82BVhaMWsMe1TLHTt/v0IUx2mKVfPz6PM6Qw6eRqDSEz0TKKlp
         vRre6CIp07WTq88p73NyWv22FTblm9KZpAWz3ZhH1H44TOq1akDD1eTp+rgeSz8rnZ9D
         PSYysDiusd0YUtCZzxs9dD0CGDj8rkFQxLx+tf5UGwiz3UD1IBjqCs1dfxHD0tAR6/yp
         FKQPmBEFA3rMcWvZp1F29XMHMmAHrTTqA8zb/Zz0KsAaLUaeTaqjjHTSqlGfVavqiGLw
         /bjaWlZ8+3JDYjuHLC8um4D+XN9L+QdHNUVE2L3Q4RrVYcZmFIiJIjlH4CGZTmqHlgub
         CvYQ==
X-Forwarded-Encrypted: i=1; AL+hErF07eSUvlHjEq7gzIiFQuCd6nYe7LhVc7g63v94HRs0vxBptJ2VwCf+MPup31jAPiD5YEytUrXcjsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PNXf0hyDT4y/pxsOdhpvlAx728mledUmzvo1WiyDEoTvCOj2c
	Qk2Cws/4ZLXG3/WwjLu8vxEMxNISWBc51B+9W5qYGEPTBO2dNHv+AaG1
X-Gm-Gg: AZFdTZfFAbAWWNOjQW4xEyl2+Oy5TBKV0QQoG8/q/sc2lZXKhIg27Xr4QkZppo8SmDT
	1PvZqXw3XlvVedsGLNLl/Oef2Ja9EBe1ke/7wd+rxe10u7ghiRGk1ehx08xuyu0mb31UdCYxjoY
	6YGUTU7XZwtE4GdLTcyeHIaJCeUXBZ41RR8UFjO1lv3yK+VLpJg6hztRP1ja4pPFesuHOFUIbSZ
	37XBbh2BIfLOQAsAp/KGU/oApK4IVNcn/rf0nCppR+15oItMQtRax8JoaacmqEzTmpYrbNDOpdm
	bfXJqxCiKr7lc759ZOV0gLjuSNeVXnHBCAHhftddr+gS/EETEfTXSxZncDkD+V0yRG9XfEFMB2S
	DpcM+nnfdgjFwhvPp1Z4q4GUcMNKSPU5Sg2UVoMFPmwWYMijcifjHrP3/dPZtiSM8uUY+RrhpVs
	s+yr4TR+7aMECzQv/GOvNlzxLCLmPUVjryeQX2P6lche140ZFGVTzc2IcJfgbAamg/GPNnpHfxf
	AFgZifDHx44RZvXFpHh8zfFG7NerbDUNduQVrSeuKxA7FKxKJcsM4FmjuZqtxmEI9njkjQKUUkh
	mVo07IpjtlWTN0UHqUANXkX23yxkKHuFJvP7FKOC3CR8Ids=
X-Received: by 2002:a17:902:cccc:b0:2f0:d976:651d with SMTP id d9443c01a7336-2f0d9767d6amr88871745ad.14.1795787179570;
        Fri, 27 Nov 2026 05:46:19 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:46:19 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Fri, 27 Nov 2026 20:45:07 +0700
Message-ID: <20261127134507.125513-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10

rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..d8db3567fd36 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -74,6 +74,108 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+	vreg_cam_avdd: regulator-cam-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam_avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&cam_vreg_avdd_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&camss {
+	vdda-supply = <&pm8953_s3>;
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&front_cam_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_rear_default &camss_mclk0_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_cam_avdd>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <216000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_front_default &camss_mclk1_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <90>;
+		orientation = <0>;
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <418000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
 };
 
 &hsusb_phy {
@@ -169,6 +271,7 @@ regulators {
 		vdd_l4_l5_l6_l7_l16_l19-supply = <&pm8953_s4>;
 		vdd_l8_l11_l12_l13_l14_l15-supply = <&vph_pwr>;
 		vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
+		vdd_l23-supply = <&pm8953_s3>;
 
 		pm8953_s1: s1 {
 			regulator-min-microvolt = <870000>;
@@ -302,6 +405,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
 		bias-pull-up;
 	};
 
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_vreg_avdd_default: cam-vreg-avdd-default-state {
+		pins = "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	ts_int_default: ts-int-default-state {
 		pins = "gpio65";
 		function = "gpio";
-- 
2.47.3

