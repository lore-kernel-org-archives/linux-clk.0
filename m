Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0F4A341F
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017595; cv=none; b=Os8Ih0gHDhiGx8jAodAJY4fo4aLv7ZH2XpjsZEwjIG+WeMqx0WThXfdY/ZZVu8yHWCHCsdxoNEE/u1ORciIBixldLH9cLZuxgN5FWcXy1Glky2M2USTpPnkdwCvPS7I7xpYjEkaI0oZgli7GxnvhPBCEke+aKdFG2qzSzCpCXT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017595; c=relaxed/simple;
	bh=//M46Tga2bI34hWrYo8a2BgcoG977Zc1LR/SYbuK1Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jq880rK3g2E/UYzagLzIzN8K0H7m3AjIeT6aILP8fxeX4HjJiPXT+pZHeNqUsx/M4eEdwtZYXth5kCG9OFWpFFgN17AbZR4hrsG3pWBf2GVFMMmRqBbRUeDniKzWNM0Slrz6FcG2nKYmqICof/Alf6LqYEfPElBkhUrD2HuC13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6Iwfg88; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6Iwfg88"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bdc947aaa3so12288667b3.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017593; x=1778622393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA3VhW1+zRSIxiOmiAMnVzHu6j3L3rzzIeEBVV/zfx0=;
        b=B6Iwfg88ad/vaK4zIvY6JIN1bYHDtPTP10C6SxOXbEGngF/B4DYLtXpXDTFvVzO6YX
         Hrfoqs6LFdoXQrZfib7U0NWXhu2JHikfTdH9PK/rKAIIAQgCr/SD98fug9BqpQESDjaT
         twOc6SIGXXxpBiAwHJnpc/NieIX68ZoXN3O13TJxzCkyg6o8JTLRgosqZSC2glWFEPg2
         tzf9yQalZOj4oAA0QJkJrxmYqOD5kGOspbk5ov3AVjNxEj2OiMb2kcwX2j2Qhg9zYpAL
         kAHIPhKNUPmLhDdy+XFbxdp8ZLPBhbRSm37fy0iZSuyBgnOM8d6YDIUKwf6jDFQQhSBa
         q0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017593; x=1778622393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mA3VhW1+zRSIxiOmiAMnVzHu6j3L3rzzIeEBVV/zfx0=;
        b=lPEyLTE39BqkvKQKl11CNx3zeeinx61OHv+evdPtIJ4L/k9+GRYgfbTjIDCEqe/scs
         8v4qrwIToOgPQPF1IH8G0uhbPdN9L2IE5zm3ewVW2prp2Jih0RdHsRw7Z/ek1tuvBuTg
         bZe0r8vCT4VL80lBXGJxsTD/NU3W++tJuNxCecam/n6FU7TE4SEjVMey2NF1kHbJEfw8
         bAJElGK2OYzr0+J1u5s1wx/zo+2vdPjE1n3WThP+Gn1iR6l+HLAfmw2ocFNSEB7wR3+k
         Id8Hm8Glqh6qVxk9bz5b17oWW9xn7XEcqeFymTB7JBgf4D7VzCW7dWq7CqCuOdaPOmIm
         OtlA==
X-Forwarded-Encrypted: i=1; AFNElJ9WVBZ/CbN3g10qGxXI7gfGY7Tcc6R5kGslPoB3NjWQcldTNHN/jaQNszUljQK5BmTK63OAmYsA+5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOeUIdxjCrULTLgydo33iy+1YZxBrQ18pOOjUsr6Ph0rZvWnUw
	APnZshcj+XKvdFE7xHWhpmH8WPIOIzg90osQbmbp+800nyRozMjtQWvT
X-Gm-Gg: AeBDieviEMze3bZ7KYiXHWjxJczS1os3T9mkCbXmSDVs+knPFDd/V32/6GIqa8Be2x8
	ShO5UvPe1FwWXo0rUfe7c3lkJYDNBPw1ekKbDR56ztBn8XtInFX/CS7r2d+SLuGOzg8OZkpAk6Q
	Dzi6BZHXCg3DurQ++KU+j/uEXOF1rszST4tPx3XCnlfVTP4hy5InJendpUVKJnVMOibPZKeXI7y
	K33gG0ofHc9lB/kerzlemEhlWk+jekQqbczMF3b4aPeRAN8R//vV86NbGKTByJCmBzed9LKc3BD
	G01g/GbYhnbS9DpFk8sUn99n0I21WDx0gfPNxp5xHgNK3k3VZ8fB//ZX/Pqs1GOIsUSgwPhmK3N
	Xz/Tin2S8n1e1PDawiPG5Z+kUAH3RNUvi04ymJDBtzfDEaF47FVqzPEmEZVBMihWElwLANafVrz
	3kDRTweMPJZaFVS9iWDCbxND5SbD7gMDsCDn7K
X-Received: by 2002:a05:690c:a05c:b0:7b1:3579:2ef7 with SMTP id 00721157ae682-7bdf5e86fa3mr9817227b3.28.1778017593022;
        Tue, 05 May 2026 14:46:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:32 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:46 +0300
Subject: [PATCH v4 9/9] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-9-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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

MSM8939 supports HEVC decoding. Do not disable the HEVC codec HFI bit
and add it to codec type converter method so it can be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       | 2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1871cf3830ac..eda6b19708ab 100644
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
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..178274d10c02 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -207,7 +207,8 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->enc_codecs = codecs->enc_codecs;
 
 	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
+		if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))
+			core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
 		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 	}

-- 
2.54.0

