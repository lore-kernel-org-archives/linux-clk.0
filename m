Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A338654C
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823216; cv=none; b=Qf22I7PJDIVAfaEGQcrkRGme+/jlhDAzzh3ug8eMDLx8Ahn8qOFgj4O2GE3igvAmZ1BBxfzXEaq+DvNucfpf6fLG3kHfPu1SiDoHDXo0COSg95BWRE5gpvILerimxMvQLlhFs0k584kU9DZ00mfpCafarnl33Q0yq85liJ21Vqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823216; c=relaxed/simple;
	bh=cvQ1+7+KJ61hX2E7lBAYjSXTUx9Z/ZsV1ErUURaTUTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPA1FgySdgMdOs+9iDSkQd/1XBo5kI+qBd2Goo0f4RY/0SowZuWi5AgoBnUp2QcJMEYouzyAbGVJg3o4qrqboLsPCuOnj6VSyuQeC6Bqi2e8slZSUYYRSoWVnQ/OB7TMz5bySyXChxauhqg/KRpBSwIYU/34GzeptswBEysTGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqOuuOYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SM8zfLDv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqOuuOYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SM8zfLDv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2aR2X1632446
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5q1bC9AHIFFKDC0r+fX1bOoJjnFvzKsMSPYf+pQ1QMw=; b=iqOuuOYlY08CPI0E
	nzwAzHwgJI8bmyVhe1ev8buDnoyexZMwzpKsGaGPT8oxFIz9DVRco+qheS0lfGOi
	ZFFN1FoDom8k+n4tiXxbbXjJ7FNHpQURnxCd1dCW43M0fVeXBXV5mHraA4CzGfkk
	MTmM3chqrjm9MSSWyP4eixQ/d1QXJz39VT/6EvheRQ5Wdqyr+W4pvY/ydC/7QevS
	mX2LyBG7KY0Mo/DJDsJJKB+rU8y5SQVyqpnaLMf8Nz4n1q9o3M2APp3TRDHG97MP
	EqFiwGOe729xYJkLYKBFwykgx6TAHwCAhS88S48N/P+YGjSwvjvlBs28JOO4VLz9
	+xRirA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapukamm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a18d37a91so3251630b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823212; x=1774428012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q1bC9AHIFFKDC0r+fX1bOoJjnFvzKsMSPYf+pQ1QMw=;
        b=SM8zfLDvYB55lOkdjqo47Gzagdmsj0X0UFzQwtNYlrXV6YspH+exuY/l1ZwEFwSBAL
         oUgMePntAWPRDnOF4YGoFVYR9pj0RHbR0v+2OcVaPUk3bA4+3Vjcrl1fTWBM6w6CdF+R
         vlVRMtySG+gkS2l2oPynigVLd1vAx8+YYWJRHFXy1voaq2Xk2Wt06F7yHetpzfy1Ilx9
         JGSB4tCrFkDaCa52+mh3Tl9v8upOsl/cqwh+/Dnvig6XJGbxSK24+dcds+tLnTOneCvD
         hj+zlrxaWcfJmKelo8KaGHw+rM6aQ0oUC3EwIVFt/mE2pUGo3k5dY/NFnrZ7cElI09nT
         76Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823212; x=1774428012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5q1bC9AHIFFKDC0r+fX1bOoJjnFvzKsMSPYf+pQ1QMw=;
        b=g8W+ufymD7yLBiE+4P+uI1PLHXuSf/p2xN78q064l4s7/JApy9vEDDvG+wdHLicnbA
         wfCeQ1M2SId8XVQZV8r+pCvkK0VMN5cC3HW9PhnIqNAkWME6BI6KxtDIVbfQnCpl9QOu
         4IWhtWYf6NwwYcqs/zzsko6MboKGRsnGU+PjL+B4d4eadRpEwQuLo8Rd099oUwLw09XV
         kbZ25Oy+A2YGZbMCLqNE8LGZdxTNzCB4Y9Zdfsi8oqhmtVlRUNhb+8kylcwp1oxhSzlO
         1jdvddfUWZmUSF0n1ENtE7sKjOu6goxsjDi6B3MBLGz5vFoVl4Ier+3o4nkisgT+MLDY
         2DdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzjpB406HRb8z4CRrKQ45yJKR16gYWM0rDhv7FxuodH1BEq8K4TIi/y2vgSUHA6HNwEmqx8XJzfts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR9v0Jx+HK616xSt0jXF3u9wJyqx5HzGe0a8qi4uZSf7P5iaym
	8TDKIMGuKGd4G2qdfZ5Uyfz45uV1t1/icTy2mg2gTibOPKeyFaSpfAnIj+3DOf7OoxYnTq60q58
	qD1v3vKr2LLK1o4KYr2wyyxVGcpdAIVuV4TNBeMiQmN65jyFc8Iuh9zsrno27fqQ=
