Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA202E1730
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 04:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933264; cv=none; b=a6ZL81n4q/eM4Ea791gsREk3SKJBWFlw1tqfAKjD0rts3hxNXw5PjoMKlPFZB4HFJ8n6q9WvCCL4fnb+ErOLW3MQpgcyh5CU/Q5RTy0s/ZrYsvWEJ0K4/9Yy08JjlcAHnL9yRAxkSp+WVDCWS9ukw7+mT8J/fsaVZIFoqEVZYgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933264; c=relaxed/simple;
	bh=ZwYTrMAmnkdh8YdhuMQNkEVxOPy2CIPYNXYMB5yEdew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcgTXFScKMVDMMo2LjJEki4rAL1yNgJLQe7tz9LlkVywB5HYU7JIwN5U8mQvNfXnEQo3x6dDUD+hey+3R40g4bCDa98vGjXy3x8D7UsG9HQU7Zd3yQG15cJX1GkyeM/PKR5N6Y/DVUTOrRJiFG1KIw+6muLTSmiK6rdiLUhnO4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1oKh+oI; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1oKh+oI"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3eae4e590a4so2022233fac.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 20:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933261; x=1768538061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05mvMiaCezgmzJYXVgjf/BCnZKgTJFkAHEvjQAEJ4/8=;
        b=R1oKh+oIOl3xPugr78RVmyt3j3lHMhsNrHM6F3CRSvKw0CoPjlcnHiL7buzNk4sP06
         sIsiDdWgVpeKPnYwwEbxyFjXjzcKvUBiF2lo1gxMp9XDBRP7z2aK5E0lDQCbfiT2Ipq1
         bLcG7tom6FeEKym8/b07ipWFV1dHQD7toqRVYiu3dLtwEX5s4RSRVpCSkEIOC3m3ItlQ
         fOyu+0J9NkahMSgRjJ+9tMOhoacuNO0k8vEiw3dXXkomg5KOIl0IeYhvmK2ArGDUuR05
         +Wfsez95HOzJerqVjdVdGjqo/3LyV61D+km0GcYCgsaE8JoYmQ9OjIi7Nft4fmYTgKzK
         51+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933261; x=1768538061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05mvMiaCezgmzJYXVgjf/BCnZKgTJFkAHEvjQAEJ4/8=;
        b=RBiRQgTlrHgmWuqV8H9SVd5HcIZBbd0j5krp5dMgrzP6PQYqhsm5gvz5IGuyJbAOa+
         8evV3r3KAeClOFpx5Gmo9GQOeOM7XfrP0s7pwAiZu2b7dJwK9XXZxQRJrCrhweINzVH1
         MTFI4gx1c0dC10K1Pk8xJgAEDJU5wk1FAvqvJ4NPlJRmMKsYF2s0KQyyEOPfd3eP87kv
         vzkI1XwJIDTN9vrVHKiZR23pL92vUDMe3ySqvhwTTcrOLAfiaqfNH3hl/0jzP+8XMM4M
         3it/dgYCbTPz6f/iFve5p+LnrLs9ELv8RtRtnQP8O17AvhS1njaHcax6hw780OVu47Ev
         ezGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBE6ZG7YGWMBZWs//ajtIJPvSlLz6GthtlMlBvb0YinqU0cMT/9M/m49QKSr0gwGRT4Vcq/ERtqak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz3JW0+nwH8V+6npaoPt9sKVMsuEk1f60kYjPN83B8lA/tfQoI
	uvekUWW0VeNAwnndvz2PmtnZDKyAwmTg6Ax6LaZ4C8ckX6kmLjae5uEzVDCBUg==
