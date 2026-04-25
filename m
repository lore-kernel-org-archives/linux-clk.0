Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741ED3783D8
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141898; cv=none; b=lOqdB3bMQs0HmTdmS9Ym8LVgCfsxfn2jJE/twAEetMj15MZ0Dztprqxb/65p1xqlgRyMRfKNOOA++d6Z/+gAX+U2Cc5H9d6r77oLdyoeqaLP3pfAxbc5WshDdFLdGrV6s/zQRKxuRWrEOhBSpyJi9LPU9ocnPkBKL43GQ1kATo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141898; c=relaxed/simple;
	bh=tDAlsKcDHucm0PMV2skHLBx8pgweOOd/KInCPeBESn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJMng35RKIz4dLogDP34Lub7AoZ5G7pcMvnGBAbHLiZ0F7c6QqHS3VZcRRjGrzuP+LYCRWroaFZsGhs5fLL3O6eYgtbMmu1wmgSGKDWPrB6+D4pzz4FOJklywkSmNX+HbteRXrIUqdmo83waZ2EHyPce8HPW60BbufWSqyjDQx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhL0F4Cu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhL0F4Cu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so104052415e9.2
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141894; x=1777746694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=bhL0F4Cuhij0g00JTwrvocAdkSOsjDTaw7hE++UVsu6HLQ2jaiXFLNITMyMRikYCNc
         jIdO5qepEk3mZWXEfgsmOGE9UMclCvh0KkCE7dXKKSB1U7I/pdm90MfKXNd6JHSmrcyS
         MSi9xzVoGEfbEqA5i0nOnFZwsjl6k0g8vK3K4yxw6ohmiRPKOjvskA/r9XsUMnw0Bs1x
         nNEsqw3K6BivPUV8UbLD1trTmIknRA7OrrsT77HUo4f5t2woEaAFuYy7s8oYLcTpiHeS
         VYYB70aSec2M/ka1sbtSgdHeUpJFPkUhk/BeyV4CvfY1cLeGClce36RUmmWjQz4tj2cW
         JnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141894; x=1777746694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=s1z8v4zlSWXULaIC4I95YT/LTKAfc9MHY2Pqv++aJXI//jMSTfBQLSIocc4vDfPZel
         a6Av3ekAaEI42g0MgdT7y9fKqgGWnqT0xaYWIKvsV169DTkp03A43WOq1jH5Jc8xC44i
         eiERo+kiqwHF/S3yvxahOYFiXptvi6gZZw9Z1imu9zBuKsDpBGQx4gpM2PnDO2nNAQ4A
         NmgYd8ZAZ/eA2XKUfmmv7F/K/LGY0rvEUqA9rxNVmnqqfNwTF5S8t5vggGm5cDkZaMw9
         Plov0uuyfR2/dkfZ+DE+cxUGB5dlzpP45pmSz5OIGuv9ZJsBcI79DV7pmon4JAsYjAVD
         Wwpg==
X-Forwarded-Encrypted: i=1; AFNElJ8QYecyLPNu+//VibVii7IrN4daVXYoE2r4ylh98+BvkR11v93GpOmm7kVII3deA98US4l0TiiF8Ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQxKs6zH2BpcdiOki2hc1kEPH6gqITQbtrmExL+jS8nVpnJDfD
	XqSD0r0v8CLgclC7lGC6ZT6XoxcyFx7UZZXqvosEYmhTVrUf+rdu3ZP/
X-Gm-Gg: AeBDievE+e60rf0pVxMMr06+D8pDus+2TB8xdNeL2JQT72ZI4fNLrORSJBUSB54frZv
	Ebl4aqYih4xE6I8E1RChc0SPSowbloNgcbOFMKIOZO3VRCD+3XSjhI5/ZQx5mbCwulVkr1Bgk1l
	L8Xg5GIgmBHxjXJbfDnKoJypw4QRQX81COtXRCOOJjcVJDkFBP5Xydv5jEJkxeyMVAAvjNshhTn
	Epmy8piO5O0Ip6T5Os7aJ1dIb/UCIyS+D+1DV8aNIZ8Am2qKFBuPl+iBO7Dltz41W6bzUYP4TNG
	gcXp13OI1T6NFoAw8FjePdsTkrJ3pgAWIUgEv6IZkKKBdtB9wJ9Xm8zUc/VNwHbtMadeZAE3/3O
	sIf0akNoy1+XU7NWTq2syilkZL6neL0JUbDmJ3ePI1J/Aqunc2Fcfbvk/YbOz5gszmY8B+QALWE
	rXYuDpxV/btJygANck7ckDRHZ9sEwMq4AfraU=
X-Received: by 2002:a05:600c:1993:b0:489:e696:836f with SMTP id 5b1f17b1804b1-489e69686a7mr348688125e9.10.1777141893727;
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:09 +0300
Subject: [PATCH RFC v2 08/11] media: qcom: venus: move getting vdec and
 venc for later
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-8-f69e52b36207@gmail.com>
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

Call vdec_get() and venc_get() later in the probe so dev_dec and dev_enc
are initialized when getting clocks and power domains. This allows us to
attach necessary power domains to dev_dec and dev_enc.
This is required for the subsequent patch which adds power domains for
HFI v1 and attaches them to dev_dec and dev_enc.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 12 ++++++------
 drivers/media/platform/qcom/venus/venc.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index daa8f56610c7..a4aacf5e535b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1792,12 +1792,6 @@ static int vdec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->vdec_get) {
-		ret = core->pm_ops->vdec_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1817,6 +1811,12 @@ static int vdec_probe(struct platform_device *pdev)
 	core->vdev_dec = vdev;
 	core->dev_dec = dev;
 
+	if (core->pm_ops->vdec_get) {
+		ret = core->pm_ops->vdec_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bf53267cb68d..5f6844d3d9d0 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1568,12 +1568,6 @@ static int venc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->venc_get) {
-		ret = core->pm_ops->venc_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1593,6 +1587,12 @@ static int venc_probe(struct platform_device *pdev)
 	core->vdev_enc = vdev;
 	core->dev_enc = dev;
 
+	if (core->pm_ops->venc_get) {
+		ret = core->pm_ops->venc_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);

-- 
2.54.0

