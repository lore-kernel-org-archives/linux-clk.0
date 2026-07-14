Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E4532E757
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 05:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007010; cv=none; b=sB0HrCCN2mRiL+h/t7PYytRZO9YO1jimJGgdYKTMwxLGEgJnI9ReOeJpMSKRdHNKyWIrWpyQjUST4MvrkPRUm4lAaTM/YHf5ySKho/JdsHIaPgaKym+D5e2zbWy3LylnzrOaqwdt+hb84Lhvl/sHmGTQ+GqVlsFzFBGPSk9a+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007010; c=relaxed/simple;
	bh=f6RWPu7OSYsDVLIJlL5RPbvktQugKFzgNsgyhrDHawU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ep0wzJJ65Ng+CeG20nefgmVk1WYDD4RXXQRiKAq1bbV1JfG7avEZcYDi6CkOBNgbXH7u77OXZGpqiTKJtT6+QEaZm+RQ+ue2Tx1/yUN3T2sfkJEkkygFXvipjH1xeAk3gczwXVvNuJiqodRe49C77NCFE6nI1NLYXPZ0SHuKbp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaEM3Jz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPjmngh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaEM3Jz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPjmngh2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38WIo3483240
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 05:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/EH/kDTOFfl9ll8nU+LHJ/
	gslhkAK0/qlAc45wOhX4E=; b=MaEM3Jz/RdLyWBA4WlEsbzSxcBn4yhjN1skm1y
	DrKpzT985rzWxWvET5XBcLFu2Gmc3G3ZiTgCOvq6X1itYt1Qhc/lJ0yEPMEBFsKH
	xoOjIb183G5zCh+mpWCYRa9fFWQWmDoszIez38n/yMtdRwXpWXzBc/Q6/YNvX2CZ
	gOOnC/KFREiD37/MfuE5tEKfu4o4VTzkwW0lWpU3PJcED4fpfQcxAt1cxElZLALP
	3Qos7LOobsmoS5/s9G9RcjTUW9FXINxTfWg4wvLnRygs2MLQvZPb5tf/lP+kpYj6
	Bla593FYj57i3HAOo1Bm2MVaHOFxz8dY2RbdzDOgSv17WMbQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xaca2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 05:30:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e095fd889so1208270a91.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 22:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784007007; x=1784611807; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/EH/kDTOFfl9ll8nU+LHJ/gslhkAK0/qlAc45wOhX4E=;
        b=TPjmngh2WITqkXzfzBwK3OGCB3zMW9nvbfWgU5AoF4Jgn7u9WQDHcFRzXW8hD3iLCY
         ykHGMFitl9ItGtUF01vL5D/iuEiCoeTwMP8SQ3d+un6o/tFBxAFMUcSLKqGuTioUPcMB
         Y1ZYpT2WHUkay57pbNUNzMnSU46zJihSeS+7i7R5FchqAjjiOYArXzr0krCIDz5x9WEE
         5VHtIKn4WQRTW9Uuukt3kauzmAaQvuO2EmN6qR6g6YTQAQKciHgtE94sW9j4HqPyHS7u
         /meIQloYcrLi7dE0CGaMNjUmV1XqQt6/BnVt57VffHscu7LjBr35ZJqVVVOxYu2MzCrZ
         2Xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007007; x=1784611807;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/EH/kDTOFfl9ll8nU+LHJ/gslhkAK0/qlAc45wOhX4E=;
        b=pJuS5/Xyz98rI7dKx9v5NFmDjYV8IQgy+PV04hMpOo0LigDJEpgHIl9PCdDEjgPE7U
         xJ9KZNRpJ8k4S1WPI4+PRC0okxzk4Gpnj/QIiQReXPTE1Fz6aIrFpM+ewhJmlFD3EJYT
         IsqqDrThe3ugsoDu1sAa/lSX6S1bXWpXcugpp7a+yzsxsbRox6pWXhQDAqFTPjjsZHav
         Oks18Sm7LnQiXGpNj02HZP0H4JorjRJ4bPmDgWfNeQB/F2phutoCoNBFkIaTTcJI8leJ
         qBVGPjdLaAn5Nq4JRn2nsGNKD00bNGatIDi8m0Am3rU99MvmkUBaP7X2kfo6w70hxMpu
         4XDQ==
X-Forwarded-Encrypted: i=1; AHgh+RphNuS50FHXH49eznZf9RFcTSbEneNKCHZtTsDIAm76H4GSeu2kEUlUMMS7MTUlqywSLlJkX3LWTzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6HTO+Df1MBhMzC26hQ59Zl01P+nJEK3KeMkLeWShA8a6rDUbE
	1fIvOmsyPPBbQJppHXpc/JMU1grVBdjzs3lhg5aStPp+u35Secle0kEI9u2zlDPjAvyehiFwhpt
	iJa3FDQb4whP+jXQB/7EKKVDXJnEFwkc7vJF3Zq6zrP+4nuBT77j42kvdGuVCY+s=