X-Gm-Gg: ATEYQzz1e2wG1eQLmRdmeMScMwbEY/QgQn5p6hK6s7d9NyNYOkIhq0oaS6mx2klejpP
	IQLchMQdcrhyJ15Y4S50OBs5R3JjOKKkpZsZ0uOBc//8jzS73s4lbsmGHUCVHBLsHSAF/tf2H7j
	mKltIWKmx8TFgcqDXk3NRFyCCCfJouA344s4aYt+LA/VBH4fPIz0JPN1EGDRXWz3l+EDrYjc+MH
	myp1OJTudWKI2keUcXha9824FIUaoX2eXqXb8tE0TF2SzFjTcWVqIreHNuMyUKSrnm4oIigVgL3
	2QsB19xdqOMoITviv4D5+7/BPjCn5xBt0NcSuSta9QgmBEQ4iZfWMmTq9MvuVekV8kF9zbDMCmf
	3Mf5QFmk1CU4p084P8idzHa5VxTnRoIyxLTcJG+k40S44X7o0oFsi2LN8A7d8RHoHHFhRCPERss
	4cyV58l06bFCKrD9/J06Ux4xGdehxaqILbuUNGRZYIFm/jZ71g6Qmc1wDe
X-Received: by 2002:a05:6a00:a216:b0:827:26e7:5c23 with SMTP id d2e1a72fcca58-82a6b260f7emr2323125b3a.59.1773823211886;
        Wed, 18 Mar 2026 01:40:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:a216:b0:827:26e7:5c23 with SMTP id d2e1a72fcca58-82a6b260f7emr2323083b3a.59.1773823211364;
        Wed, 18 Mar 2026 01:40:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:40:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:09:45 +0530
Subject: [PATCH v2 3/6] dt-bindings: qcom: add ipq5210 boards
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_boot_to_shell-v2-3-a87e27c37070@oss.qualcomm.com>
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=949;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=cvQ1+7+KJ61hX2E7lBAYjSXTUx9Z/ZsV1ErUURaTUTc=;
 b=GQupGMUhdSmoRswbGDv/Usp5qjiQYBR2bY9062OSCHWmkCFsZCKKdCus3Lu1RBG9LweDS2FgT
 9+pB2wFzxRlDTipe1PlHgpEwLg4i3CA4SmXzSbReWC42m/xYIPzJNHv
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69ba64ec cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7cFofPlDN1olvp7CM7gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfX8NiBvRhASrTB
 v1Bh2xCThQCrJ8uB+UZ5KuI0ST6SonbOCU8z9hpgpyFaPnvKEb2xoKYp6PqTh4Y0+FupIEB0SIG
 J5eRZrrI3DO0ydeAzk5B7YCA1YJafMEw85/ltFpB0/SIb1bzjNrainjG7wpWCUS0WGlM9NWlliG
 K7XSqyMFYboHVt8WmQGdk1QKi4twn05svz1Tc8Vqjpb8pqMtZF/iFI+i7MUYzhh/DmgLArtQI+6
 zxtkJIiWdfSfXws9L4qRgdEbnvvpqQ25PviHqv5dZ74DJGRMtpUFqzQrMgqQ0LSJKZ89K10wmqs
 g6eu57vaDYZzBJ1XndKfP10wBN/vN44wIDlfihE+NTl4xOWqJQUAazpvf1sqc8PON33EK+bftY2
 OTjA28pHfESZ3D/5nbnyWKtaRI4j52qVaiTL/K/ZjiHsSMmoNbdqOGY+IQdZE8LTAf5lpsG8JBN
 CZ3d7SfuUfanYXVcfiQ==
X-Proofpoint-GUID: 85Q9ofDWEN6UnPWhF6EuIY5EQtuB0FZ8
X-Proofpoint-ORIG-GUID: 85Q9ofDWEN6UnPWhF6EuIY5EQtuB0FZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180071

Document the new ipq5210 SoC/board device tree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d054a8f5632d853509b7cd37f07f02473cf6bf71..7a36da412ab82b425479fbf6d81293f24e66ea36 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -309,6 +309,11 @@ properties:
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
+      - items:
+          - enum:
+              - qcom,ipq5210-rdp504
+          - const: qcom,ipq5210
+
       - items:
           - enum:
               - qcom,ipq5332-ap-mi01.2

-- 
2.34.1

