Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A7E33263A
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025341; cv=none; b=cwxHJ4Fa/cHHTLl5y4liZrpiah7iM44I2VXwchDDEY5BEmIrMgBxJNMydBgopSgQtGTb37BhmkruIXwnB6rdK8Ue4ATvRXUG4EnhuGTSRQOSvmZqc6nYHt3tEC1dAr8e5F8jKFPsYdF1vs0WMBhM7Xqtvc5t5JOSJRxOW+QEyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025341; c=relaxed/simple;
	bh=HykJptyeG70W7OChA49EYIHxPs0wMAgUlbTPHQWlYFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBbS+ncwJlV1nAPCxmXDXJkXSKmZKSWIcMHlT1Wslry9oL7+RDQcB11Uv0zyAeTmzvNAGovkhTjFMRG3rULNyeKPo34Od3a+gXpJL/12ePu1dlFc3ATgi6L7O5YAoZeweG/TFwWZDNYCXN1bJCgmD74rblk9XkRKK6G1OGKTGNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wr4vXiVW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDaSDRWp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wr4vXiVW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDaSDRWp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6311oXJP3081559
	for <linux-clk@vger.kernel.org>; Wed, 1 Apr 2026 06:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1QYgNgDJ3F6MS31DQqDY7XXr7r7iT7d6sWyEB6cfUQ=; b=Wr4vXiVWsW8f3rgk
	IC2ZVni7/VIOigl8cL8jupphGG5a3MXGVxjbFOckAdf84WhhwhsGGkHjZIxbUcjL
	aQaEEq4A22VR5oDQa9H5p2/hvhsZwWEtJpTZOfBVofDsStOY4NBCeaAHuMF/mZ1H
	V4fB5u0p7JkYPgi3Bur27CO4KoTMBjlH8sm+qM2Y4EXhuedKI/hho3bnl2t5MI1z
	ZwGYLLSY6iY5FzOSuWwmH58DhW3s7s6SnDNf7qZ7t2DaHAT8lbV4iZ8OaB5YT2qa
	/wcNqSAK+9X0Rr9tSDMq0IetC8BvcJMfL27J6IPfWvYYeWqqtpxxq+EWb97ldgA7
	WU9zHw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdktm0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 06:35:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so5936955eec.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025338; x=1775630138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1QYgNgDJ3F6MS31DQqDY7XXr7r7iT7d6sWyEB6cfUQ=;
        b=bDaSDRWpx/LRFb9Lqc+mdS4F5yODvCB0vONnaKZas/IGNWuf3gEpfnn/B4nVBCF+qo
         zF+4md+obJuCmDIos1+1XgOz63pEiZ2zkYQXn40gkPxBA2qZ1b5p/h7NWKXu0wlJ9SG8
         DgfjrKDnL8LcocBfHW++XRKwlXqpd6PH4R3pRsqc2MvTvHYaO9+6yBegrX2z15SBzjgi
         glYhMx7v6KGoE2uymhQlAfNG3oM5gNQ6VkxrF35VUQJaFQkURY+bijyl4yh2s42P/5dS
         kNUTrbDzhzw3BI66x+clMX2+cvR/VU03owpCCiwWP4FQZTtRjmwn/QcBxxG4oJBOLFCl
         efAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025338; x=1775630138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1QYgNgDJ3F6MS31DQqDY7XXr7r7iT7d6sWyEB6cfUQ=;
        b=G1fKfZEnNs3usiriiRW/M3NU6husYR3zXC4SkEXjMURjWEYo1QF2Uoe3mVEfh5dvI6
         IU+KbhDMkbvR3NNhWwQOrB/7Newh1zmKMuKavAQZqry+fQB5lvCKCm0sh43AjpEz8kmE
         o5t798wklXHF8j0e0Dg4SUbyPdWpjw8yZ9Cg9Gw86IOD8boWkUqVOLPQqI7X4oZ/EdkJ
         mXY3KtAWO7As0891EIXLfmmWXc145EuOxQkr9h7GqOCyidZhAgaYDPD7fwhJP6kTy70h
         HXBfyMKSDmTokNS5R+oAL04X73flotn1BHyF+Cpj0UanVg9Wjn9gljRE+3Ke8lva79we
         wx0w==
