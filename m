Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3594552933
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994823; cv=none; b=apn33B9vCU0oO41KpVQzgrYOlfRDKFVg0SDSBJY9iHzkw40dm/Vzm7PP4yviXRuIO/sXxcJoE8N83RhvEByLDEnWdHM2dFBDNCcHjwj0nsile2yRYRSzBWmvpmH2PLVDK9nDE85YRl/0Iq6e4moC10nhzcQd6juzHOXw3oAyszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994823; c=relaxed/simple;
	bh=fiG9JOwZ9RgoyoDyD6yndaiq97l2KW6CcMhSb/W8evw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+ddQFHk8hFXBHFBh1hGWIGVGkSNdgurxzpPODtu+q+zP7CtI83PNgQRrbahe8c5qaV1ndCr1KMVe/8sSE776cw3ck8FppIJrsqFmo6L3zGYSpWbZRGuNR+A5TCv+5p7cXcUK/MEwGDoXd+LO7kGp3fmcVNepvx7scUCeNTdMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LoJ0DLHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKdx6OtW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LoJ0DLHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKdx6OtW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJ5h3642816
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YvA5VN9F1N6zF9xJ2DQD0VDFC0d4+++etjYaQC8uc3Y=; b=LoJ0DLHx+hzj50SW
	Mz+/y+fdRXGzkQVhoaK1cTkTFZR3onkq6dlJbo8VSkdfi1YMC/XFTW16aq7BnyCc
	S6mlzMXTKwf0vDlN14S5C2OllMLnValya98x4hg1WoIiViQiHGEA4u5ecRFpO/4y
	cj2yjNXsPItG/Z4EM97wJX5rkc0rJXRGO75dhPQ6/c+VudXaxtrrWk++GaSkj9xw
	DHvF04ABxhZ0sA5njSLGldxdQl32G11mc3fRXG3BGDge5XeHMhekvvhho3z+HDxf
	pwbA591ik/XpDkgRBlgrCUjfHyjVEJhw2cvfqVABQ4uZrdbHYL2gKH7kykGpEVVu
	jFxECQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470af0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:20:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so79438585a.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994818; x=1792599618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvA5VN9F1N6zF9xJ2DQD0VDFC0d4+++etjYaQC8uc3Y=;
        b=KKdx6OtWqxOa8wrmDWGSPxcWJ5OMTtHYX6xvZF/cYSzHx93+tEQ/DV8nakUm9Eg4m/
         milIvQ9iMxNqCjt/02auaUgQmbSOD6AyBU8ko5sxaFhqMefvzj1O8vE6N7iUKUXXsOT2
         9rkhbO6M0xoIYjxfJvGbxA/Z+yYajf7MhBzowXmsOfLseP8MdFRo6RwPE9LJJIeFGaWr
         PzMm6+N+qUjMrWlvkaMLXN5hB1WaRMBX7fuQu5yP8N3ztjTkJFqvFmBhztJsxjmFTQPa
         DVqKPdlS0ZhmhFlZyWUttdRxOJA/4jHITsKDlHXEdPyAWP/FHXL9pifSug5AKA5DiOuq
         lb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994818; x=1792599618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvA5VN9F1N6zF9xJ2DQD0VDFC0d4+++etjYaQC8uc3Y=;
        b=PSv7rjFFOq/ZX49jco0vbt9ILUSoVggqJUAOsVZPmAiOsNu1+B3+J1rsD+DrZ/QgLF
         wRR0yjQxr2bEDJAsFh1AZM9HKgn2quV2h3lXOn4VlkIK4VeVpovNbc+9eJ80xgCZo5CK
         PazXEUTEg6KJO1r+6hqK/gPUK6D8FStaSNt3flyyGvftm/EZOpa5w99QpJ4Ri+zdNqlp
         fvaHGjkNhP1/d+YHUeFBZK+mbb7x97wSNbp6vxQt3Hp7yxGPNauF/pYcmITTIjMwAXgN
         fs7k2J+vJZgtUZOVOVnjJqfQC4S3tj1d+hUNlITor4gXH+LSHjdWim0ybfm+yAOmUhra
         wtvA==
X-Forwarded-Encrypted: i=1; AKwUvBxsfpWDdOp06Asq7J9idcAGrfED6evVH0FJ2lio8Rm9pP3Y1IupZW9yHQPF8p/JPskGZMbz7n0h4ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8NpwimoT3dAeDWJ6mOOYB4RDKGXJxIEaY4DXAXqLaJpBntK1D
	t/+wWEEQz/qxZB+qDnlIHJfz+oIH/Afi8x5VUVh1z5ECnv8nNMAsIw93gJwG69/5xb8ipCSDIGV
	jhnR7RiWEaJKN+ddkxeXAGmApK/PMcxa2No5WSkB9mfiUOffSH90ZuMAnlZ9Hmbo=
