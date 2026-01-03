Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF22749DC
	for <linux-clk@vger.kernel.org>; Sat,  3 Jan 2026 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767419853; cv=none; b=gU/Cj+UR2kt2HH1g43b5IkxoCE14VCrZk7RipUiR6tllknSX4cKbaR/BEN1HMr6FGiCGgdSSS8xjNGC7D+84jmeInAoRLCcJSeD57WLN92C9sLeU7Y+E24cnB3xlhG8n64lyCEvdSRJ3HgjdOKSfuOeZvI9W99SZmH7kPIMeZN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767419853; c=relaxed/simple;
	bh=2pAbQ7vKfrqSqpvKuGBPoFyWbimAgVMkbmR4XRUDqZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jgy9WaLtM43Nbrd0gGG1RBAySlFrBJRIww4jiLj2KysPp2xRx8HiqPHwy5AB3J/2kdHNXnSJaesDjXMQYVILO883+cAm2EtgKntD00H3guxwHgx/a0Hyjm5p4Osk+Mp89mchqqgwsp414yWuN4m/AIUrtmPt/qS7mV2Qmhj/NOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZggmQhCQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOlcxBaX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZggmQhCQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOlcxBaX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6033Qrn22793221
	for <linux-clk@vger.kernel.org>; Sat, 3 Jan 2026 05:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2wPt/bh0eDEJhclxcj9TAW/aPcYy5+cyfmqyWSjfD0=; b=ZggmQhCQbkrPJS/C
	804V7SE9FcYCV/aFIknFLRSE4v8Dt16X7M6cxB/Gq7rgVLpbVHJUGMjCBriLpjHU
	Aqa6OeEeWE7IyyKHuCuwXX1p1lMEaiyXGbEhDuirLYxbz8AeTr3c0qX15tYSmVYZ
	d1t5NhT18vM/KHdkaO7qrT7XN493F0faIUcpEbMutqQB3T64kEhv1f3IX74+Ll3o
	q81JJ/iCF3IN66GXiIUwgVYQtB56phMAgV+ShjqXzeIUtVl+VGQMnLUW6t33Ljjb
	yM78BA9SEnBf3qrI9ZzdBKyZEqz0ozlDzoyPziLxO6pJxtDBJaTzc28ZgSijaJR0
	KByr0g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beu6t05c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 03 Jan 2026 05:57:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso25653513a91.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 21:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767419850; x=1768024650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2wPt/bh0eDEJhclxcj9TAW/aPcYy5+cyfmqyWSjfD0=;
        b=NOlcxBaXmKwfj3rANUW7E43230Xp8D2XxkAwljpgDcP6PxDhJBcLKXK58vq65+eC9T
         XeKsxHBZv9m7wAPBKVB2eL+aTsMETSC/Wsoqtc5N3gIrS0aHtanVnjWE/NmtnMEAR159
         wFRNbeluFN4MudkRhgAYVXuufWSD3uQH9izYHbDbvJOMSCi3nC/3GEzZGoAcwegXwo+p
         BUHIjxHCxcxpJgQQRhKZ2nZQ2IKye7B8qhEIj0MhNV8pGeulJoLfv23C5Bbr7hVEuaCQ
         d5R+qwg48j5sn6liJc5DHArbpfcJJ8La/JOF5UEWHAFcoNUb3YJ6ih3zad+wPvUPpjhE
         5rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767419850; x=1768024650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L2wPt/bh0eDEJhclxcj9TAW/aPcYy5+cyfmqyWSjfD0=;
        b=Z2Sd6l0slZ5sOP/RPfDsK6nW6phsX8LkSYXXak9B/f+8DnkzdHRmoHkHGRJmD92KHq
         I3F9dsXFztps2HAGFMC6whjpysN/45u+MvD8wTtbFJufLsLzG7y2FtQc4Vjgow4qyDaC
         lxvKHCSom5ujgsCFWBmDHE48cnnbfVvDBQ+A3B8fL3j5rxOGrnubiam9vb4nPFwTt53N
         A3rNswP9+UyvR1ysRAK/4Wwi6Abcwztc4hq5CvFSbRwQyuYD4czpTU+3IA1oHU/LdP6u
         b1Y1UbSGMpgBaKKEMbS1vkVz17IEmY1TwCqm0ccVJNTl8lGqnMgAZZeE3ZmDotXq1RkG
         T0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLRlzNfQ9b+ZBgNJQznh++NMBG0czd8yrjGHr2b3iK1AHwcnOumOI/8HRmGLFG/6TWpCnLADvSR+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbdRwUcbbF++qAXU49J5EuVTZ6D8dB68DNlBZ0lyzpTAfDrM/U
	l8rpEpYxLEXZp0iGhqbMk72kiEAKpxcO/CW7jiTRoWIHlT4l330rkqQTxakzN+7BAW5B28sUMhV
	ULD8t4niWoSPABpZEPoq8TJBdUFCNQOmAjUhhldK6zOzaJwv1bI1LawsN1b26/KQ=
