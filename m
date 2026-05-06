Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECDB3E63AF
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057050; cv=none; b=o/jJHR1MdOhvTZkC6/yrSMchGlyYEpDmw7mtJmCc7FTdxa1ehCoNF5DaDCF88XvcPwE22YzehaqrALo2SBBJJeOhhheqH4XSClqFuhE5pfRR35usY+LwX4INt14vHVzaBCbKqonQAW1U9d/k65XTg0Z0Ey3Bu/J5bmbouFHJAcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057050; c=relaxed/simple;
	bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNna6NRoMB4exD8flLYr5Mb01YMR1LWiCSsdQoLeQaQFgTwQuJifZkTspsTi4bkXbF0tCmIIB3y6gmMez9JJT0x+W0rAFzzHDjl5trV0I5NEifQlEGt+uEFdUl8sAhN00Ms6bBzaS8Rt4fxomoEP3tci6ArzCr4p0Xr0mRuB/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxWxlS4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJx35SLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxWxlS4w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJx35SLE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468ZwSS443144
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 08:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=; b=SxWxlS4wS7VPILG1
	kppM8GNiYdadAL+QIRiHTMIJABg17BLCE4Xn02KBeW0twlMRuN4w7mJnJt39pP5N
	vGsww5BigxlqNERBmsMc2tSt5mI1XsEljKa4gtmAwGSSoTZ01Le72xUv9fYqRO3o
	ZVn647DYibPhacWxjOqCdu6LXaDqSt8Q0UWOj0vx1P/D5/gyJNr/P24UOznNPzVw
	jbqjomVQ1lbTVk9ewiJTs4uk7FSzbwfJFKYn9j+BUl3/YKJRmFt5ZQhY6loPlvaT
	ghFodw+BiMyWAd9yFEbCTRQOfr0FwckrFlX1g7LC9S1Ixdo/T6rvnhod2xWsjE1w
	/KSNbA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299g1aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 08:44:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dba1e866dso563167c88.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057047; x=1778661847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=iJx35SLE7RMOrRYeP6mV7Brg8FUKvqS7OL4Cb6f6TC3EJlXkNbyfpS1GR9E+k0A+5e
         419zuU2NC4Y4q6pOHdKewbWVptSSAGP8bORjd1zWRMoFcs0pIYJHbm5398k4KQ4zuaq0
         d1N3giR5TjDVACuEZk23XfsKrsJ0iOuiituDcpTjpYza0FK7/S8Xq3U6TL4tC1xpBR91
         seN33osXgFEUiPktp4zhMfPXbM3BDdckLEJfVveDI72wKnNstUjmxHfFcT+Oie5RTddz
         a7gLrXD3WLk/MKRL4uAOnmPBHmYqBomZyYNaUWsCUJH7+i6TncaWMRgMzh/fEKe6QY56
         2Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057047; x=1778661847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=gmE7iDITO+TM3p6pRVva/eSYnad8jcUssNdm8drujdCqatb/hdZ5g1vrvZaqv1WIh0
         1qIoLnQ1/e2fVLPIsVGllMHLXs/sQFPOLI8HmPO5IsqXyDiixBVtGweJvugDfCkJftAA
         gziNNBO1pDsO+zhH7OMwrtygBINjT8v/FavTxNPkWeeQm2QOUcQEQDzQqzPoM+4hjUxA
         ggO01DnDm+Ig9izIa1L5XKsC4V7E/QfYAz2qZPsma7sxMoVDpdxPpOnqf+vE1W8uRvA6
         hSHVMC4Cts0zTJxV5Jqn8PFQgKcBLmjBsCg50JacT1t/EXkVXAX2sO+ptm33XzRa3y4F
         c20A==
