Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1938D36923B
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971618; cv=none; b=SlhoxoaeETgYa2ODOPFC3rLkZB4Rt5kUk+/S8YhaSrLnjgqeXcrI2D/slag4gpeOVuTE87J1X4asFy5HpYf2iYbcPBdC6t8g+KYehXIYGx4cLFZUaKLx6uk8fbgPG6oJtt2c2XjXlxyPHOwdEWvVU1VLPLkRtRevONLEuvgtUyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971618; c=relaxed/simple;
	bh=yQBFMi0V1Q/34XT7l2xkr/OPRTO8ErCo82SZzAZN8PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uY/qQCk6+So2S9OM5UrwjQtMTHNxzQLypfRYCkdf6fbv2OvKxMMSvSBKMIDzr2GHXWbVYYFSOu1jgkHARoyxYEbUrOwhVcvPkJZJ0h5vxU5DUukvKAkucwTCIpju7C15U8IPmQVyC3k2hozawibGn/NxQYMj3DU5LRSL5FJ45lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFBULBpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxbVDTzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFBULBpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxbVDTzA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z3kQ993413
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TMnVyIqj4oCOoXs32jIk9PhLPoRy53h9I9OmzdXVzE=; b=JFBULBpDRvWijOZu
	nK5Ju9lbxSXz/Oyo+REGLyqeKRSpKZYiCdg88TLy1wsg+wY6+FSeD/84976D7owH
	Yu8o54Vl2TtHtiAZ3h3DqrJCgEtZxb8951653I/TLSNFZirvz0IVXcO4yLVzDbEM
	iaphkMCFg4o9K4ROlFPaZH8XJzxGVf1y5/gdOVrZ9mf/N3E6D7quOf0IDfe19MCK
	6bvQbP3mzBCTq5jzhml/u67n5KOmZmm+9OdfjVrHA5z/Oa00UiVvFh/O4s8IOTeI
	Mo9W7dyyQeEesPcya5lSE18R3oPHBdPrCKnuZ+hh20UScrbVeBk/jIRsYVj6acmw
	vC6UQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v8wmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so37421735ad.3
        for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971615; x=1790576415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TMnVyIqj4oCOoXs32jIk9PhLPoRy53h9I9OmzdXVzE=;
        b=TxbVDTzAXUU3N0vprDEv6wpbyRHmH45ma6SWMMpVAPg7FCIe9oyjcrm8TV88YdutLS
         O9OOUnE3VgB2wp2rv69i3eBjtyq1tt4iT77vBf3095G2YeiCEQApCka1rPeGFBFMrPdw
         n5BB4QcyxcF+lkv1+WO2tiUBgsDYz3uUoZeTwLgaiEFaa264KjGXRNedGmWWsyPF2Z0G
         TbOvz4M5cdk0+ywTE34Q2Q+kQgDtJmNXRzn0gOIZw1L8qFBKT9WsHw5DTEjT5tKzV0wE
         gw8nuvOqIi8BjCOOkZs+6R4KHGeOJCVZpQ7POk5RsrgjIDB13MNtqdcsHaFrKuUeKPKv
         sMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971615; x=1790576415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TMnVyIqj4oCOoXs32jIk9PhLPoRy53h9I9OmzdXVzE=;
        b=GHeVNHE8SHu8zJs0K9U3vfiBqNPVnGY9LQ3ReQBaTpV9RvE2Y7COVgtEazw5fHUIT2
         g/cOMC0wFtTBit8AoWO1ZGgbHp3gItPIl0al+qMM3v7n8K3V4a4Wv+7mevUlJ4tyNJrF
         fn3SHBIO90N4VBMkDTkYevcHBrEV7rL6OhYe6V2F/g4BUkwgpDlQM6NhK5Lqzas0c3RU
         uSV2BqmVBaxVhi+oTmT+vTlFdbldFzRtR/rk9gKODJekkyCpQJzTRR2gAWJ60Y+zPuGN
         Jlj2/x5U9uXrle0NMXqI0erx+FqAnQVKS2u8PzZP/7wbPAXAG/mz3TA+HFDtT6ZJjDgF
         9CZg==
