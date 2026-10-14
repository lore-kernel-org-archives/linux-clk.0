Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF11C4E06FC
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021911; cv=none; b=s9sHsdrdM7A/SaYSIJMDet4qORYCCBG1s4w08GWwfFPhbyqbBoTsiu2OUu8JyN35t2tIJFdelhcJ6wNV2OAIDe7o/xLeV20gx7z2WnmLWz+/VJx00y+2pHG8rDN+cH9fGHiOezRRpHzmNGXtZ2vcHF9AIoGi/uVGNGhhgTgHy0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021911; c=relaxed/simple;
	bh=lPeEe7tz+0YSnJKsAf50jnjdmdW341RGDSdUQ921plk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lPROmK95d6/jba3PRCPkGE2KkkCyw24vRNezwo90QtLl0m8s6XR/z58wTJIc4mW/KE7SXdDon5kKyODGcEgnnn5JiruRFg/yaf6fausgrORfb98I6g9AlR9P6qcUfSS04hs38cUjzRvIyN8g7AtoXFFgoGrBfC/e1hdzwZX/Qmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVk4BuCe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5r29pdr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVk4BuCe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5r29pdr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGZk5E3468988
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxCVevdJDei/FrP0xFIQ/25OzUVG+gGQ5ld3vJX0vpw=; b=VVk4BuCejeZRxfi3
	L7UdC9/bYbvFBOEvby33Mrkj9T4l5jJkoIj1MN/a3zUOEM4aCvcruLMudsQEIFe8
	ocEzDAvdwvLdGMus/OX4/INKgDD2TrB4PhfouFH+6Z6WDcmdSsgTjI2iiT/joWeh
	3eAMUod8OGFPtzl+w7qOncje3rDylv68ILEmkNf9iOdrX33ffYtTF9lL9zrRjkWA
	TZaN4R6k29zetT/hIi2FkoyDifn24CIIjtN2BPxUrsW2fNBmDxzeKYMd6kucdMx9
	o7EZWISEm5yNXVD6aeVP6n7po6YOUhQu4bCUcvjTACb34q4HyCQEAIGN7u8WzTKG
	IgMksg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd79f74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 23:51:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caa0ce0cdso125854285a.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021908; x=1792626708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxCVevdJDei/FrP0xFIQ/25OzUVG+gGQ5ld3vJX0vpw=;
        b=X5r29pdrESqWnVfS/K/3q3ksnRJ15h+tTB3SvvJfjWgplFVekv8ZCaIbE7vI93R6Rp
         ldefXwl+x8vXcApAqGUywNcjyoWVlCvbiAQY4k18opwizFmPA9V5l1xS1x4KAxrilLW+
         QNU83vAdVBtv2E+xI7G6C2f7gBCKDRoDKClC5HAWywq4EIFrjKf00zpHQubqWllJZbC7
         K7SjV8F3SGAjnFEKRGiC8DgMJwsMHwnZzxMCKcGhbNC4+GL4BZgaTa5Xc++iI8sFST09
         1QdOiXpdMHTdWrmEA9VJCqKD1Tk80TCtGNe6d+vXaJsXwlj8PyFjXjJnLQJpLZIdWXpR
         NpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021908; x=1792626708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxCVevdJDei/FrP0xFIQ/25OzUVG+gGQ5ld3vJX0vpw=;
        b=a9VicSsuUzCoeWST/feOGHL+wLy1B+BgKMINiQbMIv0kwpEjmFoeGb6F7ds9oiVKZ+
         oq8GLtPvDi0kuSLKA9JwTJZ7JB7ENaEKep72VAmvmgiZ3yRhjGDPDXOOB8Ndosw8hFc/
         VuEnu9oecr8k16M1ZGOXj2LdUfxH6CMIkTRGfv21ReJqjLzQsvN/glduhFbM2QI9s68M
         SxXXF0a/pZ/zRb4brxFCuKanXE/quVJqJ5Vw3/EYrcKpdJORf6VHpVeLMOxFdfJKhqv1
         vyiVitbf7E6wy3mG/1xG1/pkOJXXjQ9gKZIW+FYN3Ojkcs3/99vyY2T1DL8TgTip2q/M
         wiXA==
X-Forwarded-Encrypted: i=1; AKwUvBx0f9Bh5IvDCHrlTl/ipYIcTP6E4NUy0gky7Cosq/q1OXMQm9UTjgyLwnsFuyexDH2BXxrDAxqoOtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnrDyRJgt8yQyjowJkEm/D2GB5ffXmDQCJ8ifpwzBwKdI41R2X
	vVYtQYekULJNy1F7b2Z09Xz+gZvwCa6HFR+2aiqiUBwwuy3JKnMMwujMF72r/95/Swbpn/O9+IQ
	3Bnvg2g81dM0Du1m23Olppqif2CEAa9z0mimyZ0EbT2UPw0PIQTOmFx7MwKpaOZ4=
