Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F0937CD28
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406495; cv=none; b=rm7BRMHLbPXRAJP/ek7bkQ42buL8r3FcIWVtnQoHQB7aVo5jR7+jDOB5dXtuLGR4/XbYOYnTP23AXZbiOB6gVtGGL7xQvG204DaX58ZnmbMolW9w9yTJ/wS1mKtCkbVJjs7vwVWXMWI7wQDbQO3x+wPgOBgffEb5Y00+AAyselY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406495; c=relaxed/simple;
	bh=oPx+TYWEbOLSoB6gl8GiiVCXJsV3cGiWKVqM3xR9UtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVo4Xri2XUKD9Ah13mpruegYoqN92Fgku91ZoiIu5DpFkVLPDSpqqTBuAJUbr4RIM3Tw2h+qAD8x8LWJU/6ZQZXsARjLTrhOZB6k6lcFrisJ6DY+5S9G+DnGTFaGozHAEcmSCZMbSN4eqmAkYjORDBT3a5jBxL7CeOxdphLbYhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FToPpjRm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FToPpjRm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48909558b3aso36555075e9.0
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406492; x=1779011292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=FToPpjRm4RG+zsaGViYBOCvdo2+0SXHSbBAleSZ2kQyCB2yac72sRj07vVMsyJqIDl
         Go8ZubrjIwoGCm6/SPjgs7lo/T5z3cCgYmEix0dWTV1bc766tNJqpLzYJ1h6D+vnscK2
         79tb5DObwslWUk3+oRFLwsldEMiVUJ+lLxPikurtOlCXxL3fvs4U0NL/0ljpOxv2vMIv
         KNXjcL+s8ml2G/OO8G1OafDfZR7UzNDuxFzoKDWm2K0kV+HULejHtsgsTWfX3SuA+4Pe
         A2sGn4uTLfp6NrXrukjlfxMpg44jMl3wkSmMQxKHdiL5A8mliDyf+04pJSwkY/aBve3h
         ZHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406492; x=1779011292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=pSb+wilgvfGPB2G/nmaIilXmMfYkBCyIQc+T0da1hwTZ5dplMjhYDqXqU9cHW83pcj
         Ag0ZUpiEySvcRsZf3JJpia+souNV1FJIbETq/G+ZrsdqWeNBgcrh8Cx3n1G5k7vBOoW6
         gR7qVsq+2FaI62s38Zwtf/L8FXQEko9AA7LO18u1UCOfUZddd3wCjnZb/bzuReqr9Jh5
         tAGhLVnIj0ZolxwghcnzNaP4XgXAYG9WydJ1rYJa9t4LKdRsOf2gtyfwPTQcW6rPzGGi
         yHgqtW+YRzKAokLGw9kuuVuY1biWpYkEVWtsnafEmWSEbDiJE7RQvA+iEQKnUvy4nwa9
         ekoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Wf0/RLdqZV6kep/E6aehGW4Kj2aIJkPHKuIPigHCymunV0GrByR8vkC5Dr0I3GprgCb9xmol6Nz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf1JS8PzGd6zAjWqDRgCwhSfa9WGSm4JqkWjCZ3jBxie1Jd5gZ
	wMsiwsGfWeZlAyUeogSuZtVRVuVtFx9j1AnaQh2SQcMu1cWM7EpOP0qm
X-Gm-Gg: Acq92OEdZN6SUaEMcXJPeQRf00fwvF/LShkRMHRb5jYvsuzCF087kvI8yhJvQ5is18h
	7ZJQan7+0T+Jv8has3x5C504XHhuc/rTZrmlHaQjZqk1ddjgUQR5dJTuQU+sp4Zw00OvYjnbmSe
	pDV3/tvxl3NMbNrLQwonCl9XiBfpSr96eAE9a67ZC4Vim5GD2B/h+ujcZpDm8CyKue4L2VgbJqL
	OWm4e6GKpqSqxjxQexLHpfAVrnFXzSJ+O66NlWD58CQl4gSGg0neYgyWtUr9uLAId4Z0K37Af0g
	w4+mLRf4RX6EaJ3Vo6b1HaeevIyEO4QnPhWBcbE07yOky3anKEC9tQDh22ZyM6eQtmP6jx8F2v8
	ZzSbo2IzO19JuhheNf2VYLMD3tQSeSzXwaWV99YTxSpxMifQPwFNAVpInqRE65R+a18p0Cy9RMo
	T6hcsrLtl7uApO/AEt9hPbGWKYy41D
X-Received: by 2002:a05:600c:4ba6:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-48e51f4bab4mr180086765e9.25.1778406491652;
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:46 +0300
Subject: [PATCH v6 8/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-8-e69465375900@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Despite using HFI version 1, MSM8939 supports HEVC decoding, therefore
it is not blacklisted. Add HEVC to the type converter function so it can
be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  6 ++++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6ad20d58dda2..75cf63b452dd 100644
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
@@ -724,6 +728,8 @@ static const struct venus_resources msm8939_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..514dfb99449c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -84,6 +84,8 @@ struct venus_resources {
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