X-Forwarded-Encrypted: i=1; AJvYcCVc9EYs56lCdDnWVgS0kkbRoT39vc4ipus2npOKxU3g9RPi0BofeSrqPlMLlhIm6I+IvP93meXOd6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1b48bRa85wLerSxg2Xah37DN7uPZ8r5kUkc0cwXXcNgUZG4HG
	2/BN5ihPDh1xqCixx73Xs3VlbeU10m/YzWY2HMYa38jDciK3viNBO0AIiMKhiqftFwXqoXAK0KT
	+1rFd7AHI+L/awqyMLGG4Upvq9hpL+o/JyrMkmb+suVPjsGZ8mEisRZeA5CV9Ekk=
X-Gm-Gg: ATEYQzwMgY03bsOv/Sqc71XxXQJPMf0Qsd96+R60ySz+UC8ATMLdyLodhKSCnnmuknF
	MiE04/ivZzSouwbyoBmpgto3yA9gL91uIICXTeJCW5W7Gg4iNRWNg8mpvoHo5hvFSkSGZH8OgVJ
	B/b2QzjbLig6USOzBCzaDnFZap9AK2k6JjkITMBPSCXKU2iWEPRV6CjsyGo++j6IfOMvOy1sBgj
	+Sy7EDyoTcqwSorrmU4B73LaTEshYFOd6q1UteC6jt1JP/TPJ5eAYsNCOeAXFLwZ3rk6SKTtACv
	IEtUaxC6GcND5L9Tk5CmKWY1rJ0adKZTCnUAAhwukUgAb6U35USmzHeszbclQSRnqE/GSTJxfyx
	QWug5axVjV6E5tq1vqxPvqzyGFtAdnilBa2LqlhsN9jxmTopsdrfYgk04QKkO8yJ0g+a/
X-Received: by 2002:a05:7022:2387:b0:128:d4be:7418 with SMTP id a92af1059eb24-12be65a27b9mr1237995c88.35.1775025338213;
        Tue, 31 Mar 2026 23:35:38 -0700 (PDT)
X-Received: by 2002:a05:7022:2387:b0:128:d4be:7418 with SMTP id a92af1059eb24-12be65a27b9mr1237978c88.35.1775025337549;
        Tue, 31 Mar 2026 23:35:37 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:35:29 -0700
Subject: [PATCH RFC 4/4] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-qref_vote-v1-4-3fd7fbf87864@oss.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=1732;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=HykJptyeG70W7OChA49EYIHxPs0wMAgUlbTPHQWlYFw=;
 b=0SX9Xe7reS6OSBWr2q3Gmgf6avxaV0jkkGa1FvQa4GBhvKr6tFnkgE6sk+GAMJCTnHGKVygEt
 xJGoX00cKHtB02MK0Pa2mGPWEuj6mAckxKSii02vihdA2tQXK8cZY+K
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfX9Gg+WQdflU1u
 aTXyz8seSkgySGkwCHLHubkuS/gc3ss2PzE4dGAy9fBowQYPtXfuZY9im9ZruGb+ttKS6CIf1/x
 ghCH+sQlEZqJ6GfE73o+9ntemP64cFCZCBAX1I4iCa5EywM7aLNmPGd7tMZfTs+Gp9REWwfaJe/
 ds9lejhN38UG1NF7ntTugooJmbkRR7IZN4dkgtdXl8NtLQlBa8uRI+aQAbdG3k+qQsMcTjDeS9b
 FiM9staBrVdOR8eFCk5w2ZmjnYukO35A94O4x+A4v2RxA/4I/XDAxtphtX1Qav7n+iYWPoQtoFn
 Jx7CtOEymAyUPcypW9KFZiv3tz2trfZWyVrwsPdb0WpYRqvBH2ILoGh70IMecDAah0Q9UpXgK1x
 nP5wIBAPvtm1LjmVhcNH0cos67qQeKCtQiUnVXflDBIyip43uxQEs3gFoN1O9PthSARNYWlJoVR
 Z2lUeLQzDr8UsB+QeEw==
X-Proofpoint-GUID: _cT2t5n9urAQiZ4U6pd4f3BxCB61IN0V
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccbcbb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Gcy0W0cHAWauOcWtTx0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: _cT2t5n9urAQiZ4U6pd4f3BxCB61IN0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010056

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
index 51ea23a49b9e66f14d08dcff777789d16647fd17..3ca181d082ebbbc4d4778abc853c39deaa2a76e6 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -342,6 +342,25 @@ &usb_1 {
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

