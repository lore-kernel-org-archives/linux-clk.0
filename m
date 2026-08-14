Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8053A41D230
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692744; cv=none; b=Dx+mLpiC3QhocvPW4F9HeivwOh08uG5DIN4WIwqkfX8RrO1Yxp7q1JYpYDyxeOCxRR1Qmf3Ur1ACrr8yLCbcKToZVpRSj0zwrFgE2+NSQeum+JO1FB3qR6s1y1mPDX8i7KNqmsFhayilAUeKZmiBqSXIohY8YHnJQRlDmtn/gvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692744; c=relaxed/simple;
	bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIAIs3mG2D1Dm4Hthqr3aHhUhNgJUHM8zTyMzRJdPfQSzGwswCrte1dL0/e+Lt59c/sS7pcd7JK0azp0nLmdV5VQ/8ERGUbLm0ChCBg3/F+/2YjVlaEjKpF31C32zRLCXQOgn5YZ/NpI70ENAoC5Ru5YEKDYFY77vNplFedjazI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqyQF3qY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biUsmutG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqyQF3qY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biUsmutG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QVhe669241
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=ZqyQF3qYsoI0iga1
	P0dUrddoNGW/Ab0986gmxFI6kCZjk9D4aTCdcl93gkZ2gOTsEG6zttj+vk3n3sHB
	yUvoH3WK4ACmQpd0rPzTZ49Sq1QiErQrMef5rdf9kgWxLaNU2+lb/iJezrienF7i
	i8g503thezTB+pMyNyqOu3rcpyv+IFNrNZrbpjVstKQp0oDTBsaaB9yL/mFzalz6
	C8V9gcQnN1b7BIZl4McYrwLCnDa47eZgfZwEtiBoImeoOqnJQuCnuoDybPbU9FMo
	09GAHagxNwe4H5BATQW0FFiMJ+VQJ2l0JFX2lUGIoh+Cvz4VCKD2uMmkBKbIllAn
	85WIJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1uua2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:32:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf6acd760cso9202495ad.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692732; x=1787297532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=biUsmutGWzySCJfQ8FqlX7Xo4V07x5LwsyNCpoG+jfuacZI5uHHc+qZxgl2LTIMIiA
         3H0AY4zpSLSMjAzF1YJdbflBnSpuQNkMyMvmCeS0nXJVJIwAk1qULnE2kD+hsYB+VNHY
         y7UyONEnjMGPlxiYV/jh0N3eCulvETaY33CO/wJGmkg7c5nyBpP3W6Fh/xV1r8jlQTtA
         256wsbDvZ9ug/1Jim6k30u+z9HMA1N8qk6P07nny7PmQIICLZbftwzbC/bXq2EftWnFy
         E/AR3OIzMf6I9bXSncv/NjosefxE7++0nS4nS7OdmVDFcDEz7W0Hn0Vhi0fH+0wiKeAh
         M27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692732; x=1787297532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=AKayKOlg+QdHJuM/9af1TFxN+wvU/60g41Lp1vRPzQs9S+ePxVw65wh07nn1yD72uN
         P5GuiqsIDZGuZjC4fOuKlrrbMt4XZmAzE34d1ex3a4yhPKwYksWCW/a6X+yuelQJJQry
         YGYsq20ar5eb8jqMT4oyrlPpiE7/DnnOQDaC9DOnHD5xO6809QFDLhIH7xMH5WOUUfB3
         9Wvkbmh4wnSdM7UMqqPEQAufqNpUOCYWsYojbn70LA2AbefJ0Jzho9No0N6oaKBIBYv3
         pbpAqjUsjT3/OYleK+rp0o7lSFx2DrStWmZ8APa2b+xJ+ODGp84Ctg5fLivOyZkLkkgd
         206Q==
