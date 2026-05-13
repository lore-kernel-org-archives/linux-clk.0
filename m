Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBE13B9928
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707583; cv=none; b=GBfiiph/5p7/DpAE9PNfW6NXB3HSbaVzP8TBQH/iNDSKA7tTKxffHSu3YesSlcXZsphVghZQ9AOW9oC1rH11nOsSkJS/mhT8Xbs/hRJW/ERuJj+/gC5T6GEEcEwMtDAbnxgXBXM1fEHGoOo9GWYZ+TW/ZD8NOFr/coOJm0SV3g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707583; c=relaxed/simple;
	bh=eWvwFj63Oe5rLHhL9VyXX1Yhyfqj3Z9mzRiwe5LaGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJambzeOTGRSdkfhFqaD0dGLiySC+2LgN5OqeWVk1HIC7LU/XoJ41jh2+Hgq9jQvZTzwunXK0y88XitNDfiviBNfCTGXu74dJOQ3yyHCGUSN2tnPJNEJXbelTSJCjFAUhh5yDT5Ld3DbnLQl8veqVbRddddoDI93kjMWpfyXzMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip2Xvq6r; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip2Xvq6r"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-65c09c1d000so6503331d50.1
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707580; x=1779312380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=ip2Xvq6rdZ3Giv5cML3cUgYclSNkxIHf8wTKmdyNK38TiXuS/QwfgaL/fTWa7jcBfG
         sHwC6yuK3X+uFSbsPAlhDoDnlYXL4MKjdZlcXRHKhVEnOW8GvWl4TNg0QS+9+OEDoys8
         dmB7xLo0R//A2Ajz0XGYkFXPzceIUBvMUakJK9C2UnvO4oDGMzgwSD/NvxtTrNp3uUeY
         B/WMaQqzFIEGiEi3NenX3UPPt/kUxA5Ssqd2pGzJL40eluiBaGZhuCOX+72WT7E8m/QT
         mzqdAspl/az/o4bhQdo5eOsYz8FjnM3TGGwuKiOj1rbTMSz3M3w6pmwdfg+e5g/OJMRS
         qRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707580; x=1779312380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=DMRSu0FkJ5d4CWGdtzsMzOk/gLpE8QeKOrMC2W6Cq7MCKGEGSJmLE268cTrog8hRK/
         Ih1DdoKd5M2+Y8AjA/Axot+WDQkGKAjDmOtuaj59KIkRA5woakRV5dMMqbxtF4qdoj5A
         uf3PNWxsDl5Qt2A1Yr/MENzk6cyUKvvGHHzWpuuT6T4y5Pjy4VcXombbe216JhePkw0U
         sxEDLocB01PEV+0y6X26BJ1SFv323WwneXF+zDfpH7Wnxf2sABvLrIn9Nroh65+SbuM8
         wyAyiJzdnYLVkW0lrfB86/zs1dbjq03P0R3MeV2PwnrQ7eaB6sdJmco7UyHjyu+ZbDSf
         ZH6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9t5FVhXkJNV7dEOtkVjQvxtjF5dk8n6wvNSU9fILVWvxbsU95gqYQMM3PHICewIgn09B6d4zikeMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNxwMQ5q9CNTa83tmxBx3cNvEbM8nSad5BD+oiOi4QZWEN72m
	hGlUsc2m9c28Edefufpdshp/ZPl7OxqzQE914u7vERN4O9sxzRDLcf9F
X-Gm-Gg: Acq92OF71QlTrA/Ntdz8R3InAJCjWbLkL6E68QemA+PYgVFDrlSsJEWx1b5Y6I/6lff
	z8vQl1sQ4s5bHIXb2Wr+LIdbrRuvIiLTLCarAGOuPRILvhtHb6LJwvLXxycESHJebxPx/eIMrmb
	xmfWXQ8M1FMWFm4ymBMPGnqeug3mGAOpNStTaWrkKw8qTddkgdjveVRn6zRII65djexbvqgUM7X
	2N9lqlrueEWh/aRNKiZj+jqOE9O3vyWjlv7Tdj9uMul9uv+nLXgXQEED/uhw0sK/Zij2q2k+OSQ
	CRdAPDciU4nSmyplzyFA+sDSIf1UBdJX62K4hJcg1nzlU4NW1apEJHknsQot5pPjUrQm2mAnmyz
	pfVpGsDyJNrhxsroPjvSZT3g9b6di0UvAeOqlYn7qR2AAnglEqoD8MVVNIQqb8duL/jvM0LQRSN
	ilsqwQlWA3j22CXumEe8MriR+LSA==
X-Received: by 2002:a05:690c:6286:b0:7b6:783f:2122 with SMTP id 00721157ae682-7c7e668eb6fmr11694307b3.9.1778707580397;
        Wed, 13 May 2026 14:26:20 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:19 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:36 +0300
Subject: [PATCH v7 7/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-7-33c6c6fb9285@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  4 ++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..1b5e72980702 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -178,6 +178,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
@@ -684,6 +686,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index ff9174a4e8c1..3f162b11e669 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -85,6 +85,8 @@ struct venus_resources {
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
 	unsigned int vcodec_num;
+	const u32 dec_codec_blacklist;
+	const u32 enc_codec_blacklist;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..8e762cf77968 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->dec_codecs = codecs->dec_codecs;
 	core->enc_codecs = codecs->enc_codecs;
 
-	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
-		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-	}
+	if (core->res->dec_codec_blacklist)
+		core->dec_codecs &= ~core->res->dec_codec_blacklist;
+
+	if (core->res->enc_codec_blacklist)
+		core->enc_codecs &= ~core->res->enc_codec_blacklist;
 
 	return sizeof(*codecs);
 }

-- 
2.54.0

