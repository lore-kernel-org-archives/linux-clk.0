Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ED4343D85
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144019; cv=none; b=Il4ENFwr4tsm6TE6dP+TLO1RbX9YULIr42IV0VbbtH1ghNa8d1XsriwgebwWoy7lApfjyfMllBlL6KD+LvPxwc/SZqZa+VFmMagcTvVI0WIObu/COYV3Otc4lxHulQyvJI9qoT21EGxOLu1ZIH3TuWr3yNK4vCg/H4cfhM64XQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144019; c=relaxed/simple;
	bh=hEjS3gadw91ukvyaCwp4piU6u++HLzd2lRnQCRSMKdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CuNbc2ooxU09UBiPAMdzRo3ha76T54lyoz1elkzF9WyKGxjHewokP9d3ab7Q226+BLpjiTn8D/D+lI0v3Y0wD7Wtp7ZXms57w7wvVASY3UX2W4Rj5DXYMcHdPNjWW+XNIKuBaXkJDWDQ4gfLmn5JtuPEhE63JJjXWIR7rpSo1fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOQOKgPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xsy1XPa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOQOKgPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xsy1XPa/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JCmijE3305999
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0LXa/f8KKYSvNYFTstl3D0QU7FLDypIICNUrtZyBR0=; b=iOQOKgPiZixwOHEY
	IUB5cCyx4xqYIBGPzyy0ism87lUxNWxRo/OzVAJU4CPjgJg5FNd8koP1n7XlghYV
	mErkK2GRsYeXn7+QVAN4YOmvWjKHxwlWfLig4MStnmzoAYhK5n2R6kAshMtlP8q4
	VtS5tz5PiL8nHu432INbB9Ciz6Gzia6IY0y060K3NctUcdoOOiZUF6DvszoAYIi5
	8DXm22MFX8/WNrydIEccWYqF2GHuCnn+eztb6gnBxJvJU4awNgeE0imkddGOFZIk
	6HjaGHQOJ2M6an9yGKzdaZYLCAGdwtdpthY09O8AzY4LlYJ8XpNkb3vYYehDkk4c
	DKX5Mg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb9ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934979ee9f1so124464585a.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144016; x=1787748816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0LXa/f8KKYSvNYFTstl3D0QU7FLDypIICNUrtZyBR0=;
        b=Xsy1XPa/hgQ+Km02zG9E6JuoF5JG5pfgpG89KJrjH2vYAGNNhRvsWEmXCdRQsJhGrk
         WqYApCeY8NjzY/Sf//3i8OhOSjCLP2V54gIkg8vXwf2oj2rfbVQ5BpwkT8o7W+spi0jp
         tluP3584/a8bXFHaVJVbn8pGfqVfVowtE6gHbl73WzslENB38NpV6nURD1ObQ9oj40Ye
         uoBQa9ebLYBAY/1KcygHm+H67goJEuO2FdzASCyS+N76kiFRuQJSCmYH3BRJ2p4HTYl8
         M+RHWS6yF3R3lFtFvIS/76n2h0wasbzIIwtgy3IYGJkT/tPJJUfmfv+upNqdwTtGzP3J
         YL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144016; x=1787748816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0LXa/f8KKYSvNYFTstl3D0QU7FLDypIICNUrtZyBR0=;
        b=dBXve+5VD8GaFmNJR27tSWdap8f9fGQEzzI8UTsq3KlqDUZyYl7mFttfqG8DnfzWZ3
         mkwvCOjnjtOlebufFVhGhnfGWqu+IxxxHiT71fCy22tTzMbIHk8qFjG19bRhC7GDHNJx
         95cP/PM23spgzd2pJQanHhW8s794bZKp8jOveXVo7oMpSMleSrqe1et4zherJiNjHfbl
         BRNwEPrPq6JATWa8xdjCezMHr2IoDGWIdOKtPazlUeT3ZTa5SEecvruiFIRlmcaLXV0e
         Hxsb7oqx0LZge5dBJsnmgvlh2QToWry72RrHR7v0SvaG9Ow9QtLyBO5SiIcfF++WzFii
         HXmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/RBW67JYWQ6BdP/dTN2bM5LSqRg4ZOuBmQGHJltvjuLUWWCSTgRt5a15uGRs2n54UY5FCPIE2tPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDHRyewTcxt7zt/7tx3aqpdMWINOhnce/26T/bVTZvpnCnc587
	8hlbiFjsOakHjQNOnzb+dkDYujsk7QxusQFfAxCgMTwlQ+/GP0uKssZ/ATHaakH26b+9K3t8ac7
	2yOUx/mfU8HXi2FfQ+6hroycZebbPKgoKoAivGa1iEgtpzr/P43WMsBkMkiBuGhk=
