Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6A44052A3
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970298; cv=none; b=Yra5aaXO/qNF9nFutpO690BnTKZ27KfdqAxGK5ckCVaLrhrflpwxwOQzEIfW4YX0g68ZB1YLbscl7NNmFvwk5OBFb61Op0Fz14hGjPntGQvxZCzKpcXHbKC7MvAe4iM4LfLQPNZ0Z5PshNXGyshLt0ptXLztE12VWFfxPvtVf6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970298; c=relaxed/simple;
	bh=kRi9KUiyiURNB0UatawZeEzDOR99f01j7cgA/n8HIm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUp8IMdU8XCz/aEMp2exq7Y/5OmKVVQ194ISpDE192GzZQ8I6qvgo4TpxYRkZxsveQYj/tfD9WJYpsGpwfyVCPUyxNd+nAUpsL+ot3i9aLCkxZLrhkQju0cXCyGsyueVovs+rTZXSXHS5GNXGJDPJ7ZsE8scoXxPbwF8tJm1k6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XP1G1iBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARsiz4o+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XP1G1iBG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARsiz4o+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6pd31882192
	for <linux-clk@vger.kernel.org>; Fri, 2 Oct 2026 19:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/ZWGbUh/8jG
	NuneT9ps/eKOiY506yMQ7wobsGaxA9p8=; b=XP1G1iBGgqJ2QegAfN58Agwy8Qg
	vr7J/W+1g85OKEwiqKl3F3/qwjcs+pXJOaldfgacM3/A3/LKlQ0XnkhyDf2cze0V
	j0snU+0hxJQG+xjwbDfGpgjx4PnipPX+oHxwQQGYsSlOL2ILGZYs9pqE0ZJToXLv
	qlNS5UhvNll3rQibP+wikBgrCGTmhsROOEJ9zLo40orNOEEo2vULkaC6qMYnuunT
	xty5CgBecfLGG0xM+dNZAFFwFFjfbb+BCW1zIvaRCWxzPBu6K1lo/YSZ/yuI9cui
	Z1CoL9lKTjRB/zcnYk841PxyAB/VoTCpW7DMUqWCv9Va9O/TUHCzEBaNtdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ec99a7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 19:44:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc40759b2so278667485a.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 12:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970294; x=1791575094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZWGbUh/8jGNuneT9ps/eKOiY506yMQ7wobsGaxA9p8=;
        b=ARsiz4o+AiN2MtTxRlitLBG7kIwn2OKV5aUaR5hAP1mGgkGX2azEdqAtD4ZMZyoZZl
         8sCPVUwNVXxWjWsw2Nr60NmxLbBF93aJxcBhNE9lk/9rmJ1le55IK9iv3G4DtexIGvgn
         zBEBosDeMGBRDglyJjopM7tyaU6fbiW/Y66B2aUMBE0SpoTANmbYWWi3UdiaDnee7x7y
         tO8woUITt8EgGNUhlk4gOiTyYhSdf/cfZ8mjMfTBDa1Vc0aQUB96A7DR2b7iunK4zJme
         Q8PGxFuI5rx9f/AsVWNuCqXgGbpaE1dMonMQQf919pAYaPLoHaeHSBpK1W4qWWUaH6tJ
         Xj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970294; x=1791575094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ZWGbUh/8jGNuneT9ps/eKOiY506yMQ7wobsGaxA9p8=;
        b=kDBvVmfu9vYVCOoFXp9UhbgKUQD8ErAMpQl2SDLpqQANN6vY5SOBHX+0X8RF/EgDwv
         BWeUWnYuNr3qOWhzZMHZKS7Nk/q3PGQtV6X7ZRjyhBIQjMWvBbnMBek1B3alSQQ2vAPr
         fJYhYnThePx8OAQZGrbWZelsOA9wftEBDh7Poy01PPbj6aAy0GPscvyM/bbjJaHM5MOu
         3K+EpBCIUVW8DLUFV+XWdkYB6Xi5+tp16hodBHr6zqfH6vyDzYeZ4UcgxrlKb6wnoBfR
         n7BLwn5iBINYZsXNCaLpIPhIB6hVI3TyybPwnDxRG6bTluJcGKNmJj8lodHGUVL4ZNl4
         Z0cw==
