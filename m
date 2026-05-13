Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903522848BA
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 21:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707592; cv=none; b=K4VF0UnHqjGgsLDjtfVVoU2qw8CaamTlS4Tmm6QhdbL9gyGMFz0eBGrHJHzZjOPCCyDdtB/FpfcCto1+37kQtKqXAeA9Ll+4jYnLb56C7pNiDeGZXP1DIZ0/tcFzfAVSkyZY7dmktHOEwaTOQMGt0VDU9hhKjd2GTCMaEfkwB5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707592; c=relaxed/simple;
	bh=kbRxkDSklKmUXRkpNNt2jlXF+tF+3iVfzCr636P03P4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cb6b8eFWLDMxv5Q4pxv4nmiSerQjlIgpOIT3pS+lO83hqQgHDpFsD2Y91EDiDoMOfPPYRAhlX2yeR9ttizVk1+wIwAZtRIWUPojVXt+0+5CVfXLtLgAJxzYZeACAPX8K3QdcdkmWR6RCOPvpKQMv2uqo14zPXgj9v35GpRsZqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skspkCET; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skspkCET"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-656d749109cso4699590d50.3
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707591; x=1779312391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3TcPVRIkkCvtZzIpVvk6MMaDhrZ9WpVELhUPvDjGtg=;
        b=skspkCETyetnXYnzUqQEQBjoOQ9ykMOhxIMGej0EBNc5UV9biihouUTvkPX4MpXhsP
         DtyGORjSLKQNkU/nHZsVGNqRn9h/y8O1eh+pqI0dAhuWGSyQaxflzldqECIAuDMY2mu2
         /gdfIWWR3i4aoehgkO7d6uvKcUHXYS7kMN5iJyZl0JndNzhEbsFWBfxlkVxDu+UMfn6V
         YVv3rpN26BOUiTG8xpKcBU2KVlYkL7OGNXJkyfsVyiFhbial/EOyQc0d3AgjjcLexvU4
         DlPV5fit/lqmQ19XHUhFZ8NOFrcazk2nndLbCR9LVH2ZZDvb12zqvK8TEI7f7dV22Rg1
         rGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707591; x=1779312391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3TcPVRIkkCvtZzIpVvk6MMaDhrZ9WpVELhUPvDjGtg=;
        b=YI6xj9deubCaiVZZldwqEFFugc4U05NoLrv/rKGzJdWVoWCIp61ztn0WJV5TaxoO0L
         8znLZ0XyhrRZKlra/YqoZlUXRRhBcTWSbL4iKrzmlRDnw7+RDmVfQROYYXjrTeG2EtqN
         JhMns0wAKwCSlgaxEwpmlrokoGqljyBEsbOWGFye7BHg3wvPCBhOSvHbAVgXZbSrlcgr
         ryBj32OFTr5m6wQLaOIejz64YeiD+jDiN8VwC/RXtLpojrFd5PpD18Qcfl2PjXnDoQbl
         l+Dx9r9rMVZ0vQnGi6zmZ24TxD/aZ4hx+je9zhbhza8z0rw0m816Tj83HLwmfOiR0lEr
         UVew==
X-Forwarded-Encrypted: i=1; AFNElJ8Mv9/YAiBDwBzWIdSzYAakNdgUsjBx9TrgUOnsnIZin7yF2dncsdPCfAxakmg+tg7HRYpOJQgyzig=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXAeCQgJ+PPgowXz1NPAQCaixf5K14CpH5YI1hkUGKEyk8Gjd/
	iFfYm7Z9/deOi3tK9olQXd/GpL1kFNoeznbybMIPjZGAAp4X4ZBPVQUv
X-Gm-Gg: Acq92OElVNOa9/IotpA0bdLv9eGpYv7XpHQd0B9t4CitEE4yrfCNUJisJq0FwXS9N8R
	oK8BVEuzTdC2Fikdgog/yKCJHIq9+SEmJU3XPdNZo1rmnYfj/fD+oX4FQIlb49HNqeDYdh/5Ef3
	nQW9sr2yG0ujnGdTZO7TgSLHkwUh02wxNkjm0LvX+Gr8/GDevp5N5EiGR/zcdSonNd3ir3esMIy
	5qqHWPtd8OOFiYYSgVHRZX5mOPGqKq+dbAPw2I/EjCMoR6f5mDBPO5NOllaVEPaKgt/6Fe8To8A
	1j65ptw+tgERwk491wJL84Dmfn6tEzwunSqmQlR2F14/IiI6iTcflNEiYlgxmO8zYx3yKezQ0uC
	va7ADb0GA+B9M8UlJKIXjYKoKt8a0iu4V5UdHkRWFlgzXsqNEYZSBHZUxavKqYLiWHUhI/ZCGl/
	dqKo6HVLhEnTLbg5ZpUARwHSk7qQ==
X-Received: by 2002:a05:690c:e3e2:b0:7bd:8782:bb63 with SMTP id 00721157ae682-7c6aa11b5ccmr54775837b3.19.1778707585933;
        Wed, 13 May 2026 14:26:25 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:25 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:37 +0300
Subject: [PATCH v7 8/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-8-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1b5e72980702..b6eb96e43319 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -692,6 +692,45 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
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
+	.vcodec_clks = { "vcodec0_core", "vcodec1_core" },
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
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1125,6 +1164,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

