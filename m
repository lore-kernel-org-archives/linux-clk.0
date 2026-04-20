Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A253335DA60
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702644; cv=none; b=hd825D9Qase7Y1y3oLFW/xb6lDeDt6S6PEeeL5+CvgL7M9d9vjHPMrFG6NKJuEZ/xBB/hcSyQZFH2grlgzC7iWQtsDDXHIS78wdJj/QVUvw3EwY6umeLDiv09YYFqJlHVujNJGD6IvV6ivfdjzGK43cV8Ki68rbEOQhgwNGfO40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702644; c=relaxed/simple;
	bh=DZ3KmwiHC5R0rNOGb7H/mzeKapAJF3vVekLdIS3xqas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qlgLJJUImC93In8IC1sFRoqhh0IX3NtuHXN4YoTnQ8RYkkRj4Xp079sMhoHqhybv35BBQnu3Er94S8ZhwBSV46gsRSPdoQa3Of0MMqgfdJhe0QD52elnCRLB3DgJoeZi4sh3yo4ji8TDhLhigCC+NFCV3zuZvmIV1bdyu58a48Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9yGoQMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLFf/CBb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9yGoQMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLFf/CBb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvMVx3015168
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnXNKvGPM70nBzOIG5k0xotvjWoRzt1LHDmn/HOTJcE=; b=n9yGoQMaJJvAt+mf
	q+IohmfA10CSt6DPqEwmk2HhCHcoy+1VZ8cC7wd4pbGQ44JICOlZN6jGZYbzB+o9
	W6UKBIpvd0tEBiY9KKdEXN4BKZY3BU8D89sd47JUzi/gEkP85yU4klGuQ+C4eQzE
	kztGO/YRs3xKpnbmrIqcwZaihQL2elhtlRQljZ3UfrBEm/h7K4cJe3Wt36UlSDk9
	eqgSeCU0ZrV91SK8hZl0CeM9bPoZAlhUuW0ihemKRN5ETqY/fi5IiU5CIwQs60bq
	jSH6Nv7fLMygth89AHnYLaenagXilX1phPSZp2oYTOfJHnsLDUMo+r5vcsT8VI2R
	txiUAA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuks7sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so2601149b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702640; x=1777307440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnXNKvGPM70nBzOIG5k0xotvjWoRzt1LHDmn/HOTJcE=;
        b=HLFf/CBbEC9AvP421bl0vA6e6Lq+qJE+mudsKAFA4VicWtIufeT19/8Q5lbnszk+hz
         8QWEs653IciTAJdLc85ZGOm7ii/gPi820JKJv2ZQ567XzN0V8TkvrsVgb6OE4cppwVv8
         jKViwdVNNN2dy4poWBvyOzQhnYmD1cYqQOWrb/fzUwvQnv4vOv/FzAVOaP6L9em3pOHl
         tcLv2fYNsL1L1J1X+/tz11lXTlcJ7VNMzj5ax4rkpWxXjFu3iYDG9F7y8TBIbcO2Lsf7
         PjR3oPtDzvZZnmQcjD0MBco3KN/iy7HeiV5tnQmyfZQBu30Kr6VObZdzipGolScHIMJe
         jblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702640; x=1777307440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vnXNKvGPM70nBzOIG5k0xotvjWoRzt1LHDmn/HOTJcE=;
        b=EL0YFzT6n0KDJTTFqgrvLVxV6SGldP/dpPGou9lXy5/iHoURWYeoaweVBeRNtI5u7L
         yUuFXU19wuORCwzRbJWzpGoAjZP4lE2mezNBydwLNedhVR94foOrHn2pdavjVt67GeZB
         4HRzw2wm7HPapt0jKCFbtA11xk3Z4v9GL7hCcnSOyU7indebXR7x09hoR/BgS8OGM5a9
         3UeXCtR8oEst1BoECn+h6NMPQyK9fiqDLFLiNS+SqriP9TfWBDKpN2AOSFkdcEP/UlIx
         jFLg7/w12bV2wxFXSg5dghVTEOSpdICMtyqQLL/N0yHF8hEgM+sp3Vj/KyEiS1Jrymv0
         jLsg==