X-Forwarded-Encrypted: i=1; AKwUvBwlm6ZHPcdLuiqwl9g0Wy8yhq3LQ/J78uv2aCy27F2rdCJXVV/b6G4/p2ymsuWl0hjedgNqHVLaXYM=@vger.kernel.org
X-Gm-Message-State: AFuF++leR3yKonyuU24ooAKcBkD+Eiz7Dz8WsPr/m1JKaCbehxkvCg24
	XD5nO5pVQyoFLXumUgcDhTibZFohHMLX5gzHSIzus19lX7DoA7ijb8h0ahUBMtztoc/WuEDRQO8
	nHg+cOVrCU24Y1SlCTQsnhy4mYP4ckodX2mNt6QwR/gLT9/uSsrCjccGBjs/nQJY=
X-Gm-Gg: AYBFou3WQpT2ehtV1nQ2898nJ0rV5FHFKNk+Cv/atplm7X/2Wlvs+96c8eKH26RHC7r
	aTc+mItR4DFNqSlhmYY9kaxQWVww+h0xpUBCWhR7IIRxNWb4vyx0XtBh0yjlFyFcbn+luWmK1qA
	pDTid/54PkA/5iTDwFl/Xa8HKz20Bkhck/8HXQoMT9zl2K0xQxZN+hZc5IMb/QhGDzHk1zEJyLv
	2oSXe8LbWLQfIX1EWmfC6guNlNDDzqvdXGnAp4EUa+IhN/NMxbidTrKAO01X4WPnut4YMjGIO7/
	BMw8aO8qP2ydb2e/AbNSDCIf9GapW4UvBwzpAQ4M1YIs7r83DEsCuFqF84fRzm5uGbv//h7X3V5
	JimlgaGohdp/d0wrgxgHFXGdu5/01rIt/s2e9zKRoucavAEzDnOOUAdGj0lsCE8VZjJrTyEFLZi
	M/u5NkT+OIAHTb4ORoKt85K2htTJcKMVGGJA==
X-Received: by 2002:a17:903:19f0:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2ddb1b0f7efmr138780575ad.13.1789971615512;
        Sun, 20 Sep 2026 23:20:15 -0700 (PDT)
X-Received: by 2002:a17:903:19f0:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2ddb1b0f7efmr138780115ad.13.1789971615035;
        Sun, 20 Sep 2026 23:20:15 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:14 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:37 +0530
Subject: [PATCH 04/11] arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE
 clock to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-4-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0cca0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3OI4E87EZh46DsEagTIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: DKOoUbxNFVDftfh1O1bhdgUEOrNx_5rK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX0j2HAl9JnUDH
 1utlBBcgKVtEJh4McomCZw5/Sdyi1fJXweVClrLDto3v1/1zVqmXM50jyGBqM/llfTRoGjBmMPU
 8jnT9FhqFfpGxny+DYJoIHL6m+wMXzA=
X-Proofpoint-GUID: DKOoUbxNFVDftfh1O1bhdgUEOrNx_5rK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX5BxbTgJeD64e
 SvGub2gNsg4EEqfQtmUeacyTFbgeItRlonPXbCj9LL3OhCIqNmU+P6k56jHUpkxCZIBDmZEq8uB
 QzUrjxaLiD0w2ak8qTE8kIKYULm9dU76n6hjLV2ZVJoFt9jrnH+M8INAhNgEze+x8XHJQFAtbsa
 sYMMS6jsv/QmA487bFVsHNybo8vnF08Ql90n6XccoAwGEJsE/RKtSsZpIBa0wAL7HUjc6bGLQkv
 LBSgjmyRJJFfajbSyW2POUEhvklEKe7vq47lneJnQN5otn04vY+wBYKJijQDjLyz/io8SFulbiZ
 YfkL+LJLbCVOEJCOPPptQig9ejrfBgrkGiZRuBMHxyz0cjUgagfcE6UVsarf4cqPnv7oZ/5qcO8
 TJYvxS7/zw1PvcFklqef3o2+VRKZ8Rfyc1/aQpcO/VcwfTkzDf9CNunUhKPyyLAUpIuyyq28gkU
 bubLMzOqSTUEz3O6dcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
propagate to the USB controller.

Cc: stable@vger.kernel.org
Fixes: a98bfb31f676 ("arm64: dts: qcom: ipq9574: Add USB related nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5a5bda5f21a1..dd1dcd955c95 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -428,7 +428,7 @@ gcc: clock-controller@1800000 {
 				 <&pcie1_phy>,
 				 <&pcie2_phy>,
 				 <&pcie3_phy>,
-				 <0>;
+				 <&usb_0_qmpphy>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#interconnect-cells = <1>;

-- 
2.34.1