X-Gm-Gg: AYBFou1yNHmbE6MvKF4XPWJx4/RkZKQFhM2/MFsebstut9hLtmRa4FMUJkDB6JoJSqb
	teogsmcb4MQR1pIFC/MnuWT61Bdbw9a3EmdR5Jb2TjL3wndOYwXMrdZ1wW73oOV+bY6IqsTHIae
	7opE1BmXhtShLoeUBToWw/mjfG4EM8f25/NG0k1O4y1KJwZgqFZC17S9noWiCnRV99PvIepGN/u
	9/1+3HUn0wTARbG65LFYbW6zXoIUejWOYYDgHiwbQYMutOXoF8LKgRsCYM1OMmIQhCjoFM8S+Bb
	kFv60qUdtsEQA0y0KnMYJWEWSS/nZmhjIbiUOVxjIorCQ4qQXQ9QiawR2jU8I45JGah3RlGghU9
	MlDe5ZJaGy+lv+xfn9XNo2Apa3B4Vgv+PAp614ed0LxVdbiVCgLjUYszp39ITa29B50rZ70k5nj
	YW74gpJbmy/Laj
X-Received: by 2002:a05:620a:4714:b0:939:ff11:5328 with SMTP id af79cd13be357-93ebd211034mr2620943885a.24.1791994817484;
        Wed, 14 Oct 2026 09:20:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:939:ff11:5328 with SMTP id af79cd13be357-93ebd211034mr2620936885a.24.1791994816864;
        Wed, 14 Oct 2026 09:20:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7d0f6sm740187e87.38.2026.10.14.09.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:19:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 19:19:20 +0300
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sdm845-hdk-v2-5-6d0b4b42f267@oss.qualcomm.com>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
In-Reply-To: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3759;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fiG9JOwZ9RgoyoDyD6yndaiq97l2KW6CcMhSb/W8evw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqz6uIKiPcnuT84rLen1AukFunySURVM0g03Lh1
 21lVTg/aQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCas+riAAKCRCLPIo+Aiko
 1XhoB/9pOmvOIaU1s0UmuN4LFEoRFcc6VK4R6vVfvDVOnjFiZkVFdV+RE8eVTfFJT1Ah996kYXj
 ckn1icJBgL1uw5U4+95RDZu8T/ukocAdgHJbUST8ZI5wfcdu3h/TGmEeRLPNvgBUq4a3yJp2mdH
 AL/21pc4fJCMNq7IcSmrdZ9GNrkB6w60UAERE5BDY+/aEQDPhBmISsoA2czMwcyVCAoDBAQws8E
 NL4oWqdPfwMHTdIxCT2wOR4RAkgBUIZHZsaGbj2MffARKX0Vy1KL8HUmmikZypFZzl+86OQ0DuM
 1j/hGjWGE0xvnPnfCu2iPizghyiKHhlOo9cSS4kXet714zeA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfXwmKJpgGRcmGI
 73V3H49LKuIhfw40zAXm+uQFmOwZ4A2h1xuxJnVNemCkrIrDw7wEQ7R1qqY0fjI4N2YiMAkfy1G
 suOmU8mgJrkJQCclfh0m2Gs1nju5SmgllarVd1/tR0HEIVTutiSAQJKIwnflRUUa3PgxabkvUI5
 2SZGysY4oAC0c2YFN9VMqItHCpJUF7aLtSuL/jNVCoCqbnJck/LrlobKs+6iNcl3YOAftrpgsdw
 Z+gaVeGsHIOsZ75eUF/7gEGvsQ9PjCBwFaf9wUVFuLsbSfWiueuZj+sJX8/xuf+UDu0H5UiKCdE
 7TxZP9MejP/nfnrRcy8chz0CA37uaM6R3Ng6oZzBD1R69qUMaLz7Uo7wZWhDysZFdEICF4Sj79U
 uOspY8qkIPhpG7/wuEb1UGt0V6Ci/XySta1xgzCI/nBkN1je7N+uE7tIuisDYeXj7jOnR1orJai
 v++BaGdlV6aWCIs8umQ==
X-Proofpoint-GUID: xgX8NQDezbBgfShKDTBZBoFkHo3byVtc
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfabc2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FFXsBguXHA8yshPlDHEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xgX8NQDezbBgfShKDTBZBoFkHo3byVtc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX2B92sWe8jC3z
 YIsInL20dHppwVhJ7eQmsvUfQT8th4tHR5euYGjPBUl6FE0xDScjCddSenGQrWQCTkDWo7wi4dS
 WjpTeEfXErvq2Eu7v68Lwl5O8yVa69I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140065

The SDM845 HDK can be fitted with the same display card as the SM8150
HDK, carrying a Truly NT36850 WQHD dual-DSI panel. Here it is powered
by the PMI8998 LAB/IBB and WLED, and it is mutually exclusive with the
on-board LT9611 HDMI bridge.

The configuration follows the vendor kernel, with the bias rails at the
5.5 V default of the LCD mode and the mode select line driven low for
the dual port mode.

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