X-Gm-Gg: AfdE7cnXBkmUDTjyxrqZAMiMKtd8vFFD1evIfTTLl21l+AynAhUlzTaEyVZAzpe//jE
	JTlVUbSDo7QYVGV9ENcUSNnld838SCWIfu98AsgxsMGEKLa3AyIOSwe1C+9KNYxbl5MhLMjr6jd
	VJIdG9K7XlCVEjpggNNfFMW7tl16jXe+YWNXo1dIQyf/YlKv29dJpZrniRdZrDsqKI1WJQBhne3
	7dDPOseg9lG6KHpXH0wIEEBgVP3hckpfaBXjOI+deS+8AJJQsIOLacg4EWd/7ZCss7UEuhSA7TQ
	Q/SO0lGgOUUs3yMQ7HR9g24J2CxebAMEIlJjiZGbTudkbvkp2R5r3RqpLVRD/w52QTQbPbJRBI6
	dqYFzDG3kkpzV/XtgCWzvF+nbQPVnZG72lFUd0MKaIg==
X-Received: by 2002:a17:90a:c883:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38e101fc92fmr3278757a91.18.1784007007312;
        Mon, 13 Jul 2026 22:30:07 -0700 (PDT)
X-Received: by 2002:a17:90a:c883:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38e101fc92fmr3278718a91.18.1784007006848;
        Mon, 13 Jul 2026 22:30:06 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e16e1d010sm889684a91.0.2026.07.13.22.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:30:06 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:59:35 +0530
Subject: [PATCH] clk: qcom: camcc-glymur: Add const qualifier for
 driver_data & CBCRs list
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-glymur_camcc_const_fixes-v1-1-c635123ebbeb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD7JVWoC/x3LUQqFIBBA0a3EfCeoSEFbiYfkNNVA2cOpKKK9J
 30eLvcGocQk0BQ3JDpYeI0ZpiwApy6OpLjPBqttpWvj1Dhfy548dguixzXK5gc+SdQQtAvGajT
 BQd7/ib6Q7/b3PC9x6obDagAAAA==
X-Change-ID: 20260714-glymur_camcc_const_fixes-fb04b120c1b4
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfX5ZQwRIVA9off
 J08wNDIwH/c0pvEvmCO+wIDah8mnZxhRcGcFq9l8NlRHOCTBfDV/lPr5iR+wHJdgIcFuh9aW6PY
 WDQsHrO9+WJw7w7UIuKtErJwdsAhzvQLChQyB33ndxfkqbQz7Zj5H4jLurg1XeLsJpawMSPktCE
 zHG4YboXrScsWy7TqofcWAqcTFPQ/HRcUA26MazNl4LRoxW/0Wqt5Vu18J+sDUHxaUkEqN+XJr0
 HRYLRZsF28UBp3qXRsfKBMWXG/vhUOZZoO+VEpSBrwNzRLsyc4JIw068sCp4SI6Kv3S2COx3yza
 F52nD5S6qlIZVr/Nxjh9j2YdNfhzYTPwslEK2wFCKKfiN5OTJma+/9YFl9kLiqNJSABfQqSlY/b
 By+TE2LD1EM2aNs+pFNGrFWeLCC1pVHQ8nn8iuptutOnkzZwbZ4klQjaSqlL4PGEZGWkZBDcaq2
 ivCULjIvliYWJdwSiKA==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55c95f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tcLhrl5LxFYkqpN5Pw0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 4--2ihDZizqOGLB691BvF1Nio_833oxu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfX1XslGXKp/PZz
 62km2zfCmdmmsGzd+hFkzxkqxnNXzrXw256utsqf4kj26u6/o8GCk9o8JxVK1YQwM4u+xVCffM9
 9JQfHIMxGuAFV+Y0KJbqOfsEGLFox4A=
X-Proofpoint-GUID: 4--2ihDZizqOGLB691BvF1Nio_833oxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140053

The qcom_cc_driver_data and critical CBCRs list are never modified by
common code and are expected to be const. Hence add const qualifier for
these fields.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-glymur.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/camcc-glymur.c b/drivers/clk/qcom/camcc-glymur.c
index a80f05b7bc4841f97d03544c11a77e8821437925..044cc590624e5fa5c3254c48defb754e4b856e63 100644
--- a/drivers/clk/qcom/camcc-glymur.c
+++ b/drivers/clk/qcom/camcc-glymur.c
@@ -2223,7 +2223,7 @@ static struct clk_alpha_pll *cam_cc_glymur_plls[] = {
 	&cam_cc_pll5,
 };
 
-static u32 cam_cc_glymur_critical_cbcrs[] = {
+static const u32 cam_cc_glymur_critical_cbcrs[] = {
 	0x13960, /* CAM_CC_GDSC_CLK */
 	0x1397c, /* CAM_CC_SLEEP_CLK */
 };
@@ -2236,7 +2236,7 @@ static const struct regmap_config cam_cc_glymur_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_glymur_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_glymur_driver_data = {
 	.alpha_plls = cam_cc_glymur_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_glymur_plls),
 	.clk_cbcrs = cam_cc_glymur_critical_cbcrs,

---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-glymur_camcc_const_fixes-fb04b120c1b4

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

