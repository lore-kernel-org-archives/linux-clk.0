Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D364E34D907
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702615; cv=none; b=NqAjBLz+fVgm2UwSqsaKrieiJKlwdCJg8UDi9m092vbetkACL7qGIB9P1wefOSniMFhB6Q8LhLraT80OS6RFwFHPBqzMotJrRZp1Qzf8IK6iDLIZinhYDlVJ8E4aS8HGgeWoHHhhKVdRlNIMLB6p/hkZOkajxS11uNec/RysRmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702615; c=relaxed/simple;
	bh=f2wjz92I0Sbbb8BOJs0/4SrTPSaL+5OM0B7Xf9WaqAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jkwfvEGkf+N5euADtJGfZNNYyZDU04Q4IDI6/xjK6Z0PMErZ1C6soi+TdwD4l+QFsqZPgva+5UFkYxgVrTza9ziXjGFwU3AsCAZFL2tyNsdmykByIyuSY0ouK+H0sQPE9ztKLOBeNALsJIb13I+nuNTMHu24YiMyHWSODAqKTz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPTf7d43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5l+dzzW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPTf7d43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5l+dzzW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCbi1V1532092
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cj8JODyzns33JEy+VFqUGn3ybiwxgn9uIU1bz6Z3n60=; b=aPTf7d43qKmhp/eA
	QVlEYDTJQT/NxbPAVY2GbsqT0wWlNAy0dMA8JrytxlTdS/k+F+Tvzkl+8TisXaVp
	4YgOfsBl+Cbl3hIkAaWRLdThjuHl9rrDTCn8umJd17oieoWQVM6Glybsg+pqhjku
	xymy/CjJnmqM94Lddb7VojyVz/ggujNSWzYL6AxDI+3wduDD9GvWiYYUSqwH2HdE
	KUHuS8vfSpKIjgx85dnQE2gGq6EX5J/xKfcCiHeCXExuyMyeQS8sNpM7pKHOa7K0
	vNZuBgqjg/G0cO2Bj18SDIBpl3zmBj78eE16rU+nVS7tHqoEoJ9o8CNaKdKh2Udc
	XlvWgw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus29xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c798ace3e03so517241a12.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702612; x=1777307412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cj8JODyzns33JEy+VFqUGn3ybiwxgn9uIU1bz6Z3n60=;
        b=I5l+dzzW7eTVtjJdkfib12AaOi3h4CU1dnMSkAGX8+n3mivnGlUS6ytHdLy7zoP3CY
         xYbXStVWsw9OG3R/TAiyFd7cZz80hdDupFPyBnzwFUlxi1JmOpxO4sfyG/v5pKoEJSOF
         j3USr8uXt4BEmEHyX3wklOKO8wVSUdUc/zK3DyNHEKYd2pczwRCJMLVXQJ/eSmOCZjIx
         mIJuR/WXNijdNGr3YQW2ocvICHlVjMSSsEJ1v4oVteQXGxU/5ftXTrMRkh6JGNMEIdKV
         ZQcNRJF/CorVz4VMgMWDnwAa8jlEO8neMj/ADuiYx9i4gtY1PoCaK6vdgW6568Ncg6PR
         Hm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702612; x=1777307412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cj8JODyzns33JEy+VFqUGn3ybiwxgn9uIU1bz6Z3n60=;
        b=Kdg/JTVSjXu1yvGP/sx0eO8cS3sO53siBJ20eLR7UAAFbrCc2MCjzGqGGuTSSApaDe
         XR4+GzFuTIi1vfMhiQLQFP8wkOewWMdyTY3OYozpygHb1YR9orVbt/kyjLa08V/SMmhU
         szNFsZcISTHQ8rwwZSSBnJhm5B7nRKoNfUUXQETYmX1Z/KA/Q3UgH6pDB3xAaVcNFSir
         +DLghB7NltXi9jMdZ+8+rNPU8Nvig4TvmU7PNlF3l6y4TiZtXsVZ6fTVO7Nf8l5DmX/B
         R4jWRjwPUy31cueqkC2QWd+SEV1PTWyiKQFd4O1cAvF/4EChod21TJslPBEWzas+KEfR
         b3eQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mSFiYBX6tx2+YJITMh+G9CgyOvQlYpZ70Or8iAQMeYfr4vbXuxZmf3h4KXRhVmvH7DIc+qBfNGBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YycHdIde7WGlGlVLEje8st9VtLGdWw97x+Y5yjARCbZ2c1hqR7D
	OOzHPr02Qver7zpdHQb9bmqiOrQ7eecXveuUuAWX5KtMrGo2MUlYTQ5+tF3Xk8Fkm6nF+1Lhtt7
	2cXdXlELHkRlaLXNQCKdGsAlWJZe+QdcowOsubSYJIgJx9OP46FnzikY0WRR+qZI=
