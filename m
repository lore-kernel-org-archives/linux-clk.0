Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378E441B8D0
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572607; cv=none; b=GarfEEqaONhaIDhwKYNFKxFYMlNTAdVa6PSCT9bngrPqZ6Fx1fdYcMm596vJ3LL1c0pFve7atxMBMtr7F4bh5LVvgOr+eE2zCTdMDWRnUhPsaO+Uetm9aMlRYMs/Lbz2KnXTOy5s/KMM6Dfc4dDxn5N3NcV+FbhzYCpADkh2Wsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572607; c=relaxed/simple;
	bh=efBjfGOsvP+ouDw0Cdkr+P3tV+HFKOcqgBXTrfJplbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8cWYhxNjhP1TMKcWg93Q2sjmpFbf2E/pAkqdCFpZPxnpX2lHBccGiAqtBopUl7wtDJiymb/+mIOyU1zvilpYKMHxiCdR46mk/0XtQgPMVuGj48A4fUInK3t0BCc8/bcWrSvJO1Wf+94xwKeVFH+6YRPXRBg+Ur1SzzWltjc48A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnCiPh4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xgdjc4Tb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnCiPh4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xgdjc4Tb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMVeP1800252
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=; b=EnCiPh4gLULEErgy
	Aa/Vo/qT51Jbo5hhELK/SnMQ+diBloibe0w2QOXfiyLAttTtTUdrYSfNakc8KFB7
	qvhyuX40RP25+lKI2lB2L9AEAzuZ9kruAYiljuHwzvMSd1Xf3CMYUZo0EUcYrVxK
	7yH4BCBkVjLTvr9Tvxc2lSOwB0Id+Z25NvcHccPDoU/6D9GaIzCpfQDJ9o3hZRH2
	wk7LhA/YkLRzBSr0dPxQXvsDgX4BFDvnBvwKTKpA2ovw5XuYVeyjd0ep7eR4sic2
	N+1iWS+WKhMWSYlwTrEDr1VN57C42ypcpWKOyDeIWBuZrJfNZYG3ghZV9R5luYkv
	kT2Njg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78c7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0408254aso59738701cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572605; x=1788177405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=;
        b=Xgdjc4TbPUCWiHQPDTcGY/csnjru/xTh65eMa0l1LP93k+faVsM6fGaw1MyWQYKmi6
         KXfkskT2Kmx9gS/fIR5ZWEX/XWVUo1ML+nfd3uv/GU6lr1ANwmBI1KLwc6necfHiQGW7
         cZtcnvxS0eFoFJGwSdHv4W22GQJaM52g6q9QGZhiiNoqJHiZVEKbDqMHehIOkS6Fnfm2
         hsBMe/laHZ942x/8eYVSG6Beimyyx9N9b7B3ds5GhrYFVbgeKW4Lfv8393fmrYtUQlDN
         cu3yjQcTBckO8MxDFkPL+jqigdY65qUTqoSh3h8PxVfqN8KaWMVCtc+VJjAQ8BNrAmRK
         ruFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572605; x=1788177405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=;
        b=JVqtMWazw4h4kGIonSWmfcol464NIuS2YgroeaHXZAvgZTP53tYqUObPRlik174Ntj
         OoKHKr2/bMUGLte55DCQK9tJPSk2T6Q2Pr6p+h66OeUELYBiWptm/370R5Qd+YTCzfYG
         AzkcVJyggJaJdMWQBtrCf0LL/4f+0tcfqa7WNqT5ETtrJbxH39ZutYZmtLVsh+rKOIjH
         6mdBIn8i12wqRlFBVQw0Ewd6wLLCw1pmWNncWdPHBqdmsc0GdFilVOyongUNDBF/QvFd
         WPDdNM9h6dNcrkHNSeL4BZzDDy2NAenitfQWvc39e5/0KzqXNSeSc+xquZF9RWJjoEfl
         vpdw==
X-Forwarded-Encrypted: i=1; AHgh+RrMVoZ+G0zfSNPC571B3d5E5gU4vTviZmSsqjW7RrzDuZ8PKDBgIViuQyJsFKQZf1+4NXbCCT682B8=@vger.kernel.org
X-Gm-Message-State: AFuF++kCGB0m5kcMknrbPNbp9TPvxWe/YFvpxDB8bLGFT6Jg+RbYyw3W
	R3V4g0AMEuG4KotnByvUGf77p092zimzeYwqV61RROO6FHH/mNtwwxmHeTicuEqie+A9eQQiHuy
	ne1WFPLddhLIeyTB1TGu3x1+hm3ppD07a/YmEWMY95OgEQLAbS9LNO9k6FBsg7XU=
