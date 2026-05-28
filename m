Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE78302165
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935373; cv=none; b=LhUVNDOJz2Rk+KmVY5JA0DqCL0r63FtLcriYSWkjPvHCrFrii/rLy2i2pxzdC7MTr8Ew7FmFGFzobzERVO8wt8sAwzzzpyCByXY5HVZwUBqe08Ehp5vU50tu1IdXTnYSgRER1w346jc3eH8YdU6e6fa2sdV1QQAJF97DTVOAVuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935373; c=relaxed/simple;
	bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pf0RIokgGBoMs1+QJdzpOh89xSH8z59STH0HxC4FBAP7Vr0RiLEroHFgRL7kFzv3W3rnwDML4ICaZb/LPZjI7nNJPTlPqKje6cWwI992QH+VhDxYo6EK0G2p9x61J3OgcvUTcbppVulr7YDmXSIT4bIwn3IKYUiNylz5ZGsAxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpNKy7Ls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3UDR4HH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpNKy7Ls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3UDR4HH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKn8q21638879
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=; b=CpNKy7LsBQy70RHr
	Sr9oeufRQjLPz14Uh58H2MUt9x7ilPTalznpNKLBQXC7u0ScyOOElFP+LFI6Mlkl
	NHIs9VUYuvqGTpSQrCSYnlWbv4Da0ltHUWkitP/+ORCanavYb8uOdBuSBZ4QGilZ
	ksll/JCJt3CBqRvcycxRqyUYkw3l12L73kXaamqnwa7mL7/gkUBStII8f/UHIHd2
	xIrCCQkDhSTcmKeR5JR/ARb4NYlHtAbIc/1HxvgHLmTznwsFQREbRSLSbq3UPs7Z
	6q2bNt2pDFbUTUVTP5PB7GT1VF/HT0LKZ3DLYhjz8dx+BJIwDdMbjkQl/d9eq0YR
	t2zMKA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yngy8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 02:29:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304448ab58cso7227097eec.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935371; x=1780540171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=a3UDR4HH4+HTq49M2rfm6DImXfxXeSKpsShthGTVo7kK9Z38UfE8PpV4HsJLZaeadg
         ombZGHEGc/LrPgQU8tDRfRBz723aBhCMb8jIjAIrPDQOaQe/xb1srneqAevolMmd/8rs
         tBfMD9QRwubReQ9nIQEo6MhZnJc2dB6h9jiKOapRET/OXuOawU493eblZUCXy4PF4GeP
         MheOMOG+rMPoxB6rAvY/wTVTb8StPVViGjkWlF/iU4CBXp1aO3px5SFZMNb29KkC6iKi
         Q5F12arbPsR9qJjE5xqYHhMTQmI9yClwb1aISi88Xtn4X55MZQhfQdhgHpIUcva53L+2
         4Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935371; x=1780540171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Um0SGEy8hxoDQMdJG/QQY0h50libSMRMn55Wj30ICvU=;
        b=k22gX/wKEiDnfD0kyU2ek/Ybi1yhFaY9BgQC3cVnH1qBEobdzfDTCXa3+zS5HzC8YY
         557xAUacbEhWAuPDHC7dVIz7i/ew8CNgAGj0YbWcIzwbahpI9gcEWc9llSchRNko6+jf
         mgH5BSzOLuf4nkWzU2VDxpd8Yu87AWFX7ijobpNnKi1W7q5suIspOGJIFM7u0Klw12hE
         AXmr/a1QvN9GHxQPiOrTDxVM5oGdXWJUIID2AHhHKRM9OsjQZgLzn3QdEbZjZQ19A9H1
         lRcuHV7JmmEwmw5yL2wJCa72WqnxkxLSe4uZh9vYWvFl1ldmXumdD8bo2Q/Q+R6xZleI
         TQLw==