X-Forwarded-Encrypted: i=1; AFNElJ/jshjYswJ9z/g4X9r3qTEO2vB/514SgJb+wwevy7JkHwYMNoES+XzhBPQo2C285tiEu1MakSSEV44=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHfkxRkluLYApZvjr6Wy1JSqgqkKCzBThlKsRERRb1YfFFTfa0
	7rapd85xTXIol+A0wVUrJ+ii25bEhvu0xCrMeDTJvz0bTWjZr3liyO098Jb4sp9/qMRZ0+gOO2s
	AKH1Bi3xe2KrEZUKkjuoE+woAjhCeVV3CuVnR4s/2LJVn7Dk54japB6410weev4A=
X-Gm-Gg: AeBDieuKT+zOEo0WIOOGur5co0Tt/RVM7c+D7q/HlRMRCB2acQ/jgC/oMXBtE/fTCxv
	SphhX0H5y0w7wYxtmcJOfug5pOH/xZoKDqIWnajxDKQENt2ttwvl03hqbGYQmp21eWIzAu1FuUW
	lHPfdxDWENsuPAfafphZBJ81ENcDrJu4cWkrLxzz7gqL9QaYLoSTHh/Hak2zrOEK4deweyy5wEn
	E6IJwSdZtRvpcTpWRyktxS99pFqE7CLuActmD5ZDaaTJRpYYW2RY0bXjEX6rUaq1dqIsFctv8o3
	KrWad32z876JqpN6Q/g2ACFVpTBAk3S3t/r+Ox+DeL+6K+u5jPkNjciYdAfNqFNNoKW7TPCdsfg
	7ps7YbmXiB1GmMubc+9wnkdoik93PMeRWyAqPW4dqPxrRUEepmE56BgQVlCXDeMV1XwzcEyKbcI
	wRqSk=
X-Received: by 2002:a05:7022:6622:b0:123:3301:a718 with SMTP id a92af1059eb24-131a771ca3fmr915175c88.1.1778057046574;
        Wed, 06 May 2026 01:44:06 -0700 (PDT)
X-Received: by 2002:a05:7022:6622:b0:123:3301:a718 with SMTP id a92af1059eb24-131a771ca3fmr915153c88.1.1778057046051;
        Wed, 06 May 2026 01:44:06 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:05 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 06 May 2026 01:43:54 -0700
Subject: [PATCH v3 4/4] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-qref_vote_0506-v3-4-5ab71d2e6f16@oss.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
In-Reply-To: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=1676;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
 b=Vf8Bn68UCpxcj8ofhd/XbsDqSsXtypYZxhuiMZtGUI4F8gukWtodD6DpH/jBxOssPmgO755Wr
 soHheNW0ES0Dyd7wuUK8xd3dwcft7YsKwPj7I7oKFVeTnudjA7a8o0u
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69faff57 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Gcy0W0cHAWauOcWtTx0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Gp3Q6CzW4dywRz_qdU-CYbxLtDt7t93y
X-Proofpoint-GUID: Gp3Q6CzW4dywRz_qdU-CYbxLtDt7t93y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfX+wb3SCg8DaU3
 cj5y2z9xNukf7EA3t9UPGbX8yBnpzsWM+sXFIAWrvi8SH8ihXp0e9lnpgzx+b/NV0I9/Wp80xzT
 WmfdsliA2f9XBpLxNfe4eGe0k2mJewCcOaPiC1T/mjf91whxqSx04NeifUU+RJKQsSgAoysvCwy
 py5J5sMxSa4uNqIsNrsKpzso07h2EFl112dbNA0DJwi/tg0EEPswTkAEo4OmwWf5WjhhLGBASEi
 pQa146NhEGopiAtaqgYqu4eDkXROxjF4zx7Nn5mp5miiVwt4UxnafOAtYT9nibHu/3Ljnf6cOO7
 6Y3t9XRY9AkCxkL9aQhZTximkiI1Pkpg8fu6oKo4yz6IvThZVBOU73CcvrSY+zSYEjo3UusPCdN
 rTt5aVp66x0YLwiSKgCme6FF9DiyVl925ddYVwRocUohdsbc6jc8I7uqCc7I+3yKkMmg4vIXmjb
 sZsbbT95kSNJZpcBR9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060084

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

