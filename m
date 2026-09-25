Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA56477E58
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326028; cv=none; b=mFnXVKRxHilVR7HJhu3GCKHcseZSUrlZj5fgNYPjy9nURooa23m4amZ5lIUHe7aZVVCQOcadZKVXs5li3gN5FVH1/sR68Q71ttRmIV8AR4vOaBtTT1xUSmFSzb5mQQRtyqU9D3L3pd3pRu2WuQ9y7rd2NIOkiZJW/lOyO1FFLns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326028; c=relaxed/simple;
	bh=idzv4/vd0rQo+68PWCIkH4PHUd4x00/KI6aG0rgwbq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTqMEMnN3qNFMzHZ9/5ZtYouBjJ+hDay8X7+eZ2yISaze9Ory7j9Co9fPuETPHqnFXHKeK2G9uWs/jgYorF9KdEDdTaJIBcb7zNbENjz3KqArGgu95hEwAaZSPntqvEmJdIKqFeUNWeqawXHR96XUmwbnA4sdGWKyRcANfrk+WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4vOUHgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOdB5aPU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4vOUHgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOdB5aPU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5IjaV600036
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dTFOZ8IDkN6
	23Q2WEMAjS2pcxoPadq6jbVR2SYWGFiE=; b=f4vOUHgqsik0pR3/ZfbJJiH0cGd
	BKwS8TfJiNVgXd69HAcMzSCM7V+6Ymps8Fuph5dD9oP48h6jqtQAP+XseW0nVccD
	1AhVOcE1hOTRmMsKWCkK9nxQAZqFQIECYW+6JbgjkxEHEqiBpib7mVTXNNwVcwOV
	/21Ps0Im5m8ligGRkmZuDHLg93pA12NtJ0cmSxFDF03YtqFpdLjobVpOxqAtJjIk
	6x6FesA3jYsEOJ9jeimOSLtE2Ud6hgquqxeSLmyPSX1atfu6Vnzx9aoQ1Mn5fScq
	5gq+z7SVxLMJONfC65LgnndzA1pOXJwYclSiTzYqHjMS3b7R6zfUqg2eqLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrk00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso123243185a.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326012; x=1790930812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTFOZ8IDkN623Q2WEMAjS2pcxoPadq6jbVR2SYWGFiE=;
        b=MOdB5aPURdNzY5jgnf8ojZalwqCsD/ZWOUBjJBBevMTVB8Qe6pQgg7Wgtf2x//858P
         Plb56MM70+OYmGouPyfmHehsexA1ll9RsbdD41urBufAe+GptHt9IxbpLXs9zeR58bW9
         lbfdjL2CupUg+O4tRaAO29N1lpJAqma25qi8AcTAKxgl2ITMWV464cO+eBM9YHSPiDIw
         hekIJG7N8yPbUAfOx1TeIuJYzORqHoWH+/fSN7UJqQs6/bnOZHvCVzdWW4nuO5Ii1zGu
         HIkdb2O/nR6OuY1ImInDeCVYTRMNiAaQHOr1XuyY7uoN6JpEZwNslte35Xwr4SLV1JoX
         fwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326012; x=1790930812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dTFOZ8IDkN623Q2WEMAjS2pcxoPadq6jbVR2SYWGFiE=;
        b=dNMfB2yNoMiPCrCu2iw0y5Ltd2aNGtigvtAKvRdzykm9J+nOo0F0Cu1VlTkCSfeztP
         c/mgX7yPp7wGOFnLJkKKNfP0KsebVJyslTBm6C57xozuhOaknkGunZU1en6t72mGTI1Y
         rAnXVF3HCJSm1Uw7juHrVHqlNBeJkB1rD9J65e82prcPjm4KfPTuIZpv4vlYUJqHGNpc
         GAJA8ILP8NObZcypLoo+WFbdh2PsisSztSOTt7NTF7DaZL4W8ddUqC9g7zQbDxkm8iMn
         RYKt27ZJFQ5wefOV6C9P89EWTGGw+DnFCnN9YJ2qOm8XdW9aQYju6mzeXhn9hf5xv6hD
         Sxkg==