X-Forwarded-Encrypted: i=1; AFNElJ+FwtpHQ3TtgFO0B9h3O1xnBp82BMvOCgYdGNeWrAnVOcNU+p540hrN5oQXXaVtj8oT36ceDp1XNzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztPzV9XXP2AlMqaySHg8sr7qZGlMf1irzTMaXmbnfea7YGX9o7
	QOvJ5RneHJ7yxl4UfJfzBjEq1aB8flGMMHtNgT/t7Jja4Na0rLqroy5X8Z11Luo9hsuFs5sHtho
	U52Vh9lV2lciJZm2HDjTab8QP/0LXnGCvJhdTc4V8Ir4TTkBx/poGg48V8Z5wHuU=
X-Gm-Gg: AeBDietGakSQWDTvd82H5Y2IJ3ad/77vlIs2z6v14UDMzjSILh/MS6wGonSaawIntD1
	dxjs2eNM94F6nMUiVVRZo/hwI4n5YtjWHyzsx/7KC235mYxGxvO3AIe/FT7nbmGkz2kTAkc6mIw
	ZTsy17LA0UnFZpw7BpbxiKoe3xHN7OMp4KkB0OvszZnF9yol8D4HmmJHIVOHw6KPMpj/zKw35KF
	wjUhmi9Tfj1mixYK11E27idxhAtLC/QPzP0yzRoW+vaGvbsiBj+qJ8sCRfAVXHXzVNrZRKaJsQe
	JaFKiKubesDiM7/xzRRiWRKIclax7RMBjM+YSlUxYfDD5KVPWeHKullhyvw2dj964PayS6nos2x
	kcHZPg167JATBuQz15gHSwkSyCvGavum6kbUb6NCVkQO+LMJvR6JoqiQPYcHZGRc=
X-Received: by 2002:a05:6a00:3028:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-82f8c94c5fbmr15549494b3a.46.1776702639891;
        Mon, 20 Apr 2026 09:30:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-82f8c94c5fbmr15549416b3a.46.1776702639195;
        Mon, 20 Apr 2026 09:30:39 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:38 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:59:02 +0530
Subject: [PATCH 09/13] clk: qcom: common: Add support to register and
 control clocks using CRM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-9-eb27d845df9c@oss.qualcomm.com>
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
X-Proofpoint-GUID: mmMgRD_3QvBhfVUleQ98eHqJVhyEbRwm
X-Proofpoint-ORIG-GUID: mmMgRD_3QvBhfVUleQ98eHqJVhyEbRwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX5iOjXlrhPit+
 qSF2IW+2UU1CFoC/EAXvVEOQGDcVUbFNuUEDILiIlwkP1llWjJcIAGAK1NHNFNBcZT1irfreuro
 xoJn6ZoOoJogMRjMz2U+aP3/aCSbET2Sg+G/oHlUSHkcECzcd+FePMWCHQfgaK1IXR+r6kx0tFQ
 mtQPgZDTV2D/2wVsjOd5fffqd+4yP/mfvLzOI0ssGs3/s9CYmt0n2xl8GzBuUMg9A6+/Seh/sSL
 AzW5tWLdTgeeKF/BetdugaYEhmn/E2wwoLSaJysWYIOL1TUv/Zsb0mzy2PfStv8SUJtoUZF/ObM
 ch1DXmfm2VAcyT+FzEkqIhvBPxzUCwzx4S5MEvDwPDrymzOlCWJ1XexjkboCliRcuD3YZF9u+S1
 24jS0uuP2nfCdt347t3jtPIIVs4XnetAPaAmYcV3yPJ1SkH/22vw1n/zDC6jBJNWmiMpKTXNlVY
 nx8Shje2YY6nIPwgwiQ==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e654b1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BZ6vxNvidA0H8-9MRDoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

