Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B29304BB3
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 04:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005200; cv=none; b=ERSlAh2rWWZDnUS6Rt5qg8iN7MZEtGJp1FE1wYQzN4F2aECo6v7YYYwvB9QJBDfzkxqzBIVRVHhr0RsLwDcQHbLLVJuNApKn7nmpCm41Nsr8FO3XNbCi/LXFeOaC1XIBeOmx3fsT6nLmdalk35s2+fXq4L44+12j6DdqnkXWZOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005200; c=relaxed/simple;
	bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a3UVP8G4SjRUPGGACnhCe8bOTgC+iSJdB03dVemHajrw7AGgfKDY6oDm1qnmvzLNwqTY08XSNER9jKzkbOxyJv+MG8L8L4NFPEt66UgrjCP91zjZGG5HA2lTOgvV4pIdodcyQWd/DiWNlVsSn+p44Lkv2qvGPoFa5kTOXht45No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChsohAib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEBPi+AA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChsohAib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEBPi+AA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E383cN3465995
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 04:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=; b=ChsohAibkEY8PfDz
	wsUqMPYeCFJ4j0JxqwLjaq5aFzzR8z8cLZg9N1vSHD0aITFa2rHhbDpnXSNdeOuI
	VF84pIA2XSfkPI9HRfYRyzboJ2X8XpwJtfN7ZqtvKPJXeLmGH4UWeFikd0gz4aMl
	VvDVPR3idX9CHbTaxZQH/J2+ZVSV0DL+ANrY1J4XwZg2vz0YFLB1gPt7m+HWYFJz
	/R8KPQ/nULxN9q/05NOYB/B57h1gSDINgAc5mbRPa/LXliHpEl2BaVz8ny9uL6im
	+JLYnben9EIMnrigsvF8QMYuo0Fw1HdM/gozabf1U1w5r9MUEhCzz/vDYEgH7aWd
	eZhi4w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavuw5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 04:59:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so2924850a12.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 21:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005198; x=1784609998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=hEBPi+AAckVv+0IPkE7JAMxtP8IiD/eWsug5y/JI6OSk/i9aP6mVfpm8cp+TNndWnt
         6vWAwJHpVvQQRTaG0GF2ZqSBRNkkBnYSG52R8FdwHNnj5QtP1fCFzKNSorSSwdJvDUmc
         4tl1rhe8WCcwlOqJXw6EXDt4gsxX0CRA57ZijOqijfU4HYkEVYyp3e3/2/VxqffbMWVj
         Uk0bfRXS7R4IzLk3E5qiibV917GCSTlOyJVtrFJupHrDHBCtzxwT3ldVNWCior5SXHgl
         9M7pTDvHMODhuZNju1W6m5mGWqm79M22ganIBoUZKZfgqxScz0e22mdEJZkaYTYwZWd2
         u3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005198; x=1784609998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=IseUIifZ7+po6H1b4uY3PRoAa0b41in3+oDAeYR5RR4gP6s3tGbXZG2dpFIoypug21
         3DPBXXcLzUicR6XoLWYeeFi4bkBikXXYY3Ec1+sKTQ0UUrvmFCDc+auILq8VAQhT4C04
         e+F8QY6mR2zFvNK+Qnf756riQ8ESAqMj6roEezGfxdM+E2xC5tOr/y1SYK6aBaK1ah9J
         qzAKz7+Na0FK9tv38SosM3gWrQpiUvvIgjP4RqS495ByFOG4f1YpB+S8HDrS18Q4YgdZ
         H2CyBZdSKR7PMKA2YJXKqP6oPW8NwM4BjGj9fZs+DYEEkVIdRGxCUKTvyXyaSQ0GT/qq
         6b/g==
