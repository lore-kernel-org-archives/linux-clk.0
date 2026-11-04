Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810837;
	b=NGoNdO/gPoup6CxmfgbX9QrC8U4VJuFNEdpIIOMHhMesnfx6R0FJIFkCoVkZDRTRVzqV
	 TNxIwVWKiLzxLRdIm8oMduMo/sjCn6rDXggSBTybXzPhed65WQvTMz0v9hXQGipW995k2
	 sCALcyxakX9N7pxasyPeRftiZKBHCAx9KaK6VUh/AMsrvYEvF4mARa+dW08dlC31Z/I/D
	 Y02hLTtBRPtvhZTAq8NAZbEVYsGBD37E12mrHgbObIx79bJj8i8AsqvpGL78Vot4VUyG6
	 7gcaXjohjPjQFwL/px8HHpPaQdkirXZ7pkkuADkOG3jMa2XZ/r4dmrXsBvoKSsWzB4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
	b=EKyNxEHKTQANnFtVEN8XF8B2I3ZE0te8u6REOGUIkL1K6b4x2CKLnKnH5FEKXyu7PVAE
	 pKlt9LDCkyF5Hia/yy48vL8skqzh8W2SJIaEk20B2oo29YxWNbRgMrpAgorjeeSh1Lq9u
	 JWfTfU8fS24tw9+8x8hWOaFljtdFdmK414W2nUEmbXNKIqkDWTrjmbdBbpe+qvcRfwIqQ
	 Q9QO2W9QExVOubfsO49E3LN7jnW72o2pLR3SOkeN5Jccd/bue0yLpGESMKUjz5/tqFZvi
	 Qtbjd8853BKnpZWb2KAHHOb5cAbYMnQtqizsEGKbUrXav3HlzBDEp/TJAQNvuAUyDcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ii+JEp8N;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F606082BE0
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 16:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F606082BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ii+JEp8N
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b244fb7fffso1297987c88.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810836; x=1794415636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
        b=Ii+JEp8NcqQOExZCbNy1Q72rEE2d82j/6uqSwHBPOZM5MI/gsmkc8VVqk1azPShaNG
         cuXcwE/gD7VDumYMltfWPvWHst7fCWcVmipbhzGgDXh2GVypSyrp2k4O4b60Q9NV0k4A
         V4nlC/+2OnNcoSoToNxDcBGgJO/yheVFxBcJffRm8mbY+w40ZrnsyPrlRkDIPQbrd8IB
         I1BPtTsMlJ2HCIfeVSTs6wIyZewYdjeB4c6A7RaJesYBkyD4WCMbvuLbnaCBfI6DsK3J
         JnOvcFw6haiXJnCW/3so2voL5cDhoekP/pgDJsqYqnmMcc/aSL8qtr+xd3hq5dPW19uo
         6UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810836; x=1794415636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
        b=nETgt/fJFVZ0wtjBmWNTc8UDBpT+hVTCWxKo6gRMQ79jOnmi4iLAUEqIPFKetg5EuY
         oT/AOW8VNEEFtYk0MGa/3O0WxA8igaS9ZYunUn0vOvlPZ3YET7Tjw7NESEAVTAeFBcQY
         6wlx12M/H0YlHWG2fXTCMsyL9be8G9u0vQXb2jJl38d5Z7aXGJtMyESsGk8jLAT94rxy
         aIkKSv4XhKP/dQQFq0hUwriy9k/60cXO410yiSL1gLG8rhe2PPb9UG5HldPzO1s5KUWr
         SIjZpmiiFoYHPc2MahHA746IS5ebglhPTkHq8VYvIM9Ua6RKHS6MMXDPjaKLAWNLAWnR
         qU9A==
X-Forwarded-Encrypted: i=1; AKwUvBy9SExo7U9Znr4H2XskajgIp6uhZzhusspoXJEOcSVLGDekqsXeZCtjnsN6JAUT9nPU57LkyMk8NXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AL7pg5xFe9/nRTp+dzprJE8mzrO2kWDReKu22kn0AolHls5TP
	kY1jDzd82EufN9bB1xbqVER9bvCm2/bjUdZjDGyk/LcLAyMu6sYG5fn6
X-Gm-Gg: AYBFou2bqNSNRVmLlTI4SuAHN054tiQQeP4fH0BWmj9TRJq7Xu2NzztViHztTaj+pKb
	ArC3yDWFbodT2VpAtavrKMPffoiptNda9/RuGvE06Ax7NAkcCjwM+5S3G+j6BNd4r9fVDGjNE8Y
	xEaVbxCzmo8oKKFMhJM90A0lF2TvUOlWPyF5gSbsqfZp7RZuU3iiW2omotK5g7O1d55/Hu4H/WS
	/7z21U8XD8DMmhT6zVfTWS5b06LO/ZWl6iTLJC2QH+OjY1rMKkQ2dQn9LamNUMunui6s7ghOiGn
	x67d4II/2+vw7pGuopE3BwFdZPBZ9m8uGM38W8oQwu+gjzUz+VGdq0AGWNLaSPnopkSMnRFKGxe
	Z2KeY4xTEPRgetkTTCq/O4NdHiQYE1LOHHsbf95SyEX7wXudXXhU1l0rRsQd09631uocDOnAjmk
	Mi8O+rOnd9SJf/nGRl5vQo3Lxd6nUXwulCrVAk6UYwmYcgQZT/2CrVJSP92ursj5i7XZO/cQR/m
	DfmEFBehwmIXCL7i8g1xyrzOeScuZhTzwcaChaxpg9XJDLfYjimUQCFrAZI6PxiQF4LeHFpyQ8F
	EIxB225ubHe10OYKdOp1OZZYP8iQYsxTHB1bqsZpQNdrMh8oNRs0kvDPzUSkjL64sPNXJPmfW+z
	wyDOU1YI=
