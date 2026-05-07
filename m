Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4CE32C94A
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 05:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132365; cv=none; b=NLZ0zwzktyFPlF1lcMTjJPtB3rDN9pQHkjV2BNTdP/KpK+i3SIDKT3pAT8AuEI1rKRiGyar+1dqc1dT9WJuFZlXGCsjiMsNytBHFKkjlKC6ROaYtEZIJ2X91VtRIyA0jjSGiXB1nMx9ffPo6CRJ/Bw3US3Grgh0EIQI27BAjgt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132365; c=relaxed/simple;
	bh=1bQKyQFuznWk2H7nFim3U/ajbldz2nkdFVHT2l1G8Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0DIlxE4OI2ip+S7fM3M3Uof1Sw0eo43W9h7BJR06l9sbaj/6Pu0v4EhGQ7drmtaYSKkYDgK+7A/R4WVi97ZMOud69N26jMlvQBuacWp6WVO0vkkvIoXz/0BKjrjBKgJZUTaRBAMJZA1WWIW824FbhPEBKdu9d60/jmuYKFTn+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y28r68wE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/18BZPm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y28r68wE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/18BZPm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64757fL33036458
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 05:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qLex6gOIHDgMu0sjfno7UaDjWHFJqKQo1alL3lhwg/Q=; b=Y28r68wEE4q+pwqc
	9/gWBjCqdEsuZjQcD4RaDP6kIibFxG7KDwWL/2MciRlq2tFTqv5k5va7tRdRLwkf
	rvF5UUKlzrPzx3gPSC++bPCqgBQqCsSEVH1dr9StN0x6ZzVyMr5eXStYvH35tzgD
	4PsVIKHkwaFY/441I8tO1ZJUH06fBFnrvAUjnKeny6Fty/aP03R0elBdx779IAys
	rMCukX4X90hqosYXk75cpNXsTCq36SC9sYFk/dBQz6PuLqtGZZOytg3P47ERnLm+
	J9rV6SsjMssWioAM+2s1gFR4asO0TfARwra/AXkdaUe0JGgVjOTv5/dBs0L6Y/iP
	D+oOmQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf3bqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:39:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83836443305so245256b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 22:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132361; x=1778737161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLex6gOIHDgMu0sjfno7UaDjWHFJqKQo1alL3lhwg/Q=;
        b=R/18BZPm2TeoTcjTlkgPxWlif2ktZgQpYNMMZnPY5NI3EDXYMYFI2PxGQ68RG6JWLM
         DvbE5XsdHhrlB5dKfVuGAHYpRZ5BnlHdaGAHnCuyrnFtwfSiX19ECjuQoFWCk+WJe1Gw
         lMtzVlxmTApoM84IO7p2ufGURBCVInpSm3Lq+LvHE90oTohz7F2ZVJbPMckw+ftGPj7f
         bX1UgNCoq8trwM4SsW1hxAsbkpj4GpI1wLfdsjKoyxZ686sP7sifm02ppMM06POHMsYs
         nshF5R0jk3owBHvAd/UWRgS0jYShe0M3ImputLVi+7gG1tBBIx0XKkyTJ1BKEjBknjpt
         J1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132361; x=1778737161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qLex6gOIHDgMu0sjfno7UaDjWHFJqKQo1alL3lhwg/Q=;
        b=mSWzOFM+Ca2h/i1Bv3VOqEm8D6R4ZQXVIbY9uzzKHYHum+qVBiiXMZv3Jqt7Kot/fa
         SuXMc81dAIb03zYBs/yZYcCO+f0WyMukkhHyGE7C/dGs3tcXxPAzehLpV6/ka+yxOdsc
         TOkFAb9BdfWl7QasFmoTXz55fsXzmeYUw+9ws4/pfrSSloYt5M7QZWNLdCzEuFYsZ3cA
         Fq2n7yhJ4310GVzPbwo12VXA0zDtkji0D/+nGCeVgp6fsTExM+pjOFCrqYgsC/JTfKO+
         L7CyJtk/tJDgdmOtd7mG0FlH8w5QQUoDOHWV2lnJWgPUh5D2XDQ5GSwGvjkm6Wt8l1NI
         5azQ==
