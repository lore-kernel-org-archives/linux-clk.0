Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669132;
	b=e9oaRpiia+QFAX3YD9L3UvlnlwlPRTlQAfSoFrxtNdWC4grC4nLJq+zWQF4igQiLydxS
	 aPuh6mHuazPHeiK1mie6HW+2IceYNNYEuIdmS92r9DHdyySbMwYxu/hpgx+KENZDJG8tM
	 v3tc9Kuj6AGp/5Ot1TZbVx0Mhopg9mkYg7uoYpLEqNez1ELuw4Cgs2dmuEBiz0AFK/i0C
	 wmSdxj5u0TSqNsV7vwL6Vh8UqfdHn+TuHyyABO9W/GkSfgG3MLDNPW8M614zLQLqfqB6V
	 vsAklKm+NEjoP1T8EZWp3tyWoC4nY/pjGakftY7/K8zgUq5RCu3jrS3UUuvm3XvoO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+MWBTNYSRWjg4nAw8/hdhIdqDgN2Nzlt5vynJ2DjOQQ=;
	b=WdfYrsfp2YRQ63zsLTnGsHsgyPDiH4euH0f2URp+CrfvWUpLvVD9VbS8HthNIqITsxfQ
	 xyJu/gvrqDrkbBn7ryxvT3cUTXPA9Sp2PK0GQ40oiIDw4QvEpj8BNaxoaiejkn3+rM2Ax
	 hVg5rNO16s1J6VLOfMqjJ84QlxY4JtxzOVaZu06qZxgDcA/gk00kAQDNzieLsRY4fN5Z8
	 +ovoDslvnKuid3kiGhS+VkJXFTUh4G7C7S08L6Z6j4rlbY9soPfyWXR6hwyGaeo/AbWXY
	 56SFbKAzdVHYqyvtWs2b44ncSYpGbJ9+XfBbUcIWeRXz8st/VHyFGJYneJY4E6Futpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLFgUwIl;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60E606A31E
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 04:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC60E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLFgUwIl
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4179850eec.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669131; x=1796273931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MWBTNYSRWjg4nAw8/hdhIdqDgN2Nzlt5vynJ2DjOQQ=;
        b=RLFgUwIlz0g0MjaqUyAsLzSqvkJ1xLt6pNRY4OtdtTDSlvM9yWhwOMqlv82swf/spR
         cpN8y0G74ukIXQVmdxMFTvwiAVDQpXEb4h0UvDTgh24cJTLOD7b2+v/rs/d7CXIycJLD
         6/Msy39eq6ajkqsqV38tDFS8MpwW+dQxPz1xrQ8Dc8ur4k7630y1efc5HB0HdHJ7OxZo
         g/ivpWJyMYJJJJ1i+qOAkTDlHlCdrB7MClyIVaIO7z5NLZl8Eu6yrksd3gzIVVAwSJpm
         CfXShRM450RzeD/OuhH+/53DkoIF9c4PQI68XlBu+thZ9SMj1Z0ZZoe83miPr9iKsH76
         CfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669131; x=1796273931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MWBTNYSRWjg4nAw8/hdhIdqDgN2Nzlt5vynJ2DjOQQ=;
        b=xCKzMlwLGmooChdLwCEMMFj2Sh+J2W0Tu93L+5VXUFyjC1IkZ2gV5wljzLV6NS/eVt
         dUTZI/36po6TjMpQzbJLYo74jdzCbT7rmpzXvaRUF4L30Xex0Ok3+oUNRaI+/ULV4cgk
         00dF2zPUs4T+xLFKL6TXcrgvgalxVRTn+ifmz7jfrfZmGsHUcSYWJ288k82FLymCH6NI
         gvoCY6FjmG9zjCbGGk/9RCX2MyjzePl1THbRzNRwxxGrOVEMv+zBlU5bo9dwLZ0b9D3v
         oJBhxry8C0/zFMmF4GMxRzupTaLzmHdxPKkWzTtFOjetIDZUi2lWV84jXF7JBOg45YJP
         CVkg==
X-Forwarded-Encrypted: i=1; AL+hErEswqq+hTkm7vkYen6Jr6sx5zUuXDB0+aDcsOUps0Ld91jvatrFwnIk/DlXNTjuQHmUgeSA6+MGX78=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oQpTXdOi8dwrTfaBQGFuiQ78lh25rJGWxCGxOT7RMsbJeW7PH
	19whJeIuTOOiuUyskPJlYjfe2mjNIrzcDVSfBjqcvJ1X1tQ36lB6nFEd14916yj1
X-Gm-Gg: AZFdTZdkmsjiF8T8F0L6T6UpjU8Fd/mJMYYRYanBwnvQ4i3fhlT2OZrvta83ozrO3QS
	dc/0ToAw1E/t1/7GJw+NjdSWFchRoWcFImhAhji/zzJKMvzJvOTRjvukkhi3GPjlrP28EGAe8O/
	CrcG4LGSESsMc2AwWZMmaY7pad62V2D6cCJOLWgJX5XNvqxsRNaMFFBcikU8DURmT0jvKfQUOSD
	GW/tTaCDr0y9IbIAvpL/fA/AZwkbSnVnB+DMp0YZDL0bQt9FhPc/ghT9VA8uEZZ1W2otTE86u/L
	+VbahghiXZfvQwZfEIb1JOIzn8NzMumvFNJ3lLbDX8gNTWaHiIJAt94Ijnq1mLnvPe01/j1JmEa
	ccVMqZ1w4YVtKkZtjezhhGBA9acBxPDQVdLmDLbRbtaeQ5egVskUGn5jA+8E7lZaC4eYY75gDCR
	gX164flk/dv/Z/xSITh0avZ3ZiX9psd3Ttceiohpny5h/SGl/GKD+X6I0ADBKQuUVFgLC9w4trj
	62E29cxdmeQPOtISfQQvnwAruhSIk9xLaaliNH9L6VzIIDPkVUbyZwW/2bT2MRqfwdmg53AhIvo
	a1j6QBnzlkwZbRcD2unEQ0m5i3MUMVYzqx9GThXmRQc6d6np9pNOhpYg1U3TuwF9K/SFy/XSgTy
	Vehsi2LQ=
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr19606973eec.27.1795669130976;
        Wed, 25 Nov 2026 20:58:50 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:58:50 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:08 +0000
Subject: [PATCH RESEND v15 3/8] thermal/qcom/lmh: Switch to match data for
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
Message-Id: <20261126-sm7250-v15-3-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=4181;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=4OXsCzvDxUDZzUq7vC0F7ppwML+xpv9VHox1Zc+zKA4=;
 b=iheqhOtdpQh/0n3iRRubDWuH146ojwlMj03gsY5OjYOhXTj1+XoFKhFe+wELpJighk7dT3Yao
 Hv0TPWTNrXDDS0mPVo8AdoPKojWBGrDV40/iwV7M6wZYIT5nTOAQJTP
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

Address this by introducing a SoC descriptor structure (struct lmh_soc_data)
and an explicit mapping table (struct lmh_node_map) associated with of_device_id
match data. This encapsulates both the algorithm enable flags and the CPU-to-node
mappings per compatible string.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 63 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 6bfe25021..de3fe64c3 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,53 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct lmh_soc_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct lmh_soc_data {
+	unsigned int flags;
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
 	lmh_data = devm_kzalloc_obj(dev, *lmh_data);
 	if (!lmh_data)
 		return -ENOMEM;
@@ -139,24 +173,23 @@ static int lmh_probe(struct platform_device *pdev)
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
@@ -231,9 +264,9 @@ static int lmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lmh_table);

-- 
2.43.0

