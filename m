Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522563E8C70
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312762; cv=none; b=gzAVtFax+pFXZamt/YjSj14gKkEgvdlMfjFuqHDxYeEYkTyN58mlOTbQ6cfSVH8c2PlGiN8sxq305/P4NIngGDZppNDEFdDykZ2zS/MWzNau2niWx/BriJ108H9q7viQvut8pFO+HoIOUXucavUhELN5ZvNstd/rdndoHIjNpGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312762; c=relaxed/simple;
	bh=tDAlsKcDHucm0PMV2skHLBx8pgweOOd/KInCPeBESn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ku+8cLRWy1r6ylWdbD5aOgSL1ZoBZvpn6z5hsJP8dtHtIq6yynYyS6I1hmaM+3EZdLAAF4ngVQTpswLZBxOTNiK6zmGcuqHWD565xRup+CQt06IAplIgi2vgpZVRdVMw5n9A5UvcQ5hL37nLDVXGclQiGhikLaSAxG+d7JRLvbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of5y5ffc; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of5y5ffc"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79a46ebe2beso106549197b3.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312759; x=1777917559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=of5y5ffcKvBozRtgm8cIt8KvWU52gmHLEL2+saHvCzPQud50Oozy5PzvzdAdbD6BG2
         F8AWGZqhTeeMSzq4Ngb0VnDTYWZsaYMLjYzvVbuKRtEziRBBWVWIqcrXJ0oRX5OQ0B4y
         KB3T2up5ajoDDq+JsrCjfXK5xiuDGhU82ag/8z29sFcMxkxupj45rOUIIljdQhChqmTX
         Wc0h1xWSzF6fBBkvekeG35DZJbD5ZUE6qkZIZqzi0Uon9EVgnsnVg+xSsfthssafr/0z
         b0f4DvZOZxkVZYZyOeGLYOgFEmx18sXCElleR3OkqusqjU4mS7DLFyR46db28ZygkzZt
         DxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312759; x=1777917559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=LbQAAqPHR+qE/UAkT58KKBUHGC9Z7J+jta+mdD053dndkiy3Fy89sZrdDfqLX6DYMI
         btoPSkFIe7Aan330n+1QaHzUbY+qAmu8vxpWWbjdiYC1LIwxlxqI1D1XnEKEV619s9je
         8jKbMq7D1Tl8sttt/xfGcvqkDZCy8o7kfWQml0L3d+iMHWymEEYpdao6E9TLVEbu9Bhj
         QX9AHKYLnZuaJqr+6LxvJcUk+XzaTyTA9/nJgJ/Ilgotpsqirpjq1sTCAfEIz7D1H3rk
         fmLz6afKblErPypG0ihb54MrQRtuu0m97LnOPdojjOO4oO2Z8uGLpTE9UQHCaDuY3c7a
         287A==
X-Forwarded-Encrypted: i=1; AFNElJ8LulgkYIHsQfMSFMNERzc2Gluw1/5qb8OlDTdUH0Adr6qnE/4wZFiBYhwhEbDk60ipA66KLmYI3CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKYXCoBClMcQn1r76jdTjRVX1RlXoz9fcAKOTBtpf2hzjbsQL
	dLFJwplIOEMTk8W8ypvAM7UfyQtPmgeGG24czPRPT8tvehbROoR0f/TdloWOoSOT
X-Gm-Gg: AeBDievgeGXUy/VfxITxnIotZNDKiQ/VhtS0F5Kvb36qUMr7CcbdR9ZrF/Z/nLuAncl
	CGJutTliOE0TUll4UStAn0uE+BV9LF+1g+fFgnpx93hp1Pd5yt/THF6nCvC+ImpVqq173K3SqkM
	jYnt18N797Iw+VId2BzCx+2/6jw6L/4i3ApSOXRJMnibR2deIHCudZNudDq7KOHRNYNnwnZJbpR
	AgqEVUauVihPrFrZI6QM/S2xGOXrt8kKt6jEWZTHjnlgn5SBzugUsG/0hIEIQ63K2tUBOvmzEQ+
	eYAsH0FdATow73NAbFEmf5GoAzNMKX/ZmfNDb/8tTcqFDrjAYagL18YTag0mgknBZGyUVah5Y5R
	5lLbjRwXdS55/N7kaPWVRuEJQ0vXdNr0AMhqbLu79Hk3s8CGsLUtcEpO4d2JSC/EHyTVtVK5q4/
	RuHaqlihhgRukR5SQxBCX5AJlWQBA1kMet5yiP
X-Received: by 2002:a05:690c:4:b0:7b8:bc4e:ad3 with SMTP id 00721157ae682-7bcee021207mr3161247b3.44.1777312759338;
        Mon, 27 Apr 2026 10:59:19 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:30 +0300
Subject: [PATCH RFC v3 08/11] media: qcom: venus: move getting vdec and
 venc for later
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-8-288195bb7917@gmail.com>
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