X-Gm-Gg: AeBDieusZrVK1VkJa/FcMaQRpCR7m/yX9yS66O8JZ8ckRfKM5xMRosoHcxasxTyQYgZ
	q9LR10g2y6XYZPQCG1um9RxrC4qi7Vi2xUzEYjoY+w8/PTMpcMOUTLOw0axqnwy3F1opNOgkuNs
	47Y/WB3JOnYRwFMOh1mpICUETWdw7rAIJe0pakgLVkMVDK2d8Imc4cw3qdF7e9qDD4bDp7c4FTJ
	I470IX3x9mIicQQ/WHSEvKhQB9a1IFaxmTeh8PEz3IIErLalyJ6gH3LpgeK2oHR8EDFRAOBcSk1
	Pg9g4JcaOr3ANrhyKeWGK6EbNM1BzCkTJf7gAhtZUJMiF7l/cMLrESR21SXa6Mqy3qwD1wMjMIS
	o5cIWlGWsPo8kBhj1sSnS65kxeFnbYnWo38kRW0uShQdZH0WAFZFguk3ajSD4U6Y=
X-Received: by 2002:a05:6a00:3498:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82f8c8bede5mr12500271b3a.30.1776702612278;
        Mon, 20 Apr 2026 09:30:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3498:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82f8c8bede5mr12500211b3a.30.1776702611609;
        Mon, 20 Apr 2026 09:30:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:58 +0530
Subject: [PATCH 05/13] clk: qcom: common: Add helpers to control clocks
 using CRM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-5-eb27d845df9c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX+5uYln/ZpRVB
 hzWLuSXCGpB7IeQ6CxcRcq7cOKYx1hRm0aWdYDOtNJBSkZzpx63z7ZNvPIwhcbcE+61XwVvZwPe
 wvJYFWlzqf+qKHCRWPJjWbmcf/ODHGB5NB0im9L9UmetoaHmlclJIktbjtKaBEnSoGmOrj3mMCz
 xg5uFwg1gdeZ/KKOMLovJ3juYUROj6y/LglAPdCVstaIDqKur7Puh9rH9RkoCn41JBZGfvIbnow
 iVZYp4icgNxteebJy4uLPKGwjVc4MCj0VTBgwcC7WQz9hGiQ/jK4OSAsMbZsnW7L3kwZcVIRgu2
 khxAJ2VdwWGFyaCZGxFUNOgxqQQkQaZu2iEjZ3Hve6rftW9smGCpEyF/NzuuQx/WimR6VOUVL/4
 e672Qp/r4ilDbnEYQoH7bawazQXp7s5r/Xzvhcb73VNwl1TFNEBXt3YR85gXxJuQbp3bue/uS+V
 xYZMsnCeMzReCR/1xmA==
X-Proofpoint-GUID: lctfeNCrf6J2XdWep41Tb1SEMHBcsk7H
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e65495 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rqiFlLygBDmmhMIpyI8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: lctfeNCrf6J2XdWep41Tb1SEMHBcsk7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

CESTA Resource Manager (CRM) scales clock frequencies based on
performance operating levels. Introduce qcom_find_crm_freq_index()
to convert a requested clock rate into a CRM LUT performance level.

