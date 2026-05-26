Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F7A3FAE01
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802310; cv=none; b=MNRiRDiHiSedixVVVNXSBpLH+lPfSasD+VcxBAisyQBw1c/2UU+KFh1Y0rgbDPzsOA206iWuAuUcsZLLH8wE4ewAbNQt6wyOTUCknuM0yvAjkNUAzSHA4TrynQ9hsiS8uKM+q9NhC75dj7FjeSEDEY/rHr6wjBUZ2tzfSq2w5PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802310; c=relaxed/simple;
	bh=DevLhieZ2Jb0JoG3u3mXqGfpLCKqdiC/50tm4MHf7SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qu3spOcSkKoXH2o1eNzRC6c3xN+WZZdYf17MxshU64KcxYz2leyfEFw75dCLTimnJxse1mVK0TSLifbH56YynVjrRB8gTJw0DIHs7ZUnhbfNBoRMl6TBhEvsM6BNhTHVYXXYnkcyu6iVLReHQIzOeNm70XRFx/grEIAM2EHfWGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrZTYUmm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrZTYUmm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4905e190c71so25415825e9.3
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802302; x=1780407102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcbIlr1puve+xrm8T0Jkr/obWl/FvkGIhLR+4PXKcyc=;
        b=MrZTYUmmg9/KQcCudWc1YnxidIPEaKqKlH+V11h9z2R80GGaxsHtIgfNM1fSm1zZOW
         7dxaiW4b9pfXsh/Wk2+8Ecx3nGkuALUFkshw9DaMqurjBDI6swKk1WRtTOLmshHvZ0ju
         OIGM+a82zpyh0E6I/rfi8sOCroFdvY4t+HMt+6fhWmlcsExqXXnd9Q2wOEGF39GUCtmA
         yypR7IrJs2KBmO4LjJfbNuVwoz1QeYXgF1kYJ1rj+Po/qYWMAT7AKUCEfIdoYdHzFVlb
         Jluluw+XR/FUXlgoqUmDt5Pg7bNWUjP5mVgsUA/4ZSgsz/xQFQF1rrlzUCr13anqR0sQ
         Nv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802302; x=1780407102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcbIlr1puve+xrm8T0Jkr/obWl/FvkGIhLR+4PXKcyc=;
        b=ALabVKeWNLFs1T9IS4aFSOAp6caN90u8zv6oMsvkp62QDIYk1G2/hdvXMVQdc3vTzp
         ilUgJNQfexS18HCP55WW6T0P+gaesjk9ZizAxawv88RTUmb/yzurD948JGnO/saEzjT5
         xQlcPUm3+bQWUUKaiPpu7rHE7X4DUmaXhBOzaiW+G5k24M9rVFIabFIBWNH73g0ANqE+
         RmuYZ+4wxo3rxC547mJYI9DCrK6scZ4VZBImB4p80LxiQWuitFXacmrBTbxfL9GUBai1
         XrLF8meGWyOH6q25kd5IbHvsQLjzJsCCBFTHcl9gZTvylLLdF6gK5Z8jutDBOU2DFKhD
         CQcw==
X-Forwarded-Encrypted: i=1; AFNElJ9HDsnAjiPGXk1IeYlLeus09rdXKpxt3Xdr7S94fuWFey6hpvC3aQBpFe5whVgY1uNI+IzVLFhFbvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoRU3XBjf7Hp8L7tst1SOj4LzVZhC3zKv8yNsD+hGXP6BnNGHH
	kjikZ5zMwt4CpXHblKHASgLDaZMDI6n4bYPrzQG2nojTB8BNlVDWGkd5
X-Gm-Gg: Acq92OE27p0FikNNB1yUPWVNhXXIb0m/vxYnleoLF7NVAui8r8bBE5ftQgORcdsDUKE
	rAsl/R2duxt6igMkKxHjCbg8vVi4Xg7zd/mm0OmiH4SFe+wPihYeU9vMmxPkbxeRxiyn1auZ4lZ
	KmS9nuumPOfdeVTxy1P2/xMUVQWgNFntNfLb5myYaV/Hrfru+W9/bLmcKAFxS29Gz0EHk//IcEB
	pBFm5rSIp1AHVS7PXRmVGDUeW9Wb66RoW2qcnQKMkaIWld1RUq+IlPu3Awu8qfJ4abAdoHkjUzb
	rkynODiiy0pMeLJn/Mz0a+hOsW/TzhdO7NkiX3eqPYrLzGpEsljwwBkae0k1+RIdJWEQ1eu3Yus
	Xaan7WogneWQxfIgxT7AU7Ox5iadBoio1CNjaSi8muCkbycRJcAq/LTLT7wMXZ60Yi07h2MhO1/
	NMqrkdJJ6sJ7vIzYCkUHmglPe4yQ==
X-Received: by 2002:a05:600c:84ce:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-490426aba7fmr175000465e9.15.1779802301797;
        Tue, 26 May 2026 06:31:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:28 +0300
Subject: [PATCH v9 5/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-5-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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
index bd88e2b484a5..243e342b0ae7 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -693,6 +693,45 @@ static const struct venus_resources msm8916_res = {
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
@@ -1133,6 +1172,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

