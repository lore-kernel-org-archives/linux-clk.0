Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2234FF78
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702625; cv=none; b=mrh7ZJMVLZNqa/W8JJ5erWTPyQoNBsRzB/8TjBZB1I209QwRa9ehZMfbQOBU4GFx8EHppKLnnjDnMif2+SYuTob8XnHpbYXVtzHkF5IB935SrkcGfCY6h+UItccuu/sPAY2gbVCavvuIvKUxIWs0jMLrN5ix7tvGk8wx9s+bIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702625; c=relaxed/simple;
	bh=GkuGBtz0vm1ur5SbWsJoyFWyyIBKgm/VPzpwgEa5Hlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YnfmJzEC3WiAWp+vyoTT6ewbWgpRK7kViZgOW/uXaiRW3hXspfzgDffrKUSAcUD6q/LVRhhtL6zsWblmPTQl4rJ1vMTYX9wzv3tSHwWDA3q7zRfAneTDuvBH5hep8hE9flyXTRUc7FdGtunYFSisYIas2G/lTwKpxg4bGVcC1Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb+Kmkoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOPcHHAi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb+Kmkoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOPcHHAi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFR2YY1599880
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzJ5ge+EfXqrbVBAlUAXmfQmBnk818A5VV6UdTh6l78=; b=pb+KmkojbYnV1bIa
	X54gArqJ6FYMEDPvI71/S5elsHYOZyYCjX33is3QL90MI95EynuA7Ujsdl4ulU7/
	5f4c4ZOXcC1RaO4uzK88u0kc5JhRmG/MM08vER6nw0G7tNtft+ZGhqAeKgBmsh/p
	BaHsdywlbTAo60ysT+Gk6eU3q9s6TRKJ6tBAzCeqyhfHRoqHGEsHU59wcKZhbMlc
	cDCgVSbtZX6CqDzjPwDpLXxdRa8HP4AtgslCCnszyF40H7jSbo+jylP3SRRk7toW
	HrTxMk6x7k8NZ6VmZiO1eotcfUjCUxFDF4772Q0cDsEKoQ6oyErtDL5/81G9X86f
	yuU0Fg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh899mqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso2019491b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702622; x=1777307422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzJ5ge+EfXqrbVBAlUAXmfQmBnk818A5VV6UdTh6l78=;
        b=bOPcHHAinADlZ4tMY6lRZiq2fHklKxZ7v5qY7ArmMxNAQspVaVIZmx2NpH9MDBomGk
         N5LBxbPOK8mHTSGKnjix7teu2U81NdnfBv/OvzT5FG7z2nd30Gk7kLSP92QIXlNrLSFW
         KhLB6G11Lw1G8r28S6gw27VDYFLY4sfnBRvYAzvxLlw6OIuijXDdPxL3i+z1ZnjWNdy8
         JPFg0csioDUoSCoogstILhfDQhFNSkDGv7PpePESVGNVJA6yHEAqixHc18IUZjzSgvOV
         WU01sa2yUe659Rpog2pqNrTdaYc/Qb/fxJyutMdhLYV8tZYJ7hIbvaAHikjNBxX7u/xY
         L9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702622; x=1777307422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LzJ5ge+EfXqrbVBAlUAXmfQmBnk818A5VV6UdTh6l78=;
        b=cAtnR4Ox4Si5nH3pPkC6hBIlIm5z7ZzDRz4fYnAGR7eQdpDtNNOEIjLaNYFtqHN2UR
         NImANq3CDBwMQ784SWMZEqpwFe9v5/MwZbROKmbBSCIRGgKxCePYIdkqHpYhIlas50Xq
         ljQLGhIx7ksxEqPeQMzdKAteYfXZ2pSZBCB1tTntEzzXVWTqsOOoG+lQ8kTVK3MUwxcx
         YT/mw0zd7CeJWUNb/msqLYIpvCS5eGoq+xst7JlQqvQs0rourBhfCBExTk05yDEh/pXR
         +NRSyXR/5n5vxmDPH70I7j4w2aLlTTs8db3laqM9gY9JzJW9WnrsWZEUlnw9QU8DQN/r
         kMrw==
X-Forwarded-Encrypted: i=1; AFNElJ9QIRK4BZBLZMv+j4V216Y3XTJ1CajYTqThVYDzGQfY3+4xPUr9ylQaCGR7Etj3OCN/sd1bPL/78nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqUCYVG/voTU2UIfQ+SBlZzoVva822F7ASuReN91MhgGNX4Naf
	TklmqPbGUzg89l5SPivZKCPX8OlBzn8w9JtAi6D4R3DkqMZuHIDY2fMhqaBv3qgh9wAOogGRPe2
	Bo0frPpTQ8ISWQXwvDy/kuEWitruYCQt8wFpd26c2pBiBd0mgaLIhQLlPbNbpAok=
