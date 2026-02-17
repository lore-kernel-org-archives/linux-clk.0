Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2B2358D0E
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333260; cv=none; b=ZpPIfz9xsCAAHcLtr4Sz5gI/Zq4t8NWFtGSQ68YjJs/uEOPSAet2FPeTGScRwm7E7GII1b1Mf5e8IuGNnBKOGy3TAyXKh2iz8j4XrqQtQU4sjeLbm9oDrczA4zyE258fc9TuxEb2eUZR7qctD+FFiypNgKlLSPLnho0GdceBqCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333260; c=relaxed/simple;
	bh=WUGnTOWFqMXc2ozV9o4D93c5ZNEJhDsr5vmysU5SqCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKlGQuYAnkb2W44MxENl4CaklqPnERuiZbIUkNwWsmzRgziOtsujUtlDBo7yaKYdQxlgJdaSGfm/o07V/oPgAGP3Yjqimn6p4CeJmUBeWtvwizZoJ5EwaGxN/4tg4CK3cFhIq/eihaybEpbrmE3xV+EJfexaXHMFRhRsIoeMQVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6OTdkIV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhyJ7Hmt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6OTdkIV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhyJ7Hmt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBCvm0006270
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WjpGNItXzQU
	rVP2qT2sTaSiPzVbEmllTeq5ud1RiF2I=; b=i6OTdkIVdUAr5fyIK15NtDrtjBZ
	mD3ytSU1QomVm8kg4E/+8ZBAyIYJ157+jb3OJa7s8ySkdcPvirMHmUeDHrvVPAOe
	80viS1dr/GLiwbmLYfHL7tGCtdTFhAc4CDQAcTfQDt/wdvNhmMMGiiwp9uExT+HN
	G93DAlkM6FQIOngLSKPL79WhRYq6XMwHVrmGBCapIATtLHVvisxIjocYIIJCn5xs
	o28T+HXX4tep2Ia63N32SSdsl85v217hzeVTe/d6pCiwd5c6F/i4ji07vI8bH1RU
	UmfXfv6/JcwB1MJgKAb61nmrmmVJT37I+dHFLoCOeDH6z+g1WAUOP1/Ttyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khaknw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so2451659985a.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 05:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333258; x=1771938058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjpGNItXzQUrVP2qT2sTaSiPzVbEmllTeq5ud1RiF2I=;
        b=GhyJ7HmtkSR/UcDVtz8ep0lL2+Lp6Tjsx/qGV2OnhrP+s7YL5aipKT2MMaFCHSsPd/
         hq+9qBTIy8+GblSUop59PAmsLKXi5tCshtC2ShtH5kjJoVpXjtEassrRBJRToMasfmHU
         WK3zPwszHNe0lEa9T8NJhMVRo8C31ndbNPHGfqlq5ZIbr2shCLMlMcoQqBA5LIwG4a6e
         l7PJeP0JCWPGgfq+N3ErgDIzo1NBz5EeHqQT2EZfQ+3PpcWyoX8dLE1fpkFja4EUKYhM
         DG87Q/iHtwhP4LtPtVdyn5SlAhSMOK+i2ewjvnVDe/2hMsChFaZcgg0uN5qNHIMRPX04
         W9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333258; x=1771938058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WjpGNItXzQUrVP2qT2sTaSiPzVbEmllTeq5ud1RiF2I=;
        b=NVwNC9CYppoBooaZo12GTL5tRDNVl96Rt5lOqj9sP1ha6Skb2rju0ovuoJpZb8L34x
         sDVozCbxT5VfwmNuKsmDete9nhwYgdlq408joXF9o0u/ZQcOjg5V7YMyJaTKoq/+g2s9
         sCGhXKwyN3Gc3vJH9W6HN4ij7OHJPnaVY/tGH6/bKK8rsu1xfZ311oUdVe/IXxMc0lCF
         DkrCaGxBkZI7JGB3xjhdR21tAON0gNiOMCEiIBh0MVLiTQERi+LwCoE7IB7T9YhiemY0
         VW+o2Uv+LCs5shW3qnCFkmOspsNnLI42ynEA7gSSUA3RVNrVWS7/HYK9ZlkAJYA65d7s
         yJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOOqJ+fWxGpsvWnA12pCKENgnHHT9iBAI9D4cAxS0qVdnnnGlFi58CCYSGKualCfQyLBWd82HG/m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkpLKTT43dOcBWJ4/ddqVcnw06T13OUZHzXwW/YWqzxw8jGz+o
	iqCGlTWOl67/E71zy9ViEaqo8IRgRyEInip11hD5/oswMVrAysytrLpEDOe/y7ucO7Kro8pS/Ij
	sA5g9jNsz0ZUz+d0ma7xlWBlbCSeRPw+58ulaUz6HzTHkTC9D3XDytMV7uH8JVcc=
