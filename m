Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAF63932D5
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 05:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994511; cv=none; b=TIZp4FKZ4qgMHsNWJwoc4QvExjYndg0zYI+Z74NX0DJgopCuTTd63TGO55RuOiDLlSpBlawCLMJb4/wCv3aSF7cUBHXXRVurPHLeQeqqn66wHzI7j02eOk41oPhXlPHddeC4zusFJDTvWvdUe46zkW7FaxE04LU4bgjDm43gZJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994511; c=relaxed/simple;
	bh=YMgrQDt6n8SBtCnXboK/aTC4ySe+AkmpAZwiO0FOb8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMzxMF1wi0Rc/BC7HqvXuO72ZIMIoq9HSR5+QyZ29pnUTQ3rJtnhVvtnAm3Czns1VR3wVYjRFM+dTFDiptn5KrkXE3m3hxnCYU7l/x7057+RykTGSD7IAWU9S24DB4y8weO5SmVTnirgr7Atrk2XNZ8+2Y4TMvUkIrJNbwGoB64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=et8BMUbY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwOIh8bN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="et8BMUbY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwOIh8bN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wcMQ775238
	for <linux-clk@vger.kernel.org>; Thu, 6 Aug 2026 05:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJt+V3ieDZ+MqBm9jPgM7ZiDX5wmpvQnMbQUd+p0318=; b=et8BMUbYPB0Nu6kE
	a6nGviH+WhRYyigytzfz1nhMDVbunHujbpoO6wEWy3Bry1LO6AYilXz/mjFkFR/i
	nl2X2uw9pYt80wG5/pPN9ozc69Gg9Nzg7Ek+pQTw5bfZOlVOm6lr6rnY7U+KPyAQ
	ljIJs0tsZda5C/v02PLGIwV141n1X5+aV04hiY32gtR+hhnB1NkUHjSvshaR12Ws
	IUKH0vaRStg1CITMf5XIUK/Y3DaJ1YXOnjvepfLkyjluLGXE82IWX2vcWnAKDHtr
	pA5gNnEYkB4moiuxtksWGx0PlVrQM1lPcJ+OymxPUGMenbXb7PcYzGchqD+fzHsh
	RsWIMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8ga6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 05:35:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so31152065ad.3
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 22:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785994506; x=1786599306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJt+V3ieDZ+MqBm9jPgM7ZiDX5wmpvQnMbQUd+p0318=;
        b=RwOIh8bN6ERGIB+KyUt2+79OhfhXQw5jWkVovDzYQNls1RiaooeT1h+7dvrXCjXtOw
         SNfw4cPy2k0jt6CdFSLGh0N1E8xqNohicgUO6i01VVKliESHS2nKgA1v2JPDOYdxkp5Y
         ovjg3z7dEMTY1X3lWVJ4Xk00T+3hdC6JZSsWm+0doRM4u1UCueheFW5wNeaGByE41yBg
         tzVmkt7fmWMRNvWQK6QRISFkM0atMh5lxSqZFZ33bnrs9MVSBjzyYdTZoXRJDJZgS96t
         EKGT9EQ66pN1rD+rfPn/b6VUts86IJSA/45FYrjpt8DUJijmTt/Fygu97mvybbal7e5y
         H9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994506; x=1786599306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJt+V3ieDZ+MqBm9jPgM7ZiDX5wmpvQnMbQUd+p0318=;
        b=U/O9lxV+DydND6nUZ01IMFFSO6oWSoFzVzjf/wSSfifHvVjnl9y4Rk951Ri4ME9GNb
         DVK5m5anUX9CFYuUinyXITB2K26ac/bCWDN7U77MzljM12aUodB5StELATxXMDmcmZsr
         nLKkAFqeOIXMn5eyL32uddKiUPkI6nKCQDaZGgi5Tq8lJeLDZaLK5ATSjcXjIfrIAOy/
         22Z4swlUjSrXn6UVOIu2V392oQ5OT6dl+WRZE8vvv15RPApokoeGc5QXkyMidjv9OZID
         7PrPz/wlbi+PAOI5v3Vdj8V6xLRYey09Hb+qFGQxF0YVNQ8VyXx8gGlHkmHluO7HYBFl
         yvVw==