X-Gm-Gg: AYBFou3INVc8uRi2zRlSx2UsrwVVGp4dfQdjwR1pbgfBjRk3Z8ppb+fAIYfi54Kxihr
	9TFuJgJ1tXBRA9dRus6jvUSpgp78jY6mMRebY8RExEEgPTh90m6APhGhrHs7Z/0sNRZ+5BA1LQN
	HZo0kcWDbTVl6xftHNmcl9Tf3Zadj3MDk44wKLf+zmbVwuO94U+5jz3iIJFaoKS8HVqLrvy3X7i
	yay9weorusw+bfezYJWo3FbnGc/BSV79zWBIUSQTbuBaivNs8spTmSgriqxfWM19DYWguprSjRZ
	sY/OtU2eTpsFIjdsQFUnCZPVu/YQVl7NaInmFODevfwAjFm2a/19XvgCWev+AbsMoG9KS0y+LQV
	iirfiq3zBEWcbCEq8triMfksszZCK+Dhakualvpd45FRgxTRel/4/3Ji3FZPFyx4Ud+OaaLAgmA
	VDqBOGIiG6WtdG
X-Received: by 2002:a05:620a:40c4:b0:93f:102:566 with SMTP id af79cd13be357-93f01020639mr843410085a.67.1792021907949;
        Wed, 14 Oct 2026 16:51:47 -0700 (PDT)
X-Received: by 2002:a05:620a:40c4:b0:93f:102:566 with SMTP id af79cd13be357-93f01020639mr843406985a.67.1792021907422;
        Wed, 14 Oct 2026 16:51:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5414sm2285281fa.16.2026.10.14.16.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:51:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 02:51:17 +0300
Subject: [PATCH v3 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v3-5-1c179cd0d16f@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3699;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lPeEe7tz+0YSnJKsAf50jnjdmdW341RGDSdUQ921plk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0BV69yRKo5WsJL9NkfShKlw5sif2TqVTVzVqc
 XiBc9GHkYiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatAVegAKCRCLPIo+Aiko
 1UjbB/9QEPTx8aoKoMW/XSK+7/UUz+WLcxglA+qvd5MRi7AaKIiOanodABwZSFMbkV6j2Zrya/+
 GFw6bIpeoxu6PcMC8whrOpraTiS3oqf86jx69Y1pcbrwWe9HCuExHu2JYjlFlEqKuLvvgP9n8TN
 6DvCLhvBuiBeaIFXT5fDnQXhtTc7AQA1jKpgQTYyGWvfmQjFIcQy3PvneItIsfxNLMlmbWqloLS
 rE2Pv09nhLqHi6qBtgIbZ2UduicoOrYaPw6yIkaklowXxemc4M3SHe2CQs6c6agKZ3L+Vv9vZWU
 YdrJaPNVK+7AoOJe8QZN5ASbkjZ4xZPHIEdATKuTQfHp8vHK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad01595 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FFXsBguXHA8yshPlDHEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: UXFGuXM2OuGOkT9T-eWqFUezh2qs84a3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX4j5tXeJGGkZm
 zd34a/NpzBcUtYsAie3gj2C3hhPuLVHsZh1JNdR27l+Te/+FK+37+oj4Hyzq/oCJOMAxIoPDU8x
 IH1BLjzj3Siwy3B+ozDS6tTCA5u8+nMJyRcOO8UVowZKJHdUTdW5l3jsv7tD0vUk6HVl62r7PYL
 8TtLr8ZY9PD4oXiAcAt62tb2saWdSLMwM7k8Is24/UWow/wuU8gtMYyBBgWeKHhy+/9CjYWTGwy
 1GpxaEJwSIMWdx3RTw6wpMeRg/II099j8RxiGsBE494wO/Qwa+6S3jOaCtdSPvII9+hPsuNRZEI
 7UvqTZDS9iABAdekM09m8Jwn9GNPbKcvofew6sJQOJu2SZ2GFa9ntr167tuDFKtSPPHZmrL6Kei
 LWWKCPbOnOrVOZ59M1usfl10aLvi2qfrM7J1Duycj0FCEqyaPgPR3/OHvDKT5zQMsbyjFx0NiCe
 tAmPMmlVmtNiUSQ2eVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX2VjljmEPg8so
 M8THXwZRMPaAk0V4m5iIrqRfPTqktYIElj+U+Rg3Ft/PoY0alsHIZQvlrNBdsjcX89NwiM+vg0j
 lR3qmNFUOlrrpx1L8JA2dcY8sYUe63w=
X-Proofpoint-ORIG-GUID: UXFGuXM2OuGOkT9T-eWqFUezh2qs84a3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140095

The SDM845 HDK can be fitted with the same display card as the SM8150
HDK, carrying a Truly NT36850 WQHD dual-DSI panel. Here it is powered
by the PMI8998 LAB/IBB and WLED, and it is mutually exclusive with the
on-board LT9611 HDMI bridge.

The configuration follows the vendor kernel, with the bias rails at the
5.5 V default of the LCD mode.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5be99934cf9f..85d06a950b4a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -356,6 +356,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-hdk.dtb
+
+sdm845-hdk-display-card-dtbs	:= sdm845-hdk.dtb sdm845-hdk-display-card.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-hdk-display-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
new file mode 100644
index 000000000000..1022ab096170
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Display Card kit overlay.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/dts-v1/;
+/plugin/;
+
+/* Disable HDMI bridge related nodes (mutually exclusive with the display card) */
+&lt9611_codec {
+	status = "disabled";
+};
+
+&ibb {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&lab {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "truly,wqhd60-nt36850";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l14a_1p8>;
+		avdd-supply = <&lab>;
+		avee-supply = <&ibb>;
+
+		backlight = <&pmi8998_wled>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				panel0_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				panel1_in: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel1_in>;
+};
+
+&pmi8998_wled {
+	qcom,num-strings = <2>;
+	qcom,external-pfet;
+
+	status = "okay";
+};
+
+&tlmm {
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.47.3