X-Forwarded-Encrypted: i=1; AKwUvBxJEir2e5fRryCxmc1gcC9TWSviz4da/2A6ePERJwlGTeXQER79ZKPiz7oRLZTBLYyKFlCxVyENYEg=@vger.kernel.org
X-Gm-Message-State: AFuF++nDIPHR+wQdudLOAARqB9fD5tiBK0X9244iewHhb7YA7fG2oS89
	eV3QLuokXj4Ygxzit9pJpKlvf/old2T/vtxOyRBk4Bh6AutFtDXdGF3yoEgxZl3PJ5ixqFvihvE
	8aVQY18KXGxpUn5LL7qrwRORqWfI8ISLksOHkZI6PzUf6JRKbbrZNPpvr13a4fZg=
X-Gm-Gg: AYBFou3vueAD/jqBy8bRDbHey4yX1WqoLuqcZ4X7JPrZAupnHs9+TJYJuLDFMnGYd9T
	lnEcZdgDJ8SF0kDtDOEqaNBfnDy5AlYghT5iNz0nFdvE+WTRAExdFAnWRk1697aWGZLDV4u5zGc
	SuevS4/v39NGZrqBktm9pQxEif+ywTruNb88LAKcz7STboYkE0YWgt7YILbyRMfbsmdprC7aFZ2
	+dcqtW20g/XDJjoxecqYyjYNc+nNzBT/QFwR2LCIdZxOqnX+W1wYR4I11BfcXMdIFK87YaS3pxd
	wdeZRd/qBragmu0g5Dmm8puBwL/6P/bev/Gf3f232yRszQnrqe9nP5Yu0dLPvvwoqlYG0bLIKXk
	dZnWILrvhcVDL
X-Received: by 2002:a05:620a:3198:b0:934:ab73:ac53 with SMTP id af79cd13be357-93cda7fadf1mr713349785a.0.1790970293841;
        Fri, 02 Oct 2026 12:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:3198:b0:934:ab73:ac53 with SMTP id af79cd13be357-93cda7fadf1mr713343685a.0.1790970293325;
        Fri, 02 Oct 2026 12:44:53 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/4] clk: qcom: Add lpass audio clock controller driver for Glymur
Date: Fri,  2 Oct 2026 20:44:34 +0100
Message-ID: <20261002194436.1275056-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R5su1nfx545uoQMkrH4pqaQCqE6iQdF1
X-Authority-Analysis: v=2.4 cv=Ie8Symqa c=1 sm=1 tr=0 ts=6ac009b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7GdS1con5BCYmhUutoQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX5o+Rzzf9sfqa
 s3FEW8oAdfhWGCdxrr/4N2On/vLJMjkRtXP6OrMnos/l6cHny/NcyirLPzOJLFWG07nhEOQFpxO
 BqTsegJqygPh09GoTqpmuogqxZxNLd4=
X-Proofpoint-ORIG-GUID: R5su1nfx545uoQMkrH4pqaQCqE6iQdF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfXwksZKx+D3e5V
 n38PBBoVX+nOXCS9IHWcGVLwRTwVEe3nWVUJH0KTBwsSriNnlut9YHQUjSGLgtz1TEPOeVyf64l
 bGTRKODRh8i/iw4ZF6eVYLRm7fPKPBOiLHDY0VXiqf1RB0xrnzaDw1ro054/3xsu1iTE2Owawum
 hJ8J/HIzO6Cru26RwqVzfhwmyolJct1tZs2lPtxMYuuBuokXLBQv+afyeWJWqRyjpblEZ+ODkcX
 7JDllpJJSsywyQ9r+/cWmtRvh81Mp0fQFNjrkreM36TUWDI1Swezvt+EKk7/y4lVYGXrmNq5GbK
 fBhGqSU7eNiDvnabsaFF6wAsP2Zi9BAgD40nLl3SnQNaly8nIFpoQ22PKin+GfijCGQkE0dOvng
 09YGD9VfEF4GMLZUYslcW+cCmTVeuQiCQXpez4BHg+qmNMTF/qgNGplBvDNwSc6rG33faFJNegp
 CGY2EpMLSgb5r2Zq7vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

Add support for the lpass audio clock controller found on Glymur based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          | 11 +++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a..89e6a636e497 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1274,6 +1274,17 @@ config SC_LPASSCC_8280XP
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
index 6affb5073f26..0c7a67b9cee3 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -151,6 +151,7 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_GLYMUR) += lpasscc-glymur.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
new file mode 100644
index 000000000000..b7fdd76df2f5
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+
+#include "common.h"
+#include "reset.h"
+
+static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xb0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
+	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300c, 1 },
+	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301c, 1 },
+};
+
+static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x3020,
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
+	const struct qcom_cc_desc *desc = device_get_match_data(&pdev->dev);
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

