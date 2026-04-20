Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818663859DE
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670982; cv=none; b=DrvJdkhXaX0jrESQeURzjbNvf/6GzhyIkj93vNG3F5z+NyU1RzNP7UDbyRnyaeusLxF4YCpnnnpH0a5wCymUSP3fh+QdSsFLbIScP2maIor6IzxH7G2PbgV9/JVgufhrGJHWa7T3aZttNUk5Xs2iWLMn4LCozmo/eS4UaB4kxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670982; c=relaxed/simple;
	bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOy0H3DATKgbYGbpvd3uXqGVZADfYWOWMe6TXUv7mwjETi4qKCyDmw0GnqT2AAuGtWzXu9pGEbrROTXlFWYSIx5kzYZdFnxgRcFGJn5LBoku+tO5xGSi9PvWE8uZ5g9OQGY6W7QQy2DzDB2sRqsQcj6paPVawiwi7s4xwUJagA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHqnoqjD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwX5jEpe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHqnoqjD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwX5jEpe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7WrR51398993
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 07:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=; b=LHqnoqjDEwiKpuvP
	hVpI6dnRvdPA929YB8cYxZfNMJ/sPa2fMXPQCBVyGC/ROMFALcnCOre4kF1xj3RN
	Ir7JhSBm9tS+6IRZzOsrbQPTkZ+ep8NDzjkMJYBG6OwC0MvTeEGpbV5SiKLhqOvy
	OqrZbkXVF7Sn4pSVf4E34eCglHD0WtucdFCsxmHDYuyjhNRdjtrpJRvLdf76eHAo
	dd47p5RCOplDE8W72/fLKtEpZbWAOiSGa6ja+t/18fCllumeYg5BU13ffMMPnxCH
	oHb3OF+O2wbaDORSdVAie6uE50nWsQz8nfn0jCH6iZL4j64P/5fDa97f8Kf593v7
	3rC0EQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hcn6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 07:42:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d93379001eso1639888eec.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670979; x=1777275779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=UwX5jEpepmXk1GNBKHxas8/3N/mjSpYzdpGyEwYgql7vsKs1bqHItkey4qdWUm1Iex
         gut8DOrC+kfbVoXMAFPl1fCYHgBH58olHDWme7bZI40qt9WZczJfl27YT+VSw6qyTcqL
         FJCn7bIWfL/IxUTC1huYoly9ikzoXeKziX+D1AkafOTSnSlNrLRlaaKKCcNWFS7d5ay/
         thSATAJT+p07Bz8r/SQX8iAFpayr94HDGBN6CBX0jXXRCR3ceN8NJ+7G3DTioP8lADfb
         VHNqY2aNnvsQfiwX2GUEHINNIoC01oKqeOkFYmBLU4BPSCtsr5qaWOjAzRdP/0R/UHMA
         JfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670979; x=1777275779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=IQVhtby2qztJu47XRICyLvlJDucBc3kXVxu5EHBjOE6oTCNIpnGeFvUwcvAQe93uUj
         ZBBHL2ZgGHCRVfV3fdfb4AOm6MrlWFvfnbOGIgYlEVczIZFoEXJkaVx2vbXoD5D6Otml
         ubQoa0j3EmonG/ng4+Adpn4Cj0VvAhsCs/NKyG5E6iTyz2pkGhfaVOW8KbLW25K9mFVU
         eT9EtSqJaC4gCMm0R67sErP2NKZDaCZqIxoAGYcBnm3EZoNqb2FNJaCKXRoYKBs2X+Ce
         IvJ/Evj1OZx3dRstTCLpGsfBwy1Zib8f+L+oE4FfxrfG7bi4IujVhSoPOLHNBfAwgrUc
         aTWA==
X-Forwarded-Encrypted: i=1; AFNElJ+Tpj8ct+AvCPhG4i/odf+94O53Ilb4HQ32ZOsEDErvZw9sa61legL9QTYLaVI6J1ozQFiq4ZXWnXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOzqApb85Z6o3kjN//TmmbaIVrRl5nKokEyLsj8v0WSDyLi4+l
	YzhhtaApUHL/+K0GOm0RckJ4eogyCTsOzzw9FDuVoaGV0eozD20zIvigBnqSZk/N8WxYSZc5Rg9
	1Johauu2vJAbps1DKLnchHJg7U2duMai8wq7vGhhUweuFFk5XAlFtXoqZdGpH/H0=
