Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA17E246BD7
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904975; cv=none; b=AR8t4PXnmvt0+9Juha3qG/PVGeXfIJwUlLKBxCDBQMH1iXjV7iS3WMZ4xO+ULcieg0kFfMZdsy8EJnk3wF42IIrjfjTMgnqtluFocEqUT7qm7chYlwPoN3+aav1UfT7qR/1F4DRCfsSDuQh8+pYDr9kEOyuo0i8h2NDd53qtpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904975; c=relaxed/simple;
	bh=qmyouG9wax8DI8Ep9VGJyGEQaHZsB+L08/7ldbX8DSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ry4fefcMa0+2Z5k8eh9BouWeZMtuz9DmUVfihjJXNSY9R+664SkY81JLHDjIuLHp0CSOOwc1xwxDepHAOEHaLpcWfu/TBUyLBiwIVwT2wWJrB5ml7GNLhx3K3IrJoB1WSk0d3BL1QzoL12RUXr5DC52AHc2P2AsEWt+OtHwF0fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIZNxdM1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLp/3wLq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIZNxdM1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLp/3wLq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V6SSnK3117076
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 10:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9xq9j3KqWpWbSUPVXWGjxl
	Pd9QFvEU2YsH3D3qa4tOc=; b=OIZNxdM1pS6Oe3LIVslZWWboU4LzLOFQ+hwNAF
	GIah2e+gFTNdiVP9EpVQM6yIEjgVrdj7sxm7GzTb0gE0RU/NPp7rEga4//t83FTa
	++xpL0wWx8sdwUK77sHeKFdm2UuR0A8/alqb3LCEs9cis9SkPHAAbuMAprPcHKOR
	hB6s00EdCv/45NPACWx+YpCXCYt+hTSUWWe0fEeHdjd6q6A8EkByc4hpjq428it1
	ddEQZwb6z1fKW5AqegbIbO1UjGbCckZHr+xS93jqbaomKEHoKDUYe/9URfXcs3pF
	8+0BwrhvIUqgSQyox/B8u/DwE5c9DSuPEndhO2ieYznPF6UA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45frkr7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 10:02:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7810289cd5eso5165958b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 03:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761904972; x=1762509772; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9xq9j3KqWpWbSUPVXWGjxlPd9QFvEU2YsH3D3qa4tOc=;
        b=iLp/3wLq/YPcD6tIHrpAf13SUsVucTPi3cPLw9iA0flHLeDcXmy2RKSOgKLO4jDtUp
         YaHbUz4WZWIYryvPAP/sxsaTAGrml7zlgEFj8GiPHhBllcrcQ0PkZ/lPCkQYgf98wqmH
         Q3RIt0RseoJZ60ExhpFoM8JrOMYg9C5XdtcOSsw7/tDfKufX1nqrRA5393EKq12tLciv
         iDdr4AVBTiF/Kk+pMdy1fUNNcq/gJxmlDlU3B3LULNOTWkIoGl7tPOzIxb+49kkv20Q1
         1ARJtvoSpxH3NRifgprS2I89o/c/8AO2cnHVVEa9pYrgJmVuKgZWVxToyPj4BMXDb+lY
         io/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904972; x=1762509772;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xq9j3KqWpWbSUPVXWGjxlPd9QFvEU2YsH3D3qa4tOc=;
        b=ZCKy1MU9r1exX+BJcu8rvPVEFFonxWW0AREef3dF8gOhzfjVao/1P+iQL8aNOi4R0O
         AblqzjfPDffb4TaiS8/BlRkC31sJcdQae9GMD9+Usz+se6GzR1XOyA3oZsleXKo9+vB8
         AOAtYRu/dksh3fcrae4i9v574nmZaNnlFpSNH68bIRfS/mcWXy7j2wDWQ/GPDTo/5ko+
         t6vfusEEyCFD7BgWk/ISYY1In1od0Ag+rzq0+ePtUIuZABSShRXbas6+CsC8Uj//ZnWC
         FWopmHt1YovdmUqKHFzFgNssnQ8p6EQGeL0bjn8eYIdY1ke+dXcZBwifXvKd5REchDec
         Hafw==
X-Forwarded-Encrypted: i=1; AJvYcCUA+HyQDBesnaKMWhixBU5oCWiB9siVXydNUn4FiKlEQNUauYyYAne3Gy0kbO5WZwsWjSJ5E0zlezw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGROhlxLpgbRC4C8Dx2DrXdVH2P8j/wFFfozayfiI566sGOAda
	XmY/9tw2ivsPedqSqQq7ieCCja2NdzlohU0kOjelCECjXZAIkDeaNtsoJnSkbHB8mO5KXXSSE5J
	7d8mgIcgIn780FtOadIaWf1owZ3Irctr9heOdkOWqbFn2eguuh36MYQssZzN/6Lw=
