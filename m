Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC63E95BC
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312735; cv=none; b=GtQEeyy0qo9g/ZKISlRAThtJUPRQ0GlSaTG+2qvR7Didn2eOQ0jp7UHrdNvz9LqcXP9BteLOgNFlEi0zpQeOCcSN5So/VHTdZDXgN/oZvnVoqIc5+5OV3ZbxdUpnmsdc9sxOVDBhnt1QlXXU0n3exRudXHF9jyWOLeEP/FslCaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312735; c=relaxed/simple;
	bh=Xk0UXmcYPkMiRcwlsWbLeKXkQX3Iku6FWRxA9QzJnOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHXjnpQ1ps2+7wCfrSPy5VpM0pJaqp40lZ2OZaqYDFE4c8A4Ll0Tqfbq42A/Ed7BEZzK4z2eL8hOuhxkVyOkiCK9x6hiaU1VU2lL8rk7u8DfzPR25EuClNdYZ5DVm8EOg7lb3xDG4YwcIzdp5yiBwS/zC9Ej7iOLrrqCJCZVH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTMVGQut; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTMVGQut"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7982c3b7dfcso99512107b3.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312733; x=1777917533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NYYhGmqxRMsjsqtwuQ+VCWuB6ek7t/CJSP2hNZsrRY=;
        b=DTMVGQutX0e+Uycc81wJZ8KJJZfKb0l7zgVg0vmq0nUCmsFNxQUfMc0QxNERZc1Mie
         Emqi8/u4gt/qh1M+G1vE6HgHMWHPN89/sJckFhTE1/qPbLV1hg/CRiArAAZxbwF8y9wk
         q8vCq2kMwSpm3lGYYTnUmIFmYm39O4cQxWyQyIBUWIEVYNzoWDDRNPNYjdm0slfjdVyH
         QSL1WA7aXUv1OPs3Vfm5OnWItIO0ek6JoDO71XsbSfFke2uuhPsHF+fIVex9si9KDTA/
         o4VJ5SEV8cvAC2+G5EpcHos2iiMhzb6CXr8BOLVpCJy70zOFoPZ//1tKBQJqNdNR+CWQ
         1Gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312733; x=1777917533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7NYYhGmqxRMsjsqtwuQ+VCWuB6ek7t/CJSP2hNZsrRY=;
        b=bTUMFOvpf1Xg2ShRXzdwBTSLPETXQLdK5dQGjXIpZWbsfOS9pqWMcpIWngXU3oWupF
         DDwmLz2HF0fTE0Vz1g5TzLpMGAL9MJfrDJ1ruFjfZRvKKrAdhCaD0PSA7sMHa+ElEJ2A
         PVqDWfSxmVhR9Q8Xr9I5elndfVKXbFeayaqGbhwPzHW/x1MpwOUx1iv8HUIYqQQVGldu
         BkNjT8umVVDy9aaA5PBtOIYYeakHEPeNRvXW56zM1y8arsofXsULyXGF3conMTQwDI+V
         45hrUjXa68d3fOPPWol0+vcWvXoI0oy/9fB2QNOs6guc1E9uWqR0nKoKtjOCnzBZHS9f
         XX4A==
X-Forwarded-Encrypted: i=1; AFNElJ/pF0Iigo5qFrh9iHmkQYD6yhWRfHhWXo7rRNb4XhYDWtw9Ze6RUbPaH0Z6A6YKMvknYRSe5K3MzaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLf9C3BIXqgjs4JwaM7GTwZDW5KO5vO62Hxww43t0D/DvPGsiP
	L4GfmTZ66bs2AfflBsAz1EICD4WyQMsb+AeyAJ5i9a1Qi/DP2Ol8fum4
X-Gm-Gg: AeBDievsoiWylmjyAhsp9KXKo9nFeBP3jkXWBLUEZuWpImAVTd4Sb8bYcbdOAvxFhnc
	PMhL29mmAI5tjZu/R3n/iP5y6Whpsb2scg5PLgFmU3cVrzBxs/AQ9piPnYYfp7UzFGJppzzqvE+
	SQ2YIGvpfL0QbUXXFTrRqHwhhbUIdJDPekfwh+208cDiiydgQo+Fdo941Y4y1hc0eDMmu3tbk5n
	kjxbBtWrDIJOCAsBKV2d6+FzoTQ3p51cIbZlJtb9vtfBXvo4c2QeCaukd3LINt+RZsp+gTXLyHo
	EPwpSUtpv8wcEIUqkjdMKgDMLijEdmcq1T5amd1wtYGAMuZ2l7+fXzbWJmxtAuQUDzpX/aVyQaA
	Lnt7+J+0Ofbur2ySYoNNSZdGvSIrDn+cl9Wbwr7HQLIU3D3rXMj2bTGrd7ulghByPPSepVeTFJp
	IaMcPwaFqAxbq5kes37IF7BnTJifeqdCaZ5v0m
X-Received: by 2002:a05:690c:9406:b0:7b2:dad2:5def with SMTP id 00721157ae682-7bcee02a83emr2560347b3.48.1777312733280;
        Mon, 27 Apr 2026 10:58:53 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:52 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:25 +0300
Subject: [PATCH RFC v3 03/11] media: qcom: venus: Add msm8939 resource
 struct
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-3-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
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
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..5bd3ad21b366 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,45 @@ static const struct venus_resources msm8916_res = {
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
+	.vcodec0_clks = { "core0", "core1" },
+	.vcodec1_clks = { "core0", "core1" },
+	.vcodec_clks_num = 2,
+	.vcodec0_pmdomains = (const char *[]) { "core0", "core1" },
+	.vcodec1_pmdomains = (const char *[]) { "core0", "core1" },
+	.vcodec_pmdomains_num = 2,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1160,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