X-Forwarded-Encrypted: i=1; AHgh+RqCaSvXnv5ZzHYcw8abefH/dx1RSZYKs4+lLcG576qDigQ5o6hvTICEBn30jbafbekOoB7meLkbLhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF4KT2Owhy93zJN9+WMVxhk/O6GZyEK51rvm1sfXkzfQkh921F
	2b4M/CMe2dSDt7PCe+NXaUOIwAB8ykKsC1N8ei3X0VEIhcw1q5vYdcSwAbQoXMSriMUZ/FW9CNz
	5B6+dMVquBwXAHi+rBsdSjMGFLbufjuM2B8E9eKiPdlP1kpEEhAIKrZ/+fCtDbVw=
X-Gm-Gg: AR+sD10Ak1sQ2K5Gc2151RQoNLUkkNYYcgTks15QnK8YsrriLfW5bpkHjNjBjV0YW5U
	1ExCkZjBLKjhQy2CAFHDRwj33yOjgJJaM9nfNlqSQczrLMzKy3e7Zx8Q0DyL8yHfxxdKuRS3X8G
	X2wNgFbjU91u1RAgLbRM8v2EtWV7X7Avzk8nkKYOnNAJsg1vD/RekauQ5bO3qtozTthKICoN3AJ
	3bJ/Kj23zcl2Eie+fWJj4Hsk3AgLsCp5zIBTrz5mSblewHn4aYtTusQNWwrR2xNe471vxU/cDe1
	CL+hbVJTW7l//FMFxZ+z63dCXyrYZwQgpZhZGpDDeQW9f6sXAmiUAXW6xQNnVVXRwpN4sXMUu+X
	VAKTp92JzBBQM59ASCdtqopMdDa1OS4xeE6vJWjoHg8IuWXQ=
X-Received: by 2002:a17:902:e852:b0:2ca:10c6:f69b with SMTP id d9443c01a7336-2d0ca7b54ebmr123142035ad.5.1785994506339;
        Wed, 05 Aug 2026 22:35:06 -0700 (PDT)
X-Received: by 2002:a17:902:e852:b0:2ca:10c6:f69b with SMTP id d9443c01a7336-2d0ca7b54ebmr123141295ad.5.1785994505754;
        Wed, 05 Aug 2026 22:35:05 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fee7sm25780085ad.16.2026.08.05.22.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:35:05 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 22:34:57 -0700
Subject: [PATCH v2 3/3] arm64: dts: qcom: hamoa/purwa: Add QREF regulator
 supplies
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-hamoa_tcsr_qref_0805-v2-3-4f1cfb1fcab2@oss.qualcomm.com>
References: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
In-Reply-To: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785994500; l=26246;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=YMgrQDt6n8SBtCnXboK/aTC4ySe+AkmpAZwiO0FOb8I=;
 b=AaqoLMON+Hs03PNggPrumYIc/O36dY63RZ5URsxGQDf6fb8euIXzS6UgEJg+L44hq2axlknuB
 /XXzAhHnsDPAiDXLTkpUB+eBJC9nnnmj6YHGxwb74ZSOlIAhPaZ1ANV
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: xnky1ebxMI9sFM3MjfTf-jLQew_33qfA
X-Proofpoint-ORIG-GUID: xnky1ebxMI9sFM3MjfTf-jLQew_33qfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX0Rm7AR43z9l/
 cFbSA+JuWRDDJaLs0V0fTlwfisT9UoM3oja2gTnEqJui3Z6q6e9YkCLgztg0Qnm5WPqxbeMfCAQ
 MtuwJF41yi8lFdi5NtxvVmfacix/7HNoW5aEYBePDERqXF9BjSlpPKMAs3YmXpCw5ww6O8Em3jq
 F6wlEZQRP5YFu7X5lUVoK1LneHYe8QlmXcbHKPVEy2eaQhq4wponXMgapmtZLoDzpK0H7DWqBEC
 fIuHdArdJAlhuD/cgQHgUJ6dGh45dBcwfL8uyR9RurqOp95x1O9KsAFUv7xq6tRufwI4snJ3foq
 m/YKIp8oUSjq9wuHvWUJ8MGEgwK5VPXnjQB2gC2qOVDMRCy7uE4CN1wRFXy2/MmgTJtMezqIZns
 C3AUGBE/JhdoKq/hRPZDfztJV9hR3O9DDy5yZMrbyZ1n3jiZvyklosxQ0rQ7geSJl51a1t+jRBB
 UnlU+VtK2ieRgomH5tQ==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a741d0b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4vDcivUYQOVtOqHL04gA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX9oBku+gLx0e/
 b5xtq1YAmmLJilrBhgTsOkinw0jinEW+manplcXT2Co4bYP+qFI2cUFHfUVUpXqtAV2U5xEz4Nh
 9Yu8aDF5Fc4LgIyeU4iqV3TO1KMA6pE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060040

