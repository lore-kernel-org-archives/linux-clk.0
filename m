Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6EE4B2057
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401509; cv=none; b=BvzfqTNgeJG9FqK7OmxwP7FEFSjpC4ew/cAWgBDDqbGbyEd2k/pGZQT0p+O5oW5Mv17HBEMQOilOwgZhtH68e37uBpEtqG1UGx2UOYKMgDS9a6yrGgcmjEqlJca4wvzfAmD4IkE7issug8YKmz8Ee1s4J4q5cQEsZRK9J4qs+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401509; c=relaxed/simple;
	bh=Gk4MYI6gZD64lB8jqs+VeFEB9RTHDV7aov9asAEAoqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jdu6n8K8EKqpnOmk3oJmfZSL9Ngxi007W/jyFum9MbLqbYcYFWYRIgnQFQvLq79GztRDTqGy/sSI5Ael2ToCJzLLBXybp7Qe9297ICSJjWVXMJ7ee5qIkgTIw08KyeEGYa6FGydFIk2yg+MH7PJ3S4L9a66yg+bWmLyOo4tlGOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1F8rkLT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+qdsahW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1F8rkLT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+qdsahW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Yh832688707
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myWgXXG8iF+vXRiE8O56/LC4PaTh8cFxHTKQwgY5Elg=; b=J1F8rkLT9jxWdE/1
	J4n6ITLaKA2X20EWCQU35EltVB4BDfssQkPuXts/r2ZfsjeLyL9AE3d/ZxZvGyJx
	+fEH7TySoQdstnsj9Mke27sdcWcfDxyxARA8W/+A14SBzQFMtPcQeDm7FHB/+h5I
	eSXJ9GizIQo6qudsfOf2yRI+MesXAvFEtQ9W3i3MxuNxTpkhjfRW1E36Y2Rb64FQ
	396q+F0yY7vbbLra05IO3kBUnwEwPg5+4UCw18CeEVVHHwiSsayLDqnKKtHFQI5k
	2ShQSYSn0UA8ZuUOYr3p4bzoJkrXmTgACDWSwN1UPHhXMfSz2duXhfEUTKZR6+ig
	W4bBow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn05gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:18:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so340561885a.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401506; x=1793006306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myWgXXG8iF+vXRiE8O56/LC4PaTh8cFxHTKQwgY5Elg=;
        b=G+qdsahWykpzA1c5ztHMv3UD01YC+O6ttdHSBiCLc8NSnBHRCp8FiohnHAnSvV+Ufp
         d1a3qd+w42KLa7fGrHYkb7m/muNcw2CYyaiFZ+7en85w5xhSQ4w5dCHhrrkNTZNLibGJ
         jFcQ1r7dqs77LBYhpF5oPqlEYT9FMQe/QWWVbXAlxo3OjF8PvoCCiIm15E35dJYm5Wf3
         xAN6BF27pPMq4nY2hAm0qzMqgozj2wzupiAGVwZTmVBWrrCTL4ufFLyIpVi0tEXy2DBE
         Nz1hMDpxtzrADQWgUUXQSANfMCE24pje51CTOnHrs4Xj1XRD5DtuoYJ+iFgOWHXnDPKG
         ZdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401506; x=1793006306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myWgXXG8iF+vXRiE8O56/LC4PaTh8cFxHTKQwgY5Elg=;
        b=Cjcauu3TmeyDdhvslkaDuqF6nrRngfHBHn9ztCsmBpBiE5o6nnEax386236q7YFiy/
         FvMTIqNo2phm/JfeuzGulG8Bmwx3U73vvHroRaM8gpXn/W3/Yndh8ZSHrefUU9fS2IPb
         NZEKoIEMWGavCnc/DjyaAWZkcSfzMz+zKlARyQVBvUKXfNjv43iF7s0PbohopX8CoSKq
         Dmoc9qPhcK+iaqdTHfZAQ/VWxbXNIP+iiFugBET0+OC/Zf+OIWDv0hbvnsC7YtxL2MVt
         MMABEsVcawJJ/bFlsMgyDnbnBZRam4yPh7jUOCQm1azdYGM7RlfE4Ak8ngagCAwZf9pC
         /k3g==
X-Forwarded-Encrypted: i=1; AKwUvBwfcM1EFAAhpB1uKDE9wjTUHEaqRPG7p8Z1zEHjzfwtT1JEBAGRjN5edBxknRbXM3SrssX+DkHesTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkoNcqdojOWxnuvcgj1NfYM64MxyyVdyfhU8ZVMo/Xctu71g1u
	FDiIEFmoZIMZ6u24niEUcZZTqeArRXFBdb+rlzfDZpahnVhA0HFRtOc0eJgzmbwqqFOVm4STIPL
	vgbi1kv63fqxDloo1GKQfqxIIw9+W9F7yx/PXX+aLeXO4Tp0Y3tBSfYZA4U7mCp0=
