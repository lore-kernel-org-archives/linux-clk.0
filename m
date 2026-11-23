Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463549;
	b=DSRwRnoHXC5kZ14kYZnhv0JIyJeHOK/HniMYT+Kx2HUz7OekHfTvCF0XvKOsQFNGW++G
	 VAFd+xT1fyetI0eniOKF60j6pBtTsgapDLcO4n/8k9lUyfbxunGmdiY0CuROnSawG0nw6
	 5LWHZ1Cl7bhLNfizZ9pbaiObWZgvfwqRLuT/bKFB0xQrbK6F+NZvz8dd08tp9lMqYkhRP
	 IU71jFvR9ASr2xU+//428NRvdRApbRKUrPxi17XCYOQtpZDMaew23CdLJ+IvTwM/xluYF
	 hLwcMarJSor1xFCO4fdHNYnBb1Kt2mzjz7IrzFAa6v3v7ijXNHaC6077lfnbXfr7mYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
	b=UQgJn9OctrZlidi+dZUKenUDpHiAxJJGFY0+OwIRQopRypZMVdqWDEGlQIbIdeGIFF/J
	 IUDZWrUB5Eb+rtqjwwd+kYVigjMhK8a+6F3rHHoZ4qMfLWZRaG8Tn2FZYb7EH9WKVE9aP
	 ERZ2sDlO5I3AoeKYx11iqyNulJ8lsY3V6X7QU6xkwBmuMLK+OmDv5SfxMwgVl3KdaQZLZ
	 5qsnaYoSPS9rgGVZOLuuHW21rIvNAZAIX7zCmsy6DyX9wtTyWAWgASCeb1Vi/WhWbwgyK
	 QZm9qU78w68BN+rlIFksM21ibcwlgYFyBS0fjbrKuQZrYwSYIBoFrL2fAXX0MA9uujg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEuoM6vL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhCVNVdN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2015606A32E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2015606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEuoM6vL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhCVNVdN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH98N3475364
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=; b=SEuoM6vLNzMom+R9
	jHLxOHK0ndtSRUeXl8wV2xIxUa5faQ3dFWkmzJKJsZtxQwAV5as9U9wDAz046fYg
	V6bTnoNjfNH8JOX7NuMp7Yk7O1LJ/usacXy07ZmELCXfRhnYc/tZk9RTx8T84I33
	a3rzuqV+H0tsZalPTvt+uqHUZr8nshLKPvr7qimWEB4tzhklz8foUi1BbvAqXRCv
	h/59mh/yLErvPKfQ/fm7XNFuMB82ts8oU3t7wCj1qa271lckokZHIz1dtaOevRQD
	Xsg/sF6a9+vBSQUIs88t/C8Auehy1Z3LBCFdzYX3ohUqKGrHksVX8dUX//9ifkX1
	OjdV2Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tux5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a0f79047so3353909eec.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463547; x=1796068347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
        b=fhCVNVdN2azqQAEFSzQIOZyF5j9or2gDQvyAI1PGSAj9pRGPZ+YXNWvTAQ8+8QMdy7
         gRWifWOXgWG2Xf9rX9FctC+5I7ndHxqSViOIynCt7lj6XPO9J5oRR83T0/3U1pHZ+xJM
         +ZXURDzN6Pw/vnkeoFIZ1Y5lsBrrVH3SVopUlkNsaPTIdwMB4FC/WZtasvtNzYVhIlv3
         LZz61UlX1R4vCBl2s3lqFFs9SQlofBqkpsZFH2zVAFicvAZS78oEmLx1z6/TIroSoRJZ
         d9bEFINZi3ijjVaknXwz5tpRk006Q+xSUzYpW4sIQBkgf8EymtPGfgT1VmesX8Vz+IQb
         c3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463547; x=1796068347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
        b=lErWSlxniD48mnNcfZWG947tUeI5xQEnB65Gsa8/Sja3PxdofO4KOVS/ZLqcspbduO
         zTGXIpjbNeiT1+WqoDtG6bIgLbQWaenf7JNP+LW6iJNeyBlvd4ckqINHW/F8HKdtMm7Z
         8boB+YansLd+s60eA1iHcNzioGtbd9K20Z85qBDGDrsttlCgebZzJ/b2C3uWij3JGf4F
         PZZqxCKkjsJ48v+1d6Va+cfYDnKG/uv0G8duN1/CmCjRMvl2DpfAmhLtl46BQDxGuxXc
         YxpKJR0/eUYJl6g3oz94wHUITSLA65QcolA5mLS5M9Q75wR9NokkgUQmZ+lV/Mi77bTT
         BXJQ==