X-Gm-Gg: AR+sD10pfxOvXeEzxxA0H5utaTZjjbUR+OLGVjQ0fzIM1QhC9QzcaNRMNQhnYLGbY60
	4pX12UZnGUz3h2syGhwHdYV6e4jJuEiTNQRHA91Wwh8Uhdc0Zixl7yPvzBMozJDAwGI1Vs8FU1m
	GKFZqY+4qbGrO0jtJCG9+pnCki+XYAgisZdT06Lnd6hI/dQEGSEAkSIQGKvBr7GVRnAR9smHAYU
	Lvpe1ff9urfE1n2frYTHBmGXmM4Yc63rNW9BtLm0cfRDlEFgfD3gErQQzrK7xbzBSgnDxwKbNcT
	Nj5AavNQOrSelVfsjEqgh02RneB+hnGGXb8UOM96zIxWCgLnycSgnGMwDj7Pdrohb/rRrkOCOxa
	A0ypMm6n/
X-Received: by 2002:a05:620a:25d3:b0:937:1538:6b93 with SMTP id af79cd13be357-9371e6f0580mr369536085a.40.1787144016155;
        Wed, 19 Aug 2026 05:53:36 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:937:1538:6b93 with SMTP id af79cd13be357-9371e6f0580mr369529685a.40.1787144015558;
        Wed, 19 Aug 2026 05:53:35 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:54 +0300
Subject: [PATCH 09/16] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-9-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=929;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=hEjS3gadw91ukvyaCwp4piU6u++HLzd2lRnQCRSMKdc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacUW2Kap4nEgpiLnVAJK3I9j28+tuuoE93SI
 6Fy2b6IZAmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnFAAKCRAbX0TJAJUV
 VoK9D/4kEQhjkTvmQ6b2zRF2IxMqf1kgiLRvY3mL+AmywfxFLb83sMW39bqV73qUuB493n2FS0d
 +iouNrG+mWVaUrrTE/OVLOzpwmQ2xmP6+L7q0jMDwpgO8IdgK5CtRTuJtkdC8kM976RvV7MTT8R
 t4Rd3kppEWwM4VPgTIt8zQnip0eVS4S7mwcTgZc1ptD5FzXb1wujh/MyxYCetgMRfY05Hb9leiA
 gU6kK/9L8jUb/I9le1FIHMJ5WOi4JcuoOzTRHvUXPxjaoJ7g/lHbJG+toqr/HKJ0WajbJdXobF4
 hOQXpCeeAZx6Hs/JQNcnfY3hXTQcy2LE2MUu8WxSkQRdWRAdqxUfM0kbiR8gVkS2Tdp7gOFhMxU
 nIW5z/I2Wn/Av+/Lk2uc5lEFXXYMCli8Up5RfHGD+P21gqoAHZQHjP5A2H+uC3zNp763Am1C+lk
 VaOgRXON/HIghVWi8rkZGZv9Q4aegLQFD6+Ee4ZbKFo+ET5mNPbac0vEw6x8ULlnLbK/nhAFH5k
 F+4uQDdmMvAronrvICBpIRmvgybTgIWVQa/t4EamxxUEW3evlAcei9ciolGDX+2Sv1VmxAlvp8u
 RVtBJWfAh+lOxCx739eZaOyVJ1IrMbKnMNQRL92Fs3i2hj+he/YzrqulqHo1tVfgPkgnx1JH5Lg
 6Xr2eG1TUeOXsag==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85a750 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5OSBTYWx0ZWRfX8lDEfBTywOPx
 YbC3+xtp8F0QSWWTEFk2vyHhOaonDGANOBGtQNddZnf6XxuCZMWJOLUf8n+zHYmmPzy7GIck5h/
 +Ittfv4l+8YsZm+3HEjTPGFduVmHACPHBb6MaWr/RXAR3e2QP7VTDB8qFDQxSU0Kx+sQ9qib+O/
 itEhh2SE3dRo68y3qiDNlcrESoqCAXtAdTcRKxRO+F4A0849RhajP0bKyVCA87fatmLfhsm4K9e
 PLD0wXlBLjmXhSrisIUXJ4OdE9SWnZuUGK9QdmI4zXxTmec2RjD0+dMvEPMUDlWV2Dt4b/QIYTS
 btUpKtEqcfpYG8xxmmmCK2WBP4ic5wpShtyEiuRQ/iT64ef+0gVwwM43o4lEFZYnFy2s+riiA9B
 7KP7fjNTku2Xah2Z7qzTkKbO40pHAXx07B+f3jvCGj304tEtmf13PZeZOVgiNjuuXRZZr1zjVe1
 gK4A0aCh5RghkCMn8rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5OSBTYWx0ZWRfX1InoAP4+FTCF
 aLPPt+8DX5BIIt04zEoQuIFv2curl652A/7zmCW2jJROA3u2dKDZxS1QoZud93MiRlc+4PmYAUu
 Y7Q7xOFTKW306LiLA57zLjLDOl4vcN4=
X-Proofpoint-GUID: YFmgjVraV857zFrtCWYd4V2WeRrsqh_R
X-Proofpoint-ORIG-GUID: YFmgjVraV857zFrtCWYd4V2WeRrsqh_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190099

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..50790cf1c3ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -971,6 +971,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