X-Gm-Gg: AeBDiesKw8fmG8eyKOWrtxddhwRGFaKMApoM7WeuB0OvvYRP9DvJjbxE9KsubDyEuO/
	0VsU5zCWniJZEKPmzIhnIaMdoRvtKD3OLrtNH/0zgZmX+VHNmAGmdEkJSOK+2jegHYDxHt7zQWO
	g8y/jtxIYIqmIVjRY3ke1Klm+Bupo5Haohcy/KGKJM9gDS0tPpdzARNmu4D9mWAky3dAZbzrvgN
	jPU0vUp4XmMfXBSujDQyk+XTMJXAVPedi2m/Mc8jzt01QF5K+Vy13qr1ryWtjUqHIHBQqSep+ig
	KLcWgy4ReyV918rnN+UeIigsGzTlEXcP3DIDeT1Ar/2wUfNDj8a+KXHHDucd+LH9kaNJNFoZPrj
	Jj/h6t7kRiLvtQR1ceBpsCUm1CyNRpPAb9u5sBcLoOE0elqgTY3VH4HccDmHrrA8=
X-Received: by 2002:a05:6a00:23c4:b0:82f:5f2c:dc1e with SMTP id d2e1a72fcca58-82f8c902066mr14297797b3a.30.1776702621581;
        Mon, 20 Apr 2026 09:30:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c4:b0:82f:5f2c:dc1e with SMTP id d2e1a72fcca58-82f8c902066mr14297745b3a.30.1776702620966;
        Mon, 20 Apr 2026 09:30:20 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:17 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:59 +0530
Subject: [PATCH 06/13] clk: qcom: clk-alpha-pll: Add support for CRM based
 PLL ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-6-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX+qaiCWz44hSu
 f+NdQ+50dJdTrXG2j6SEQnOPCCasrKihLRAFR5f4JKnGe59dnn9t4XSAuyWXmw/qUYalRLGeeCT
 SWyLH+ZB5XciXuLDBHecMMrMgcURPZFfavJ0VBv000LOBDeVLHM+SiIcs49WhrNmr+iGFTH0Y2b
 0b5PUYaa2RJQqpHNs1C4GZd2eFR4QwAD+AGSD/vCp2aI3WQYOiihbw85Y8HilSV7dQf6nAPWDDX
 Cn1MszzmRe2CQ7h+Yn7PHulrizUZmoHu1KzOpbHe9vMTYBqEyJpfQ3JYaLWI4bTTCR4p80uk9z7
 8ONRfbQC+qtVvhPVW5zvyp7/O2EORuo2TCkQwf6FQBc99ovO4GNtJJBQdHLVGmmjI/uGnW/3rLF
 GYEGVASVp1QPZv+qa9wMIV4Vkwxh/OFp9xwBFfuToBjp7ZUfJqjcrdVACd101w7u1M7ejF4lR4B
 n5CBMnJCPH2eFBVBaZA==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e6549e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UWxg1GitlfQtNyvJ0DMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: vMWa_ROs9tCTQHRfgPDzjSMIw2n8h8aA
X-Proofpoint-GUID: vMWa_ROs9tCTQHRfgPDzjSMIw2n8h8aA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

Add clock ops for PLLs that are controlled by the CESTA Resource
Manager(CRM). For these PLLs, CRM programs the hardware based on
aggregated votes, so the clock driver does not need to program the
PLL registers directly, but can still model the PLLs and expose
them as parents to RCGs in the common clock framework.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 7 +++++++
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f8313f9d0e30ffd5393e3163ebc0e51b2bd96437..67fc97739d0d4c26aec0bac5d43d1b87d297bc6a 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/kernel.h>
@@ -2585,6 +2586,12 @@ const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
 
+const struct clk_ops clk_alpha_pll_crm_ops = {
+	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_crm_ops);
+
 static int alpha_pll_pongo_elu_prepare(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d3344921457c39deadcca5c43d72ded3b572a3..1ef515708ce19e636eb9a59b126df5048e262d85 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, 2018, 2021 The Linux Foundation. All rights reserved.
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 
@@ -219,6 +220,8 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 extern const struct clk_ops clk_alpha_pll_regera_ops;
 extern const struct clk_ops clk_alpha_pll_slew_ops;
 
+extern const struct clk_ops clk_alpha_pll_crm_ops;
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,

-- 
2.34.1