X-Gm-Gg: AY/fxX6R+Id57wrGo9hxU5R9WfOVbq8xRJmgSk/H3Yq5D1xvXs9x+zBK9643uVMLdPW
	kVyHCFWTNu60ECE4hHTwmmNaOOQ1Kwr0QmSaG0jjd+oFUyQxUqjMY5rdUYv08U09LN1BcCXt8cJ
	qL2qWmmKFS34Lnqa5dryWBoa8AbcSogQWbcAfPHG/wAHf5SwvPYfcQmqBCacTLNcwu0EFtnpkw/
	8VEXyjPQgruLVNXKuB8d74S0swJsdLvyj000/WFSUX/MLO7R5xu+3BDFe/+edJZw9YB+Xtb3LW0
	611UJXGcSFW2qBIV+JesAlUZZcq9tlinNRyoV/u0Ah+jvvoWUfSeoFulWiMiK9QL3hqB5ZI+B+7
	OdkuheJI89jyGJidpjo2kyvmZ8Fi4WvYwAQ==
X-Received: by 2002:a17:90b:2e08:b0:340:ad5e:ca with SMTP id 98e67ed59e1d1-34e92139e3amr39340758a91.12.1767419850095;
        Fri, 02 Jan 2026 21:57:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpcCg9fX+H0Pn+w+Tps8ZXvwhpB5foLwu3uwOPMtZE7QA+g21xkYFtg/YbNaZowr2UC0nDaw==
X-Received: by 2002:a17:90b:2e08:b0:340:ad5e:ca with SMTP id 98e67ed59e1d1-34e92139e3amr39340751a91.12.1767419849639;
        Fri, 02 Jan 2026 21:57:29 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f475f1726sm754760a91.4.2026.01.02.21.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:57:28 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 03 Jan 2026 11:27:07 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: hamoa: Extend the gcc input clock
 list
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-ufs_symbol_clk-v2-3-51828cc76236@oss.qualcomm.com>
References: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
In-Reply-To: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDA1MiBTYWx0ZWRfXxUjUET+UKvxz
 ZpfjQbmk/kQ2eyKv9aEwZrxg0YGjuBcTkmMw70ha3z5mLliLv+CPElqN3fdUDiEAD6AKQ0CYatu
 mYr+RtnPPRfyH1r77UE2w+KksJGggqS+JqlBJ3+6VcvWLxMteg3W3ruUBayua/ILp9ZbYdVpVpC
 SkKi2EPHnzHArt8nYJk6hJuavvcYKudM3vUgkf6g/UCHdWqb9kxcDdxVJcku+gAT1yybvH6c/9u
 kDAf+TTGKZq6P3Xal+ASKKPRCr3/QSoV+Uc/PSwfsaX8RMbbsvPUSgmFPdj5aBzpxWUKrUd5g/W
 gnPog+v5c6U9CiO4E7idO0rOciwC8bxy4Qmvl75/HIAdlyhwyHGunekyic6/Xgu7vCcls93BI46
 DKpc0UzR+gEbohDR+ChgdAsMb8NxFOGIeCz6ARSAb43oe/JNnK4/W/g4+ZjoHgM8HdLhBGfTFso
 UC2FHg4QHNAe9zcBjsw==
X-Authority-Analysis: v=2.4 cv=HLbO14tv c=1 sm=1 tr=0 ts=6958afcb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=us8TmX896EGkFYs_XRIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: EnEBUeYD-B86c9oVkyKjzgA-u617STlN
X-Proofpoint-ORIG-GUID: EnEBUeYD-B86c9oVkyKjzgA-u617STlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030052

The recent dt-bindings were updated for the missing RX/TX symbol clocks
for UFS.

Extend the existing list to make sure the DT contains the expected
amount of 'clocks' entries.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index bb7c14d473c9c523e1501f9379ee7049c6287e96..21ab6ef61520695d977f9d741ce633cf537171ac 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -834,6 +834,9 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
 				 <0>;
 
 			power-domains = <&rpmhpd RPMHPD_CX>;

-- 
2.34.1

