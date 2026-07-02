Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C2F3A4F5E
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977788; cv=none; b=crgk61xCZ2tfa+DhNGvhiZcnNNwQrHRvtIEt4/+RP7ahIvyEIis4yaPVIbwJ2K4D++GHTZbLosWovIj3FxX8U4VkYE7OOZxOEAf35i5EKGxkrp1kc5BtFNlHVcuZzseXEj0ezJXg8rzoZDwbgPJw0WyFZ34LVuCfOpUPLkcQE7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977788; c=relaxed/simple;
	bh=omG0nxJB+cR1OXkteOYajtvR4fNE8kStbx0zl5btk40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ze1qfX883Wfbtl+pITSt3AqJEtt4vBwwC0tcnjRsa07osdew4ovSxTs99626LAZKtnzH1bpSyjjS7fam1ZeZzD0rWhlHawADGMOj2UZjlkB3VsdmY2wVJ7mn8DtcYQ56omO6DTcaBAtaLDw5jUvZCg513abBNoFTtjjAGNKRkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYhtZ+xJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmA7VV3P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYhtZ+xJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmA7VV3P"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KIKE3009608
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 07:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmsJYIBGEJqXut+hGeT5xfQUlalTAABspgm81N9sf3c=; b=RYhtZ+xJRazGJtRW
	Cgs7nQ8DM6deCNH3MzCoOcX5e6JSPC4vw8jdSmGDjNCUryqY/gdGH9BcA5kBIZZ2
	ydfUPD0O6jETJn1NgD4KJe1Z0r02BQ3GyPvRdGSR96lMAZBJdo0z3RMVq3IxFPsi
	PXt3ghSJbF1L4MX2+0ClJHYGHlV1CAACk40w+5YRsvPS8YY9vujmoYMuepjo7IRo
	uHfFrxbM3V5OwB40CLLWe0h+XokpOnmvF/vFfjzjPEt/RmTlenApYHEBIJHf2mt7
	oATDH68SOLsdsWQgy2SWJmBVh6RtREH4X3u8l+4CX/9gyxTYDOQfTScQy7nMuDUF
	VbsK2g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rtthf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 07:36:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c79e5de32cso18609085ad.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 00:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977785; x=1783582585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmsJYIBGEJqXut+hGeT5xfQUlalTAABspgm81N9sf3c=;
        b=QmA7VV3PePcxzZ0v0zLY9dJsa6CMuWq06tYRtcreSbjK/CJjbQqKm9wBywTJpA4siO
         AaHX0NslY2fqJBGrA1uiWtjEwV8Z+fiAL7+vNAP/v+P1np6hG/jgsIfpA5nLkQmfLUZn
         FCueKC3QTcrARDw4gsOXLoTBq3G+nsceBeiIsp865bxAiSbVyaxw0eiCtye1qSE8fq2h
         FT/M+vlDM5A/uVD3a8zmy6fq49wE4pcTteZU+m0LerHDvpjKNZEq9FVBgEt0h9ruXNbK
         u+8HTxrvUqrjKJWx0pAfKoLe27uO7jndLOgsAY1cn/nv5A37bZVYghiyCFaBO7UGpc+F
         SQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977785; x=1783582585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmsJYIBGEJqXut+hGeT5xfQUlalTAABspgm81N9sf3c=;
        b=PKXNng/V3f1KhfDqJ8sSrYfNszqsXJ5sWIUJ6JWKX9T5JFw6vNxlS/Yo5yv823EdDu
         smPK1YO+SPtpUFBmH4IBh4omFS9jV6WQpJICfcWdHmJzmivz5VqKgmGP6uetW2KXED/Z
         mcKGwUD+YzGvbrMvq1nqyczTVwDAmQRmLH7v7+V5N3fVVFMAbCiAYsn+Tg2WoR9W7/jc
         rFE6MEL8yrLVZz0KYmPzkppNQ1xkMvOk0X3MQnDxsvJ3iaoL7OTNFp2k49y756Ge+XYd
         QjW8lEjMXR9lc42woyiyIxST8W+uGpFSBrictYJImaqxEVfnldl0/vjWPgW5lhwg9LCE
         iFAg==