X-Gm-Gg: AY/fxX7pi1R4yza6uibhF5ZtekG7l8h2oUwPkTJK4nwv2evkRqHNEX7Pr96SnV7L0Tw
	8GaS+jzcti9BxPSNsN1hRZdUUHQsfwYT24XLKRKtNoFwAPnBPTcFIQvZJ6wuhmmtpPEl6xZ0ZFo
	cd88K917AmfqKAo/+nJ75P2fkx+MgujJiAT4CZ/IAqO79M3Ar6egxb4Sb8mHf7hEL8Syc0kMrvN
	9a3UvBgAMHTBLQSeoGCERNT+K2Sux+cEOF3rUQFEmHazk5aiV8kERoXUGqnu+r/rV5eXbaQ9O38
	shJcdU0X+XJGxsXz3hFkRTTXDeta98rZuS7NlczmL2gXRNz0B2/SIvfe9DA1cG8UKcOvc0SuOnA
	Ml9ww6KGfSXUy188GFgQM9I+/1I/F4Krlr/FILvd1kZh2Yk5EqQPhnWpK/EvMJitg542aJbyMUI
	l5ro12VMdvIRMCOoE6LYsYF6SIQS07xzKWwN8Y5DmCTJEgeNJhs6QfimZwffm3o9fr0o5mH+1zQ
	8+DPpUt28jY+xxDOYFnre5I9u5pbc5sbIcdJdA=
X-Google-Smtp-Source: AGHT+IFQMfD5BmYuMz67fv5qpmxGsSYuw3YF8lZjbLInnepHp8t3ZgfenUtKZ4QOFw08dY90b93PXw==
X-Received: by 2002:a05:6870:3353:b0:3f5:b004:314e with SMTP id 586e51a60fabf-3ffc0b5e85bmr4715058fac.46.1767933261550;
        Thu, 08 Jan 2026 20:34:21 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:20 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 8/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
Date: Thu,  8 Jan 2026 22:33:43 -0600
Message-ID: <20260109043352.3072933-9-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
to the q6 firmware. The firmware releases from qcom provide both q6
and m3 firmware for these SoCs. Support loading the m3 firmware image.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - Check for -ENOENT from q6v5_wcss_load_aux()
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 45 +++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index ccf5fbc5be66..2bb83e6afb6b 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -103,7 +103,8 @@ enum {
 };
 
 struct wcss_data {
-	const char *firmware_name;
+	const char *q6_firmware_name;
+	const char *m3_firmware_name;
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
@@ -160,6 +161,7 @@ struct q6v5_wcss {
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool requires_force_stop;
+	const char *m3_firmware_name;
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_pdm pdm_subdev;
@@ -931,11 +933,41 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	return wcss->mem_region + offset;
 }
 
+static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char *fw_name)
+{
+	const struct firmware *extra_fw;
+	int ret;
+
+	dev_info(wcss->dev, "loading additional firmware image %s\n", fw_name);
+
+	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
+	if (ret)
+		return ret;
+
+	ret = qcom_mdt_load_no_init(wcss->dev, extra_fw, fw_name,
+				    wcss->mem_region, wcss->mem_phys,
+				    wcss->mem_size, &wcss->mem_reloc);
+
+	release_firmware(extra_fw);
+
+	if (ret)
+		dev_err(wcss->dev, "can't load %s\n", fw_name);
+
+	return ret;
+}
+
 static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	if (wcss->m3_firmware_name) {
+		ret = q6v5_wcss_load_aux(wcss, wcss->m3_firmware_name);
+		/* Continue if M3 firmware does not exist */
+		if (ret && (ret != -ENOENT))
+			return ret;
+	}
+
 	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
 				    wcss->mem_region, wcss->mem_phys,
 				    wcss->mem_size, &wcss->mem_reloc);
@@ -1196,7 +1228,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops,
-				 desc->firmware_name, sizeof(*wcss));
+				 desc->q6_firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -1207,6 +1239,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
+	wcss->m3_firmware_name = desc->m3_firmware_name;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1284,7 +1317,8 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
-	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.q6_firmware_name = "IPQ8074/q6_fw.mdt",
+	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
@@ -1293,7 +1327,8 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 };
 
 static const struct wcss_data wcss_ipq9574_res_init = {
-	.firmware_name = "IPQ9574/q6_fw.mdt",
+	.q6_firmware_name = "IPQ9574/q6_fw.mdt",
+	.m3_firmware_name = "IPQ9574/m3_fw.mdt",
 	.version = WCSS_IPQ9574,
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
@@ -1304,7 +1339,7 @@ static const struct wcss_data wcss_ipq9574_res_init = {
 
 static const struct wcss_data wcss_qcs404_res_init = {
 	.crash_reason_smem = WCSS_CRASH_REASON,
-	.firmware_name = "wcnss.mdt",
+	.q6_firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
 	.wcss_q6_reset_required = false,
-- 
2.45.1

