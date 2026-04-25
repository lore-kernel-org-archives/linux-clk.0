Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2804372B2F
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141892; cv=none; b=G35aMm+mpdmKfm0oC/HeymZOTy1AsKiG/AeA9v6nHELgU9qIzSUAiBrAbTyKZ1IeccC/tDhRn6aC++yH9BYBURqO76Htrcul0lP0h6fE8WhN/k1oQJ8pqUMzLdLLm5QNN3Wu2Wxk0Q9Cd1H3vHejBO3Ys0FKxjIJZRAZFi6tIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141892; c=relaxed/simple;
	bh=LpD6bSQrYC1BjamcEs0u6YsU6tL9lz8IAu4zl3kOQh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKTR46Ambpmxt4YCZb34gAkQjldC7uw58eh6fv2nqe6mUR0eZ7WRrAWrgCVxd86UnZcy/qxqW0N/u6F7E8GYwhXyH4rxHLD6WUGBVfV+fcTbVe4nO4UmEvUp2O25UpRnimP/wUopAfjFCMnocED0J9olM/SYZSoMQu1mBRDzbfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VT/Ort+4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VT/Ort+4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso73517585e9.3
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141883; x=1777746683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V1onxXfVBoDwpXP39VrgYBBMWRu3J4MOQfpF7jti6U=;
        b=VT/Ort+4laCNJMTw5benZ6n/d+RPfiSGNaYXD/bX5Uke3ikX01/1DVc5RRLXIT/K1X
         PKXyvlM9nV/YHMNFBqhWcE0r4vPViI3JorCg4XeM2V3Uek2sM/rRcoOnFtxn4ZwyzmJA
         b9p6c4KTW63E0zKVadJdNAb8FBx/OYAWqOWLsacIkPLUy0i0xHbQ6UqCYcYBRzZEZgts
         2CgOQ8IXOeClzB6Edeh9K5DAF7zHgHMpEq9Tah14wYHtpOtvkoEg3Uo8RIcZJ2tVkM/P
         GzklJ6LjDHiQrHK/E7xa7Rm6GgCnOfmufK85hxdRtyjO0Q+JExhj5f7HBWGPqny32Jcq
         oykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141883; x=1777746683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7V1onxXfVBoDwpXP39VrgYBBMWRu3J4MOQfpF7jti6U=;
        b=RibpUMcNpk/Y7I1RP3To0oo1lDyRTygAdYQdgR1i5v7uK/8aPzb2kSetsw4DWcIlzN
         IgXpPhkF3VS60dAT5mbWUBhofKqJ+6L8aIoCJFfXyUazoGi33xJYo3bf/EG+QqnjweTN
         3Zl2P+5ahO2vTCQkDPbZrAGmZEvsDAFZPIqdDCKOnRX7RvzHcVqFQTVFalb4bVQEzGQo
         3ks9sPOJpd8jMeGdbSC7zRvyvzxaiHYCElYoriKpOeDrZLZQ5LDH+cJXHyvXA18Hbgnj
         KjJ0/0tIMv1aTMYRhGB+Bu87LxDTOwUt39pjO4seqr0yw7PgriNzU++47FvERhwS9ASz
         EGXg==
X-Forwarded-Encrypted: i=1; AFNElJ+Lv5W9RDAy+AhzMWEwhNNHJO/5tON8lR14A5X7GiaE3W2/zHvu53jp/qFV9QH2z9EZwIDt8gNO8jU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTUbxKsGwMecjosrQyRi3CglY2/J1KwcpXjDJ7LUu+1lLQgakU
	WUirdJ/HP6iEujNEYlZUzS63oJs1OyA1ZxPHhnNeXvqFHGV/dP4T+RMP
X-Gm-Gg: AeBDieucXu8gsujWTA1jlkOXt5j1AmMrPn0Muj7UYP5B+ycGqrrEpwQ6n8Y4YA/cQCc
	Ebmdbq/21d0HroQDucwtwR4LE4Y5jyGbuREUEfQwok4mtf0yshA0Rd5diJz/sRGylysXPk5uFMY
	wUDsG69Op/sP8E280eYQrIf4If756Lq2oxVjSZi5EmvpT3ldzu8+oaZ2QXnI4zHqoIUwIN0sIqm
	HP23qM0HWn0/hHUqBsZNCj/MGrDDvxy/HpoOHUvsqp1eu+QH2do4RaMGCUm5ier53cVqWgc2W78
	azPkB4GF/gHR3Gzp/JQAlRbayj8fExNMlGjqut5jI4+RRK8wtFgoUT/lwdPXog+lAFTVS8BZgY8
	3xRwAMJUuBsKvy5BLsWX3NAs/S9hJEnZkXXAsvOSfWcZrQ075leOE6uqYHRjOWY/LztoKa5f24z
	kAGt2nBc6qItatqzUf6rY9zp9LwMnudoak+lI=
X-Received: by 2002:a05:600c:33a6:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-4891c1f38b6mr230516585e9.9.1777141883035;
        Sat, 25 Apr 2026 11:31:23 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:22 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:04 +0300
Subject: [PATCH RFC v2 03/11] media: qcom: venus: Add msm8939 resource
 struct
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-3-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
index 7e639760c41d..ebe166b5c955 100644
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
+	.enc_nodename = "video-encoder",
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

