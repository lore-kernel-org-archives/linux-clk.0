Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EA736D9E8
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142869; cv=none; b=mfFscsHQuWX0C0W5ONXo58uu5s30V8IFO8BtzXjxT6zG43c5oMIGn0MwO+GT/AGTRXIQghX4T9dHBaJxz4uMV6aUw7mggZB9sntS6uOUJ8ZHd2sReFdmxGg/BXq06mpPbPPlhi5eVZwCmDAggBl7PPempphqEtHom1J9TFARi5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142869; c=relaxed/simple;
	bh=Hgic8MxAnTFchNHGOEh1DGqhIUm8syxUYUmVA61qdbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhYfTwEWiGYgh+VYoB2t3YZKFcd3gLuj01M0EtSILvs1O+FN+htRQPNVTmV7FTXhYGAbLze9lWppOalibApAevuhBTdclvGkYFzJ6v9q0E3W43KiYWsKhKsLIpJidDr5eX7LAH5BuR/wjopBfl42y4nM/R8sAF++R8o4cm3DY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKaJ/t5P; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKaJ/t5P"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-797ab169454so4950737b3.3
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142864; x=1778747664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mztCL7JMamVAXPjkOpC2zBeTslrHsHuCunn4L1+puRM=;
        b=pKaJ/t5PeESzq4Ku8QJaTko0AFoNXDrstBGeJbCiaaOYOV1Yxgt6ECLJ9y+19OFDCJ
         jlHvWF9kwHqyB4z3x/RApNHtEefxc55zgwp9rT7I/V6x/bStZfuVW1zximSBx6lc6YMY
         F/cseBlHVL/fn4/aOZB/ycQba4Y/DqaG/RLLggT4lCMGxBzB0h1Bdw/MLtrHf8jU/QVn
         mV7XmHoLGY9Q/2yEnq5clF9V/ZlpBVg5BvtAz6hTuTUWbqXz8CTt/+65o/FN3ydfPDRW
         x5YL9CFCKs146RuwF1yslsWhtjcrEhV5BGCUO3FW2Rk2oE3CCaYtvxjFpDMNuit81+Rd
         Ue0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142864; x=1778747664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mztCL7JMamVAXPjkOpC2zBeTslrHsHuCunn4L1+puRM=;
        b=WGBMJA6fIURtM1x7ZvUSM09LSeaSTXjjq2fq9R42d4H+4cCV3dSmKpkNpCoBmrmIeg
         JtvddrLbaiAFo7POyRgMUcG8ZEUcliOwctsztxFNvDqEb0VgFWd5zhXI/QqicIkVp3gp
         r4LYJv7Ne5744+yd/hM7ylGDZ2sM61Nu9tNQOzJ2zz8OBsObDVDusyi5KMpHnV/EVQD2
         qqdOTmxg3pnuVGZA2yNuimIZzSOULDYROrQ3Z/yQAYP3Z6vvB/Gql919NcCoHvkUqKRo
         Hy2itfzXhRk/1fHToqOO5p87QQ/Xg1M+1wXtkW9N3UdbzcfoYjI/NywQMcgQTSHQocwv
         eT6g==
X-Forwarded-Encrypted: i=1; AFNElJ91Fmw8YERlXvIKYyZPpGxsd22gWTrtXNapan9geS3rKeO9nIysO5s0ObjZXDv7o5FUh0S957XcbZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cKItz3EsKNbtxvd55rarmBIZKLzpSM/pm5tyvv6ut9DJSC+U
	W6VRNsXpLaQ4XsxxZbZfHVevHE8MIdwvu5VErPgNcGUqELwZvwzA7PRj
X-Gm-Gg: AeBDieu8tKOL+uwLvcx5JEH89ALhZMpYNky6eGBdZCU8S3oxUrWNN38WYS6hYKGEu12
	KL5P8hTUgl/gxqc2VNh7PVK1hFJpXivL/QPJUHzG7ODT6KB/T9kGnEZEJw1D6GbtbqCJ0MponuP
	9jxT/8maOsprmOehZ3+1XgLCeMH7M8QXzpMpvM2TcXIBueAmtlioG61SnJyLG6Oo9PqCQ6Srj4c
	Ng2XegUXWusMtVTDTrseV3DNXHt3BIB7P4g7qjjhYKxYoAfjpZn3i0HPhvsT+r9lqPQG+OUVllu
	yGlsTsAz/7wyb2iqi7ob7XCTZZ6tcgzcedH4sNKVxMDPNhZyiEupLorw9fT57bqdceZAxxGW34x
	9HDP8DeQhAGJFRPi7k1hk+grhZ5NdxgZiAgL68zrzvB++vm7LrXgjWOmdJaTGi4F6CM4IBVr1cW
	hZ6qhujtwjgJYIwngyvmEt4zS/hla0YyPStksI
X-Received: by 2002:a05:690c:c4f3:b0:79f:b903:88c4 with SMTP id 00721157ae682-7bdf5efbc18mr71178527b3.46.1778142864586;
        Thu, 07 May 2026 01:34:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:34:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:23 +0300
Subject: [PATCH v5 8/8] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-8-d7b5ea2ce591@gmail.com>
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
index 6ad20d58dda2..89798ad1087b 100644
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