Additionally, add clk_crm and qcom_clk_crm_soc_data structures, which
capture the CRM-specific clock configuration for a clock controller
(register layout, LUT information, CRM device etc). This info is used
to read frequency lookup tables provided by CRM and for sending votes
through CRM to scale the clock frequencies.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..968e19997daf5eebec65315974cd0c41e08e55ec 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/export.h>
@@ -80,6 +81,44 @@ const struct freq_tbl *qcom_find_freq_floor(const struct freq_tbl *f,
 }
 EXPORT_SYMBOL_GPL(qcom_find_freq_floor);
 
+/**
+ * qcom_find_crm_freq_index - Map a clock rate to a CRM LUT performance level
+ * @f: pointer to the frequency table
+ * @rate: requested clock rate in Hz
+ *
+ * Convert a requested clock rate into a CRM LUT performance level index.
+ * CRM treats performance level 0 as CLK_OFF, so valid performance levels
+ * start from 1.
+ *
+ * Return: a non-negative performance level index on success, or -EINVAL
+ * if @f is NULL or the frequency table is empty.
+ */
+
+int qcom_find_crm_freq_index(const struct freq_tbl *f, unsigned long rate)
+{
+	int index;
+
+	if (!f || !f->freq)
+		return -EINVAL;
+
+	/* Return 0 for CRM to disable the clocks */
+	if (!rate)
+		return 0;
+
+	/*
+	 * Calculate the perf level for supported frequencies starting
+	 * from 1, since PERF_OL 0 is treated as CLK_OFF by CRM.
+	 */
+	for (index = 1; f->freq; f++, index++) {
+		if (rate <= f->freq)
+			return index;
+	}
+
+	/* Default to highest corner */
+	return index - 1;
+}
+EXPORT_SYMBOL_GPL(qcom_find_crm_freq_index);
+
 int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
 {
 	int i, num_parents = clk_hw_get_num_parents(hw);
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e8f432ef34ce32c930cf045f6ae7a..9987cec84324a258f3405c7b9093237f52a41b45 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2014, The Linux Foundation. All rights reserved. */
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
 
 #ifndef __QCOM_CLK_COMMON_H__
 #define __QCOM_CLK_COMMON_H__
@@ -62,6 +65,39 @@ struct parent_map {
 	u8 cfg;
 };
 
+/**
+ * struct qcom_clk_crm_soc_data - CRM clock register layout for a clock controller
+ *
+ * @reg_cfg_rcgr_lut_base: Base register address for CFG_RCGR LUT values
+ * @reg_l_val_lut_base: Base register address for PLL L and ALPHA LUT values
+ * @vcd_offset: Offset between consecutive VCD blocks
+ * @lut_level_offset: Offset between consecutive LUT levels within a VCD
+ */
+struct qcom_clk_crm_soc_data {
+	u32 reg_cfg_rcgr_lut_base;
+	u32 reg_l_val_lut_base;
+	u32 vcd_offset;
+	u32 lut_level_offset;
+};
+
+/**
+ * struct clk_crm - Clock CRM used to communicate with CRM
+ *
+ * @crm_dev: Pointer to CRM device structure used to communicate with CESTA
+ * @regmap_crmc: regmap for the crmc instance to read frequency look up tables
+ * @regs: CRMC (CRM clock) base register addresses and offsets
+ * @max_perf_ol: Maximum number of performance operating levels supported
+ * @client_idx: SW Client Index
+ */
+struct clk_crm {
+	struct device *crm_dev;
+	struct regmap *regmap_crmc;
+	struct qcom_clk_crm_soc_data regs;
+	u8 max_perf_ol;
+	u8 client_idx;
+};
+
+extern int qcom_find_crm_freq_index(const struct freq_tbl *f, unsigned long rate);
 extern const struct freq_tbl *qcom_find_freq(const struct freq_tbl *f,
 					     unsigned long rate);
 extern const struct freq_tbl *qcom_find_freq_floor(const struct freq_tbl *f,

-- 
2.34.1

