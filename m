Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D993CA490
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 17:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646109; cv=none; b=XwCir/rQ6SA2riN/xg+MzoWVCj/71nOK8UF94jlz/xHmfqssNQhUwm8js04ohuv/Qe4ZDns+ckIkTLkk23FFuZRIZMRmziFiAoFvxKy/mfUmVz2Ktgyva/VI7yvsHbeD1D2uZStbQpzMW5BANM2q4nM3vYTeGwd1nfmFA7XpQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646109; c=relaxed/simple;
	bh=XXDrlXZhcUWS5yXrHT0sKR6gNpYeo1u5PaKEzVqYMv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AM2a4aaTYJfvlTAsrpr6/bP082Xh8fRQoqGz7BfaYPoT3CrPLvjgb0PRD1JjuOyvAyrd2qCA54+wj07Qdll2xUjSmlQ3pF2bAAXjvRkwsE96YH2iEAF5ijaRkI3KSfZtR4uRaqopvCCkoAOeInuys3fJ6eZWMTf/U0Us0om6WMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0vjLvi3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQIafM/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0vjLvi3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQIafM/V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624DAQ0E1421868
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 17:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i44vo9G1sgcNUMXOuwpN2jErGlIv0/1tRkQyHWiOwFI=; b=b0vjLvi3u8nIr9D/
	8B9gTBnOpVSHX0FpVqWQ61jRlbM62sAN6u+J7KkwaG3Ywr4jgqVxsA1XGI6O1ndj
	Gkqy1TFYGM3LWSpagKZuawOhSsr5SWWZWC+d6855Gm5bRcz5NUQoLORj9MkyrqXc
	LqHzX6Nhjo2Xew4KemJyMZ5KNhwK+/seu1It9zCdVyPH6OS0wRGEz3xKs8UHtHmG
	fgOxiwPYcY4kFzURiZoHuSU8fCXjlSEhFPuWgMWw8caKK+zz2qE6o1SRGK0FEFja
	UMoFjRl8EZ6RaF8j+ZbmvHcYPrhV2HWdrk5BOCg0MHDpcrUuxtL798a/trCoo6g7
	WACc6w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u2b9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 17:41:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70ea677571so4287529a12.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 09:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646105; x=1773250905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i44vo9G1sgcNUMXOuwpN2jErGlIv0/1tRkQyHWiOwFI=;
        b=WQIafM/V5B04NKplh1pvFfyVQtrpGX5afDKGnbquwMFMOOl1hneUBxtSbLWQv8rbZd
         x9vndhS/GuC4Chb9zs4ISIGmiok6BSajfoTHYE2kmHoUsDozgAY+QEAoGc0epUVlnIcW
         7y67vrPHU3mk/eLamA7orYVODGvjepwv7Xutn8bwugXpBmk30J5IjBGnO/CCZfstku83
         rOwkFSZ5+u+FsLpEK+Q3M4v3J/STy/36+oelaGHsNwDXPt+Hno8vIHdvP/jJatwk5GOM
         1Ri0TJTkdO3VsRS6l9n1GaERyy/aWiMJy63yW2Uwh1/kTZjN7LER3sTXD/lDcQO87N9h
         Mrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646105; x=1773250905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i44vo9G1sgcNUMXOuwpN2jErGlIv0/1tRkQyHWiOwFI=;
        b=j2si/Pw+Fnxwz6DwctzeN80BKh5bOpIumnRu5AJGWx8843I13cISku976MceWfQmkU
         0ZQvcWyg/rvjSN6MHOQiYgBa5BIf46qa5ptmyEAdVWAhYGMHyxzcZuYx7eGM6Q8drmF5
         UT3fqPjOEGGqm7uaU/xESWOmFwJIsEB0ePSciUHpICGHNcQ2Cw0oginqp2YfOLqViIqm
         12PqtqtftEEB9E7QyzhYzc+lL8WTFQ1B2NBPEmrvUDX+3726C7zifSK1tU5sFQsHn2c7
         ZklpijQdaUz/wo149mWJxul4n2LLHrjswThx0BJtHETT1mOD/6HedbgayrgW+w5uGfPU
         w+eg==
