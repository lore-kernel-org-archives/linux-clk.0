Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437407;
	b=yl4iRE9iRtdsxaUe2hAZR1sBSZMf6dhKqANmKWJ3YdtPLxZjAzi+TVnayskeemDnMV1Z
	 D5x+SCJdylN8PMc3C4TyJJ3y6uh49IC5nE2gjUWhf3B5kNvKFA+W1yayccqf3R/xQWfiz
	 rPqY8p+wCjFjNU4YOue6eVOtQsxtigytLoDQvwnU0NEBWZVY48NNj32589zULuwT60kY0
	 b4uZ5fvDBwoHJI4ucq8FUH54oOjLMbijvaML17AfoLb9EsIki1RWATDcacoTKjB+qwASB
	 V5wUA5UDDBfsbuSVKgwjPy81ZgBA+xm1HJVF4M0W5uVkWEkF5e/vvgsxdSd5dlEpvcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
	b=xI8fJljLMtdqfBn2/dA1mXlol58kHiWYvwdvbNdbZ4Q5Yg7BV0fo2/C+s6TIEcZZXMkr
	 l7kFpEcadvTX6H2aEQFxD4+DGveXFHM7dykyrxFuS27KCCrOU+BljE7UCFD/U5KGmV9dw
	 ljAjYTdiMx4U7fmV+EfCUU8+X20nxoukaVOs7ilstTKj5EszsQGdsXFn8aSf3ISE2LSQG
	 cuo1rqE4gqEDKtfolqaWAoweTH+cXSTnrx9rcUbRVQA6fSWwFfbF+kxHi/2J8HuHxMMS5
	 rYHPPwQdBCkaKFGYVRQUI6FCooo2GNqrGCEtspbCLaLRz7ZMbSelu/lFCGWa+1STUCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88F4606A6A2
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 12:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A88F4606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atlI4xhW
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869b68caecso4153996eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437406; x=1796042206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=atlI4xhWUQnHPQ9nkYx3mQO8Swph4K/bleOIqj2B5EWCD+vbxo7zUlwusUjhC8SBMI
         74SAW8d+AsGsQPS49KlhZ3wmObfzg3i8k6bjnLML1v3xvmi93htAIrRa3G5Mt47kUkbg
         8WPcf+BlbVDglyiG/AoRiiYZEv/QbipWZYqJLn/H5MvLp3vLv/WGzFZS8cZZUREwIitt
         q0EFaL7AhpJcMNbXN/xAKAu5BF0Ucd6YxQBsWhUGBV0e0YZUYNlHBOa0Xb/jU4GhT689
         kH9CLaUi8j8aRI+IOBYW7nODAPcyglZclBG0+lvwv1k4+VVdcc2GJXQFBiHF+2emdk/p
         nl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437406; x=1796042206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZRwBHNibaWlFnpiuuEMtUB0YA/t47H+l2X5jKIQ1Dw=;
        b=JHnMMl1ojMT9jYfxWVY57+BmfeP1M4Du1ufd3S9ipCav384giP2rTsK21403a+8Wei
         rU+fCp1fIO+/9JKJWXx9ZflLqZ1Z3n9aKXc3bgGK+vtJU/2/v1bJagjKU2U9glna/JEk
         I9Esjt+fTClyoG1Ny/4ceHUVAzjsRX8SSUf/3azeX1CHa0QWSuqDF1skzWHnUsQVRMfC
         vm0Teo350pgvyrr0HbXqA2h2Ci9RLxglqTOE7IPnOKXudMC8RzFeINDCIuKbpEs6yBBq
         YQSzA+We9ecZYTil4Lnxpo9+5nYlEnfde7vdxpIzyu9Uz56gw8sML3s9SS+UHvVGI16t
         brXg==
X-Forwarded-Encrypted: i=1; AL+hErF/km2/2qJs8ePOnYtEkbSQVAZFJtjQZMxzWA5m+XoDiUV0UiNcvuQsfbAM3rSSYchWvDI39D7NQP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tp/nUEm+0p9NX8BH0918cENAQwxlkBN1hjzKw8qFUvjL1pwFP
	uYSTrU87DmlZvMSyVkRcwHRyNWT1tjdFcghzVigw4tOeSIgtJqlBcdEH
X-Gm-Gg: AZFdTZfqsjUbRSwv9t3Q/JF5VbWgm1/5Zb7rGORKpqfIxEgmxljeitwksgxruEOK/Ra
	JtTewXmgPSs1te/DnK0DMfrTPiAYUkbCp/Y3YLh9llfVSNXhG4hBjx70KA6wFDRrBdLkh3sKhJx
	hPUaEqXtyvV3tIkyja9X/GZfRIhkBqh46oMddMWHbBWdJbenjFz3vcKwTjej0tXMIXRAQycrCPC
	itCMnzQlwqHw6jtdrIVgiD8qN6HofmFGMUgJFttU4TeYZzJpBzkNt99Pr7oybXU4mxsNHWacBr4
	XgTMxE/+JxmQd4L4f9ER9YB07ibvkanAJPFFUdAti5EACrQJqETUpSujsh0K7Wc1x6+vVXgOZ/O
	rEuwE7BNlYCkUnf1n6Rm2ShFgt4y3exQ8bz8I5P1xYvDS92HvfFpb4o1S/Dh2Y6GXCQr4w52JKN
	1zcTPbYn1jM9FbponjQXiI77LrS03KAsJNU8eIlxeoAgsvN5WxArgH02WZ3UnZvDBbFLo6LSpKi
	n3V50q2Pvu21gOnw2srjtcEh0HNX6rQ7hWyUYp3ML+AcylVF73M0+UAc0Ako6F37TcolZ0B2L9N
	l/r8Redp5UkTmuW0XST/saXPNOfTjz/ZB+OMtx1fndYBXpHz8AngmpVIT/ELIdRe4rU=
X-Received: by 2002:a05:693c:8209:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-3856f14bcfbmr12986753eec.8.1795437405845;
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:45 -0800 (PST)
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
	linux-clk@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:46 +0700
Message-ID: <20261123123546.152162-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

Enable the CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
rear camera and Samsung S5K5E8 front camera on Xiaomi Mi A1 (tissot).

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..5d4fd7f42042 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -308,6 +308,20 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39", "gpio62";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
 };
 
 &uart_0 {
@@ -325,3 +339,103 @@ &usb3_dwc3 {
 	/delete-property/ usb-role-switch;
 	dr_mode = "peripheral";
 };
+
+&camss {
+	status = "okay";
+	vdda-supply = <&pm8953_s3>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&cci0_default>,
+		    <&cci1_default>,
+		    <&camss_mclk0_default>,
+		    <&camss_mclk1_default>,
+		    <&camss_mclk2_default>;
+
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera-sensor@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		pinctrl-0 = <&cam_sensor_rear_default>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+		vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <270>;
+		orientation = <1>;
+		status = "okay";
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy0_ep>;
+				link-frequencies = /bits/ 64 <216000000>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera-sensor@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		pinctrl-0 = <&cam_sensor_front_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <90>;
+		orientation = <0>;
+
+		status = "okay";
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy2_ep>;
+				link-frequencies = /bits/ 64 <418000000>;
+			};
+		};
+	};
+};
+
+&pm8953_l23 {
+	regulator-min-microvolt = <1200000>;
+};
+
+&pm8953_l2 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1225000>;
+};
-- 
2.47.3