Add support for helper macros to maintain the list of CRM clocks in a
clock controller. Add support for qcom_cc_register_cesta_clks() which takes
this list of CRM clocks and update the ops of these clocks to CRM clock ops
only if CRM is enabled.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h | 19 +++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 968e19997daf5eebec65315974cd0c41e08e55ec..14dfae80e567852d09a5972858ae14c62e5074ee 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -10,10 +10,13 @@
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
+#include <linux/mfd/syscon.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
 
+#include <soc/qcom/crm.h>
+
 #include "common.h"
 #include "clk-alpha-pll.h"
 #include "clk-branch.h"
@@ -266,6 +269,47 @@ int qcom_cc_register_sleep_clk(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(qcom_cc_register_sleep_clk);
 
+static void qcom_register_crm_clk(const struct crm_clk_data *data)
+{
+	struct clk_init_data *init = data->init;
+
+	switch (data->flags) {
+	case CRM_PLL:
+		init->ops = &clk_alpha_pll_crm_ops;
+		break;
+	case CRM_RCG_CRMB:
+		init->ops = &clk_rcg2_crmb_ops;
+		break;
+	default:
+		pr_err("Invalid CRM flag for %s\n", init->name);
+		break;
+	}
+}
+
+static int qcom_cc_register_crm_clks(struct device *dev, struct clk_crm *crm,
+				     const struct crm_clk_data *clks, size_t len)
+{
+	int i;
+
+	crm->crm_dev = crm_get(dev);
+	if (IS_ERR(crm->crm_dev))
+		return PTR_ERR(crm->crm_dev);
+
+	if (crm->crm_dev && crm->max_perf_ol) {
+		crm->regmap_crmc = syscon_regmap_lookup_by_phandle(dev->of_node,
+								   "qcom,crmc-regmap");
+		if (IS_ERR(crm->regmap_crmc))
+			return PTR_ERR(crm->regmap_crmc);
+
+		for (i = 0; i < len; i++)
+			qcom_register_crm_clk(&clks[i]);
+
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
 /* Drop 'protected-clocks' from the list of clocks to register */
 static void qcom_cc_drop_protected(struct device *dev, struct qcom_cc *cc)
 {
@@ -439,6 +483,16 @@ int qcom_cc_really_probe(struct device *dev,
 			goto put_rpm;
 	}
 
+	if (desc->driver_data &&
+	    desc->driver_data->crm) {
+		ret = qcom_cc_register_crm_clks(dev, desc->driver_data->crm,
+						desc->driver_data->crm_clks,
+						desc->driver_data->num_crm_clks);
+		if (ret)
+			dev_err_probe(dev, ret,
+					"Failed to register clocks with CRM, ret: %d\n", ret);
+	}
+
 	cc->rclks = rclks;
 	cc->num_rclks = num_clks;
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 9987cec84324a258f3405c7b9093237f52a41b45..d00376f058ce1de7aa82ff760f92826282b1606f 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -35,6 +35,9 @@ struct qcom_cc_driver_data {
 	size_t num_clk_cbcrs;
 	const struct clk_rcg_dfs_data *dfs_rcgs;
 	size_t num_dfs_rcgs;
+	struct clk_crm *crm;
+	const struct crm_clk_data *crm_clks;
+	size_t num_crm_clks;
 	void (*clk_regs_configure)(struct device *dev, struct regmap *regmap);
 };
 
@@ -97,6 +100,22 @@ struct clk_crm {
 	u8 client_idx;
 };
 
+struct crm_clk_data {
+	struct clk_init_data *init;
+#define CRM_PLL		BIT(0)
+#define CRM_RCG_CRMB	BIT(1)
+	u8 flags;
+};
+
+#define CRM_CLK(clk, flag)		\
+{					\
+	.init = &clk##_init,		\
+	.flags = flag,			\
+}
+
+#define CRM_CLK_PLL(clk) CRM_CLK(clk, CRM_PLL)
+#define CRM_CLK_RCG_CRMB(clk) CRM_CLK(clk, CRM_RCG_CRMB)
+
 extern int qcom_find_crm_freq_index(const struct freq_tbl *f, unsigned long rate);
 extern const struct freq_tbl *qcom_find_freq(const struct freq_tbl *f,
 					     unsigned long rate);

-- 
2.34.1