X-Gm-Gg: AR+sD11U2IpXg+iFqHtfYstjJBWroI56sVY5YEoyui1skuO4EsMiljQ9RgnqNO0UuCh
	y+IK6JN9+hbxoXNNlbkMFPt7uw22+XNCcrcy2zOJLZ4SeFjIQ8sCy1V1HgAGNFrZXWgQJLA0yWD
	TYeRqboz+dbW3aq6UydzX1RAsEdjjeZssCppG9puGqWrHT6AZWQ5odRyhXXTa7v69rA3abNVaDe
	W1Ga5C9F6ClYUpDnAMnZghQrrlEMPj0S/xQ8Hj5BB+49IOqIyzEFP6n5t9JKT1BHzf6Gp+Iqw9W
	VvmbrR0N8bFY9B2ZCROjeIJqk5Ql3BK/frv8+W9Jl77V1LJCsqQcO3jT84vS/vP4Ao9+veqc5uM
	7Zj2e1DLj
X-Received: by 2002:a05:622a:1baa:b0:517:c65c:4987 with SMTP id d75a77b69052e-52de36e5e5cmr310673651cf.22.1787572604650;
        Mon, 24 Aug 2026 04:56:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1baa:b0:517:c65c:4987 with SMTP id d75a77b69052e-52de36e5e5cmr310673071cf.22.1787572604134;
        Mon, 24 Aug 2026 04:56:44 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:29 +0300
Subject: [PATCH v3 42/47] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-42-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=efBjfGOsvP+ouDw0Cdkr+P3tV+HFKOcqgBXTrfJplbw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD+A5T+dfZw2y3hZz7x4hQwSDy6aV6q91Ct4
 zTr3A+rHReJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww/gAKCRAbX0TJAJUV
 VopnEACiXp0/dtxz126WfkueCVDwtQ4DPq5wCajtfp71Huu5AzXljTPETZBG/r3K1+P/3sKZ4WA
 7jtBiroeQ3iWWYfNdrEJqyQFTaHzTodOq0tLk/3rXbJ2KItyWyrKzTDsLQLP2Ki5QmpHsCkqa+O
 5fjCmkBK4jLcBxeoIIsXXzHyEEb/B6oDeAnX8sysE8Gns5GXBB/WMNj39WEQC9iMzEFTP2bpYQs
 ATu0vpMEziQ2szXEtC8PtgQoV2YiWDAcQIL9KuuVoUM5QWe0jpCHyr7lU5+vX3UXH0dCJYtNiVm
 JUseklsrujdrF9UYLPHeSr+Mf5SLoiwHs1oMc0jB7OR1jNnJVPzb2NHWVWtPHqw5foiE/h+0OnA
 Xq36cOb4M1A4vKn6hIYowaETQ3JsxNkaaCm+ivygMJ4AufKSLufIs61MBYGCbwPsMg3lG7X5M/a
 r2W5CG/w6BwUjoFFzHtQ0234aUMTbEWdSjgc3Jm0LyORTdReS3AKMYvVErpbOjqPcgNHncTQrrI
 hs9q0BChLpo1dPTksGZxm08Ds6QJhexYTPgfetT0cR0SrWEN7q2L0XER60M/SspR56AUt7Reg5N
 pX5kaFp+8OSGYjzDWi3m73DvnQ16YdAGLXzoyRF3DWakY88Jk7KexGRwMgdppZBpQSU6kmHmnyk
 fVKcXMmsUpJy5Bg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c317d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX0CRAPb6CMDmS
 NKCIuHuoQMaf/FXekAYW4gu+hs9zzgDPceYyjwH+OC5DNyMq2yQ/4daYTxekhaYsZ9gdIbbOJGw
 ayN9GgW8UbsYVi4iD9LAXjYhflFMVn4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX5bNQ+GKapFkx
 ORG/azfhLCv01CvZecCTfNItLrUxl27i767EPsEDcVOgDdSFNI+ZSiZZTmg8kI0lbycji3Ari0X
 Vc2jciueDiiz+HRLmIPZ9vT0tpzE1uqCqEj63jkgImFWGlzJ2ZLn5PHUChGAFwimvcpV8LZgVzM
 uaghQ2elxoeYeojQYEVRAohnl9+nHutfZA0l1LagX+Qiet1IXjtBOCSAeMa0q+DCm78c4/7V/TB
 SPqmdrRfwkOI5X6KUenIpGZB+swGMm/BGS/1zoND3dnHnDATZdEujKJlpZ4lN2or0TfOZGzO/5v
 CfTTpHGel9cf9sWqxHgpI3TBEkTXfSFP1NiZ1Rf8vqXnTtmodQm30eTCIzN3co3/4cv0KuCOBDW
 ++Q7ZDF+A7NZjmnl5FVivIkt+kqOMN0vPuPdNVTs5NhJqoqvkzUimLLp149d3w6Tp7V7eCYu/7Y
 aMkGSe4RY3x8vHwKuuw==
X-Proofpoint-ORIG-GUID: 0QgCa7OVYzGUyLfnSvfagWpUdTaJ0Qzc
X-Proofpoint-GUID: 0QgCa7OVYzGUyLfnSvfagWpUdTaJ0Qzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240100

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..84012a407c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -699,6 +699,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

