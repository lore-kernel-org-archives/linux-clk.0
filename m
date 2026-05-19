Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FD6407CE0
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203626; cv=none; b=u4kjRXOLefuQ+M/IqxMUZVmy0tFHQAS0HLG611lBu9uvHuO93jjfrGAfBTbt1ZPiRWjtnvDZUmlDePS3y4YxbNhDVKgw0VzZKmjRAOAzGp5Znn17E/jZB/zYl4kRVbZc21HGXNA99Y0isVkNN7ySS/526nSl7eoeL3W0q/ErDdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203626; c=relaxed/simple;
	bh=SKSKGA5wu5mHBy3LdJTJn/ga71reNQLH+wzxBhoGTzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMY4MqKMVJSeOKG/4EE1az/Nh+h7H6FzJRaDFKFmB9E7tFAhGalazZoGR7eNv4FtuBXwf+SkFGG+0GKPY0sYYu45DL7liC/MomJ1oAq7Pv6UkgxjKv3ADMXnnNmASQ2jTpTPFb4ajub//GPzgqQwc8H8KaL3QML94/MzCSuonNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G59ac6Zk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G59ac6Zk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso8352565a12.1
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203622; x=1779808422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOluIAb4J/mdtDnp0IJFTCHh0boFRqdkW+b5Er43ycM=;
        b=G59ac6ZkOahl07psVgdDZSUW2ys2JRHh68u6YsjMyNf6oWNudM4xijOHvKfuekh3Nu
         p8zU43x1mxMskdRzRNnf9d2ZKB+3mtOm9pTAoe56XahyCrg1pgMDCmu7/LCqzt7NquV+
         WA236oJgLTexJjyZ3X9TgE+ZtE+vKxHHk3JnGSyLtZWB6udaan0XHPr5Vhtbi/0VcwxU
         Hg8xENiRkDyJylakwh2L0NtmRf/aix/xUxJrlMyiZrhZW/uA1GPFHkfcHewctLtWzFEb
         LxAB52ef0voDNIL8Jf8USNIMBKTWHsCxMwEiCh2Xho8Fhj8GzUVmnSC2zb0mTlvo24W2
         JdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203622; x=1779808422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nOluIAb4J/mdtDnp0IJFTCHh0boFRqdkW+b5Er43ycM=;
        b=hU0R8yEJ3oEoBFL7R9WLgmOEmJcneGOVV0G1xBft9pUt2VOs2xnNjgSS6F+3COweGW
         5KZmJyWUoAmIs8WWuLKXoUnayw7eyA+XJw6XTdF4dMoSBP8FmCSe4JeOMGvYXS1+otD2
         tPcvsubQELiIEZYnNKNhTvrx2kjCbd0vdMHkCCFK67a574YyuH/ojGVzJulxnf8Fe5lP
         WeAtdrcS3L4eKDFOsijEgenYWP/xzSUqpRpmD/WLm3+PfytLvCNfGFK6RXgtJPwj0UVk
         c+fklryR1fm4UpshR/5SPfFU/5rcLx1y0L+PzuYe9neRFa9qd1w07YgnHrIH/AMj5E95
         1gTA==
X-Forwarded-Encrypted: i=1; AFNElJ9Pu19QXZqWm5Y0zlBqh0vAVYVCv6dUi+MgWnydScTwz4BjvU/AoQgkIfmrgZWCoiqceMx9qJGauY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTahNAB/UO0L7rtHQi1AUNWz8DSH1rU8/hW49ewEWYwa/UlXSW
	/KHoaov6+8Fx0yiTdhFcn5+X/UenFWNdTBwAk8Os3CFWWi57PlQMY2sE
X-Gm-Gg: Acq92OGLN7Igck+ae9Sr+bEa7pZOC0rmodcSYJ/UzGpLvEeM5I9+0yB89iBJWjIKyXu
	DZ8f1llb8g2knodK/BV3cb4v0dqKB9Ho5J/oKkcC/YYHueQeif3aBHMuZVT4zkEK7qz21VaFSYG
	BNHsB9aQO2Ff5Nf4KcMpYK2lwdkn7ulTKXKb0j//0jpbIDvN7TbW86Qu0ZhfxwcEYyZpchwM0cM
	5CVlT+ICsamXrSu7IzCL12g0HqbaPt8RuH4FAx7Y3FJ5DaB003y+v7DmdmA8qad+ese7IgYDHiY
	GMkEl4JMhdl+MkfDGocXcifC+La/MIpD6BRMwVvIgPcr0BD570gDQd70f7QBe9qdz2Z+T6WEQAm
	SAIolLWCLM0tbJInlWeToejHEZ2ZZ/rIhbXcXor4vloV+l3hoSaWfIjVo53A2uVSf0az76lKuZ5
	Ks/uBg8jcWRWiF0HmhuoygENK5bQ==
X-Received: by 2002:a05:6402:358e:b0:674:40c3:f047 with SMTP id 4fb4d7f45d1cf-683bcd9eefbmr10573864a12.12.1779203621784;
        Tue, 19 May 2026 08:13:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:51 +0300
Subject: [PATCH v8 6/9] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-6-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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
index 3baa6bb4968f..ef9081d5335d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -690,6 +690,45 @@ static const struct venus_resources msm8916_res = {
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
@@ -1130,6 +1169,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0

