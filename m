Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7EA459AEB
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804564; cv=none; b=AYuU4Ug6u3j2KnIx65T9V0U9ZKHqZ8feDF4wCV54ka0JvEFNyXqIQC6qpOVvXUpzsNfLwDSHQ1qBaaU//jaiJZHBdIutFV2zKmVicDXpe9NhNK7+iCVwgKOzET5XPvxKdSYxFLb8Lj5QMk+1PFfaZRIRkIuqldBULGhXGiWXNSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804564; c=relaxed/simple;
	bh=AeF95fVBkXQHjZe3deRFzWsnd2r2EkFVq7mGy0W9i+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sABBZ+REkJoqnOODwpO5Lc+HXBqZQY9SFy9w7qbAPwkXjNsxOWM7V27AkEQJpVjkoa6MzoYfdtfrJjzd14o4sXtZsUJO65QnS4fIPV34/Vad5DXpFmy71fg3Y07pQ8j09X94dXXTdOpBUbqWEuObEE8eHPx+qbbUKlXBK5bClnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bm+zaaL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9d+zeYF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bm+zaaL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9d+zeYF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qV543044533
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y/hifr7TctT
	IAM+pED/3FIWf38Eroiy6gXo1FithD2M=; b=Bm+zaaL1HCuQxAQdLX//7ijF4sv
	sgXikxrx6wov5f7p1WUCvVXQ0zVLiYLzGQYkJ92aouTknROOAismoukiG4hPQ7MY
	0vW4a++HbE/GnOwZ9jDCSgBSQy38WKDP2FcFPtvREOgqrGCUYIxYZNgmd7vVDFf+
	yfuU2paxYZXrUICjT20DscZEzrKs3O41jw8YZYOWUEiPJB2ayvG/8dZZI8/fyEyW
	VyQcGJ3JaAhkIDddGL9S+XNK8HbfNSxHoaxu0NxVQ5O5XA4Sia+mzdwfTEa4jGv/
	ziibXRK7HOAEto48qKOaZNuuHKg2FsOGKkVw4zuUhrQtJ2KufHUnRR8+GVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8rcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:02:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so820155a91.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804561; x=1785409361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/hifr7TctTIAM+pED/3FIWf38Eroiy6gXo1FithD2M=;
        b=g9d+zeYF2TkmQ8jCYLHiPKsaUi3DZ0AQ7q905AvTCmstjxz9ju23aNYnKk8oQIMoXB
         AWS14ONfY7/N5gUO40X8+0yunSGD2B7yhDy+XiwgP5wpVLNtQ5XSV/SEVR7XRJ0daqV7
         AFF3yulXI7pragenibpNczyCcomBQ7c5TirwQErJdDlvPOVtshNPmWquEM3PQ7+lZ7h+
         SVpMFuOT4wLbjXfV2Pb4HNA0q5Qkj6rHXwc/WJHrllH9eu5bsWCBZFNPNMjT47vG8PFl
         SkE+kPospxqk03WL0OYiu/m2ymvoW6AQkP6Hvl9jqshhFrpuZUJitvGwGGypLQJ2Vhrj
         D7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804561; x=1785409361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/hifr7TctTIAM+pED/3FIWf38Eroiy6gXo1FithD2M=;
        b=GQfOGMC68FsgWI32C2C33hc1l4XSqDi8lj6YY3ts/voSCmO1DwdlePK1wcjoRhk7M+
         N8oguJYKGbHR33RmOO/avr2zdNU8xWOocPqmNdscmZtkAI+4O/4rBhmKzesR98blO7CI
         jCmfqo6GpDer42jp8BTgiesaSl4lbyVFsN83JDJZvCM2spJy999fGxxhto1wfNzhn4St
         d8bAeWQv33PDcl9TImrnMZzC6OXaDcUJdlKAqka1GS6J1l1WLPFghXa+PcIe8EMGnLlj
         xH87CcFXTlDhbQB4DsXQ227Zl+DCOmcmM2ohCjQ0kU7cExwypRUWs6iFzPq8IRDXhXqw
         FRBA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0YKNaUvh5FqXcCHCEesIr16edVKqekcpTmgpgGFgKJU4NJohBBvppQ6EUoTIjaayhR+vVcsUHeSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKJSoQcuChWrgwCtuUkyFHOfYjfpW5mywMVsmzvKato3JEoyoM
	iynPQd1Bl3PPy83FDdkugZW0J657xrGKZzvj4PER0xDiLfcF+pLtow9r+uDPRU6hRcgdsTuPAIs
	sR6DHsdi+LbUjN5Ex5oaLYMxR4uc9JZxS7f7LYlbloq91hmlB/VB51KepsGvkJuV/qdlsWKY=
