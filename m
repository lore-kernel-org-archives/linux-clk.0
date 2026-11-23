Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432136;
	b=q5GSg+R/rpB8a9gcPhdK81ASZyDvCjc7TLqheno+VwkW9kOs2FmLe2CcJOMUb443MnJZ
	 brZfwmhcgIquS1MAx3mJeA/h3sM/9dgj+6c4NXeqh+h5ZCnL2MmHimljfPHlXjQ/AToX/
	 2jP2VceFxd1JFMGQnM3oFK54C28FXDUg8Plzmlk9dgGEtTnZyXCb+TXAsaOCYRrNI81mp
	 dMzSTDVYCFhOlp+bU7IUlO1dUmLdkX/zYXMMuCQgk1W9t/AUNOD6TR2qaRtVDvscUS1FH
	 yT+ilxPznTBkBa/Naykn0H+kkY3CELdg8XHSOXrLo33GfPUA8cdslDnovJGSFpd/Dsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
	b=oE+Z7aPRiNFKmHM2ANGfVE4c8pENRJfJUveif8uGiv837yklJmSX5t70bu03h9jQVZDQ
	 1if+w6yjpY+2zS6jaelVGyBZZJQjghX3RvTVpogrIYeyTwE1oc4dX+qtCv7f9KKKAyFf4
	 1rNtlwLU/s1VL7stiqGAsfZt/5m2JuBKkEuqSnl29BdaR33Dtglhxi+i/Fi46ixetEda0
	 pcN5BOIgjNw/0riLtlSk/RA0R6k7go5fz4gi5j0/7Wi81qDtb5SKxzkA4Uz8jg7RfXy1Z
	 +hEC6hbWWQKu5f7VIgb29HmEo0nxj0Vt/RgfJGvoK8cXi1h3rC36PA6X8diCXldifOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GV3Ox3m/";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F0606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B9F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GV3Ox3m/
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b546061d58so7053075c88.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 03:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432136; x=1796036936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=GV3Ox3m/nwlScDSi01EojkTUY3OAbqwZCcsZyEc3A2ODjDkx63iQHWMPBypXLaUTdt
         vYXuXfgTZWM4Wt45ElJVAx4k6HmH+ATHBmBKr04VQE0xixKP2pFKqCpHKvNTCjBNSEyI
         cd6fpPdiLLgaHK2kNST1nJi0tKTbw37CW9QXC8soarFdkCGcU3UicgTNAW0QCFHTFzHD
         p7XT7/rZOK09ZHvbQsm0WIlxgtwIyQ+Wzlcmo/ErjYanKDDJB5TujuSnj0gOfUhEvUsu
         L+236Z2ijkpTolk5xRoNNPEXp4ru1FCx1VqOnmwz/zaD688iFhL7Xqt/HWC4bNA+T0Mf
         zKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432136; x=1796036936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=EZCNIhBZnXIJ0PWHqWlYjF/uCxdLsLt8+YjWOtjr2K7lBQENKbBMvd7GTPb2Tslzg0
         s9svf6DIVzOnfVs8MQW2neivJw+Yq3gDeltTiWjmeUhWl13C8/Zr0Ww5/Rne9Teb4EtG
         yi+WnN+5BA1szmg6Ie4iXYOvt3VJylI4FlDb+rXX3JTj9CghxZ0An2Gio30996/mmSe9
         WAX0lfDDwsQmeFVurfz3kXBMOsOGR3rLuoYtH00aD+fT0y4wDJKf6IwN+2OC2oKR++be
         R4vC5moCeCIMxfLISf43Gz5+/F9I1RHxU05ztRbYivLS3ULLrIQqgLqOGqajheilwUfF
         hmgQ==
X-Forwarded-Encrypted: i=1; AL+hErGsdELGZoiJMuIq+4564zpOX4XRpy/SZRTp1rQgH4f7pnhX517x0Nijgx2aZkOvHA7XBFwN/H5hKsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zUb4Iw0pF6AJSX8RyxGjeoz5H4wrrWI0bCSO3+tqIH++tR3SQ
	cn7zuKIN5fTB8WjGiKADHVXagsZb06VA7guvcUmXqZ3Safb/uWU9tuOd
X-Gm-Gg: AZFdTZfle+Mt+Nla+2drub2v2jYSIXvvfPQNlJgCcVUf0cYMKxl0sNbusRDErkObZEs
	n7/EDnF1RH3k4TrHXxWVRLgtOmiT2GwDASjUuXzR+Amme4KK/5c2IBeQtQEcFM8N0TIOyfy2nqR
	cTCvTwkupc22maojLiLmobhtnkqVXLbc2GI2lOPxYX9F4dUQFXuJuOioaEyDNsTqyxTZTdlwxeh
	19f2tDl2zbiAJuOX0X0ALzx/POsCZrhuFixqVAtewjXvM13a2iWwz2+V8A/EQ2iv1NjqbwzEn4a
	RvyjuXYbl6ke2p+bp3cwZuR+qBV1xDwEhX8vWc5lUoQgtuvDlxx3Z+R/dQwWpIBSocTpDZSqTPr
	iCiJ+vGcMCEqdGIhV6jTc8CR3fFdQFE2Sg67ur2WyvxmN/eQIS5CI30O9Tf+y221BnMyjjrVXyy
	KdwuFuqtDeWIK0vB4g6FnZ1z1xNAi6KNOAk/S+I6VFUl8Xq78TxjN4XGB+C/ompcSH8SaSF0iiC
	uy61tDAIEdfsFa8Lf5dyVSWOqR3xZLQD2SceXQ6zblvriRPWmAPWD46MCPYpgURGXVBI4BwjP5Z
	ryGz3SZhUl8kDRs8mZecIbdEeqsQ6SlgPTSu7SRPUjYQKg==
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr11025822c88.26.1795432135606;
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:08:05 +0700
Message-ID: <20261123110805.119610-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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
index 8ba7982fcd81..40a14301ee3f 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -271,6 +271,20 @@ headphones_amp_default: headphones-switch-default-state {
 		bias-disable;
 		output-low;
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
@@ -288,3 +302,103 @@ &wcd_codec {
 	qcom,mbhc-vthreshold-high = <91 259 488 488 488>;
 	qcom,mbhc-vthreshold-low = <91 259 488 488 488>;
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

