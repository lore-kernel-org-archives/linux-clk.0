Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259233D3D04
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347089; cv=none; b=NmolqD8Sc+da1yXBgUhT+//6sEozhChoq882s55p2oS6C2Z6kwQBBQsLqDb/T6gYC2jLpteRs6TN5HqgLp62ALXxnaTg3+hQ/ZiE0kInlQ5kG3jRoTL7+b4P1UMko/rfX5EUVdro+ScGi04JEvjQ944xQoTCj89e7foMpQouj1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347089; c=relaxed/simple;
	bh=onS0/m/vDkiKzWD/tkw4RzM9xpJQaL3JH9xNGGk0fWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnIUJUER29Zu9dM2+NEL/MBDmDEKU9hRlt/zuJx3Erfr4xvpYGs2k7YUHxrkvec2cXd+Fd+teKeLWTFPjoFY9TLX8APFbqEz6Bp3JmOXjGKC816gyyBUcHTp63s2pHAWbyy++rTyrjIiCQVLm/Y9GZx+dOmGVo+ul+/3gWZ3Vpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKeS/fIr; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKeS/fIr"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79a46260385so88160437b3.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347087; x=1776951887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q85WGONNVVR0+yKGqs+n47zXRUM373JSpoxp6zRqP4=;
        b=JKeS/fIrS24+QrCftHVpyQgkwuka/CElhnzLAkzVsAKfs9Rf2S6qUUR6DvQib4H3pE
         hLBcoX1fj2e+uvUp5BZ9NfvB6dEMpNJIpPKbVDlZfOpFEdchbIcrTU6v8hLUBBlmERMh
         5MGE+sfAp5aeFUtlOckadwx6z7kupLtEDsY8qwRJch1fFXJTCvOPgt2PevP7WY7ocHFm
         8EfZh9UfIYtIMdBlCVGaBKzQMf0zVfgGB8GJyUt0adofxIOthHSO1zg5JAW0gZzKnc+E
         mwwcL2J1ytU9j/0nR4j3I9i55HRbDJmRQe954emWkf7jMZsD8STjxVSNqZUvY2H31PsA
         tiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347087; x=1776951887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5q85WGONNVVR0+yKGqs+n47zXRUM373JSpoxp6zRqP4=;
        b=JoXt7lGU67h8GJXkRz+6fBJUrTZq5/1OPFq8H3trqPooUVdaIWkr1S0bhyFn9KbA38
         p9PTl61fB5nHq9LdWzzLpb/x9SVGfaGOroRQcQxoGU6ye/V9nhV80VWJj53yKWbM/lEa
         dQymZ1XQlZ85V24+4prhL0OsjDjoTkA6PxPjwa4+Kk/brxPTk+Jj99K7pWeVnJrvHosY
         FMBean/3az7a+m7YdCGuS7ZlBXKBcUazRZL+VRbh7WStkx9UOL237wzFlZ6daSlSe+/S
         5mznJY+vxn4ItBJm9LUOAcRnKs9UGZTqFnSv8j+jMC5gvmU1PZ1RV+zLQ9utUCHhquz2
         /nUA==
X-Forwarded-Encrypted: i=1; AFNElJ9/kdN0oY6jp8H9Ih3DHM23Tv1v1Czsq5v47W9efUMIXF+4ttfxyOQQAn+2c4gB7r4LqD+uQ/04WOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfyGagq8vUN3N4T7ob6b1KmTFEm31YWEtc0PS461QC/Y8xTKXE
	PqnpkDFxUfNTQhv/UJItOsq9M5uPf6QWd9TgsUtlnSOR/y/UpNl2Bems
X-Gm-Gg: AeBDievs9l9NxYqHJBHt2SclCBPqAeX7qnRP8owDdaPgAbjYxwPP8UlPgBK0iEfXB9E
	j8J3cyPqGLWlBVBrZ8JMpX7PhrAPfdLz91jElRLaeKhyoaPIpq4N/yujtLuu4ehhSTF7l0Cuwrc
	jomgIxvqzbw1bv2Spi7y+RQ8oiDx3euiC4ks9HzPr4lDPTwL/Sxa714L7/ZT/+BCiI6XiOMCUnG
	otcx7w6KmEypYk0KOKhOgs8lPO2HD02BBNdlBID978ULl7ZiZGqONjKL9zIr2QvmSjBwweiglov
	grIoXssRK4pYrQKeJuIiZoY3U9yJJmmQxVokQnokz/9qQI4CU+NGUWOJFli3i5475O5VStKmPAv
	yosY7PnsB8XAleMFwC905AT9RdGS8kPZKTaWVgU9Fq06Lbv+3yrfc62yX6yGRbySLcuqf7VU8DF
	elpVBEbz9xT4rW+T9BKBk/JpWDSLrcbaW0NgqQ
X-Received: by 2002:a05:690c:a056:b0:7a0:4146:6ebf with SMTP id 00721157ae682-7af71e48dacmr224335337b3.46.1776347087013;
        Thu, 16 Apr 2026 06:44:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:46 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:55 +0300
Subject: [PATCH RFC 08/10] media: venus: move getting vdec and venc for
 later
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-8-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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

Call vdec_get and venc_get later in the probe, after core->dev_{dec,enc}
get assigned. This is needed so dev_dec and dev_enc are initialized
when we are calling vdec_get and venc_get, so we can attach core power
domain lists to their devices.

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
2.53.0

