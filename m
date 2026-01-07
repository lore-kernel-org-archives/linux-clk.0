Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82574274B3B
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 05:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764121; cv=none; b=Ht8m91GfxJde1gCY9XnP3PAg/fweApccXAhOqqbCm3cisyyVZY2vKIh1FRG4WuO7m4wCEyN2X0+jvlH0TliunH5s4p0CJXlEk81Mez8l36eI1IjcG1QE84cGq9utL5iRr6PBTHQ14KoTwo5CRpnnkvSCZ8+M1FhTogdO8McHz7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764121; c=relaxed/simple;
	bh=Rd2oWqy4jH6gKVmMJzaxHYBgnnp5fxDA9W332BFwjEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvGg+IctvqtCpa+Rl7l9+9Xf4FNehuWhAHtSNVwFPE+i+ip9Uh7s9dMMTHb5JRH6iNyw34qTMM/k0NoGhagM1i5WiybjZjE7JpLnMeSPOr+BbMxC9xqzNHRlGt5CPChZF608bfuSzQn2PiA45+nTkgeLmtwwW6RB5CtS3EsZJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k62d1brc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvTmRe2+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k62d1brc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvTmRe2+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074mwNr1462508
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 05:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epN5pM4ro8J0aEbfvjQJQmjf6Qd/DnroV833V8PcV48=; b=k62d1brcr5iWhA5d
	h3iTiqLaikEusciTlSYDp8cwj0D+yPIerjnGceWYqbtTVUDCnDUUSoHhRCyD/w0K
	H6DfIdTV9txn9IMBMkd6GSuAXc/Kt/G8fJH5AtvW3k7P0iBxYsJElB3bFv+jZeXc
	xclq1YpFBdl6LkkbxX/7P9LFUwFwUwY/TiHW9x9asYcqCXvsUZxnSjzkbzLCeHoN
	qnSXAbVVzrRmeMF5iEypvsDsm8SPLeHt62rBkGD2ZCOJCnOGrrPDUEs4zLu+GGZE
	DAaWCbZoeLRfTvogCGWuYGKgC8AbtHRFUnrBwwL/yQ99Wg21sA0zMF8ccu3dSpbZ
	PiMYrg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm30sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 05:35:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0530846d3so976930eec.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 21:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764118; x=1768368918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epN5pM4ro8J0aEbfvjQJQmjf6Qd/DnroV833V8PcV48=;
        b=CvTmRe2+naxyj6fBq3cGxbsEkyLvVi+jOX/9+nDm+EM4ev3FlENBpo1zguj6jSgxyT
         g+eEzcu6AGr26uk82pvE266XFAr64nhUQ2Kav9oZtSs/KUJDYL5u+BbVgkpwOTHRpr7K
         tKY1sA87iVWMNMKYPbrEmgs+gaNDq8l5+9PX0FW4F9A+cfe2JgIXaKujGWNKTCvrFv0d
         v/Xo0D5CjDAXr8QnBBMMkQyYrgl0I6EGPqQPQVC+sSMv2iSXG/3rYpVn0pL8jsIHTlYz
         mYu1R+nEQm0VeQQ8+6/YadkCTBeZMmzpyPoDC+JBP/QrL9e+CPnXOfqOiYZKnzjo/SEd
         LzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764118; x=1768368918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=epN5pM4ro8J0aEbfvjQJQmjf6Qd/DnroV833V8PcV48=;
        b=dK0G/mlTsKEJRLVDV4u0XpdKlXPnZAsqMVhGNxSuvTeIWr+rRsulhMJi6f0MgkeUvh
         H+ZMao2HCLMCCd/XD12ixJteIF5a2/jFbgJpl0X6/Z+29qz3HOqhCPc9lrt5fdvD47tC
         my/NItbCbTwZwcK0e+1FFYUu8GwMEx35BckF+5fObBVX+O8a+MhDCdNYndKOPANg4cVA
         8iXr3mbJSKfV1g3npse/rV+KNxBOETF412+yD5IewLTf+02y7faXeyc1OGEG2Q23fmh6
         0jN1a1reXws6BT7R7w2x/a8iwgvpwUXsjXrzAiYGWzOOlsP0laFJ4WlioLCbS3Pa0+90
         mAmw==
X-Forwarded-Encrypted: i=1; AJvYcCVS59gMtnkTzs/IAHpX4SOcCMQGlxmNCNL86XvbIsFW/eBMX1WYGJIR2Hrt3L+nQ7uw2baGKlm5TD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YysBHNCaLPHVoudtdz57UZpdbvz1bnxpdKTDtbL2bqy0huJK4Fj
	l6YprxedOKY3CV/LDx/9y3EzhUsk5fOYKcTNUsvP/s6gpQYK/QKk4eE4Xq9gx9xK+gop7l+yo94
	RgrVgXk5YnoNpNyVaraVjjyNqvF/8gBlUqnCj8hc9WtDxHtEjQvXwT6gX9Ph9GpA=
