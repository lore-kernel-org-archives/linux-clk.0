Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC644399D00
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977786; cv=none; b=eqL6OolDU/Siowf+KV9alxgqgiF3WvCzLODSbmyPmJGKD4flC6dH+USdyTPMCeK8pNFmojDgDmB/yv4snB7n+YUehf7+fBXJupcs0yR+NVLw+ctCz1YaxlWxvRzs4rmUJAR4aVsWCJQXNWu+McX4Ekr0yZd3YcYULrDLiuLamyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977786; c=relaxed/simple;
	bh=T2wTeTr1gDX9a9Bl2I0Zsyo5TOUnBGDiB8otypBDFNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AW20+yow7Ohb4sqYzk/xzJ8Ez74rf0h+gKnWUbRIh9L0XTD5KUezY5I33me7JOUVzqhhupVuoPTpOjE2Is4VbmYSJYVkSbVWpOwfZl2Ud2OBVvRHs5mxFcHnjNsrAbyOCJLaWhzCyq7H0VqyWZilO5ZoTFO3VbqOIoM8VluEfSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNpHrpR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoyhvJgX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNpHrpR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SoyhvJgX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621Kvik3052381
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+OLdMnSvsqCJMNx+xvl5MR4z5xBpBWEMUAEv+Vb2PE=; b=mNpHrpR3p4n55w+V
	EYgXoE+PhGhy1GEIf9kyHyLYTCrFv9U9Hh9txV7PoL6vAQqIMUsbPLQ9k1iwWPKe
	bEYccqvDR3X9Cc9ZGmIPLUd7pv6vb/ZSugTaVLEV8uuH9st+gGvC5rIHvI8fS8C1
	Xkd2LAcaQQenxkHUykSV2RUvpPoLxUZ0uhQ9u6wfQKAaui3yZCP5JLcrSydouGN1
	QVj3x8MK7qlUz6dipiTTitxfTvSrlvOXQU25KenfrqITSHGbp+LCV3zuCNl20fQV
	AsVU5jYV/lyyhpNXEWECJEroLPm7G5etrQ1F6Mv4VhyIpBFKuVrvOO2f1qXnE7Tu
	0z3tJg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541uh8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 07:36:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c804e38cb1so18046805ad.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977783; x=1783582583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+OLdMnSvsqCJMNx+xvl5MR4z5xBpBWEMUAEv+Vb2PE=;
        b=SoyhvJgXUyW1RzsRpxl0reI2qb0A9//Z/r1Rl7ETfFZue67qgHAYq+0s5vzqphOinG
         rW6vEp9D4VysZK/0PMVYBLWAZLDbGfWSEiHcugh2F2I+cDlRb/05ktXxmIE/qNemiYut
         hQeScMq8ONNmDIi9U/Y/wWLdO78FZpOnRSCn0BDXJlwVAGQ5zcfl7dl4+2mZH5eAGlk8
         M/MfXPYXbjVdUanCEaoJdLbsrAw/unMJuaG3umy/nTMne1ghea9urx7BWvR03qYPM9FO
         3fqESTNVwua/c3ryf935EBA3tBWoL3UOarg4Gm/NSo2//7SP+X/pkg7RhHBVd2w/uM5B
         GDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977783; x=1783582583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+OLdMnSvsqCJMNx+xvl5MR4z5xBpBWEMUAEv+Vb2PE=;
        b=fHVe+VHcCVpIvxEIQRsBqk+IlBsXmLhXqaKdA+OAXdzUbj2sMwIK2+l0mNwMYGMllK
         EI0trfVdsny56SAYpbxELicZjO8vs/YUegisF39iSVFxrdUgtIvxx7PbUHl84LIzM22L
         higaAzO1bJJthKKG7WUcP0pTbjburcxsInOmoVqURJoNh4h05OVT/XMS/o1ef0CP+Fn0
         /76pqycwMwGs4cqzzVTGmKw0gnszTBK9VLiyUBYUN6/g0oHRCaqBC589d6x2beEV7neC
         B2FLpzRx0Gc7KTYSqJsP5U66PTKR2WH+NlN83r9GtJUtmplpAeAPWW9lX0JHEvJ0JtJH
         5E4g==