X-Forwarded-Encrypted: i=1; AFNElJ9UnajIR0S95GKQXcB9blcyFZbalyeS0KQfMjLIrOmE+v7vI9oBdyOB2bwajYQQzKMvcwsHJC6msBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFGhiu4Bs2KsU72v9VE9A7u+xwQgTy9JGZ6KZH91Yv9TZ3iSdW
	FKBkufR35fySotADLr/X+tEyVfmlOw+m/NANEnZEsPIWg86xpLpwalHei2giJvBU4OL5f+suNmu
	sVLsb0B1i9C/wbisxMh4J25qMxtsUbYNPAfInJW5h/LfhyLxrvPFEFfEOVR0ea60konxtRoM3qw
	==
X-Gm-Gg: Acq92OEo5rtfMvJdgmXuHIq0g5OAdDTty+HFKNNFj4XWz75k73Nl/RTiMBZOuv37xre
	04bR/694pdxy53Oh5oFwlpqIE0gbcWcXW8bphisP5UyBb6sKqhkT2Za3Zib2nnATU1u05ZSH6xO
	EJB45QivYneciAaoBoiBYkPDxIbH6oXT9W8AL8+BAMUYo4n+KnJDpjaf1ZFsYpA+sjxEJZNZOpm
	Isr4I50hQawNeqBKGnxe6yyloPphvN4K883nPgmF+Exm38RkKsGOos7AaVexxcFq+H/VyQyzVbr
	65clZwbssTzuXcnDhmNDchdPbwUuXxFJ71KbL2DQHY0PWSapsTwym7Awd0Hu0BDdHFQRSOPe//Y
	3RqJOZaYSq3EJ03Ge0aGuT6qlpqL7y1xgpuBAK0MG/0FqK9aj1+R6ch4POoce15LTDvW48v02fB
	nR9Cc=
X-Received: by 2002:a05:693c:63c9:b0:304:705f:e4e8 with SMTP id 5a478bee46e88-304705fe96emr4415262eec.32.1779935370671;
        Wed, 27 May 2026 19:29:30 -0700 (PDT)
X-Received: by 2002:a05:693c:63c9:b0:304:705f:e4e8 with SMTP id 5a478bee46e88-304705fe96emr4415246eec.32.1779935370137;
        Wed, 27 May 2026 19:29:30 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:29 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:17 -0700
Subject: [PATCH v4 6/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-6-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=1791;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9FZHk8D4zHs6knN/tvir728/vX0PR2DvuCRo3y6q31w=;
 b=eYyn85cRgwDDB/YpWyAJfuJjduiRtwbqwZMpnEsTKvCOI3RVwRimdZ0bP1dbxHouGIYQ2qeVZ
 R/P3sr11VDcBmNvu/Qzj4kCqikqo50jdnj2dEOFvPGXkSYgQ6gxQVAx
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX1Q5f8etTeEq6
 EK5FiIe5vIv5DB6VclVcDzqPTAWWNUz9IPUl+lQl3q024NIMF52fKVkyrxsvZDwbV64U0GVH/Kl
 79D+U9I1LcD55GbHBVjNs6VdtGRDisFjKjfPO3ykAeNiW/UKtEiDT6nJ826An+nGQxRBBnkS4hY
 QgjvWNpNM584ofQPx93ALOuGwGjpnMUwVcd/Oq2H3V0RdjBTtCvkn/9AAeDenGU0Yn86Q7iPGOx
 ++nFmbGguQeyYpP9/ifvxDywfTAkhoyYqSLZxz+ZwhGHh6+NRi/wk9gvVxdq0bANkOuPH/ZmZ4u
 aTYVRgWqIVKBvoe6KO8iVd5sDgyckYNwszNJBVt5nYlDV12YPWa1s7vnCy5Kr9+zgT0SwKnzo2u
 o+SEqO75TEsprAag+QghAuuXca5uhvgk3SLCLugafLs+ByVPopaEdgS0vxoXOueGX8Nx9UlqFVf
 ExGk7nx3lx2XBCvEPHw==
X-Proofpoint-ORIG-GUID: rt_c6TV7mEttImg9aHhDHQsuWW1fBGGZ
X-Proofpoint-GUID: rt_c6TV7mEttImg9aHhDHQsuWW1fBGGZ
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a17a88b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021

Mahua has a different PCIe QREF topology from glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies for the PCIe clkref paths on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..8b42f5174b31 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,18 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..eb45adc8a0a2 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -286,6 +286,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1

