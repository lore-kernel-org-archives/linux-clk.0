Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B433F1652
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312776; cv=none; b=DNJ71/M/o8Lx09FQm+I9GjOHd4nfmYUt16EJmD7Ae8LstYy/LVXfdlm5iX2gU3YgUKCGzeNJIGmattAhmWzNLVq3Hzh4+b7Jf4Lu86BqzJp8aE+Cs00sNX4G0/aiCoTpLthajIVsK2RJtVgi0YNIRBH6Qc0Gg+lys/+UUVZGJuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312776; c=relaxed/simple;
	bh=jaeITwTqO4QGRkrd+ii3VEXitM34y6Z0TnInmvQS8UE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVVsaOw2pqp4IpKMecfGJiU/bni/P9yCl8TmAds3BWDSr3MYYf8/m/zT/UFk5BahF/dhdxl4I37Y6ODT52UnFhSMKJxGnEJV4/Br3nxjyt20BUMILwipXPNP9Q55w1/Y0z1OiRu5pkR40Bjj8vxfIsMOfczXAHhdq9fA1NQ2g0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cloFT4Ur; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cloFT4Ur"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7986e538decso104367897b3.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312773; x=1777917573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UonjgGu1yenUo9y1UU2Zm+nX8gxbxS5Oh+dqLJhe99s=;
        b=cloFT4UrX1eHGRseqTfWtZAWUrTYM1Ah88ObizgSjn2oOSz2i/ut7BolUj5m6OobQO
         AtaJk99aTPh+N18Uvr9OQkBfkJDl/vwpPR5QqLJYJaY5mTctquf6ezA/i4cg2n1zjzsC
         Zb7TV7Q3oK25agJ8K6dDg3KbSr/kDiF+zLK5YPQBaGbH2EN7+KLishycnsONW6yeo5td
         CGGQJk4q01a3iP+IMcLZhCx6EF3K5NzYwi64/vLiqLME5OsB3h4Oe+ctYv/zYYjyaM+l
         ca/sBV81xwQWjg/S+K4ctBrS+hH8pzStTLoq7dtOQ5nYCbGIPh8S60Y/8T83QNPLVDo1
         RYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312773; x=1777917573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UonjgGu1yenUo9y1UU2Zm+nX8gxbxS5Oh+dqLJhe99s=;
        b=Gubvk4XEmAeeUs7OSEWLHoKdT31sTlAPoqU9gbOPdAHk/VIHE/Lfg/3H8esz68BqLk
         qdbAkxVJLb3kmqBObf9bfrBQO0jlZ7H80Pv7Z2gl/f+Wn/MGDKSiQiFLGLe4cc9w6Fk+
         G82D/JL8s9uxTSmm5wkltfjYua3VRvIUwxZzvRWyI75ZjhKpvmEsR/oWF7jTmEfGIifd
         VzaVRrPKEnEgtmapOMG/HdZ1ZvDk/RCiGmvyLnaS+p32xiNB658J1d1zHFT6PlAkZ+gh
         kQfxGuwGv0KyYiIMAKgeY8UANKoeiHonAYz9tuQQvDm6ISIDUNEqt5TJXx4xqNHcptIp
         p5xQ==
X-Forwarded-Encrypted: i=1; AFNElJ+va/cNXotNopSfkSITFmD7Pzk3UTCxQ53XcV/kb2Rbg0XtFW7cMunspCzFrW+i2GCGJooCQ8RYdd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9nAob8S4xt720hTrwH9Q4FV3k/VMrZAIW1IhXbJ96OjsRJKPg
	8b7pWrITRfVaYIhXS1uq4BBdI088vSHpJOZjCsKsP9XJ5R6s1i9cXxmKmP+Komtd
X-Gm-Gg: AeBDieulz5YxaKi/WcKfSI/pThpOv/92sWMKPd0RT9638PVH4Jt5k58cer525ibcdto
	pCzq1mg8xM2BxSw8jHorIIdoxWHxbc/ar/jbijoBR4uH2X1l3H5pWnhicDBflkjqge97ojOLc8h
	1QJ9mU0aGnjsdxG3Ar6AoBLFWQ/rkfnPn8yw+7UolvVv971H6IylEpF+sE0CYhdvW/2J6M1FyVj
	bKdJzT0Hhxl4Smp1vxugiHu33Py/eaxRAMXQMD87mlLbYQNI7R361k6p5SRwgEwERza9ZpI9Kif
	Dq0eMwykL4CeWzM75yLoTOIhEPZI49W07oVQtcFVGfivQob0HWUgW7EQjnfw0qUEHQh+APPYX3o
	jo8w+WLgmNqfmXt9LjbOu8GMl4rDx+DAQ4IfJz4UxBfUb6DDEvRY+aitiQTIx8uJtgC7xOkTlGy
	pFMWH8bMD45nJnGyms4Xo/iOym70p/CJh2/HAWmyaWqoC+3O8=
X-Received: by 2002:a05:690c:9c0e:b0:7b1:e942:bddb with SMTP id 00721157ae682-7bced9fe6bfmr3858847b3.13.1777312773578;
        Mon, 27 Apr 2026 10:59:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:33 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:33 +0300
Subject: [PATCH RFC v3 11/11] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-11-288195bb7917@gmail.com>
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
index 5bd3ad21b366..943d498f4e4e 100644
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