X-Gm-Gg: AZuq6aJZakyVSPtvFQYY0RozX2eOKkRSydTxpo1zxL4G6WU1KmIzUmnOJcRE/J1OLP4
	tKMOWGCLsHy5s94jQMnnkTiPA1ubve8nijjdh511Qdtmi4NF8PStOFQX6TDWgvVZnPfjVvfcDSG
	/OBQzUKFWuEmrIi94QilxRIKJfKsUXvjsh5EOeuTpyaLQcZbIbV/z2AQtxOpz6XQgZYynBNp2Hp
	fh3m/Hud/+3KOAu9MYz7iJPhUgH6LiFLyzViPmQkDq/E4tZzanpM3ZBWxTslO46lKpBD/GCmwrW
	YWA5pwUzzEeZNZ0cNe3kt7KMnAKskMfp5v1mmvUyydlxF7KA6cqq9C48t5CFn/Xbj4QHsySM01a
	YhlabVU8qnsgAOtaSlPxOEozX3A8sDLWFxwiDrw==
X-Received: by 2002:a05:620a:1a9c:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cb408d6adbmr1603929185a.42.1771333257218;
        Tue, 17 Feb 2026 05:00:57 -0800 (PST)
X-Received: by 2002:a05:620a:1a9c:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cb408d6adbmr1603910185a.42.1771333255688;
        Tue, 17 Feb 2026 05:00:55 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm35009268f8f.26.2026.02.17.05.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:00:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] clk: qcom: De-acronymize Glymur SoC name
Date: Tue, 17 Feb 2026 14:00:49 +0100
Message-ID: <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3178; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WUGnTOWFqMXc2ozV9o4D93c5ZNEJhDsr5vmysU5SqCk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplGaAiXpz7WktQLUwWYvIUyE59iv0LD3W7dKxp
 YDI22efk5WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZRmgAAKCRDBN2bmhouD
 1xWMEACTAZVnlvVrpvV1Cyemf5etYCW/iMUTFUrpoaRIztfj6SEsw7nx6BCl9w98y3fYZLuEpMF
 W9XWtcH3MZDG/IcIE6dbLKyPFeQL+/H0rmDbqtKv8RFvv6CxcgNV/fLD/JtMFHAQ6viMwhCRYff
 9TItV9IUEARQNNzM9dQP0KNN5eCYOZZu0qzqC6HImqiNSq/Oz0HKSdefdBGm5KM6C2Ap5c2TO0u
 5py+nXMECW5tt1eEvFKS2pU5i7N7qrez3BYLTogceCin+md64VpaZZ4IFYCNc9qt/rW3Pb7HRzG
 W2F/itMPE4FG0u69O4uwduWgA8ii09jSIzLfkrX8T8EcCIh0kXFah8o9iyciXJVuacnFxdv/FNI
 36qrCN0/cs4cPAbxWSovyHf/3YhDemlrrD1rgwI3up+gn2BefEhOvDtPLvJV0s8bHLJqJnbxvO6
 rQT7NmZMBKhthUwGx4a4C29sHlccbQj3Ai8NyjSE6r9/uBLJCD3dyXZVVAH+jCWGD7cxjWEkqdf
 bLeDKrSrM/i+pT6CrbrR9pWuMOQXUoEeBpG9+i1lqfjaOLXlnvP6vUpXkhWanUDlBYk7cMswFow
 7w3/kKAYYOHaUixIfcSQYBCIoYVRWBRZf7JX9eRqDY4jSlg2fpsuB3F7LARFJfnptFE+nuh3oX+ yXOq9aGASkweumA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=6994668a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=aiRL1Prnfr7jdu2lDmUA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wZuWjeQa5r-zEwi9phSqMzd4DcWbFS-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX/y1kuj202m47
 Rm0Ir0xjNq8h8fYbSyBvbq/BJXrkvANwTME9XmwwYnmwh04rtVCnVonc5AteOklSjXwQPnmrOHn
 4H4ldOdPON9gjtWKlRoF7ujv/6cuID/CKXM0cGyXZ1/o81i4RRaPo1hQSAnLR2ret49xrOqJ1MF
 zAs50rTatXM4+wzEsCL1s0++kfEMN1cyz2t/ENC6uwC6rc76Xd+t1FBZpKH8p7QUjX0eUBqG2F3
 a7QMQZ0ld9yUkIz2dN+hmcf2ePX3YtzM10yjZZYzqDh2s+sFhp6by6MNiWbOpQT/NtVSzXTTi/q
 m7BiN9kJTsBWBLQoVWdWl6ZaEq5LqXTUYkLhQDJWS+DBzrAS+u5CrXBV0Rt+1vtDb8HOzPkd+wq
 mQtz/6cZNGOP7AXfM5ql3UpGJrygAxMQi5S+JMSskAoCzzBvmewmDqOJAt6pnmM+JYLYq1wSpux
 cnNpoHQCb1/Jl2IZlqw==
