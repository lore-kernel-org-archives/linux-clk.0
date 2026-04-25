Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAB36AB57
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141905; cv=none; b=Y2jftUIc1iXsx0Ho/krzRDxLfUdUpJLVujv1Ou3ELDGhQyYvobv78RI8LMtHWwtBOgF/BI6q6kA7drsbnUGO5tpOaveXH2TzQFa7cXRqtZp/U4nYvqFFM7hdvhuUR+yPhJjI6cU4Z0CyXhl8IB9ENwuljLXO4CLyh48pHwu9dpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141905; c=relaxed/simple;
	bh=a7H80R42r3F7Ek1jE2GWR+lyOfXfzqpGUFLS1QAha0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQ8ooXshJ984QpATtgpuIs603xf60dBSqbiK8PaUp76D19kLP9a3O9Lb94GGhumqBvQ5XnCKPOhuDspcC5XODM4CawE8dT9H4GC34Z6UFGCBHSziR14ptmMdBEClmzcHGZtxiGteMLbUNwzrkqNlLYKRewFKZ9WYUDrm5NKlQo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSxqb0e3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSxqb0e3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ad135063so80913005e9.0
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141900; x=1777746700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARuAZF6TJpQOmiY9M38BKODkMHskTETvMicBDgqEAHI=;
        b=fSxqb0e344dGNAPKn/eAFTTXa2QGyYRMAUyJI/vwNvxXyu3ld6A11XMOEKMWmmps+u
         KrWWatBypeaPXHfhkTjyYX6SXQ/Bi690I4Dc74IAIJMKfUNs2GKioVDnmwWsV3782beQ
         +ErpIOnmBcLZx6ZdnnJEPn8Xbv75iJ+NDejoCeTmWYLXH8v/ajLf35MyG3RjU27tigPX
         9QRzMS8Le0VwdqmBJ6Nrt3qUUql3v2M0E27OtTaf2YgFgQMgtPERBGDBTcsxFI4GAbSg
         hF3Qi6HtBVSzHaxniZGZ0JcNoSmlymdu2RLwH5Sj/5dCiXXwPbz2dYM4uIkTcIXKigBS
         Nztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141900; x=1777746700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARuAZF6TJpQOmiY9M38BKODkMHskTETvMicBDgqEAHI=;
        b=OpEtZfvWNJ4LYgOxWooxPphbOKB2FCxMqtxgk1GT5rhf5ncZOxEseHD+4y5AUq9u1A
         xfP1tquNhE366W49sKbTGuFYAVMseKWF4T5hatQTt5aP7E5ScvJsz+/vju0av6Vrvr5g
         ZzmHiSBGqJEBDxcYajTXQUIeZeILE9wguCCLt7JEALlE1g/gw6Z02BWMiqhUW55V2jJZ
         15yPcUW2ENjj+uiVGLz2/HIHc6zNeQ8mCj3jTpUSmEIoNCiM78AdpIP9/Xrl4rxqfsmm
         FI9ZfZbJAQcVUFTXI2F4LFaA+xOVhN4DckoC8RBgP47SQOHzHI2VaG7K4dAnYRONwD0e
         sXXA==
X-Forwarded-Encrypted: i=1; AFNElJ/f8VgWE+OMtzepNHRO74m36wPCyLPoszYZMaJcb2fYo8WOzuF/e+8ge5l0irEdkOv66ZWTQHtJkyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MjO4Tbln8cuhbRCy5LZ0f4/KRpND4i2LL+C6xEe8kUXf7hOU
	4zay+ELlt5UgH3LEOrrJddYSvQRwc8U3zeCmgIV/MlHMQhBXfMkre7/u
X-Gm-Gg: AeBDiesuYPbonZRUsjptVvvF5MNZovPycNJ3ase1uETsYAZ9muT1vS+iVhn/71AGBxr
	7OY1Rx52FXRs/yi4eQ5p6xySuD5S3InLEEeK925mLEtr/MzUYlK/VwC7Ao7dS3wQrFnxMopAwhZ
	E1iQZpCnyQqFDfEX1xKxbOhFa3GBsGuvfy4/raVLovEGy9O9/Q+JJmsPai/zFTMdmbjfDb5N2OL
	wmeVR5RhgLzFIxRlYFaXpTZBkvgZ78u1G1zo7x0LyO3kEIh2ZBpCEAnIZJKWw3EA1gmLFQ8ifjR
	gj2KdpI1D93dYuvMCVpTQNw8KChJl/0zY4kaJJjfDPgyBPi/PZi1QjLXOp4hosJjjUfXj7E3f/o
	DJLnxRwltG3sCi+NcqM6C9azWvq+/YgE9KHp7H1PJ35r66n/yU3HjjVY+kIJZaquPJl9GRguI0M
	MKvW7ihPB5ieiI0Jbo/cclXgWaWZx2TG71QFI=
X-Received: by 2002:a05:600c:41d6:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488fb745294mr323101045e9.1.1777141900459;
        Sat, 25 Apr 2026 11:31:40 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:40 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:12 +0300
Subject: [PATCH RFC v2 11/11] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-11-f69e52b36207@gmail.com>
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
index ebe166b5c955..98526a1735d9 100644
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