X-Forwarded-Encrypted: i=1; AJvYcCVD3+d6OkYFfIcGEjpQgKhN/mwM0mZZtmzNP8M1tigIeAE5fw8F3gs1rM6jRog7IXwGga1NOgmCLfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBk0pPI4EG+KHjRSgk3qzrsQEfitRj7rvaCJAAfCyxM6XwR2u3
	kfAyrbQiTCYGmIw2rF16ewZtl3gOmC0vcAy/HwbTeA/4qPfEVvVK8XPxoBLOSLw6QruGbdj7Nxw
	4nKTJVX47ewDNpo6xhKKETSOexhQy0I9mtiMxPhxvTqVbLrHCM2syoHgyJravHdo=
X-Gm-Gg: ATEYQzzqGW2FzAytyYgAE/Qq352OX1J5q+h35toz4TTNh2U7tQtwpj6rj1XFMAyERL7
	shsVLplNaUvvEYlj910fgYNU3Aie4CxwixsoGKL6m/wfLFNi33K5xmqFHSaMyR7T+7BMkxYDcH1
	ht41Ocn8LNwP1Fh06kvakZMQHi+OLAJONw3uQycAV+MaimqMljl6o+WFufims3f7BLOph5wUx7e
	Gx1JD4CM+2a2ilSQBfILUjvclPlZpZIswp4g3qNh0SqqPiuN4AuYCEW4HbAbftM28ScU68TQqJD
	7b0rbQXOlwTfQQq2qqPJkRO4FmXzdcI5Q1bUeiPILNZSi0RQoWW0lDAz2MhB9z4aLwkSlN4GPlg
	YbAdaAaoY6t8JKEFXRvi7NKWfB7SX9GaLIE4Y3zTuJJ0ii0vlV3Ze
X-Received: by 2002:a05:6a20:cd96:b0:35e:c55b:9203 with SMTP id adf61e73a8af0-3982e1f259cmr2590304637.33.1772646105427;
        Wed, 04 Mar 2026 09:41:45 -0800 (PST)
X-Received: by 2002:a05:6a20:cd96:b0:35e:c55b:9203 with SMTP id adf61e73a8af0-3982e1f259cmr2590275637.33.1772646104941;
        Wed, 04 Mar 2026 09:41:44 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:44 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:56 +0530
Subject: [PATCH v2 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-6-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: PD2nchTtRRjcA_ngCxlBB-KxbXuh8K-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX+6wHH+jH4EKX
 6fJpgrwued0sUufw0dkuXAfQc0oFP2X4Wg8q0F3dZ1xmHeElQyg61LDHU/5z5aXJkQpEtFZV21s
 0HrCjDyow3IIVhzVWlc42Onu7VU3m5WQET2XsDNNB30Nr5s/TvAMX20e8sQmRwvZipQw5AZozhx
 v/UotVpx6kfmWL1w9TCAjpeUvpSg4comhCBzrxAVTazBhyXV/qAZPLoBmqWxRoA42VRlsN7/xpl
 vUIVtYom8uDuqmWL4XIcoKVUchZFlLn+SLvh88+Pte0LvKvDTNRSu19iyhhPdGu8ejkC2wm1gLl
 eitFoLWANtCtj2NcZYLGbe69bCQDHsWEFdurC8sHZi1+l+xcEQW7P5/nGUdxPtrCuEDOEFsVmRF
 +oRR8VjGesgKW2J/3lrhmgn6sJIj183E9VxxfMydNbInwUpajEqF+/Leo39wP1f8kyMMtLKdLK/
 Nl47TTSZNsxpcrqxcHQ==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a86eda cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2tf4Oca15tKvMlEum-4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PD2nchTtRRjcA_ngCxlBB-KxbXuh8K-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one. And update the compatible for camcc and
videocc nodes on Purwa to match with their respective Purwa (X1P42100)
specific drivers.

Fixes: a8a5ea012471 ("arm64: dts: qcom: x1e80100: Add videocc")
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e6189920a137169b14b607c6acac6ce9..029ec012d0a94b05f8d4356ba4a95badeda65c39 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5464,6 +5465,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 2cecd2dd0de8c39f0702d6983bead2bc2adccf9b..46ffe5353f3d2fe20e70fa8373c2591863708c61 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,sm8650-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -22,10 +24,18 @@
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_zones;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
 
+&videocc {
+	compatible = "qcom,x1p42100-videocc";
+};
+
 &gmu {
 	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
 };

-- 
2.34.1

