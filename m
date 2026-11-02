Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620148;
	b=Z0BK9an3AqT8uUJHxj6utAL36UX72gOkElOaHEXI5CrWVW6jcyXNI4kkVVMr8nhrcYSU
	 BoXZQzJNPX8ve49siDb079/s8r7tNwOl8UFSNEMV1k2crN84Q1mKVZ9H9UmoKz/wHdmzH
	 GCdk1zg3w/cuytkNwfdFGvNxlLXMtozEfc+ntp7Qzm3oJ8WCMdcEVhrxwrG8cwjsZUkRD
	 /+Nn8B/2OLLuu/ktIei0jv8PEpPYrrFsivmOJuGsSz9dfZWQEVxgWbRiFszsOUV/DGMqw
	 dKStox+aWlUgrBazjgQafw/XxBhqLD0xiLjGQd0IHU2PsTapRFp2qRG0SgU2/BnFMJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
	b=jfv+nAXQBzHTNgH13S9CVTUn5DpHhqs8fM6AdbAapjhHW1iCk1VhaqDVzS/SwugPRVus
	 Evlz4xGnS1vtsR7JR0bqfmUIrhpvaL7IctoLrKPx2CzC3G/nH7cXXuAR6dMi2P9TdVgsJ
	 kysNk1+5YWiCjvV4jbV1rjaILI+Ruf6ZdyV1rwrdK5xQhnQEDz5KCWNCe9B8Dd1Ane9Fr
	 G9e/tXpEaJuzxCXkxKyVm92ruowIjkB+ZF75pW+w3bpaufA2H8buMMAwuEqOB50TvR6BQ
	 sTRn1/UFwVXLHEl+WosQaAr0QNg+aHFE1TJ3saTaBdKedSCaL3Jvd+T7SbRWB6qQIog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3ow2HUe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MSvlHdZJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D225D606A33B
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 11:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D225D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3ow2HUe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MSvlHdZJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A78H214022
	for <linux-clk@vger.kernel.org>; Mon, 2 Nov 2026 11:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=; b=N3ow2HUeRab9Viro
	5nysgmFgkDbs5ypqJJilqqtXkzVhOwlmho7t34QDW11POrylfI8KQ7kW66kEsNSw
	wcxCXBdxjlZsLXe3G+T8oLu1+JdMvShcWkJI+rqeMdcjoPftFEIzrAfCH1fLjP75
	0REt7Kb5VcY5O+bt4Rzkt8gyh6Ss9c5Twhkdb18/RCV2yHnBguxrQVv6UW+qiZJm
	1WkDDoyg4J109pjMIiNVE/XYpR1mB+2155izGnGMBEH+oK3umgFPPExrbXsmj3qU
	CSz8FrRG05nrWA8chnJ+I49xNnIK2LhTleI39hYUEF/9wLkDdRke+DiEi6785RnO
	xKFb3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1se2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 11:49:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so590851185a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 03:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620146; x=1794224946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
        b=MSvlHdZJc1ZCwrczSJjZmHy7SME89cB4KeHbHglMcV3TIgyvnKqSRwmXcOrrRbvK5y
         VasnMwIv+CgAuFisnlFssiyMtd+IOwKVfx78ON+0IxCc/kLZ1v5AKBqRIBjXszzzDTZt
         dVmGX/47WB0eSGwc+EX61VMacD+FdI5TRdO+y0Zh39IM+u1LHEgmK6BkcDn7IFPRbRl6
         htnYGP+1veKYvdO68bR7jWkMYEAPjso9r/+X3EGkd1M8aEit2fguZxMESGLC4/D+ZYPs
         2K7WZOE7mzMTkxfLfxhFqVd7XX3Vjg2FZL4kNrgXc003d/Ie1nK1H90+ntcvjl+yGtQe
         5wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620146; x=1794224946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
        b=OQqlhwM7ALrZcMNF+duOo5choVKsajNunOjuTsY1oedJ0e5S7oscOeRfSGunnVVAWS
         fVW9Dk51HFKnLZjCKXqTsUODNv8hPiN7Q/X8AaFgLwc2sMx7njoRYVVqhOcWFFgFul7x
         NUcE2iC+INnXh67UTm+Q236kLSnhD1rqHVQzlfJmGqEJbGbs/KWC+DpAaIhCtb8IfA/h
         BWayGRAJi/fYiyXS2Gp5kWJrpGlCd/ZXRMxsH8TaFLFcGYPa8IQvi4pWIQbodC654j3T
         6ZFe9E78M4IIuD3OR4EVOjU9vaQyyJ3IyiXTV2hjWDJ0UQZgWjgAtkG7hEd/8pqZWP4z
         zdvQ==
X-Gm-Message-State: AFq9FYLilBKxxzJKIVgqpYtOrgi3gUGrZej1p/3vlQSOwRDS9lKP/RX/
	0bTT+r86VyFjPqXZxyxUBFBTcz4k3TyKGxoMkn8tOrf32+07K3v76ycjleZNzXO5EO/2ALGx0eC
	uIhnfXo8JVV72g38SRO+TLzC55Bzk3Kf1DdFa02OPcsjvwQ3aApfcHZZVrtWU7os=
X-Gm-Gg: AYBFou2ANe3DQ0g68921tPOn5de/oRCF2NnIrFduWpxETtZThXaxINTpKQMmImkL5kO
	yEgPmHyqiJEFYEmVfXVp0jfLxUvtZd+rVkAC6L2yqlnQ0z53qxSrgQaqHJSflzO158sycBivIM+
	t254sl4Ft8eYI1YnTeHNPhJ0/lMW5u6IjzFw0mNfswyz/tA9B2Og6Ji5ZteUEfdzh7c7B4gf2tk
	Tg8WsrmgI1duNbuBvLpmo1vvp4ctDb75ak1myspjpzvhtyyx+GcXRFJdkJm9zDA9mpqEKsETP5n
	SLk+gGtOpqD30BRWhKCBZECU5QDtENuxRIcBTEYREAxHk/mytq5DGLhtpDxxiYYARbmmAJpXQYm
	VpVszl4Tp9YUewWZEUATd1EES19JRfAa/aMn+gJUoJ/CPul722CsQfcIdew==
