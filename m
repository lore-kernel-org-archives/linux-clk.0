Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447731;
	b=QdJB5Gb5uJZm915uTu+N9gK9vS9wyMwL4Y4NcTG+8oG37QdaHuZnSeHZstj0b/WtjtZ5
	 beMkgbbaV2S+ufKxmRFn7274QVb1kndrODpTC0EE9rLTGu31bL/q5ZZrOWHpRMwmvR8Rv
	 ckIZtyR0Co7hGonfpyN4Z1FbrTw/IqOKWxY9mUoN6MvhjsZzJTKJDR3zRAW798ZJFLdEL
	 j2hudHErM3ukKWO8h8+ntOahKVyR0nwalHV+eJuX559NWQfa/NegPWkl/5XvjqlGTaKYt
	 sWaYV4QG3ncr6W7WSkPI0OuR5acR5FZ2AqpGbx2YSE0PSCN35fhPch4NS2HgzaNXiQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
	b=5eMjDSnPykdZNqSNs9siauKECGsnbl/uXAINaCe8aTQ04JMEZYKdG+4pGqUspLAhfsak
	 oRKAp9AaWZeDp3bEKMqwCgWe3CVi8vaVVCzA1Tw0BA2G5u+o0R1GNiIvMGi0YRAtejiIK
	 rE7HGgu9ALcD9qyFBe0Mi3q6ijDxyEkG6TyCqF/j8NlI6wXYp4UDx/cMgs5LdrdORTIiU
	 ArruTbkyCnUDmXGbKmyIEnM4u6rIuLPiGZL0qUM+rnHtvJYWq8Zb9UqTzO4d9zpJqR4ax
	 2+OujDLMBHO1K03GzxPbZwzUuDd+Jvthn3sEcW/Z5DeQ/DAUXA1D7XCgA64NYUaLI1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaN8tz2s;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C7606A327
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30C7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaN8tz2s
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3acec6677so4819183c88.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447730; x=1796052530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
        b=qaN8tz2s6QjWaNTQiTog+fsjkYaL/oPgbb/v7AnoTrd8bU0uoUSwKkNT8dzhR+i73u
         icf9jPTeOWH8XY+3QBmRu9W2BLgFcMzVH0jzRUTmx+5K480YeSVMjIMh6HMIEMLsuKjX
         luCitgg41QLf0IW5yF5mKQ2rtXhnDhkUtd1hM1xT84fobvegCRgTXbKlMwK0Ai5GlV9g
         9YRYCVwNlrXlDd8JsjOTLcLBpPZVBuznpXMjgSwx3qrxmUHZln8iwn54DRgbmz6Tt+jF
         IkErDcjC2ELpglQszvZhQ9f/WhdcIcZ0fw3024FJMxh3bATjPaEMfhnF7WPeDWxuJXz2
         tWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447730; x=1796052530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjPkJu8X2nBBkbwoz/3Q9ZztknethPFV/hq8GuXmGeg=;
        b=2fbY4TunWGcsYKRw1jbcq3tI8FpBjAM3UsWJBLXKZoW3pNYIbDzlmjwW9A0PtSkJtF
         To+q6o2Smp1iWyagWKcsh+dmJGLWael6UEkxbqSgW9PaBlRfAbvy+ZG6iGt3XiaN882O
         IfJRD0UV/O43MW/z5P7Ho1MgqhkwiDl9lomf1pDhwkcH80VlWvZE4oUgNUPyfK5oTC2r
         Dm6pC7bJmA32iXtcS4/Id/sEU5FU4JMsMafa+KH/PNFVy3zxzQBF6XbltXQoJ1Ub/rY0
         KF5f5Ik17r90JOl/hKgwY67qjwhgYyMcMZoXvn7B2LhYtebovnoav5LuQ4N9qeUJ2LYC
         gOfw==
X-Forwarded-Encrypted: i=1; AL+hErFvLYQR4mrlwQmK55ZcTtM3xep0lMwpA196KNEkXvsuObIqogDxJ3PqalllNg+kcAjs9a77diRn0pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8legt1uu/nbVu65Wszt1BPcbpgIqdLfWSMRxSSFVEoAIu2YUUq
	iAuh0d7k8o4olg7NjuutiMg0PKlJdHgxq78J371U/XAVKI40eqkK+nwO
X-Gm-Gg: AZFdTZfbeFO2RZZL/kECSDX8Gx489b0erd8KrjHLAVfUOWYR64Dkwe0y1wXFWlAEXMs
	jR/3hBbDcTdAFfrHK0Kr3DkkGTO59wEJEGMd5c7iOy8uSxEzueHtpTGkaV5IcVwKCBMn2fZoYKN
	YvZ9n8Q3EU2F6uJSC5XsDdyNqqlBpU4OrEgtPXSgjrz/uL7olC7882bZFZaITvNqS5V/XTLik63
	4S3kLoIy0iQts+VAWRhWTa7fYQjA21R8aOgY8iTyVAVTbzz5APEDsOsYSH1ph0VIFG7B2Ccv/n4
	gXgnmzsh/rqfs/HLXIpZA9BI4olN6WlJ65HOO3O18Hged4oTGhhiz9iOnXt1isUK2FfxT8higby
	4aUL61pKmgcrQU4pvGrK2N7CKhS7wNHAL1O9LsrilKKtB5NqMBLMNt54+njAn7OlzWVcTjHvpTI
	7C9zp94Nh4Qx6PNOzIBt06BQ09lSrBUV7H8QqoFLEFI4eG92bxTfcnvCt/D9riXVdtK6lbnemrn
	6A0g2uZdQ1PUlh7mcKdgAZ+lWLGlW9Cxq97MidjuoR6qDixPMbtnbKILb/A09EBdFHonS38Aud/
	tIJvXpoya3+QlRSKXivcfXnUK3ukfuj+aV8+AcRAdBRtpg==
X-Received: by 2002:a05:693c:42d9:b0:386:bc40:1508 with SMTP id 5a478bee46e88-386bc40185bmr455177eec.14.1795447729747;
        Mon, 23 Nov 2026 07:28:49 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:49 -0800 (PST)
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
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 22:27:22 +0700
Message-ID: <20261123152722.168879-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10 rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..e41cbd4d01b2 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -74,6 +74,104 @@ vph_pwr: vph-pwr-regulator {
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
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <1 2>;
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
@@ -302,6 +400,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
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