X-Gm-Gg: AR+sD13on2opPFyzHmF+xpoOacdRP7k0waLR2EC8YzzX/XJ9weBsd4ae40Sd0G1ciZE
	S5pigYiqLJ5Bd1S9HuAfUNn+ov6h2u6Itn80J5ioN5ln6hQb5iWIo1L8UGJPMYbW6FanefiwFmX
	mje/5owgfUIPxGMkg+ozHkfvNZoEUi0xG/qYGPteZAUrHmeNWzgMrUXleYWOf7fefrZFvnXcVvl
	HRpBrnNaVC+C+uHPe1WMGshIHCvqwUfr9gYcGgg0L+tyMaJAoWXMoJeK0DOx/qsNLBfeypUcvI+
	lirqUjOTHIwG5joDjAQazL85cGgQSsd3uRA6BDYLobfEn5sOvryGx/0KeXiwt3fkvASeVBsodyb
	i3S1f7GVP3Ci5tX+Fbg==
X-Received: by 2002:a17:90b:264c:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38ec666d8d9mr2743149a91.43.1784804561322;
        Thu, 23 Jul 2026 04:02:41 -0700 (PDT)
X-Received: by 2002:a17:90b:264c:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38ec666d8d9mr2743086a91.43.1784804560694;
        Thu, 23 Jul 2026 04:02:40 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a7738sm15662491c88.9.2026.07.23.04.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:02:40 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Thu, 23 Jul 2026 16:32:31 +0530
Message-Id: <20260723110231.1586417-3-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
References: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfXwGrWKDkEKtOd
 XO6tx1AFqiHVZehsK027oNmEA9wRutvmRwcF4CvgLYRqvAui4r3qaejohY7ow9Grg7rl4FmRf6w
 xyIe7mkWuiztvMzZx8k3gihNmm9D3mM=
X-Proofpoint-ORIG-GUID: Fa0ogzW8C-9HMaukE_CYLFAWrD61Bmnt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfXwjRBWDdsdR43
 2rcXyvQr+0mPMUx/xhsM7lpLGc6w1nxcuIGjBaIlLy8mIvgYxz76H5t6GDwYgFGOeNv6AGOoE0Q
 l2VTkUkuCjDmxcJJpeLIuY2v1ZT4kLBRJg4/d2o6jSAiiIgiGVzpvTPb04Dny6GZtY0oOOGKfMc
 6CZZ865RZWelYdd+v6m5nXUiw497kUcDSkq8GNfZJGTA58VUpdPfhRmrtJT71kDndfBCcCk8R4l
 cJDp3Gwm2op0YHl2qwdCu7olFHfoFxhyp5Ej0KWYbRkwmUeyIsHrYWVseKwN4XIOzJN3hhkxUgf
 swHcHcVKsBo7i0Z+J8thDZoJPgoYOClHuFZKqTZU4awkyUBOUs4qbM1Wi1lu2JJ5Na+XE8Zs8Hi
 1fTsEmBFXJ/ppGlz3ejX8Wkm2jaZ0TOoocaEzi5IBYCuvKGX/Jg3kY72ODa+YK/RB0Ay/M2i/ZE
 rNmlvTNvOGttLY4mTkA==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61f4d2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_fnN9qMbF0sNbu7Dp7gA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Fa0ogzW8C-9HMaukE_CYLFAWrD61Bmnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecases and
can serve as a periodic wakeup source for the DSP.

Add the LPASS VA CSR driver that models the rate generator as a clock
provider so it is enabled and disabled automatically alongside the
other clocks during runtime PM resume and suspend.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  12 +++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/lpass-va-csr.c | 143 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/Kconfig        |   1 +
 4 files changed, 157 insertions(+)
 create mode 100644 drivers/clk/qcom/lpass-va-csr.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 63f271aff177..6ebdccfe37e0 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1998,6 +1998,18 @@ config CLK_GFM_LPASS_SM8250
 	  Support for the Glitch Free Mux (GFM) Low power audio
           subsystem (LPASS) clocks found on SM8250 SoCs.
 