X-Forwarded-Encrypted: i=1; AHgh+RqloMoJkUVQAmVA+K12h6AocJttQOcvACljCGXf8rBGKX+xO5X+H0ErprO6snDuW5KdwiJa6RBGoK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgkrnDxkD7xKpC7wBxPyAtZ111ZJuojLyzohhO3tatuTud0UsQ
	OChKJ9Q+t7Kbe5WtDRHDcHYZJR8YOTnZyBe2z8wqmr8JQLs7W4nbyTqDSqOxp4QpUq/hNUa+7Cm
	W4HnDkhNXlVQPLdZI4gIsMGh1gfjonM4Tyqx+7qSJMzU8stEjcCj6EX0mwoAI0so=
X-Gm-Gg: AR+sD104qU1XHcxAPSSOiT0YslNT0V3C6QDSo288A8mUDarzBZsjGGtPg1hC5DsUaod
	BgFKeeecP9uKz1kBZWY04eRViQQx+utlf5HLInK4HeChTNY3chXgrrM5MaFikcL3EqS4o3eS/pl
	DJESpa7dBq7FT7d81PRy7OdURT4YXfWgdKvD4N/pQ/eE1RapUO4lEuL3osZdfCksN6CnbtWyXCB
	yAvWIgnCVDDwvVDIjghitma9eyg1VrqDc+UrgHlUepYq687e6PgnkLshR45OOVTpuzEmYFDJ/4G
	+wCjruIKuy3bDbKpJ3ui+HSGCrZ9UfatdQ98QIbWRDAqpqbj38IgR3Mt8qjt3nlIHqiJoP5UdXJ
	7H6BHvjMnTU26eF4I11TkHGIwO1hH4FnQHsaYY2Dsfe2XQ8fIwFgWbwhikWfrDl47Fu1nCjs2Xz
	ncYXmHnj+eB/KdeLJ0CkSR4Xs=
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47931065ad.14.1786692731585;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47930065ad.14.1786692731101;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:10 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:32 +0530
Subject: [PATCH v2 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-1-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=973;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
 b=I0K2b/N6iz/Hf/cAEZCNxofz9Q4I9Wd0lnRLDoR4xw7gpjXX9Y5mTLDuaUuwduG/xIi8+eCO4
 Fhxl4TnLyFUAy1u4Qn15sFvcwtEhWmOFc2g9+d78zMwYmEfpYDN52DO
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: SPYqkJv_Qi6h3KIcx8lyNF_8p9qQT4gt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXyAQpoDSc4Gbv
 4BV2f9lHlj6QMQTsbTRhU66qS5uVqL14DarkMhXfHdnNqEwG8hVwHa9VnRGk8u/rn8+AoX+ZtGE
 zNH6HwEui+SZe7mB3wYTtAa0rV0ra7J6GfZNIfhPgQbYX1B6TOmg26BPOmWs1rxpWQV36gxmPIR
 bxxR6H7D/KBBdyBkKAQyUYC3zcQAhGBxbIHHT4n5zgU2VUm52NWkL5svU/5FAn2e03ADngkww71
 bML4CvawiqzQoa1+VA8w6sKtiDXc6DcdXhxYys8lmgFFnkNrB3cNCAJ+uQ3RgKk72doxQuvRgVu
 CBjO488ShFutGSnt7dQHH7QF5VCK/61cy0JgzYkCdrtozFHdNLQCPz3mAqH14SGxUVuw0G07Gxr
 HenvECbnJaYp+FW061L4bspFN6zR2J3MrYs8bnuNlh2VgLBsKqxnDlWnho7NZr9FDU1UNkHeMsU
 o+PfeHBObuAMoN9W0gg==
X-Proofpoint-ORIG-GUID: SPYqkJv_Qi6h3KIcx8lyNF_8p9qQT4gt
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7ec47d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6t05LGSwh5SlIrDCal4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX0IFDI06aot1T
 oKB+Zo9y4SARwTH79+jB+sTYCQxJvVszOWwiws3Z5zQBW3uyhLdj/S5TI0c1EcJgAxrW9xvFD2d
 jj4pwZF1dQ7qsytb4utxymN3XizFtVE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0