X-Gm-Gg: AY/fxX5HYvq7uLegMWUuoNsCeIVg8GVScqy4+qsieHYVCsnkF6fH/Mjfp/Eo9L9adVS
	QrUhE/DGFYTcewGvng1quTaw+LgJp9UkOD4PWDqFsIDC4Ow2AgKr3f8gbVObQYIBJADqK3a0cP8
	oaBEGE298g3vHye0tsnKCtOwZjiNQ9A7pRvnNbMWaQVPGekD5p89vygpz1WHeQQLCP/Glits2Tk
	SRG0FDJkbKjoDNWhCMxqN90e0mPQD5Iiz368l3QKEfQlA6qXMvEQwN/xFon351S5JuZkAa4Dbf6
	1GENwABLBiOlHK+tc3L7yJcZW5CNkN3ek3gSgwpzllJUDBT5j9X+L01v9uri5a/+5a04pO4oRuZ
	tEZX3m8zkN3llvHnOpUAcVt+LxKjmevgJDWLfuaa0owd2F+Mp1nan
X-Received: by 2002:a05:7301:6505:b0:2ae:5d5e:9b1c with SMTP id 5a478bee46e88-2b17d1fb255mr1175679eec.2.1767764117693;
        Tue, 06 Jan 2026 21:35:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/QxKhmI1qvpTLhwmp9JWBE90uwQOqMfiggqzQL1n2dlmXvB8sr69JKO3HqfiCGdg6gn7JyQ==
X-Received: by 2002:a05:7301:6505:b0:2ae:5d5e:9b1c with SMTP id 5a478bee46e88-2b17d1fb255mr1175656eec.2.1767764117167;
        Tue, 06 Jan 2026 21:35:17 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:16 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 21:35:14 -0800
Subject: [PATCH v2 5/5] arm64: dts: qcom: Represent xo_board as
 fixed-factor clock on IPQ5332
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-5-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=1690;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Rd2oWqy4jH6gKVmMJzaxHYBgnnp5fxDA9W332BFwjEA=;
 b=pbXe/zapz7RZIExVQUGbhTHrjkIywJz5nnPEHaJdE+KdNKlQKZqGfn1rXtxzsA5sgvhAAPtlK
 A/BJYcRwJXuCFN5irrod0p6gHo7Trh/CAGqtc9hX4y8tZ43WAOg5wwK
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695df096 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cZQRF-JHJlm1EiHCSyEA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 0XDMgCQJWV8sU1E3F0-rfO3qwAP-iyqo
X-Proofpoint-ORIG-GUID: 0XDMgCQJWV8sU1E3F0-rfO3qwAP-iyqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MiBTYWx0ZWRfX45qUw83HBoFw
 V+783PB/pRZkk3hv2T9Yj/Us/2WNJJhAbZ78903Pi1w8xdRN48XbtpLN5XNn7iDG3Q2egDGHzle
 h7TVWv9l0upDO4HJEf8lyhK7Yioee4u5ScJ8caBOlmYu6Exu+7OATFR1OJpwiU1wPIXTntMdojh
 PtAfJ/wGx5YRlGh9kcxotwCzXTbG+gR3IJoCaOF/nf3HaOrKt8kZGQcfTxopoIj/Xm7iCquOFbs
 6Sv574sBh0l8E+tS4I1eC9KGY1Smlgb6pJs0BZug0BO3wr42gOxt2C0jW9TTfQotJb2LbIbbAzF
 +CFGSg2+NuH6JhMk3o911JTQG8u0vUr6iaCPCVCTccLHpqo+P8QN9NCadcHBTakOkDXTXUbm4RE
 xUJVaxkZXCh8FcaBwjO+lbVOE1bBFqXI4M1P/AkhQRYo02PbWG5Ty0ndl3KMYnvjh+1lK2LtVZc
 PqZi+U3AlRdHlfVMa8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070042

The xo_board clock is derived from the 48 MHz WiFi output clock (divided
by 2), and not a standalone fixed frequency source.

The previous implementation incorrectly modelled it as a fixed-clock with
fixed frequency, which doesn't reflect the actual hardware clock tree.
Update for fixed-factor-clock compatibility, and properly reference the
source clock.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 471024ee1ddd..e1346098ab0e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -70,8 +70,13 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 2b1d098f9424..c076537c6504 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -29,7 +29,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&ref_48mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