X-Received: by 2002:a05:620a:2794:b0:93f:61a6:b7a with SMTP id af79cd13be357-944217b8e35mr1507869885a.62.1793620145800;
        Mon, 02 Nov 2026 03:49:05 -0800 (PST)
X-Received: by 2002:a05:620a:2794:b0:93f:61a6:b7a with SMTP id af79cd13be357-944217b8e35mr1507864885a.62.1793620145048;
        Mon, 02 Nov 2026 03:49:05 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:04 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:50 +0200
Subject: [PATCH 2/3] clk: imx: imx8qxp-lpcg: Fix stack overflow with too
 many clock indices
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-2-1c3fc3fe727c@oss.qualcomm.com>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dhlDpkiSrZhRzO/cBPcN3/Bco39G80HHAf8kGP7ODtU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HipW6PTYPSJAlrKvb7+9EmcAI3l5HEoGI7/I
 2F4ZkNz09eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qQAKCRAbX0TJAJUV
 VkNrD/9rDjIkvAY9Zjhn8SYl9PRi56nuL9RalFeecAW+CPPz37wCegFcwBum1JuVTWOtlGmnHoT
 5LGTqDf/fcJEQhLpb0c6MwAxvbQ3VqpeBRGzfkfN3NYAquxuDXmpaNqRYCOQDJn5U/KAINI46Bi
 v+zKjnd+i1IgUPIa3URFlvM0O+AQfoPKwPJjI5k9HMJ4Abu7WphOR0JAOCPp1IpcvdhfVG0JeG+
 zyaWy6yUPaqOgQERPFEkBRzpadAyOllZ5Jz2k5HzfkDMCKLnD8CMK9KEymw1n7jFPYMl47Yfznb
 zL9aLn1gEif5ciH6hJ8H/oS07giqUhGnJ6z1V87got0QndfFdjm3XP/nYI2RX/GS99nbP1Bin3h
 OoFQY8sPu3syIbMjei9MKmDRFpY+kctJ4rQlXoh5IiEGbhhs07X9PzfOTxpe/a+DKi1++yxQCo/
 KoR+QXmPc4kG77mJKvsf25NsMzjKKGjisECaJk07bswkgNGZF4pR10HQd2qczgYbeI2Uf5uBVgl
 HFE+I1wywFJuSZ/pGHo71+kCx7ar8VgLejjGssWuTLWPkFel3DrDeBIi97VAy7mglug8gVdLAw/
 H6q6heBVtbSP4Avb4mrOc7uBGB4J3P/1ejQfyYSRKjXLtaZY8gIRIf8iBIEyQrAGlpJsFVa68H+
 9r2f/OcNO43eJRA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: X75LHs7_Gx69nPzzj8ySi1xF38RuoCmk
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae878b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ci3yrrcZy3FTaSNcm8YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX8tP7aq8WQTWw
 NppNPJ9xuz+8msXZusD+9gO9YY/44JyvHyVBOrVei3jTcJERgCA7E0B7E+tD5v9KHs1mE6H7wqn
 YQHb+MUuN2uSHAhqsM1UJ42KAkoK84tMBQXYO//ixtCsxuT0/GHBa7rA4iY8Oy18lUrUBR2gxKf
 lKP6dMTpMhz18gkBnq3SwOBKj0I/iUi6p54Yu/nS3Wq8SJEaRvzlP5ZLrCJLrZsNWfDhVLSLVKL
 6UxnSGDM6EfUb3tRdYWOnuBpWKTm39eIA0Lt7pJkiXg0G5h2751JoEMC9ibFEMHDRTiXymBuhPr
 TqDZl0AzrZE7euAFmGmcFwsswY3M3Z6ju7xHKEa1+nonddUpvxIDcNkQr5OazgbFQMTGvebVzZy
 EZbjY58azqrszwz6J2ZMobhmYIsRZpT4DpcGqkZ1m7AppskXm/0Vd2TZgyK2zqsRNs77MXE/xCU
 nZ2FWyLq4UntVWCZANA==
X-Proofpoint-GUID: X75LHs7_Gx69nPzzj8ySi1xF38RuoCmk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX0IMcMphCsh7a
 Z0LZcAGuXMecpfSh9wMqaAOm0as59f5JRBJkOYpyjpCEIXbfn7HRlxWA9saHhe99+fXauFNGC30
 GM4M9G+lcbdUud+0Ykm/WeKrR7giZxs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

imx_lpcg_parse_clks_from_dt() reads the clock-indices, the parent names
and the clock-output-names into on-stack arrays of IMX_LPCG_MAX_CLKS
entries, but sizes the reads by the number of clock-indices entries,
which it never checks. A clock-indices property with more than
IMX_LPCG_MAX_CLKS entries thus makes all three reads write past the end
of their arrays.

An LPCG has at most IMX_LPCG_MAX_CLKS clock outputs, so reject a larger
count.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index e57e7bc074a9..ae8cb5408246 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -200,6 +200,11 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	if (count > IMX_LPCG_MAX_CLKS) {
+		dev_err(&pdev->dev, "too many clocks: %d\n", count);
+		return -EINVAL;
+	}
+
 	/*
 	 * A trick here is that we set the num of clks to the MAX instead
 	 * of the count from clock-indices because one LPCG supports up to

-- 
2.54.0

