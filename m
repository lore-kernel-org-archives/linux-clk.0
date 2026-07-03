Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A1A3B4EBF
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073062; cv=none; b=tG8GTdzWL6FRkjL6xxx99Nn0ZprIbVqc6hlPrB6ml2koTQa8Xy2IacGtequgb7kgGo/5DtSq1Sq6STUq46PfkwbV3ffHBtj8YiA/e8zuLuEvkUgutMLyeiR8CG8WuvgYZTPOuTPY8PxBr78wSTtlAuoyyx2+0nNOO5+8qJZ79dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073062; c=relaxed/simple;
	bh=6RY5cIrVgZDKKwhOrSo7qgkhL/e4/H0mXeSOwXjaWI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqQ83CNoNk5gHnctSnx5omSddUbTmJ1+oiytNAM71ZoZKypIDeqeVYIaX5oOqxMSGDINMqWQzp3fpeHyJjZ+kSflJUsTOvBBiTDPfoxTrG5/KhIYuiCbo6C5muHurmTyvF+MoivVvfIZVZMZmfhVkFxlIzjaIazTjmMmI8WjsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuS9GvCI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grewQ6sg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuS9GvCI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grewQ6sg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2wPM3772892
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 10:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcgnkajawYKqpU6qG8Qh0lQ//Ymi7V9Vf3n5LhJH1ps=; b=MuS9GvCIX25OPlbm
	pzbngbg6zhKRIfTAyeqvS0t3lKxZRB8vvkadWogBtEnvfaV6AWM+X8q16BV+1ANV
	zD8jsIjBaExV8e7DrcLpzfKgJDNxCGrzDBspttAaWQv7C4rkSV6vmAGGO8Xh3YwB
	gE3bC0eMceXPf/kLrXtZ39VUVpAJJwY47cu6I/PCvahUuD3xN2Ag586/Kry+MtSu
	46BfDNqP3eDJyE/RhkCXNL9GG30+cVaAev0h+U6KGHaXz5gs86c0a+Gi1IoA/2up
	EPFSoHYnVC6fUVjHhGdz/YhGLoVWEBO21u07HpvPTD4vLT2lq2vzedNCfhSdYnD9
	P7Vyeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03806e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 10:04:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915c364ae3bso34689985a.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073059; x=1783677859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcgnkajawYKqpU6qG8Qh0lQ//Ymi7V9Vf3n5LhJH1ps=;
        b=grewQ6sg+42XrVTWruxYsvXnjtTs07wWXWdnmbDifY3wExv/WHIS3CDejXkXwM9K6n
         OHE4u9cAWgL2ZrSd1HDTL4Yull4n03SoHbS1fwFVTWPd7j1o7eTzAmaINuE9Xwcl/5EX
         UcijY9DtJf9+oDFxKO/RSzHIYp0Al9SDKRp71rbqwEbmTgPvy1Jnlst1CTB/RCqrHqmi
         YNYIPBiNmanIy7nYVkV4Mku4aNH5Nd4qEMdEGqe5z2axSs7Db0rj7I7Z9UMTLDeMuHqD
         1UGAWlL+re3W0H8KpuwXeXNNITINWAqnyu6tKCtnCQCtGkcQ+3lXjZK52Izqi0PXHnYv
         JqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073059; x=1783677859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fcgnkajawYKqpU6qG8Qh0lQ//Ymi7V9Vf3n5LhJH1ps=;
        b=FOeiYa8VSI+hw62yz3qE06wPD2c56i18xPzCGIF96RIFxEZijkiNLURIaC74d7R0uE
         5qcc8ytrvhOIukvZhZDa4s7j9DJ9F8v+u4BI6qnXA1CraHccjrCOGaCGPtU6JZfx5NR4
         Lh32Lzp7gkS4/VE7dkhQ3nZY7OOf6U80JReKRFv8RG0yOmjrfZUhFWc1VXRopg8uzfkx
         OZS3zrUuii6xGakp83NEeoOyGPAoqBFi5aQEX5OZajJsQKmkiXqFz3zKKQqQZF3aTxmn
         lxYjwN9Oy3ZrsJtVagyF+g/hwmlN6dIisUHE60qDplXBA5/O5L4XxNAfPN1snWxiLctW
         e6lg==