X-Forwarded-Encrypted: i=1; AFNElJ9TWUDjdQHafmFzWJjo4B5TYtotmZwKGTotrZg0mS/D891ADF7QXgTqnv3wP8M8eTar1tMMYvtHLaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSmPurXAsuTDpg3fCRbySA+q5T+Nea84ZZrx/BXtabcX8LD20
	0Ak8KIFmmNO/rHo8kPItGIMK6uX4QZgdxcpt+EFaCWfvxqg+ql/JmYRk1NZ8laZutWkQT6swOCq
	Ei+3mzDq+Su5oOGe6LM+uDPbk54yXL/rehbjnYMK/UuG1OnCVA2PmYFG4lmqGICc=
X-Gm-Gg: AeBDieuJo0yv6SBgUvBiylh2YxPVrF0rgMPUpK0pdPw77bRrn33GZs5R3MJQz0xlrAb
	j7Tmd0mnpWeYn9PxQWOtUO19eEmu1OqHsf4jkWqGlAm/YqxAdp6QSX1spcs4xXwd5xjVkVI+VaB
	m1wOtsmOid7qEM85UjX4v6QwKvkym0OjJGWHxRvKgGLMP5MzZZVFPiKaTo1TQ6NuIu05pNyB7Sn
	QongiQwPpovVwr2wBFLdneZJdbhb3YrlWSZirAdp+/v7f0416rhgXJHapuAgeejWfehR3nZNcYQ
	XZ36VtiMo6MX/gLANX1UYzRUVpU0boiebY/kCHPqy6sdHGnNV2PjhhPBRHtQNarZnkLsXdMh4yN
	imlfpqmGVHjGTQ8jQyVLm9pbx/0+HOxWNOkLj4yPUhs06RACGJnMucvaZ2i6TMbI=
X-Received: by 2002:a05:6a00:994:b0:82d:29f:d003 with SMTP id d2e1a72fcca58-83a5b6d2051mr6064391b3a.12.1778132361430;
        Wed, 06 May 2026 22:39:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:994:b0:82d:29f:d003 with SMTP id d2e1a72fcca58-83a5b6d2051mr6064362b3a.12.1778132360929;
        Wed, 06 May 2026 22:39:20 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:39:20 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:31 +0530
Subject: [PATCH v5 6/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-6-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfXwx9y5toLi6cf
 n6sLXxgpaHOi8VsnRCcOAdet1N3+tpnMfhmavGwFcL5QQ40hUCvgqwf7uamcv/n4RLuzwOKuL1j
 H1//bd/C5tNRZlsLyhYyR3svQ0ymwb+YPb4TlDZCuMWaU6CQ8hJF6CleeVHxeRLkwz+2YkkbmQj
 kaXS/hekxTIxuGec9pmor0JzQf/2eKp85ioZcogbVbewNIsmR+yf8X1ddky+MCK/3DuHFNYoYLA
 utHO/dd3jG2n3xDnQR7dKsHGFR1aoZI4ATokfYiSvM4Uy8dPofDW+LNn0YchBB2oGsQrpLdojOf
 cpqsHWRg+50QvdgEXqMUKF4QkahaDqHzhIFpmQTNPXLC4hkPTr2VPDkzp+aROcxCukz2X5bL5wQ
 BDUoSc88vhW3MpQU0eWnS1j6SnSxcD3Wneawowgx8prZJvCTXuAoj0toYcs5NuG9sKtjDOMNV/0
 Y8oIT92OOvvIqromEzA==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fc258a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7hkWjQK7Xc3mONE6JcUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YBoosF2d1C7mOXUzaq0g9vW3h9F5SpmQ
X-Proofpoint-ORIG-GUID: YBoosF2d1C7mOXUzaq0g9vW3h9F5SpmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070052

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one. And update the compatible for camcc and
videocc nodes on Purwa to match with their respective Purwa (X1P42100)
specific drivers.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee0764167338023c96342d895f2871a61c59..c31462ba393fd77b7124db2ce680663945e7fee5 100644
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
@@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
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
index 9ab4f26b35f298ad7c6c361b3e232edf07baf223..25cd547caab8fa64eb1a134068b77f5178f5c248 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -36,6 +38,10 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
@@ -256,3 +262,7 @@ &thermal_nsp3 {
 &tsens3 {
 	status = "disabled";
 };
+
+&videocc {
+	compatible = "qcom,x1p42100-videocc";
+};

-- 
2.34.1