X-Forwarded-Encrypted: i=1; AHgh+RpdB2brFTRQ9Ube5ZVX0mDuveyP3MKHJqm0CpUb95QlokQyrymoOotWWtDOb8DBkywoPtQ+ZcZrWzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjxpXHuZMP9TsojkAsaEIMQ/mTUZNaSCJxEk3vGVai6blTw1gy
	ovHRlpJ/Wcvv8jGSxBqKNrmJF/NN8uJeQB8OdS2lVNvTNoC4ta3TOv8Jrn87CT09Yln5E0OST5R
	DBIFs7+WNNwEBFtefP1vqMxNGs7iEfDfK9XJkd9zd96L2UU6XpjaDXmbYmLYZZCo=
X-Gm-Gg: AfdE7cmf/s0VWnXP6C5SA1brJtDP5MUjE7lypH1yaPiPucN28QYuRyjUzvSZkltIaQ/
	kVtUmsr9+D8oCKrdo264l12YNiAO/cyXI86/N7PDkkiHz4S+LKhNtHbNvLzfBF1uModw/8ZxKv9
	v/r9fJ1PvX+vfPLoCr8bHpSU8bn15dJSoisNCfSoJo4tH2lzWjLdeUSdgQeordYhK2Ni5DS8agY
	qlDfYF4joge0vGBfwHKho/LYcM1CzyxYxpoaUzV9JPU/msdNkg38LfpOIaY60sN4FvQfGJAE+vG
	n08XK3SB2LFTvc4m7gmI5JekGZGpTUowEF9w8hjQFkd4ZiytpySRGOn4ixk4djx/znMOpHUBJ5J
	5CaR6h1zr7haCYDUmm2oktZsFNBEsOqyr2dRu4cakj4dEhCoo1ynGdGc/Nw==
X-Received: by 2002:a17:903:26cd:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2ca9114d983mr40217985ad.12.1782977784499;
        Thu, 02 Jul 2026 00:36:24 -0700 (PDT)
X-Received: by 2002:a17:903:26cd:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2ca9114d983mr40217615ad.12.1782977783835;
        Thu, 02 Jul 2026 00:36:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:23 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:17 -0700
Subject: [PATCH v7 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-7-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=2459;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=omG0nxJB+cR1OXkteOYajtvR4fNE8kStbx0zl5btk40=;
 b=4ELL36ZYt6RoKO2c99VYKYAJdiGDhRbzoBaWLwQ4xByk8SbAMn7YUDQsucIuc0kmLupoMXXip
 oRawXaSF09+DExc3lZH+PleihU41KroUgHngwkqEVVnySOIt6jVnT/a
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX2yDan28YDEZU
 O6cbhsEcZiiDfVHhRKOlmfzffOO83T69fJ8ZDhjE0byx92xs/ZT84qXQ7FK8IhZdIKR2ONpQ2TW
 NVCI+l5PUaxSjCFKZQVsxhjQMV25mY8njST0MdfPHoAKaIH5jKQc9G5mRTK8VzU9FgGkHYWPSM2
 /wewO6VMAzO/z0bjlkn7oC6Ded/KIgmKmVIDN7ozG43Z9nTuru2kT72ccWYhj0btGIN0BW4R2x/
 7i/knN4/HkKEDZ2RTmCysLUKYxrNmf56LnPEM8FWexMXkYSP/zs4/enzQRt6T66J8mvjAYGNNB5
 cfQIFLgQ8dh6L8YCKz3CRMz2MKwxKHtAT1tG/fUOsfIZEFWfwx/oR9oybLf6CwYyoTgmmZT45W5
 LPlrdsxJr8+hgkp0eLxvFl4ePQZaBrykric9bxrQ2GnE+WsSeXX2sgiwsbJbbm9H/QLBxgTKQ+B
 5NaBlUTvC1jARTVB/RQ==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a4614f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HJ1A0pFH0qRQ8DuBKaYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Fct86Hp0poiCweNYoqEWCpJJj7Lff8wp
X-Proofpoint-ORIG-GUID: Fct86Hp0poiCweNYoqEWCpJJj7Lff8wp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX/yJznlqHkgsL
 oniH+sXcisjSCdmJOuNIKXyJZEm+aZAZd+DPr+pWLx6PqXCHRyOjaDj6P5zonzQampykZO+ZBmw
 9cCkdwZq6Zzw4hOwQ2+XezFWXvlE6N8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076

Mahua has a different QREF topology from Glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies on the CRD board.

Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
point its ref clock at RPMH_CXO_CLK.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..fa5229064b10 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,19 @@ / {
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
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };
@@ -286,6 +295,10 @@ gpuss-4-critical {
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