X-Gm-Gg: AeBDietSkfyU1TlXptA5yeYxeb44ysVy6KRKKAYF6OFxAExvSiV/5pdWOfTNI/b28RH
	tYPd177nw8vEAuZg4sdSzWEMkKUqHjsm7YGOCsjz3HJxNE1mzP29fSTaMFekVUWIx8f1kxhUbz4
	dRXODXkadg3EUE0DxeYEm6pPzit4BBwbWIvibaTq2otud/mPff63RgAzmtnYwJDsdLaNnoe73JV
	JAGNoKpqsd9t8GAx7GHjbVEijK3HPsScoveCK80D8X1e4EFeA1UbJ/GhjzS6wsYfKgjKgvGdtn+
	UCKCd7VaXXklkaWMIVhJn0VmBekFV56gVyQyQSHS/Z448Q7mSFa3JlB/CYe6wislSi9Gd2KnMog
	JdEQ+sIarF4HztOx9QRYKGLv4DdTMI5ydudPyf5RH0V+AsqvtMx6ABk3CGUihRKJ+78xOeqg6ho
	JM1Ic=
X-Received: by 2002:a05:7022:384:b0:12c:33dd:f9ff with SMTP id a92af1059eb24-12c73fb16c5mr6848836c88.33.1776670978908;
        Mon, 20 Apr 2026 00:42:58 -0700 (PDT)
X-Received: by 2002:a05:7022:384:b0:12c:33dd:f9ff with SMTP id a92af1059eb24-12c73fb16c5mr6848814c88.33.1776670978294;
        Mon, 20 Apr 2026 00:42:58 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:57 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 00:42:55 -0700
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-4-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=1676;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
 b=UjbA4bhllGno/fFkdCg/oALlowFVUfHEJ8HcU/WnxT545RvQkiHf5PCftELeaYbzb4OhkHYLD
 ipzY2gsIbw3DYoxY/N9Hunvs+4RwTaq/bbbOb2AX9zeHpvJP8SV1TJ/
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5d903 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Gcy0W0cHAWauOcWtTx0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 39MGVWn2S4c2YxQAH0KvFLCCzC0mKK_d
X-Proofpoint-ORIG-GUID: 39MGVWn2S4c2YxQAH0KvFLCCzC0mKK_d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NCBTYWx0ZWRfX3VUy+zJCGjF9
 wMw14nOEgXITvwsy5YFH1hR/nBr72gA2Szz/dtXQbCEhSfDO0eIttuFvl4jvNFKVfUysUzbMXo5
 JhQZ+mAsHfFdy3/Obn72DqKIB5mb/B+XpjywHdimEKkPByFBrg0xgS2rDhFHwPScbM2hfba1oiV
 WLgBGV/FjH6kpH2GIwhdcHHIBGcGbU5yJ8u7oyU/xqD4z6tC+X/jxLLoSlw4XbWa08BGK//BnVf
 m2VnN6Wj8nPf7ni0Z7nOWlNrYUt4l2kJvMVFopmXzESflMHpZ1XG0vg44aR7y/XuyE6Ym2zxdWP
 gi49drjc+qouoJZnrCImA3R1fC5ovkLDUj/OAwH9IR+ohLoU2vTasGwtvN8X1B4z6Fce/+35NPF
 qID4V8B0h+a7XFySuSkwfD4cBKkkjoOhXhsKeGhD1U5FnmyaO2roeHhYpAmmm0/GAskp37HjCaK
 WPutxkt81ubiA7tUtig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200074

The TCSR clkref clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board:

- vdda-refgen_0p9/1p2: LDOs for the refgen block that generates the
  reference voltage for QREF
- vdda-qrefrx/tx/rpt: LDOs for the QREF receiver, transmitter
  and repeater circuits

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..382398e44296 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -358,6 +358,25 @@ &usb_1 {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-refgen-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1