X-Forwarded-Encrypted: i=1; AHgh+RouwRlESpqVjtbpRC+D6M2wem5hGBiPb5Fx+IyMMSXZC3IvOkS9MMveXOgpDjyjdLnsECDj8HjvhDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxXEXb56OfjDLTfqxlE2so1PJS8hSaAaDIOU3tvB8TR+Dc6jU
	6qmpU7LMllU0MYs8gYTR4ACsrIZYB9pSQBm9zC8Sy8Vjm+DweWBiheVttpxFIGKAu1VMpR6LNs+
	AgSZiAUxw3/wOdWePOqMLvcbSA77/s37gvEugwWY6cfbQxjuSUaV1D2wGPEvElCw=
X-Gm-Gg: AfdE7ckRc8Ht5pF7+sIAql25ylqYgjFl7KfO9hL0+XAGbEEpi682vdlwBY4xI3/kdtx
	5hW4WfyBTdcUTjZq3Ip7xCijJkjXUlXMBHL1xoD4eXl5ICZEU/BlctFpDJbi8bmXFuffPn1tSj4
	qTLplHykXP5MVdYs2N5JGLtMT3huqaw7IXN9KWFxBtp867Wrt2w3/vpx6XiuqAHEhiKGoaoxG8t
	KWRjdOBlJMuwmRXLQP8UvVKlj+XtkSiUVoAikUjb5M3FDnnZYDpZzonT9hlQcjHFRDs+HI0BUnm
	89G7AHBMMLzftcIBW+OpAPgYl3juW5TRos7JnLJ99rdRMb8Xqt+AbKhFlnAS/L/VhgzVZL4Ak/f
	vJnipqC/B/DScMifJEhWGWrqw+0YxKqafPJpkUPzE+0GyfsvfM+oRJWGhxA==
X-Received: by 2002:a05:6a21:9d4c:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3c110778416mr12506240637.24.1784005197518;
        Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d4c:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3c110778416mr12506199637.24.1784005197077;
        Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:56 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:41 -0700
Subject: [PATCH v9 6/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-6-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=1658;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
 b=doXDPI60X4ekfOU0fTFxqHfYME2KrZT0grUAy9KcmmZGE3pE0qPJrm/2tIMdQuohv5L0fqM/H
 Jn8yIF1nsulCs8zxTuwTNhBa+NrEfKGl07fgF6RuyNd2Ab9lYdVRNqp
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: gUMD5S_mG32nSolMhIzP4QtZclu5_K-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX0SR6t3lSzdAA
 le6JuboVKi8LstK/PFSubTuo+bSXZZTFmejm2CKsHoVI8pdecOVr2yzM7dE0tfDKGGYoAaTuVQM
 7tob92W9mL/bUC3OmynnaMtMhXoReAxsdHoSSaSxiQYCKVm8g4ax6sSQBHMY6sMT7nEqrDtSrvO
 pBsSsjBEFJD8vwxpCTvMjXp547PARkPoMzGeNRl6be67ENg/se5zzmXTcFs1YTPg71Wr62rKXxX
 9yVjXjPdLs25j8R6AS5W1JcYG1Ao0IK9GAtqqggd4SKKF0SakUIoEC/bfulrhNRrZzP5PL/iPQ7
 oM6e8jbGoDsl1e24kY2hNTDL8gmEVnSrE3sbS8R+X1YC4IMpRoUW6a7+svMOSVldu4msCaigwNv
 PRv2fk1r4+CcTQ7LxNcSabWONqVOA9+11tQP6JZLwxUtmHHCsx4mribq3D3UihvAzgJRj4lv4te
 cOun48jFEhtRqyv1VTg==
X-Proofpoint-ORIG-GUID: gUMD5S_mG32nSolMhIzP4QtZclu5_K-M
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a55c24e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=n5gI8yOKKvUJs91qd4MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX1lXe0TQaO6wG
 Hm8Hbjd/notKl2TRC7Es3J+EYttxCn5sPJGdzVuPseAJNBMoJYEOtuv16opj11wPrErhgI+zK1M
 TFJ2i7nekGmPZkt11kkOZZak2D3a6Ho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6125617de82a..44766a73b0d1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -28,3 +28,23 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

