Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978192;
	b=0RwiCNlI87wyMRgN64A9RGnO8vKxAuouYJfyjoiynfDuI0bZDz+WaoReKt2y3fzdyrsQ
	 r3DnukRBbtAn6Gd1pikDb0h4l1GE3jJI4gFPYlyQCRAxhugdm/V/ZE3rHgdx/wGmlcs5A
	 thb58uI4wn3Z0dntdq5lhIIsEy83Kl1iQLDJMdNIQ13vtW3M/xEBQsm/hRk/oKq3KkN+q
	 YAk8Wrxa6rn0fRfmJSXKeJbpIiITrzp70P4CqHG1BdaHJc5yM2AakkV+UR/MJAeY23whH
	 2VUhD1vOYfW3UiGjWGNxXWGcKx8g2K/FWEUrYZGwUJzrm/qWAcGvZkawAiHHH8Wvp9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p0+vg0aeGV4J5pNv27qoTyKZdEzm1Xuk0hKJMzjj9w4=;
	b=zDFa38OmIurRXhxso9GZcP9Toa8TnxYQRXRj3t4YUUvXQQPPqkwmzm55ZU5iw10MzcO5
	 WMnclCw1QlZKP/yaygVuHK8oHowhDahqJCUVn6PpSXQRy90znJu11DVbrwJc2gSPWHynn
	 niSfEL7Rd0DX7lSOh/VC5X4t+cecdQvpm1TC/HIXdVOye25ESQtcGnMnyBAndoPBmaCJH
	 1skqNId3RbHxDc6T4c4WJDLIAedR7pb3Xo5BM+1upFSMGsCuX2KQnXRriQYAyfxkAvKSo
	 F3lcrwxOLipR0xt0GwTpdoG4lNyBJB9pd6nh4fYE+VbsjU6pWpN+5NZrLYvEZUKgLxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFbDAQl5;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775B5606A33A
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 775B5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFbDAQl5
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1091389eec.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978186; x=1794582986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0+vg0aeGV4J5pNv27qoTyKZdEzm1Xuk0hKJMzjj9w4=;
        b=CFbDAQl5Px6jJ4XZlFMEDPoI4ZftJaNbBTXENQXD397d5G0rLRfHNpO/GPvDacJHl4
         ejdGEOzZBustPJ+tgfBCzCFWs0gesOcaefjBsRHSbrJsGlPAzsw3qxEqMQmcZamoM26b
         ddDvxGSHByu02tUfR1WiQJrF/CGlz+Hyq5eZv9rvm+Dzh9r3PkzluFOq7M1XgKcG3smy
         rGQ8Scb2cqvB/t4IxkX5SSueomHoKFOc9Pn8wa6h0AUTetKtfmXkoNjTQFUnM+7R+X0+
         +eUvvp4EatjHX9EOyANLc7X05RI6D+VJ/jTz1UeTey4kv3ld5Ch8o1ewgqwyuLuz0AVa
         77ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978186; x=1794582986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0+vg0aeGV4J5pNv27qoTyKZdEzm1Xuk0hKJMzjj9w4=;
        b=08Zzcc8wUEsplF8cXnYSR7w8RBMbIQifgOt1GU7+AuRNCv/hrRUzuGf86SUvtVt+d/
         q4qxSnzU5mmaKWbtNGVxI7ucK7EtWKn865eDqkAp61q1dZBCB4yVnXK4JZI0P/TgCubO
         UPZQINGWXNjpZ2r8jJjU349X0icJHBDZuZQ+iH0yS6661mlNMkmQNj8ZN3WDKI9w4DqM
         Vu9THPUz4fvbvCdC5dMEx/DZH6OMi6ERiE0TofwIHO4qfbTpwfLM+dXfYiIfBU0+BN86
         cg0llH728cHnC5Dv2SEQnzfsgkFY97QWp/icnsWuljJaWDsLUvpeQNqHPgxNo7G9ixdn
         acxA==
X-Forwarded-Encrypted: i=1; AL+hErGECN5PRBxyHw6NlqhyMbyuPSe5nMkbV9tUK7G1LZxM//zWXdUSak+5xJ1uk5bwwYAg75yLyy9c6ZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xju2E69o7IvUvf6kzwcTqinptLad8DaauQkECXjXPhFfkHhPE
	KwjnPFMYl5KxJkv9hDCStQUxb84+FMWmJWvmW4fgiR00TJU2hZoHX16X
X-Gm-Gg: AYBFou1sxT1AAbPEKoN5k0xLeZgwKOq+IR/zM9zWrGQmaaft9ZCJtxb3aEm/9wuITOG
	yKt5C4YbTensMthNiA6Y1uKb1j8BSZlP47PhmQPYI7GmWZDKwgLjSQs/WlsF2q4E3EQiCkvnopn
	CorMIXmuy0zAvyU9AvrHKgZ27btJEvYN0aGrkNUoyw6CXCPqq2LThBCil4jCc1C/SEr6pWTAF//
	kPNPQDLxUNtKG6gs9tudvdvct4nJ0hJbn3mE6kAXTLZtrnZP3rDXIROWN+sre+xd+N8BCeVxQ0r
	fykXfpsi9nFwSnSm+mGV1Gx+p5gEY6scys16iaerGrTBiL+dcPDYSiKFM1T0aWE1+kYStyTQE34
	zuC0m4jLcaeFdTpW+LLVuVHNcXGOnEO1r2l8Go4pE1jcmS4rYgOZzK3N8OwwWEFbdFJl0yaXokx
	G9jWFGHlCqhtFw+sJzEVOLZYCS4dh7QTWp9DzlWQzySeI1/BPJY85+3s+y5VSBvrGNi/OoenmbW
	g195JrYG0XoWEBG2YkxmRkpPXHMwX4d7xKffLw/E7z+v1ktz9+oRRsiq6DzuSQ/00tIoqRRdCeV
	uJI/cB7MVVhPAvJfWE5wdI0s1o9qJJJxQ+JQM/QqVwkUEjCSSkQ+VDyhZCOoGOI6gv2tKibNj6A
	APn64d2eVVjOO+tA39ZZsoNKJ9R1Q
X-Received: by 2002:a05:7300:b0aa:b0:36f:4d62:2884 with SMTP id 5a478bee46e88-36f7691a412mr3600161eec.30.1793978185868;
        Fri, 06 Nov 2026 07:16:25 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:24 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:38 +0000
Subject: [PATCH v14 3/8] thermal/qcom/lmh: Switch to match data for SoC
 CPU-to-node mappings
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
Message-Id: <20261106-sm7250-v14-3-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=4409;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=nwH0k71RDFHMH21LAx9GvawuLoxMvflAeMTqII5xMG4=;
 b=9GEg6sCjo+Fw5z+URS3OWyPStxL54iUQB9zxVL+ED7z7plk4poxuPjsJg0fe2SUj1WrtGGXPB
 evpAQlKueAoDYKBDSbEHFGkU8bbJI8v1oalpbyXhlQL0bxSilhSdRJS
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
index 99396b93e..e160ac477 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,61 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct lmh_soc_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct lmh_soc_data {
+	uintptr_t flags;
+	const struct lmh_soc_map *map;
+	size_t num_nodes;
+};
+
+static const struct lmh_soc_map sdm845_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
+static const struct lmh_soc_data sdm845_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+	.flags = LMH_ENABLE_ALGOS,
+};
+
+static const struct lmh_soc_data sm8150_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+};
+
+static const struct of_device_id lmh_table[] = {
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lmh_table);
+
 static int lmh_probe(struct platform_device *pdev)
 {
+	const struct lmh_soc_data *soc_data;
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

