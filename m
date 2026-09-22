Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CD38425B
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102712; cv=none; b=GQDK5nNhjXXkkJlqWx6N1GYMn/oE/nGNtINFpFa54lj0YrAqseKq8t4QK3AYcGze5gliQNM6lgxP34IhNqcoxCKsxkf0mQOhpfpJ9AdDUHpsyxznCrKopZe/3Dx2IQmKhoVCiCqkpTsYqsXgmIrW/RxhbrAzN+ju8oQVvpbiGbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102712; c=relaxed/simple;
	bh=6pZSMPhpGtVh1HeRr5p/w3rxRl09Jzjmo+bfpYnGCwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VpuSiJeF3DPWKCeWZlKXCHMpb8tj1AZtKj4Pf2Hrzys/Ervh7cj+jVw46Csx6L+WQ3PmTk/z0ZvGGX2IaP6mKHJ4590HqZhyaW/XH0k8RWxU6/mli/EeINaMJ+qQTczs+FuYywP+Sgwxe3dmGjxVX1h/AeMAENdJlvL4qtBiGk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5b3ZpEl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNYkdTss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5b3ZpEl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNYkdTss"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7fI03757284
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ODhrrCwnGw2
	W3p39B9wjCOIxv8MLy2qdSvEcpifGmbQ=; b=Y5b3ZpElzNbReDuSDEWq6GMYK25
	gvBVZV8S6bnyr8l3v/PVZo3eRM/Kfj4rSDff0EO5cprhIET8KKAvA9Gx7aVV/BaY
	5PIr2iQPW3AlFxSKiHek4e+CZqUXWUig5yhDBqpAbwfIrH41Xtri9se3+6u220Eg
	WeZ3MQcuaRVMfyB9hqOWM8Pc8DsypcSjsdRBl7Q/11dJHf1XrPo72xbFB/BRjitG
	x19Uf/nqDnJBFVYCHxvPuCjjylX/MItUOCCzVRV9ziAvzngnVpqUL92TsixiBH8o
	0G9BdoIqA7e7aVZrY4Z1wz07KgXLJ4SMnJc8ElkKgow6OburPeVa8/5DjTw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113wdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:02 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c833d4bd04so90959e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102701; x=1790707501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODhrrCwnGw2W3p39B9wjCOIxv8MLy2qdSvEcpifGmbQ=;
        b=HNYkdTssTT8Frv91RbqQjVDcRcTrH9zva8S/Mu/2/ZuQDWzJmALvR9FVYnDb0oMGk0
         bzATk+/0IwCv5K1WubBv3c4dRV/nrXb+T8hzJgSd8wWLnUhP3LTz2vlozphJvZ2+xYIC
         7voI4g2I0KL1ffHFtxx1Cg9P0juKVTHauRIkXXGifcEvt3fieU4TMRzczn1Tzm15D7e6
         ZRJZkS53gu9RpNp+rMGD/opdzXx3dR+J43TflpJibF9CvgPxxRU705bUlNZFLRQaA0Mo
         UBA5EbXBJrJj3PQSaEpzoKf+v8VNyyL1MbByvsRjLJOzmoRd8TNKfwMrdmy6pJngFD86
         PC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102701; x=1790707501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ODhrrCwnGw2W3p39B9wjCOIxv8MLy2qdSvEcpifGmbQ=;
        b=iCMt66I3/U9EBGZGzAk78oAYcHH7VocX0BbFhxXQ1ZOzhV0WUbsylB8lRY3cG0lLTy
         5WRQL+W4LsswOgDrXOYh7LRt86ZvLXDRXKce8PhvV36ksigblDFuIoCqN5l+iwYZ7rYM
         rmoK9rB1AC5T3E9zHrK53bzrakKLazS6lzpm0MSoeWQsFdHp/KqzYZVzMG7HulccCGrr
         q3jwom4pnDLg4ghr48Zqp19Ly4G9CsNB9MGm8MsiBecMSHxqtwR8xd28Ijk9YjCS2g4v
         WXdpyDacjUPbfWrXosqwv3Zbs+SxcK2NwB1iqp5jZqMEDijPvmBmab5KS/QPj5ayMNss
         YYWw==
X-Forwarded-Encrypted: i=1; AKwUvBxpkUvCaqHxDwvjO0iAjCIS39ycfBD3NkbFHp7SiWQtuPMm/x0gxDf8e9m89wDJtQzmSnacgLhUo0s=@vger.kernel.org
X-Gm-Message-State: AFuF++l/4y1Uawn0KqYulfRDYUqJtesINJ4i6H+hMNWMU5jNQduWzZi9
	ngIN3pUXr5iOIBrw2+fxxN5MjyIx0ZE8a55ANCecycRHj00M8MPlCUaNjl5nmeSYt2bzN+0htvj
	WBGnzSH/ohEa2lndQAQxhtvEq3AgJTkHh7hpPFOmvWh6Bzvam47tVvaoFvnbIjzg=
