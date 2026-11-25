Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609996;
	b=Txf4HIv8BRGSohTqjQiFPlenQ5uSzM/4CgpNS/EEpwEdLC+UCTdga0fZ2zWiNEx0Mv2u
	 OmRwGertj+ettbvVTV+NczjhRJm71U5ZXg5PRCOoN1RxHwpggusgfGwYu7p/1mN5goLm1
	 VHIkN9J9XCht7Qg/lVXCR33W5cM1X5B0vl2Cnm4q2yPN9Sh62k8WJo3jJPTNbvTA1eJpd
	 NtHFf+mmeztsUUbCcXjCGKcuErkjHMyVttcwvoFrmyDvqiFVfvBkkOHFYLtT6ZC3dojnH
	 UYcveMLKp8McctAUXQA1rm5gwNdeXC1P9kYxT7PCnMtmLrrWMXrkz7JsDdeewDqMreg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
	b=J6C7DFjOpCMMyb4tmKz4Suml0EO+UPVjaOYfAMe6XNtVHtF6R/z11gcbqo9sJDyWTDzU
	 omTG5WASCDhYxNYfRZo0cNDBAz9ozntXja250IieQo1fCd0fUnKS58DJUmiXZH4cBPC51
	 TAxLYXJMrwRTpFnQAgBLMz9jtbqOWKrSpYVyy20Gvxmlh8uOXRHADXoHKc5jwdiYruqhx
	 O+uluW5DEsirKYEC5DT3WjHBdOBr9VgFmiJl7UapedrkdHw+mP/hUgO+4Fblb62M+KxxF
	 m+/kUQShyT+nltyTofbZl2zdVmxjFGCfek8QssSyP2er3LEXW4fkg0VTAGI92p8uWeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qgf/rxEJ";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67032606A329
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67032606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qgf/rxEJ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so3825837a91.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609996; x=1796214796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=qgf/rxEJbxbQk0k4cDRQ2CUScsPmBOb32E8eV7SSGbTmDRbgYCKL+rs+qu6txu3x7S
         cjI9087SNrGDsqNfxE7Tww5wmtC89VG8WHBtct8fjTrDhGiSrgUzWq92HybFy66Q7+Mh
         7sLaY0t19HW9EWdOuhDlzCjKhu7VJeJZlX19RhOvEmTfIxy0YdZ0cg4oZddsm0G0wbyl
         I8wjsPiXsqdS4IV5HSPD2d9HiAm/91i+D31wPtwHpvD+wyjmVk5TOzZTRcB2sCf1BHI+
         IvmHh7ZTosiAVRfVsx+BQrfehi6Ert+W6ekLsS8rYMVaFjKWiLOh0/4JqEmJZn84vZy0
         5WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609996; x=1796214796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=E9YeWVDctl/uwD24TZnddRTZj2lTGs/EKCp4je8gE2ckjhxDW8BUqySRzN+zQnAeLi
         /8TX9/OfyMzDjuPOBzYCOaN7ZJcUK+T/XG6OBYvy0e+lC4cC0disvpnyItvuDPQRuq2S
         QO0SVR7WLIDBebTV9WqKtfj7O8oyP7X3S++rhsBAXEvC+1JWG7OtrKKF9YebZr2cT9Sp
         tEk8JVsWWZy9CYG9ofLfpSIr/XSsKJx7shvuHz7Djy+mumK5d7j5NDZvvwmC8iLNNKd5
         Ysb4yXDNwIiyPvA5U/jYSubQLNtff8/p6ZEfVbP6acXHEhuctwUm5ZNtPsl99neJPySn
         dB9A==
X-Forwarded-Encrypted: i=1; AL+hErEtITC1vcVywmgl5qmyWj31t8rfIe93KVqeG3yWgxSnTskfahuv1JqURkqH3sry0y4yKwWhzwqv/YI=@vger.kernel.org
X-Gm-Message-State: APuU4Z84AaEh73idu8CvsVjekaZb1iVzIVDZ0jYDBxYX0iaSrINSD3a/
	GM+VHPC8zTwoEv7JVvDy7vosS15rXZjD8fZMK8OqDuEADFFbompZKoSq
X-Gm-Gg: AZFdTZfEmNme0zFsF+IgHacv3bOJLKCFi6X4YK//zQ1faOICh2l/19osCi3tSkMNCqi
	HBcTQ4z8lVZUvbBqXfnDOX4BcD6UxNaYVg8LUn+1OOj50+/ieGvkE+x1VOLXJr6zR6lTyp6+qfR
	2L9B4QpUVonXwflnbns+Qf0k4huaNfuA71flMTpOp3NfSVAiBBrcbKoKXeXb5fCge/sZ47RnNNK
	EsN5tzSDOi6t3wsxSYTerqQbl4ODWS04oIgn/+DqrYt4JGvFErm4iKCRF7KAS583t7IuOeIr8+6
	0vAIG84vNonWNF2COtyOOhAG6cfCwc71MvNZRxEh9EtA5xtrEufs05+jUtAVMlnUSusBaVRhtSO
	s3tQVJ58tN1265ofzkDdlFwwZ+5FUxPZz44Ta6ywp1qJRF2MCiL9n95elz3MwQm55zlsRIzkhOL
	OgiRWJ4+ueo3ZW/WO/BgI8KMF/NgBsxELYMJa0xZ0V04PVToudLdY1Km97RN7kpjG360MYg5HNW
	IvTUrqYGgcBzMuW/Bx3Ztks2euSaZ3GwYHfuDp4HQiJOQ5MZOBkcUkpGyGL7xlsNMwuKgKTrkRS
	DGr2Yeir2CllpnLdbEJzZYBsC5XHfosgNu8mS29Ti9K6zPAxFSziu9ZRYDy2rdXDjK4E
X-Received: by 2002:a17:90a:e7d0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b41cb3276cmr17251989a91.60.1795609995742;
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:46 +0700
Message-ID: <20261125123146.379057-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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
index fccb9c4360ca..87db6b18d191 100644
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
@@ -154,6 +256,7 @@ &pmi8950_wled {
 };
 
 &rpm_requests {
+	vdd_l23-supply = <&pm8953_s3>;
 	regulators {
 		compatible = "qcom,rpm-pm8953-regulators";
 
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