X-Gm-Gg: ASbGnctR0bm/8UGTpbFUTZCfm/4IVC77bY8P1hUBCKguNqMwzJla8dT8iTYvgE4IgQ3
	5YsCsvQp4C38DXrlbdvAlbxEuiQlnlbIBhunH88LgQvOR41gx7G8+m6cRcb0iXdLp2MRLI/owqE
	hfw3oRQWUq248EUkA+1OFQc+ajL33D22mSPbCjwKk+8ZCiZUFuiYjwna7qM6bCqi1+uYZIuSZnm
	8j/rqq90HJmnuMElPfdVq6khX05GHIrOU34wwXFyLi1mdciLkMCTxGCYr/iIga8LOWGh6q/eTIL
	MqUASG2wuAnxfLByk49kAl1f+DeEdYwh3FZm+xpKjyN5+zM/QWja9jEOjU2GdqvSu80L6Q+u8P0
	rqisbA4Vdo0LuAjyJ6dMiAEk=
X-Received: by 2002:a05:6a00:1826:b0:771:ead8:dcdb with SMTP id d2e1a72fcca58-7a778ce3949mr3425272b3a.8.1761904971412;
        Fri, 31 Oct 2025 03:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3SJ8Jdf6h9E0ugoT8BDjUmuYGHslNJ9E6pWopLPmG7Z+0EZsbYMqrs20H5y7YA54/R7QhjA==
X-Received: by 2002:a05:6a00:1826:b0:771:ead8:dcdb with SMTP id d2e1a72fcca58-7a778ce3949mr3425196b3a.8.1761904970608;
        Fri, 31 Oct 2025 03:02:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db0a0219sm1609360b3a.37.2025.10.31.03.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 03:02:50 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 15:32:25 +0530
Subject: [PATCH] clk: qcom: tcsrcc-glymur: Update register offsets for
 clock refs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-tcsrcc_glymur-v1-1-0efb031f0ac5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADCJBGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA2MD3ZLk4qLk5Pj0nMrc0iLdlBQDC0MLU/OUJBMzJaCegqLUtMwKsHn
 RsbW1AGXx2H9fAAAA
X-Change-ID: 20251030-tcsrcc_glymur-dd081857db46
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=KupAGGWN c=1 sm=1 tr=0 ts=6904894c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fnDjtfwCBqzf7SSwl4wA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: fYbVaVgOPpXA9MHB-qiKFd22KFXfnNNE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA5MSBTYWx0ZWRfX+ifyhp+OCkBg
 f7kFjxtsUv26pKdSUvm7n4CbhYhlxVCNT9wOld9OkyO60g20KPixgggGJqWCe3eJgjplBUpOzto
 0d587mNmkI9onlVLu7yqHmG2XZMGE36TkDc4AdpVoDfVnDlJOjpA1KkHIZndMONT9fiCHqDlZ3/
 hA2BxWqKlAD2KIltZ6xujgVilXkYjLDXys+Y7u6fOa33j7/7W7wzeU9qtk3sMNYGvwZVtNWdl5N
 xVSY6PLNP8QsE/5To6tnTfgWhRgA1PQQeXJ/CxgX90E0ScDjsf92Gx0K+051mNrgHtZVwyqBqFC
 be64bW16ds2BbOZzetAdBjtRjGaInWhx41EnJ0vUwcXzNUsHII2XmudTiZtCRTHxFjZXeHTgWTV
 vlDLswPFJbUiWBanPwerJlVyG+xgMg==
X-Proofpoint-GUID: fYbVaVgOPpXA9MHB-qiKFd22KFXfnNNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310091

Update the register offsets for all the clock ref branches to match the
new address mapping in the TCSR subsystem.