X-Forwarded-Encrypted: i=1; AL+hErGmjY5WL//4i4SnAzpWL1MThMx+a8oAuBuApTcq0Ly/+dJd0lAugwUl7a/THolU+g61ELYttO/WSQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OYYEPtzzbwSYEjgWhdTsd5MTb5Dcl+2jiUEMiQ1xcYzk+qB+3
	of+RUwAYlgVc3g5omb8s63Q010HCnCUBtZG/2uBKmwQt+hq244fuTHRoV1K8TXrxIUgIhyF17Nq
	ygJEO7JZ8542M5sANzCPOkF024EDJ0lWIUlpiT+Rq9E43088fbJpVmYmcOfNOYMc=
X-Gm-Gg: AZFdTZfAeYyucJxn6x7kSy2OdcPwh0Bp/GknielCnXr3GPvYCWAZGZXFtEzfciDX4Y5
	Ptef5J/B4+Mpp2LU8s9PJuSCBGw0VboRMYUOpLcmUjsQzmh7FenNS/SrGpANZLiQzHu3HbkT3Pa
	/bv3p6ZKJWLNpP7tRB19FeTgP0dBPBx2z9l4kvFeb8u8KROnZweNGcwy/X6KAnfqXfHwD70pIp6
	WWWJ/k1/G8tpZTrkvPieJBHn8CsD7/Lm8M3SgJupLj+Ki1C+GEO7ebkAJPxNJEv9eM8+Olmv9Kl
	jW77ADWPMG0AWwrowLVv4WWgSLl8v2Ok+MLIhOKcvc9KrH5fU9QvZl3N0RUx9usyoafBcPJP8xi
	245JO4N7j8Czko3f4hQdFR1FxfEI4qzEh+l7JeHY/y+nVnUlzhVI7Axqosvw7xadFAaTFpBKZJA
	==
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr7564889eec.24.1795463546846;
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr7564855eec.24.1795463546284;
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:37 +0530
Subject: [PATCH v3 06/10] arm64: dts: qcom: sa8775p: Add GP M/N clock
 controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-6-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04997b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qaJfFEnBwp12TzHMd1oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX8lIyZtKyb1ss
 O29airxJ+jayS0aUi0T1Q7WVuyvuMc5XwwtwHJzey5ZYnJmwIzsTuv+RYtWBJozhUCyWTqOWtew
 VK7XCa3yBiiXqW+sQrckCJdMFHMGCrKNeX8jnc8VtPrSR1SaKCbNZjprGIYrr/T08uxRtW8GfLP
 HE3Mfc9+J8tu6j2SeWb8ghdLV4KcMcDxpQh7on/FzcbooZddPFTqxocfoUYMjalhtdl2P3Kw75w
 HQNppE1XSm02RbgyBg2dKRmx3Cmc0dmBjJdOvNen6UIWEsVsI0KV5u5FAy8xCkOO0FR7GJ7UwLI
 JK96ObLfRfXxOiSU8HH2MYrc5UvjtuIkP5WiihRC+dGgdep8Cy9NxzQX+em4wSAqxpzUDvdUeET
 7ulEAszXgnJtlmnKHB6G0/Xqoi2UbnulNgw2PJEIt0U82xefh10/5GgIrUHyY+M0goxFIJileKC
 M+ru+1pzwDt259U5Huw==
X-Proofpoint-GUID: SPqDAz3rn1s7AJhMohUPG2tLil_YRjPM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX1eCneq8d5nKE
 ApKDMeOoVomgO5+aRYFa8qbSMHQDEApEMA49e4AWWD9brlJGhv4r48poeqeNPMCGY1qfibJt5Kz
 5X5oF9ZEp1vWJgUw8vtEisc1CCZAMSw=
X-Proofpoint-ORIG-GUID: SPqDAz3rn1s7AJhMohUPG2tLil_YRjPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SA8775P.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e1cdbb7d67a992172861a5a10a05a..4bba23df8a95d306867e22c49981dd8c22d4a6e4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1849,6 +1849,20 @@ lpass_ag_noc: interconnect@3c40000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	gp_mn: clock-controller@88d3000 {
+		compatible = "qcom,sa8775p-gp-mnd", "qcom,sc7280-gp-mnd";
+		reg = <0x0 0x088d3000 0x0 0x1000>;
+		clocks = <&gcc GCC_PDM_XO4_CLK>,
+			 <&gcc GCC_PDM_AHB_CLK>;
+		clock-names = "pdm", "ahb";
+		#clock-cells = <0>;
+		pinctrl-0 = <&gp_mn_active>;
+		pinctrl-names = "default";
+		assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+		assigned-clock-rates = <4800000>;
+		status = "disabled";
+	};
+
 	usb_0_hsphy: phy@88e4000 {
 		compatible = "qcom,sa8775p-usb-hs-phy",
 			     "qcom,usb-snps-hs-5nm-phy";
@@ -2515,6 +2529,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 		bias-disable;
 	};
 
+	gp_mn_active: gp-mn-active-state {
+		pins = "gpio35";
+		function = "gp_mn";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	hs0_mi2s_active: hs0-mi2s-active-state {
 		pins = "gpio114", "gpio115", "gpio116", "gpio117";
 		function = "hs0_mi2s";

-- 
2.34.1