X-Gm-Gg: AYBFou0EA2rV2aixsDJvGThP5YsS3RaBKIFJiNRAaoF8bxsVvdDjcHbC5c5OrH9agS/
	VQxOMSnKfA1XD0IE8KWzL5yYcI/ca3ZcT5lsyY07i5pix4bZv+EuyhDZUldd3UDH8xTf6F8ruNR
	g3WzlikNC3C8hSZjRDFO+iIwyTeVgN0BFynbeDM70DR2UoEzBB+NJ/5QV28BmUucAfLQAVsu1ER
	XHSUbcyW8qyA17tDeE8CKV6HC4MK4tWwgjYu2qtTequZPwMjNmunSHWVidqdlK7w5VPOJ0oBDez
	FqwLaPA0TnX6ec1g1p1kRzLnp6126tKcELqsXPxin4m1v23oW9cb/rDg+h0EklSTcVAm2zt+u4A
	5hoHauR2edsS0SSWhZbrxiH6Bo/WPOE/GFNIN6puFACuSqJnEN2jb1qyeYETyQUIc
X-Received: by 2002:a05:6122:8c8d:b0:5c9:a60b:e5ca with SMTP id 71dfb90a1353d-5c9f1666f58mr759842e0c.13.1790102701382;
        Tue, 22 Sep 2026 11:45:01 -0700 (PDT)
X-Received: by 2002:a05:6122:8c8d:b0:5c9:a60b:e5ca with SMTP id 71dfb90a1353d-5c9f1666f58mr759819e0c.13.1790102700898;
        Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver for Glymur
Date: Tue, 22 Sep 2026 19:44:24 +0100
Message-ID: <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QO64GWi2Ng7vr9JoYMM5LIVgKyqyne1B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX9vQKCvCrjZtj
 gEODXxHnYeXElVbg4KQSoXmB2+snBITuXNmvVKCAfXK/D6wIvaB5T0UgeTIeV1F/m3yXJ60IfDx
 21yrDfr8n+i8JeCDjrXZFpKzPV8FFpM=
X-Proofpoint-ORIG-GUID: QO64GWi2Ng7vr9JoYMM5LIVgKyqyne1B
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2ccae cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7GdS1con5BCYmhUutoQA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX7Nc7XCA9ZVuy
 NX2kwv3X57pDpY2YVMwEzX0TFufsDMqASoui6U1NMt/MT0j52NfLP9pyE5QmKlz2xYTcjbceUBL
 2e4M01yC6W4FjiZl3mmp34A6Nca3hOBry6ZX9nwCE14CnwFFMQs4VDbmRhLMw3rALYKsLBIaYTJ
 EuAMm/gTXufbCVQLiEtKcs344xQh7NiR4eAbjpotndo8cH0bHWFHAGwMAUVR5JCqbhWdQKX20lf
 CYR3lhkrVgU7vqFwI35E1M2/eaeJRn2ws9Rk13f54eeJH/y+epyuGZTlle6lYfxMS82aeZZmB5p
 2qBnTHR2DVEeTpsbXA/tbjw9vU1LmTWBHSgKWC2+UYGT8uBsKDkxRkWdL+p5DZhmj/h4s+gPPRM
 KSVbXvuFNpBVQ+bvDGffU6IpqPdu3Gvmv5UZkAEpzQgQmvRzzN3eGa5tPJzAlVJDkBCMBuQq0AY
 6Uo717j+d3dGyidAqfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

Add support for the lpass audio clock controller found on Glymur based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          | 11 +++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/lpasscc-glymur.c | 70 +++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index b3ffe1dced01..1e571c237fc1 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1253,6 +1253,17 @@ config SC_LPASSCC_8280XP
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
 	  controller to reset the LPASS subsystem.
 
+config SC_LPASSCC_GLYMUR
+	tristate "GLYMUR Low Power Audio Subsystem (LPASS) Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	help
+	  Support for the LPASS clock controller on Glymur devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.  Required for the LPASS
+	  audio macros and the SoundWire compute-mode controller to leave
+	  reset on Glymur.
+
 config SC_LPASS_CORECC_7180
 	tristate "SC7180 LPASS Core Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index a6c676f68b79..c8348218b6b8 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -149,6 +149,7 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_GLYMUR) += lpasscc-glymur.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
new file mode 100644
index 000000000000..97fc099983b6
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+
+#include "common.h"
+#include "reset.h"
+
+static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xA0, 1 },
+	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xB0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xD8, 1 },
+	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300C, 1 },
+	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301C, 1 },
+};
+
+static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x1000,
+};
+
+static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
+	.config = &lpass_audiocc_glymur_regmap_config,
+	.resets = lpass_audiocc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
+};
+
+static const struct of_device_id lpasscc_glymur_match_table[] = {
+	{
+		.compatible = "qcom,glymur-lpassaudiocc",
+		.data = &lpass_audiocc_glymur_reset_desc,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpasscc_glymur_match_table);
+
+static int lpasscc_glymur_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc = of_device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe_by_index(pdev, 0, desc);
+}
+
+static struct platform_driver lpasscc_glymur_driver = {
+	.probe = lpasscc_glymur_probe,
+	.driver = {
+		.name = "lpasscc-glymur",
+		.of_match_table = lpasscc_glymur_match_table,
+	},
+};
+
+module_platform_driver(lpasscc_glymur_driver);
+
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>");
+MODULE_DESCRIPTION("QTI LPASSCC Glymur Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