X-Received: by 2002:a05:7022:3f04:b0:19f:527d:96da with SMTP id a92af1059eb24-1ac5da7b145mr23701286c88.33.1793810835903;
        Wed, 04 Nov 2026 08:47:15 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:15 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:35 +0000
Subject: [PATCH v13 3/8] thermal/drivers/qcom/lmh: Switch to match data for
 SoC CPU-to-node mappings
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-master-v13-3-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=4488;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VU3SQSKgFReF5BiO2cKpUAobqELNHDdICbyBD7TlHBc=;
 b=zEQCRQG3leyhQotPeA5MCZh/7vfckyMF2IzU+0IxPHpx8ud6vbLpA0+Et2DgDiTWDZbxXhkrL
 j/JgrQU0zoCDYa1IoTh9tAQDpIItm9Dg7NXu4XbjUYF5XSuUW4NhvDj
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

lmh_probe() hardcodes the mapping of logical CPU IDs to LMh
hardware cluster node IDs: CPU 0 maps to LMH_CLUSTER0_NODE_ID, and CPU 4
maps to LMH_CLUSTER1_NODE_ID.

This assumption only holds true for 4+4 big.LITTLE architectures like
SDM845 and SM8150. On platforms with asymmetric cluster layouts, such as
the 6+2 topology on SM7250 where the big cluster starts at logical CPU 6,
lmh_probe() fails with -EINVAL. Consequently, the second LMh node does
not register its interrupt domain, which in turn causes dependent drivers
like qcom-cpufreq-hw to fail or indefinitely defer probing via fw_devlink.

Address this by introducing a SoC descriptor structure (struct qcom_lmh_soc_data)
and an explicit mapping table (struct qcom_lmh_node_map) associated with of_device_id
match data. This encapsulates both the algorithm enable flags and the CPU-to-node
mappings per compatible string.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 73 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 99396b93e..ef49ed1c6 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,61 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct qcom_lmh_node_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct qcom_lmh_soc_data {
+	uintptr_t flags;
+	const struct qcom_lmh_node_map *map;
+	size_t num_nodes;
+};
+
+static const struct qcom_lmh_node_map sdm845_lmh_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
+static const struct qcom_lmh_soc_data sdm845_lmh_data = {
+	.map = sdm845_lmh_map,
+	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
+	.flags = LMH_ENABLE_ALGOS,
+};
+
+static const struct qcom_lmh_soc_data sm8150_lmh_data = {
+	.map = sdm845_lmh_map,
+	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
+};
+
+static const struct of_device_id lmh_table[] = {
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_lmh_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_lmh_data },
+	{ .compatible = "qcom,sm8150-lmh",  .data = &sm8150_lmh_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lmh_table);
+
 static int lmh_probe(struct platform_device *pdev)
 {
+	const struct qcom_lmh_soc_data *soc_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *cpu_node;
 	struct lmh_hw_data *lmh_data;
 	int temp_low, temp_high, temp_arm, cpu_id, ret;
 	unsigned int enable_alg;
+	bool found = false;
 	u32 node_id;
+	int i;
 
 	if (!qcom_scm_is_available())
 		return -EPROBE_DEFER;
 
+	soc_data = of_device_get_match_data(dev);
+	if (!soc_data)
+		return -EINVAL;
+
 	lmh_data = devm_kzalloc(dev, sizeof(*lmh_data), GFP_KERNEL);
 	if (!lmh_data)
 		return -ENOMEM;
@@ -139,24 +181,23 @@ static int lmh_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Only sdm845 has lmh hardware currently enabled from hlos. If this is needed
-	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
-	 * of a dt match table.
-	 */
-	if (cpu_id == 0) {
-		node_id = LMH_CLUSTER0_NODE_ID;
-	} else if (cpu_id == 4) {
-		node_id = LMH_CLUSTER1_NODE_ID;
-	} else {
-		dev_err(dev, "Wrong CPU id associated with LMh node\n");
+	for (i = 0; i < soc_data->num_nodes; i++) {
+		if (cpu_id == soc_data->map[i].cpu_id) {
+			node_id = soc_data->map[i].node_id;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		dev_err(dev, "Wrong CPU id %d associated with LMh node\n", cpu_id);
 		return -EINVAL;
 	}
 
 	if (!qcom_scm_lmh_dcvsh_available())
 		return -EINVAL;
 
-	enable_alg = (uintptr_t)of_device_get_match_data(dev);
+	enable_alg = soc_data->flags;
 
 	if (enable_alg) {
 		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
@@ -230,14 +271,6 @@ static int lmh_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, lmh_table);
-
 static struct platform_driver lmh_driver = {
 	.probe = lmh_probe,
 	.driver = {

-- 
2.43.0