+config QCOM_CLK_LPASS_VA_CSR
+	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
+	depends on COMMON_CLK
+	select REGMAP_MMIO
+	help
+	  Qualcomm LPASS VA CSR block contains the rate generator hardware
+	  that produces the HeartBeat Pulse (also known as RateGen Pulse).
+	  This driver models the rate generator as a clock provider so
+	  that consumers can enable or disable it via the common clock
+	  framework, and it can be used to synchronize the start of DMAs
+	  and Codec Interfaces or as a periodic wakeup source for the DSP.
+
 config SM_VIDEOCC_8450
 	tristate "SM8450 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index db7689ee5dc6..2be7da737eba 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_QCOM_CLK_LPASS_VA_CSR) += lpass-va-csr.o
 obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-csr.c
new file mode 100644
index 000000000000..1d0805789e25
--- /dev/null
+++ b/drivers/clk/qcom/lpass-va-csr.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_clk.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define LPASS_RATE_GEN_CTRL		0xd000
+#define LPASS_RATE_GEN_COUNTER_0	0xd004
+#define LPASS_RATE_GEN_DELAY		0xd010
+
+#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
+
+#define LPASS_RG_CTRL_EN		BIT(0)
+
+struct lpass_va_csr_data {
+	u32 counter_0;
+	u32 delay;
+};
+
+static const struct lpass_va_csr_data hawi_csr_data = {
+	.counter_0 = 0x960,
+	.delay = 0x16,
+};
+
+static const struct regmap_config lpass_rate_gen_regmap_config = {
+	.name = "lpass_rate_gen",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = LPASS_RATE_GEN_MAX_REG,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+struct lpass_va_csr {
+	struct regmap *regmap;
+	const struct lpass_va_csr_data *data;
+	struct clk_hw hb_hw;
+};
+
+#define to_lpass_va_csr(_hw) container_of(_hw, struct lpass_va_csr, hb_hw)
+
+static int heartbeat_pulse_prepare(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+	int ret;
+
+	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
+}
+
+static void heartbeat_pulse_unprepare(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+
+	regmap_clear_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
+}
+
+static int heartbeat_pulse_is_prepared(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+
+	return regmap_test_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
+}
+
+static const struct clk_ops heartbeat_pulse_ops = {
+	.prepare = heartbeat_pulse_prepare,
+	.unprepare = heartbeat_pulse_unprepare,
+	.is_prepared = heartbeat_pulse_is_prepared,
+};
+
+static int lpass_va_csr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lpass_va_csr *csr;
+	struct clk_init_data init = {
+		.name = "lpass_heartbeat_pulse",
+		.ops = &heartbeat_pulse_ops,
+	};
+	void __iomem *base;
+	int ret;
+
+	csr = devm_kzalloc(dev, sizeof(*csr), GFP_KERNEL);
+	if (!csr)
+		return -ENOMEM;
+
+	csr->data = of_device_get_match_data(dev);
+	if (!csr->data)
+		return dev_err_probe(dev, -EINVAL, "no variant data for compatible\n");
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	csr->regmap = devm_regmap_init_mmio(dev, base,
+					    &lpass_rate_gen_regmap_config);
+	if (IS_ERR(csr->regmap))
+		return dev_err_probe(dev, PTR_ERR(csr->regmap),
+				     "failed to init regmap\n");
+
+	csr->hb_hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &csr->hb_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register heartbeat clock\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add clock provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id lpass_va_csr_dt_match[] = {
+	{ .compatible = "qcom,hawi-lpass-va-csr", .data = &hawi_csr_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lpass_va_csr_dt_match);
+
+static struct platform_driver lpass_va_csr_driver = {
+	.driver = {
+		.name = "qcom-lpass-va-csr",
+		.of_match_table = lpass_va_csr_dt_match,
+	},
+	.probe = lpass_va_csr_probe,
+};
+
+module_platform_driver(lpass_va_csr_driver);
+
+MODULE_DESCRIPTION("Qualcomm LPASS VA CSR heartbeat pulse clock provider");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 76e90144ea91..704401faa147 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2907,6 +2907,7 @@ config SND_SOC_LPASS_VA_MACRO
 	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
+	select QCOM_CLK_LPASS_VA_CSR
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_RX_MACRO
-- 
2.34.1