X-Forwarded-Encrypted: i=1; AKwUvBzDz9XfTA8KR4YrVbopgokAd+W8FcepzL3cn52YBXxXnXxoQ4Wcf98D2gBiPxi61A3nvs9IzmzhDPE=@vger.kernel.org
X-Gm-Message-State: AFuF++l1ga1SWXnO5zdMpZRmIRPmXCZgOq40JEAmqx5VXytSqyd8L0N2
	kN53S3X/XV08ZKEf9PmsWMyAsuABvXECxkCg5QCRLhjsAGxBpyaa3VIptMSwhOMmnJ24sdTIzGD
	uL+88/sHnhkWZee1sjddp1GQ02Tqx2OC+iQsHRXZMbE+0/3mtv7P+v/ON5HmGcis=
X-Gm-Gg: AYBFou350M3OOjfhRNHiFR3Xmlpa9bgvOCp+HE9YL7HAqemdTR/litkhZgqo/6LZ0nW
	I9pTXT+5BeBSQ7ChExBkRRTah/cgNq/zSk9FBCO3RWIQNHj6z48NN6r47bmzGTqpQVBgTOfKvUV
	ZIny67AXE4Lkx3tJZQsQvsOO7/SOjuE+P6gLtBSLZK/lc13xbQoDHfIfysEJ+XEF3iNV1FqOkZh
	drQ8waMvIr493IZNi8A11JDPm0u5Axy0MLVztBC/cWMletDMHeNCUkVvNRZ9vELlckjqzWYPpkv
	xp7J3T4bDBNo+m0A/oFp6QwhNFyP2qvOeMrTtvCgqDlpdS2fzQMGk7Pad1lHCWS5L5TcFfVtmfB
	FbRdQanrj+9vb
X-Received: by 2002:a05:620a:2693:b0:939:3a51:2490 with SMTP id af79cd13be357-93c43c5e38bmr323433485a.15.1790326011911;
        Fri, 25 Sep 2026 01:46:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2693:b0:939:3a51:2490 with SMTP id af79cd13be357-93c43c5e38bmr323431285a.15.1790326011420;
        Fri, 25 Sep 2026 01:46:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver for Glymur
Date: Fri, 25 Sep 2026 09:46:34 +0100
Message-ID: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QNbytnDdSiY-mwn6LeSNe-sWkC5Nz7Pr
X-Proofpoint-ORIG-GUID: QNbytnDdSiY-mwn6LeSNe-sWkC5Nz7Pr
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab634fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=7GdS1con5BCYmhUutoQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX+9RjYXnisB8B
 Zh6PRxXUFDxZZ6Rbzrz4Z5qKmQCnGm3s1GuUtJ+YfGDLujuLou01yyWnbI24qh+ZGlCcH0XrJ5y
 ytw5Zxq95cQi7+MS5AMsmWw2xKhX4A0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXxvnjJ2ZNaWVq
 tozb3MB+0jJ5CLp8eL4upkxsslWcmJO4xSkuVjjhg/3AnGX2tQk1Y4WA+y6JOurm82wzjyYHDuz
 LRx7s4I+RT1nrJqBX2+uTdbxyh3wLp+OyaLOoKe9O+NmZlfg0XfmGUbFIxJO2Po+R3F++q4dq4y
 Xvue9p8i1ipB6wdBcFCZA2U+WKKHPvERnwUsUNEME0XiP2QddtC4EgHX6OI4Ono8FB1ba1rrthl
 Kf4+2gIv8u7BNvIEXp33cAdRwzztuh5GagZGiUzIghJAUmA6KUfMhj/CAh9l4fhFD2IlaHAJ7ZD
 mRPzE6Htbgb/gz34V4Ecvdv2wfCnYFKoaT6xO6IEC7Rp1FHGZJoVK7mgg6xy18Pkac/o5F1ucfK
 w0N8NAn9tUhOYoUU1mkOzYGVKe4ZJ9ARX95WUSduS5tEVqKJeJdyVFlAn+HXb8vA3ZhsfKFfTLF
 zBC++NIOyEv903B6AvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250034

Add support for the lpass audio clock controller found on Glymur based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          | 11 +++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3bf39a2c54c8..c9f5daed0e14 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1264,6 +1264,17 @@ config SC_LPASSCC_8280XP
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
index bd70e18a7118..2bad94a1d982 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_GLYMUR) += lpasscc-glymur.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
new file mode 100644
index 000000000000..356625dce99e
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