X-Forwarded-Encrypted: i=1; AFNElJ/OL87BhOx1Evkbmyrnlrp6QmwVkf11ybGVv0oIgxMpYC9+0VZxvitJtJujBQ3Clgsvv6qk5YWE69c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwflOi7bOWGwf+LbySERQ6tlpcrNVT8//ihWDcTjxBf/QympEKz
	q5qt2JNtSydSnJWg0txfUbgNJ0AbAeCSHiuGyW3oN3I3z1oZUIYtdFZPOEjJfIiiNg4x5P1k8TG
	5N3nVeOt7VrmY+m0I7pnLSgW8HnCdABBcFcDoZbcvfKK5bD8qstqDUhYgzZfbAkQ=
X-Gm-Gg: AfdE7cnIz7MtvWnK3gOZ9ipydjnn1eI/yTAufmG59JCbPHGQj15RWzesMqozpK8erTC
	Ed4XgjDdvt3IBCKRLkK4WiLJ4E2T3BM3eMd7Q8vw/7ePdURmnAak0e3CNdMBOfWu14RkKj8eBlr
	CTKWFzmzD/+o95minuUpq1vcIceQIkGxtCMS61dTt022EcoHc2aG8aRbFTkEN3P2WxKXMhQRS8I
	HPjxml6azYlQjgIKla9L3ec/akpC2+8ymV0X22RBVXvRIrbFBkD31MKUoYxgyVgkmb61462L9Zg
	piSgVmtgCg8fyEkV5jhQNXmV51IHQF7Wl2FR//qWBdy9nZjAftx5P0JLpxPCVh4pCN3AsVvoBs/
	7Tc7dto/tbnIgi9CTiwPvoZUZqJlCfyje2O0=
X-Received: by 2002:a05:620a:170a:b0:92e:6c8a:2a1a with SMTP id af79cd13be357-92e781d28a0mr1246327385a.7.1783073059084;
        Fri, 03 Jul 2026 03:04:19 -0700 (PDT)
X-Received: by 2002:a05:620a:170a:b0:92e:6c8a:2a1a with SMTP id af79cd13be357-92e781d28a0mr1246317585a.7.1783073058218;
        Fri, 03 Jul 2026 03:04:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:03:59 +0200