X-Proofpoint-ORIG-GUID: wZuWjeQa5r-zEwi9phSqMzd4DcWbFS-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106

Glymur is a codename of Qualcomm SoC, not an acronym.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         | 12 ++++++------
 drivers/clk/qcom/dispcc-glymur.c |  2 +-
 drivers/clk/qcom/gcc-glymur.c    |  2 +-
 drivers/clk/qcom/tcsrcc-glymur.c |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a8a86ea6bb74..7c50d0965d8d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -20,30 +20,30 @@ menuconfig COMMON_CLK_QCOM
 if COMMON_CLK_QCOM
 
 config CLK_GLYMUR_DISPCC
-	tristate "GLYMUR Display Clock Controller"
+	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
 	help
 	  Support for the display clock controllers on Qualcomm
-	  Technologies, Inc. GLYMUR devices.
+	  Technologies, Inc. Glymur devices.
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
 config CLK_GLYMUR_GCC
-	tristate "GLYMUR Global Clock Controller"
+	tristate "Glymur Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
-	  Support for the global clock controller on GLYMUR devices.
+	  Support for the global clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
 config CLK_GLYMUR_TCSRCC
-	tristate "GLYMUR TCSR Clock Controller"
+	tristate "Glymur TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
-	  Support for the TCSR clock controller on GLYMUR devices.
+	  Support for the TCSR clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
 
 config CLK_KAANAPALI_CAMCC
diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index 5203fa6383f6..c1facd4e80f2 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -1978,5 +1978,5 @@ static struct platform_driver disp_cc_glymur_driver = {
 
 module_platform_driver(disp_cc_glymur_driver);
 
-MODULE_DESCRIPTION("QTI DISPCC GLYMUR Driver");
+MODULE_DESCRIPTION("QTI DISPCC Glymur Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 238e205735ed..19f4b3cbcdc0 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8611,5 +8611,5 @@ static void __exit gcc_glymur_exit(void)
 }
 module_exit(gcc_glymur_exit);
 
-MODULE_DESCRIPTION("QTI GCC GLYMUR Driver");
+MODULE_DESCRIPTION("QTI GCC Glymur Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 215bc2ac548d..9d9621a61072 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -309,5 +309,5 @@ static void __exit tcsr_cc_glymur_exit(void)
 }
 module_exit(tcsr_cc_glymur_exit);
 
-MODULE_DESCRIPTION("QTI TCSRCC GLYMUR Driver");
+MODULE_DESCRIPTION("QTI TCSRCC Glymur Driver");
 MODULE_LICENSE("GPL");
-- 
2.51.0