X-Gm-Gg: AYBFou1j//Epr/wHYgZUanCDy5Uz2eDNbJGbuGLHct30O4bxvhJ1Dl/vMke5cavhVmT
	QUVp9U65I27VLqaUyRSCY+YqmAiRq2wnJF3it5DKrej53/65xCtC7CUTk3Y3OpgzZMJNBWh9cpI
	7fY+3nG1gORmN5h/SPReOhbJCxz/UkLm4K5AgDoAiox1A7SERtlzWXYvgK/FJsfsYQ1LN13FQkX
	JqWB2xyYXzkx4EGPfyYhZvm9FrcsrHByguT+ulmmw/lQ5ei8EiyHRlRF5r49teBwINXeEgO1vm0
	DVT7QOF1oPoib5Y3azVoYciXdKQSuzqR0eQQcZKb7ZcHtJfDmFGIvYBxvtdwji5J4lIPX5i6W78
	ZcxiEKfeHR10xe8wr5eBqobfORP2WDF0miSkKFSrieVec1JAzadGyHL3zx5LFMeJyQIF35k42+w
	+QST2zc+mttgs6
X-Received: by 2002:a05:620a:230e:10b0:93f:2ae1:ea06 with SMTP id af79cd13be357-93f2ae1f225mr732441785a.44.1792401506025;
        Mon, 19 Oct 2026 02:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:230e:10b0:93f:2ae1:ea06 with SMTP id af79cd13be357-93f2ae1f225mr732438985a.44.1792401505515;
        Mon, 19 Oct 2026 02:18:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm15893441fa.25.2026.10.19.02.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:18:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:18:07 +0300
Subject: [PATCH v5 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3676;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gk4MYI6gZD64lB8jqs+VeFEB9RTHDV7aov9asAEAoqo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1eBR1tmWG6zeCOvuonHAaCMIEV+WWzn8XNCgn
 J3Xj+NiVOCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatXgUQAKCRCLPIo+Aiko
 1RwKB/4rsmEwIX1nmfiibiHGtpcsn/dIQigZZreg6kpuVuey2k6J9pekhos1EGi5T1cgdwQzpOG
 bM9QpvZLUAbpYqrktU71RTHjeE3zTo4Y5HQgr0MXZifrxrImmsSqISxSTmtv3BvGDRwWX+Arbml
 UA73hnRMUhag9G47RygcTMZkcbntOT5ubGrQPqiPvcnzlfTxOuEye8H4ZbHf0ZvMQysHarUTTsm
 Q+BngOQ/U3dvLFK+qdO5Xnew3QK7A/MXxhaemB7p0Zhbgo95mcpHROUNIpJ0juVJdBfSp6p4ps6
 zvZA8gewXZfJM2i0oC0kQayPPifZJa64x4UuqU/t87n6r9f4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXxLciKqGz7h8L
 xFAFRXvfaAlZ6yl4TyMKxR/yByUPu95UkqsFLhhL59BDiyfZoOBJhM96owURsr1LJKaXigLQ4UQ
 j4JdLSeIF1DwLd8MVZRJM1vD5aX38G8=
X-Proofpoint-GUID: 5KWmgjY5ZovIBC_k97dLiIXsRu_ETECF
X-Proofpoint-ORIG-GUID: 5KWmgjY5ZovIBC_k97dLiIXsRu_ETECF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXzP93tJZZt7rW
 cALogEZLKE9Q0hm40qaQIkntax812YIzpjTJFMS6Ke3la3obfthxKjKzA42elFiXI707xUpBf4L
 ZXlTtK+7vQgdn8HVq/K4Ug0LW8GCVg5mH7uW1FAg7Im0VzNo+6zuQhIZNlMcX1ODT/fGb+nrpbq
 ki+rXuOXENwy1h13ca4Qn5fJwjT3Lju6pt+AxBMZBf25tP9fcBRjorkWmZ3+VZn+I9cUV7B5cVH
 psDPC4mww7bQtcak/PXb4RqMrLVhynM8h0suGflGtWd4RpTGE2UYp4Dm0pG7TOXc71H49FvRkkt
 l2ad7SViKvER6YpmPAYCOwc7fBIyjy0UG+ozBezPnMrpQ76PyxM4ye5Jr3FAP8rtQqEngc0JSug
 SKGir0HI0H24ySLDT2zvCB86+WuRbT1wekhfSULGj0Jo/XlBnbj4mWPXygFWwWH3yXEGnbW0uvK
 USUpimdXD1e3xVggN6A==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5e062 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YEx-fy-UkOsNpVOY4JwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190036

The SDM845 HDK can be fitted with the display card, carrying a Truly
NT36850 WQHD dual-DSI panel. Here it is powered by the PMI8998 LAB/IBB
and WLED, and it is mutually exclusive with the on-board LT9611 HDMI
bridge.

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