Wire up the LDO supplies required by the QREF and refgen blocks on Purwa
and Hamoa boards. Purwa's QREF topology is same as Hamoa's, so it reuses
the same qcom,x1e80100-tcsr compatible and supply set rather than needing
a dedicated one.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi         | 21 +++++++++++++++++++++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi         | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi  | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi         | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi    | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts        | 21 +++++++++++++++++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts      | 21 +++++++++++++++++++++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts    | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 21 +++++++++++++++++++++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts     | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts           | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts  | 21 +++++++++++++++++++++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts     | 21 +++++++++++++++++++++
 19 files changed, 399 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 9c5e77df0054..c035bc890f36 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -478,6 +478,27 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
index bfb7cea56df9..4c77c51768ab 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
@@ -902,6 +902,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index fb2dcbc7c393..bbcc03dc7f7c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -476,6 +476,27 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
index 48c4ad648354..57c306047d7a 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
@@ -1036,6 +1036,27 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 66d566808f58..da6ecd4a1452 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1272,6 +1272,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
 			       <90 1>;	/* Unknown, TZ Protected */
diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 9602d65c8b3d..8bd58f194f82 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1528,6 +1528,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index d6de4da02dcd..dd466aac10f2 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1301,6 +1301,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index 02708f23a865..224474678ed2 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1284,6 +1284,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..9f677319a0e0 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1107,6 +1107,27 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 2e38402e2c14..9ccfaaa3065e 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1193,6 +1193,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
 
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..d172d8eb52c6 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1382,6 +1382,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ce7b10ea89b6..ed812cf349dc 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1069,6 +1069,27 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
index b70c1e094bbf..603f6d7717f3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
@@ -1066,6 +1066,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>; /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..0ddec7b4a473 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1347,6 +1347,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index f95b1f9f439d..ac4e7943c608 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1248,6 +1248,27 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p9>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 28342cb84ded..47018bb4e7ec 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1322,6 +1322,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 8afbac349cc9..8c41ff76c68e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1177,6 +1177,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index 9e6f679758a9..c2946cfebaf0 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1325,6 +1325,27 @@ wcd_tx: codec@0,3 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <72 2>; /* Secure EC I2C connection (?) */
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
index 0314b2246cdb..edcb6b99a384 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
@@ -968,6 +968,27 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l3c_0p8>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l1d_0p8>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx0-1p2-supply = <&vreg_l2j_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-qreftx1-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen0-0p9-supply = <&vreg_l3i_0p8>;
+	vdda-refgen0-1p2-supply = <&vreg_l3e_1p2>;
+	vdda-refgen2-0p9-supply = <&vreg_l3j_0p8>;
+	vdda-refgen2-1p2-supply = <&vreg_l2j_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>; /* SPI (TPM) */

-- 
2.34.1