Fixes: 2c1d6ce4f3da ("clk: qcom: Add TCSR clock driver for Glymur SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 54 ++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index c1f8b6d10b7fd6eaef0149843594fc7eb6a620ec..215bc2ac548da83aec23921ef9a4bd59b6b307bc 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -28,10 +28,10 @@ enum {
 };
 
 static struct clk_branch tcsr_edp_clkref_en = {
-	.halt_reg = 0x1c,
+	.halt_reg = 0x60,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x1c,
+		.enable_reg = 0x60,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_edp_clkref_en",
@@ -45,10 +45,10 @@ static struct clk_branch tcsr_edp_clkref_en = {
 };
 
 static struct clk_branch tcsr_pcie_1_clkref_en = {
-	.halt_reg = 0x4,
+	.halt_reg = 0x48,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x4,
+		.enable_reg = 0x48,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_pcie_1_clkref_en",
@@ -62,10 +62,10 @@ static struct clk_branch tcsr_pcie_1_clkref_en = {
 };
 
 static struct clk_branch tcsr_pcie_2_clkref_en = {
-	.halt_reg = 0x8,
+	.halt_reg = 0x4c,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x8,
+		.enable_reg = 0x4c,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_pcie_2_clkref_en",
@@ -79,10 +79,10 @@ static struct clk_branch tcsr_pcie_2_clkref_en = {
 };
 
 static struct clk_branch tcsr_pcie_3_clkref_en = {
-	.halt_reg = 0x10,
+	.halt_reg = 0x54,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x10,
+		.enable_reg = 0x54,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_pcie_3_clkref_en",
@@ -96,10 +96,10 @@ static struct clk_branch tcsr_pcie_3_clkref_en = {
 };
 
 static struct clk_branch tcsr_pcie_4_clkref_en = {
-	.halt_reg = 0x14,
+	.halt_reg = 0x58,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x14,
+		.enable_reg = 0x58,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_pcie_4_clkref_en",
@@ -113,10 +113,10 @@ static struct clk_branch tcsr_pcie_4_clkref_en = {
 };
 
 static struct clk_branch tcsr_usb2_1_clkref_en = {
-	.halt_reg = 0x28,
+	.halt_reg = 0x6c,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x28,
+		.enable_reg = 0x6c,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_usb2_1_clkref_en",
@@ -130,10 +130,10 @@ static struct clk_branch tcsr_usb2_1_clkref_en = {
 };
 
 static struct clk_branch tcsr_usb2_2_clkref_en = {
-	.halt_reg = 0x2c,
+	.halt_reg = 0x70,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x2c,
+		.enable_reg = 0x70,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_usb2_2_clkref_en",
@@ -147,10 +147,10 @@ static struct clk_branch tcsr_usb2_2_clkref_en = {
 };
 
 static struct clk_branch tcsr_usb2_3_clkref_en = {
-	.halt_reg = 0x30,
+	.halt_reg = 0x74,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x30,
+		.enable_reg = 0x74,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_usb2_3_clkref_en",
@@ -164,10 +164,10 @@ static struct clk_branch tcsr_usb2_3_clkref_en = {
 };
 
 static struct clk_branch tcsr_usb2_4_clkref_en = {
-	.halt_reg = 0x44,
+	.halt_reg = 0x88,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x44,
+		.enable_reg = 0x88,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_usb2_4_clkref_en",
@@ -181,10 +181,10 @@ static struct clk_branch tcsr_usb2_4_clkref_en = {
 };
 
 static struct clk_branch tcsr_usb3_0_clkref_en = {
-	.halt_reg = 0x20,
+	.halt_reg = 0x64,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x20,
+		.enable_reg = 0x64,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_usb3_0_clkref_en",
@@ -198,10 +198,10 @@ static struct clk_branch tcsr_usb3_0_clkref_en = {
 };
 
 static struct clk_branch tcsr_usb3_1_clkref_en = {
-	.halt_reg = 0x24,
+	.halt_reg = 0x68,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x24,
+		.enable_reg = 0x68,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_usb3_1_clkref_en",
@@ -215,10 +215,10 @@ static struct clk_branch tcsr_usb3_1_clkref_en = {
 };
 
 static struct clk_branch tcsr_usb4_1_clkref_en = {
-	.halt_reg = 0x0,
+	.halt_reg = 0x44,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x44,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_usb4_1_clkref_en",
@@ -232,10 +232,10 @@ static struct clk_branch tcsr_usb4_1_clkref_en = {
 };
 
 static struct clk_branch tcsr_usb4_2_clkref_en = {
-	.halt_reg = 0x18,
+	.halt_reg = 0x5c,
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
-		.enable_reg = 0x18,
+		.enable_reg = 0x5c,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_usb4_2_clkref_en",
@@ -268,7 +268,7 @@ static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x44,
+	.max_register = 0x94,
 	.fast_io = true,
 };
 

---
base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
change-id: 20251030-tcsrcc_glymur-dd081857db46

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