Subject: [PATCH v3 1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574,
 QCM2290 and others to ARM64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-1-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6RY5cIrVgZDKKwhOrSo7qgkhL/e4/H0mXeSOwXjaWI8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kUxwOR/PqADyvRF1PEutdEMrXc8V6t5ElBb
 XwlcvCUNJGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJFAAKCRDBN2bmhouD
 1+PfD/9LYQ7sld4HL+cuSM3ViP6etJb4kHUUgWF4zfcFM+VKDmqQWE14LIlGitteIKN7AO9qHl5
 zkrjjAk3JfGMmU70fRzzfdrlQ3IitETvaQacd37epDe8YlIplnwXYc09MbDfUlrnlyqba8VY1m7
 QkeBEFm275rYwArIwXH45JUVTS78LdvaT+lBC6pErdcCIV0ciKQ22gH4woGlWZQYs9y9xraCJhH
 nc+0GXQUpznbpf0eoNxJOvJAZVWjpMZGradolQDPQX1FJyslxPc62AibgbBfEFqpjgNMAhB2BQe
 vqaWUWZ336vrf1ciDB4ZUsJN5lLu9TWiHX+UURSqZndIecOoe9o8PaOjxmHwbab+cGX07iqG3y1
 SWwYsfCToSamXRA82XPWxU4JdXMCG1z/eMa2HW2Syv7JPA/LlSXGdhxDOVJe9bYoBWbo5zf/Uh1
 9jnOwXk7GCeeYAmnHLBXnDpm3i+JnC+SY52hiHmt4NcYRMJ8lDsP3dj9qt/MrGJFjJY30+vkjUL
 55qNoZbORE3qCWm8657wQFRY622D8SBjIAFWr4JNnYEi1SbRW1WzHjdFN9vcwCIEZPtRhU1pDdz
 yRHdVdTJduyBHPvdrPryeQSjTU/8Pxi4+JR7qHojnUuTpjJe1KBRadjSmFKwlZKpvImvPzHUOmS
 jxUEw0EcWaJlatg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfX6dK9f78TYzhf
 oO14TdhTQjqfg6ktoBcT65ja/c+UMw02UfxJrZT4C/udXVcf3ZNOIclUY5/Ohy/Vg6PqgDb9drn
 dnLUoArq+0IgXQG1HlZqKzlpawZNjik=
X-Proofpoint-GUID: _w5HvupAQ6z6q50f22GM-rE9KtM6if89
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a478923 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oh4px0T-8jNy5rkF8LYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NiBTYWx0ZWRfXzQ/NbcEFLuOn
 A35P9jDiLJBKmmN/GLnwzw/ekwA/xJ+kJl74vO+og+mEzXkYNeKG8hy4C4244DFj5USfIUeJFMJ
 BBs797RDD97NGhHkrd+7seZzldLD8wzVeZG4wsoBzzsf1Mc/UTgcWcDekiHmyRAsdzbgpacW+as
 xguaEcqWEryQLMgDXiZlVjmnzB7UazEO/g364uhYK/QIzQuotpGsDLMLMN+o8AeHAWSF4qNkO7P
 V7fiFEA0aMScjYqPhQKqfMJhiMcCxZdvMvekyo9rpUkGeIs+1qOgXSycsjeMUbqEi4FtDDg9kc/
 8SYBb+oQMqGmtvZEUQMLOyjGs49/7jwGR0iGAGykudrec+CG/4dzEXxCQoG4xwIzlg9z/TnveLY
 DKcdBCDxB5AWRmfldFDZ9rsRBD7iKjp1oG+cWkjCKS2HGXld9E3QPInQ84XfDXWdW6bSbLw/U+s
 O0viMG3quVkiWCJIIZA==
X-Proofpoint-ORIG-GUID: _w5HvupAQ6z6q50f22GM-rE9KtM6if89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030096

Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
so should not be a choice for ARM 32-bit builds, to make kernels smaller
and user choices easier.

IPQ_CMN_PLL is used only by the SoCs already having clock controllers
restricted to ARM64

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7d84c2f1d911..d4f80c6953e3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -363,6 +363,7 @@ config IPQ_APSS_PLL
 
 config IPQ_APSS_5424
 	tristate "IPQ5424 APSS Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select IPQ_APSS_PLL
 	default y if IPQ_GCC_5424
 	help
@@ -373,6 +374,7 @@ config IPQ_APSS_5424
 config IPQ_APSS_6018
 	tristate "IPQ6018 APSS Clock Controller"
 	select IPQ_APSS_PLL
+	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on QCOM_SMEM
 	help
@@ -384,6 +386,7 @@ config IPQ_APSS_6018
 
 config IPQ_CMN_PLL
 	tristate "IPQ CMN PLL Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for CMN PLL clock controller on IPQ platform. The
 	  CMN PLL consumes the AHB/SYS clocks from GCC and supplies
@@ -432,6 +435,7 @@ config IPQ_GCC_5424
 
 config IPQ_GCC_6018
 	tristate "IPQ6018 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq6018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -457,6 +461,7 @@ config IPQ_LCC_806X
 
 config IPQ_GCC_8074
 	tristate "IPQ8074 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for global clock controller on ipq8074 devices.
@@ -466,6 +471,7 @@ config IPQ_GCC_8074
 
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -690,6 +696,7 @@ config MSM_MMCC_8998
 
 config QCM_GCC_2290
 	tristate "QCM2290 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QCM2290 devices.
@@ -698,6 +705,7 @@ config QCM_GCC_2290
 
 config QCM_DISPCC_2290
 	tristate "QCM2290 Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
@@ -869,6 +877,7 @@ config SC_DISPCC_8280XP
 config SA_GCC_8775P
 	tristate "SA8775 Global Clock Controller"
 	select QCOM_GDSC
+	depends on ARM64 || COMPILE_TEST
 	depends on COMMON_CLK_QCOM
 	help
 	  Support for the global clock controller on SA8775 devices.
@@ -877,6 +886,7 @@ config SA_GCC_8775P
 
 config SA_GPUCC_8775P
 	tristate "SA8775P Graphics clock controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	select SA_GCC_8775P
 	help
@@ -1079,6 +1089,7 @@ config QCS_Q6SSTOP_404
 
 config QDU_GCC_1000
 	tristate "QDU1000/QRU1000 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on QDU1000 and

-- 
2.53.0

