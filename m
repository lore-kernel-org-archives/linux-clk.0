Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFA237C91A
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142863; cv=none; b=rpOoJrjFsVp/SQADqAlfXhem8tDfxmKVcXMzPn30FiT2jGqbz/qB68U/Cu5zzqyP3RqLEtJio+5iLeYh7rjGMLroTbR3CjD5jwD151BfJkSTcZyAQ0Urifb2xhMPSP0vUU4lUKkO34fnNDp3PaKs4LRbI85yPJBbHQ+JCsmiA+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142863; c=relaxed/simple;
	bh=yeKVMkjUCCV+q1p8Co4bDn9Uag4aFHktH7ks2v+mvs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aa8dmuxQsPsWdVId8AFAVpsvQo3cVJf24xLRP9lSFOAk7XSp2hulg8o1sGTx89W/RFxHOktoOoLUFo2dm/bOhxJiM42jKousYHZVze5Yt1nt1SKKeS6FrHs/FWqny5Nyuf0YZpCglFFasNUNcQxuhrljvmlL6JedV+yx8DJRuRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRYdQB1w; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRYdQB1w"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bd5e373d07so5235607b3.2
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142858; x=1778747658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4KL0hUjubtc1iTpXhMlizbN/0IShkXnTVoXEHJ3/jQ=;
        b=fRYdQB1wvnt1waSA9J92xzQgi5R+CzAh+t40TQamW91rirHLo7pautIaDT0VfJWWSU
         ddihz4tkQ1Zp8z+evCqxWFVmwAAF007MCGzrdJjCaN4ffs1d652j1EDsimeahq593frt
         FbaVdI/2AiAdZCC1ks/MT4S0h++wx7Hr3AqxXSpiFXQ9JLG5ioPkebOSVp1iVnnpKAgh
         zj4Ij/oL+2lxlPEZ7qzKljC8Eu6Jl3qDnpUuiwQN/mWgNDqUCL2NGuCFmPhl7uwr0g3d
         3LBri+ZK9rbX0sqHygBaJ0NWrLHbUhReSba/44aJFpv/1AbcAZdi7KJJkM1guDbl2zJ1
         9m1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142858; x=1778747658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r4KL0hUjubtc1iTpXhMlizbN/0IShkXnTVoXEHJ3/jQ=;
        b=VOJjYsUAcgeQ4eXnOjrPCfZooHqBJ98exI9yma2t7fT1yKjvbKhQrqZBN86jgPOdmS
         sNUoeoUMYhjEJnZCmtmIwyu7OgkXhMvytvmk/bKId7ps/6ecIPQlecIwkvgUI//0MPNW
         TMYMCRSG7+f2k+3CQ1B1saBx3eCSsvlqNOOpdVxQ3rNY0vP0DO61/gJA3sU3Yw+f7Lru
         muCPeiUDyteBF7AswPmEp+aYzC6FBjditdcwtN8tP7b2ojAoAkyas26RbwCjruWnSHDV
         H1VyV4XYZ9uKQfHbXPWAPJq5+CTE+PmuTeVUOgp0H5ueK0sjY5B95lkMjBZWTX26tQLh
         9F0w==
X-Forwarded-Encrypted: i=1; AFNElJ/3I7OoNNGjNDodW8SFUs/jlkDlNYv5mv3r0PKSkBILeT94vCdBtaaU+KWty35XKugmLY4BvLFHcqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+99mQ/yxkjDPhBAiHSk8obLuROWD1RRzrDcDVCcmzEQSQ8gfX
	fqYuDl/4HSQIUzYbDxk64N8sQZzSRYfTeEefV+vJEl66OE3PoiVmdi/H
X-Gm-Gg: AeBDiesmxao2B9F/bgLDgjRHyBrEv70uJCEG9gM5YTDEgu5rUum+cT2rKn5nHNnYlre
	9paxVSfcGtFYuNACGRoraPFM3SxU2+SPOWipmXRA2OPCaN8G+dDkmjQccKvkEhwX74fVuAAQOrf
	7FAID+6NfbP/VkjO4qG/sePUfhNqq1uTnjPVVVeNr9yRhz341raQQ0vfHpGvY+jUdu6LPHEP6w3
	KSP0XdL+EMJU7fFfKa2UNYT3sVhUUI7IAom1DK0mmDm0HMfZO+ObK3bgImCHVx5vGNtbXRPGYFA
	v6IX0VQqt3KzLJ0B6iRibPo8m7RGKMhehEqXtHxnmmtjW5LmIpwzpXpz6zJKL/VGL9rSOnwdEjb
	31ywk/WpZqkB78nXVga5soWv/XBbloCIjkWmCUzGLaQM9NBJ0xAHY/jncrHT8pkpbJNm7sHyQee
	xJxDaydQXn7ojWbs/y+Pt5VGI77JpNzary9Icm
X-Received: by 2002:a05:690c:6d82:b0:7bd:6a98:58cc with SMTP id 00721157ae682-7bdf5eb3657mr76238307b3.37.1778142858424;
        Thu, 07 May 2026 01:34:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:34:17 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:22 +0300
Subject: [PATCH v5 7/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-7-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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

