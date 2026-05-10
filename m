Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D2A37CD4C
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406496; cv=none; b=nnRdU76yNpMT8Al4I0zxXdpMOrn5du8xjUnwy1a1VnhEee2KLYt/Ra/r8Kj2qek0JC977NluZy6zGvaussFT4YTANcs2S5i9MPf3t0bwC/AKXLZva7TlqF5s8P51Bg/0IJ9HXQgOD3EJx6M8/lhy5pghexSGFp9U2k1+GzIL/Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406496; c=relaxed/simple;
	bh=PThAJofFUpaf0I7H3OPLDBFfLJQH6zwvWvtmukAgzZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5GSQe6X4y57B92sfX4Tyoz0rq/j5gAAxCSui4ua5kU0Z969HxpBxcXaCeHQHavvNtnir0MSxICboHVeE6cLq1dfgl/edLAge4h0OTaPWLmfzV5zRqevItI4PC3mZflq7Ntkhk5n+vANW3fsTipETxo9eHbV6PRi9faF+ALfY8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIXIqxkf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIXIqxkf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso36380115e9.3
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406489; x=1779011289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJYDpcxH6Tn7+0ROYd7sOCYGz+GoNKS70+mlfSYBYV8=;
        b=UIXIqxkfDe6yto75EOjj7Nqn6jcpzylJ70+ijNqrIxVQe/iMOqMOLn4TJ7BboT7+Oz
         /4mhcmmcusdAzQNtldbSdJOeG/NZ27biyVx0IhoErzzbxj6zXKFNo1PXRBiaWbRh2msX
         5mwghnEo3LDL4Af8souX6q6YPCR2KGpdXD6MAFhjMOhYblvjjYJL3RoRS7ABMzdp11O9
         x2MAiz4SaGw/Um77J8BscZLHxTnMhdnvKToGOrBlRUJi7Y0fFYLkykz/UixlZQgJula0
         KWWu/Xv/BHIu31fEK0qVu8qSuZ4TNmXWOBMxz72tH2AQAZo8xhqLc2cFXTDs3aa+rkOe
         n8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406489; x=1779011289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qJYDpcxH6Tn7+0ROYd7sOCYGz+GoNKS70+mlfSYBYV8=;
        b=mL50ol++6nOyhCwfPm1cUegAaH/YwDZiXE2YJ7AUvYK85Jn3y/0PVI3Uu3KwL8ETa2
         /EbGoLUUxtJCHRWREq/P1+9FEUR1nrzHNFBDMwWcAlnwnThaccXCMjJhDBL9Ea8EcDl6
         tdN9316OP6QPDy3XDYbv55dgjXjjrIoj69GoIw9cvQ23nG6Dbo/xVd7lGmEDEKET5UNl
         yc+N2WHUR+JvGtks0JFGfauLHmLTpgcjqpNxi4MYNVsAjG09hQ2hgmppgQCdYVYLJ3ub
         M8wyD6MGEft5ymiPZp7FjLoD8RmDOiT3bAQJ3ci7MmSuPwBgv6C4xRQcJ5saWHDfyVnX
         myKA==
X-Forwarded-Encrypted: i=1; AFNElJ+73LnGrl5Zt4KZl5V3l7M0L04YuqO5IkShUERYonPTT8uqRbLdlpvRuHduEfyLM6iY2uQoNU4l5fU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU3+3f//IdKLN9GdWh163blf2V+5iRiWqmj60cwOJT2LBGrwiG
	CDb1C+Mpz/I0jLRaXhmrXThZxh4H/2+Z5AwIukUhLH0JogA6f8BTLUZy
X-Gm-Gg: Acq92OGxZsNQQ5WnlASajto8LQsW5bGglh7irmw1/h2nd9SXfuiO+bzqSjQdvR9NyO2
	ifuoGjgSaDf2ZkpKleBSK0uYhBlQG/XoTfLw8UDWsjDuCaQ8Xr1VvYGZnUvMM6RcH5ZQHeZlcaq
	IlqRAUTfIz3WHCSlmTVL8FBeZyvlit4IrgBGXSGWA8nz2HYxRdBl/YCjeM2e5kIhRjMYBGwIJJc
	qBIjG0CZrGrp5lKMSLNy7GQe684H5IhkfUJ5SK0ZeN+BkwOSIiGgGF7znJeK7lQJUV0PrujrkIT
	gRHMlVtYIjCslwuAu+7EmWcOkpyQ8m2GHv7cm9lc5LXaqZQXzO1D4yd/5QlAv7VD4sjzWmaF19y
	nLIluKUrmXZUuRHkjhAESBcKiVmo06Q21zJAkqWnnBHFf/hf4oRYrYKx1Hfk7hlYHJ/KkZ3KzxB
	SByHNKk9+y4JPvgeSIve2Jd0PLhYSv
X-Received: by 2002:a05:600c:8011:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-48e51f3b589mr302185505e9.24.1778406489364;
        Sun, 10 May 2026 02:48:09 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:08 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:45 +0300
Subject: [PATCH v6 7/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-7-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..6ad20d58dda2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,46 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 244800, 200000000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
+	{ 108000, 200000000 },	/* 720p @ 30 */
+	{ 72000, 133330000 },	/* VGA @ 60 */
+	{ 36000, 133330000 },	/* VGA @ 30 */
+};
+
+static const struct reg_val msm8939_reg_preset[] = {
+	{ 0xe0020, 0x0aaaaaaa },
+	{ 0xe0024, 0x0aaaaaaa },
+	{ 0x80124, 0x00000003 },
+};
+
+static const struct venus_resources msm8939_res = {
+	.freq_tbl = msm8939_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
+	.reg_tbl = msm8939_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
+	.clks = { "core", "iface", "bus", },
+	.clks_num = 3,
+	.vcodec0_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec1_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
+	.vcodec_pmdomains_num = 3,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1161,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