X-Forwarded-Encrypted: i=1; AHgh+RoYY04KvRUuNuxPjAxR4z7teKI/flpDpoGN2fhlfGs0r1VszgnIowAi5KkaRTuODNyNID04MSkhtQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMq6idOzATDGG+7rnWiNsbGrWn/XEfvs6s0mGL5n+B7nj0nCy
	KLE1jC/Sea6N6AbrUMRd/wCsrarmEOOmJttUmohzhFxmVgrLJr6HDgL5iWxl7OYpfXz/ANNBvM9
	kL4s+X6jBjV9B+NfpiGx9bNwGAnuWoR5tjjHHpCnsPK+/GnS51TpfT26+KZHzQbw=
X-Gm-Gg: AfdE7clSttpkFG0puoaRvgsAA3dgrLBa+11bFAVl/fTwGRhUDaAN4UaGgsx3p14JCPk
	9MAh7geXMF/Xgd4RY4CLHfcMNV62G4o/L15CTrOvoBJxYAR4jMj55wTwhoP2uI2K2F+DJRydypa
	IfXtBb3NVp4a7+DNvzYtS7PxBe+PyhgGRnO/G3DPhmPT+KSQmrMlP63OawLMrjTkYiWjd7Vejem
	/cUh+Gy4nvr/UWu76BopoXfReTKkxX9Q/WBFHkODxK9TVgCXpnkgtHI71GfE8+GV3IEvXW6i4Kw
	iis8i7t5bd7oytfMzLqt9JrP7eW7ujI/P4p9CsPTsFY+BlZyjxjjDy4jr58cyKb+iXOI0EhmD9L
	zLGjj8B3VlT853Li0g8VWKyHpLhSe5/N6D9b4XhzNyuvP39OXhngYpxGiyQ==
X-Received: by 2002:a17:902:f688:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ca7e877452mr60846815ad.35.1782977782595;
        Thu, 02 Jul 2026 00:36:22 -0700 (PDT)
X-Received: by 2002:a17:902:f688:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ca7e877452mr60846475ad.35.1782977782187;
        Thu, 02 Jul 2026 00:36:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:16 -0700
Subject: [PATCH v7 6/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-6-776f2811b7af@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=1686;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=T2wTeTr1gDX9a9Bl2I0Zsyo5TOUnBGDiB8otypBDFNA=;
 b=4TaZisjcKMsrNPge+rvekin150Szqb7OvEjJZaTtrjNWJ8JYKcHTwH73DXpM9guJHpJHdSK5m
 qV3uWtfcF0PAGZnwGdCdHkwI+5+1KUlwDJ88kpUarrn2uoSEpUjg+ht
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: _OB4LqQ6hknPoIuopDKQ93Yy4M5bQ9vU
X-Proofpoint-ORIG-GUID: _OB4LqQ6hknPoIuopDKQ93Yy4M5bQ9vU
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a4614f7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Sd8Y8_gha8mzdjVg6RYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX9oU5wHmFA9EL
 mmgfphMkKSalnDltULGUlo19uDeKweD6I0sRsDv6FvD7ENj9WQjva2Ixr6W9o66AWfNz7iBly0z
 5mtC03mF0wUl0U0w8oLsR/cUUkwSapFYAt8WU5O4ohNO5b+1rO6XQbJ+Yy+U0xLugigsoSmfzNQ
 qiqnpRkIqpqowvQP6/4QZhHAdU3qwUoOCIgOp1eBYYaRzkayrNL38qo0LaL6D3vtHOmgjEqBFHx
 0YLLxZfn7fp3S5bOL1IFZdK4AvB0rnWq7lQtMpq8RmEHHlKazOqS8drbExHqwwa0QlkEy72pouX
 VAZqRY+uLxD8Ts5CJhAhAVkpp3Td8vBCh2b1RsWYuGca7Sw9Qpr5TOJifMfL5udI0bStGVEzaLT
 f4uRlMg+qCz87JngjNQS03CgVYoSCHHqMIiUJC/1q7MGpaH0HxnkMsIIPtglBG0B2bBOkeYz6ar
 KTkiGpq6IfMHVFJSd3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfXx47MPmsY9K4R
 3c4HQw1m0fMGiip0fdA4+K9MNSScunCvJzso91AVH0n9/jWAC3YsLMV05BXzpdmr/FyIA7B9wQ4
 mdIf09rd2OUfR4yp9r0xv9PS2MOE6tc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..92b929ee3448 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
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
+
 &tlmm {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

-- 
2.34.1

