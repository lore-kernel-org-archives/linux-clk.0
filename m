Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD1F148855
	for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718280244; cv=none; b=bTLCCoH4sDYwPocE0Duam0QqyTS7TIzbBtp2USkzxcPtB6HNHhxh1nKOAc++R1MJnDKWHD+XMkCsdVdtOeGw7zlEluSFbbPHD7ylGNda/hqrfsVupcgxQ9Mwyos3sVvKcb3f2tDB7Mq841zE32VvZJ45/U7Uu7YC0mn+SBLCVKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718280244; c=relaxed/simple;
	bh=fP45qnHS7ZSggt8umHviAsm18dm3J4F6ExvyZg7VXIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3lMwIqHJTyTXuyklH1qus9w2CecQsKaSkZKKGe31Eqkxb4v/Twnii8VfAias/t0elgAL/lDfhTmQycMTcOmnZFTDfgggk50lskdLn6PUeK2YIAe63gxFVP7rhA8PBJ6O/bn+7wol3eWheafN2sg5wqyMhsU/I1AGyiFt/tADlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZJ6cB3Vw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZJ6cB3Vw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f70131063cso9147465ad.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718280242; x=1718885042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxNvAdBgAMQdvpKI1GM9shXDCJ+gMP7loa4UaiuKm4A=;
        b=ZJ6cB3VwEmD6PLGuHEbrQi+iDh7k4K+x5ffC8EyUS2370P8MpbAmFKCcpCtDor4TC3
         tHABjd6GgDpd0eAWNnFaFiqYnQ1yszs4enoGahv+hbim1lxnm/6w0dGGcuMY2HFSyK3s
         idprJximVBRNaMzAa98XCLXChhgD6paSYgMqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718280242; x=1718885042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxNvAdBgAMQdvpKI1GM9shXDCJ+gMP7loa4UaiuKm4A=;
        b=fgGQeNw0Pvl4oZxDDkWnOppBttPKQtPNRY9xKjtRFL+w7f7lK29Vpesf/dtf71fN8K
         ct0otZ4dHYM2B8kd8dU00agfWugvCnMvoCOx6GmwFpReoURR45ErfzchlYHBbWJPkFPn
         G/kBSIJWHi+Ods5Ptqy9QJe8UlY71B6hBmsn9tZnF8TVWglZK7Dw5CvX3HtOYYW28nTe
         GDUOFdniUe65Xg5fnDWIGXLHfpY24zNDvnfmVc6ifaP2coAvUI20W7Ex3VQt3m+2/VDA
         riAzoVkF3s1XkRHr+8qvP2D5HJptl52FnQ1DSlMi983chSvT8NSFwDASoFeuXpJd0Mh7
         nHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNOfkQFt6w+myyJfpdWA6ChDcnuZgd7gfJcBvos39Y+1hHzR9tPp3YFlqDy0+VFcgrnv9kS4e5dppJShEKlqjNwowFC8v3uNv5
X-Gm-Message-State: AOJu0YxtmPEcMSyBpWLWOLbXAuGO0EWhmpSF1XaWIGZmp+xXpJcTzofR
	ywvEMWP4D4fm92mvKvP7bTyB12btN0cvz0OKzEkAeNs1ScRbo0XPehNE5ZA6EQ==
X-Google-Smtp-Source: AGHT+IG7JmmQJ1D22RvlI2mag+I47j5v8zkLdt6T5ia98XKZPueFumCinSH/YrV+4xJ3M0w9ZvXmvQ==
X-Received: by 2002:a17:902:d4cb:b0:1f7:3763:5ffb with SMTP id d9443c01a7336-1f83b74d134mr48485165ad.59.1718280242316;
        Thu, 13 Jun 2024 05:04:02 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:f133:ea93:c14c:93d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f4ad2bsm12163295ad.285.2024.06.13.05.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 05:04:01 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] clk: mediatek: mt8183: Only enable runtime PM on mt8183-mfgcfg
Date: Thu, 13 Jun 2024 20:02:28 +0800
Message-ID: <20240613120357.1043342-1-treapking@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers
during probe") enabled runtime PM for all mediatek clock controllers,
but this introduced an issue on the resume path.

If a device resumes earlier than the clock controller and calls
clk_prepare() when runtime PM is enabled on the controller, it will end
up calling clk_pm_runtime_get(). But the subsequent
pm_runtime_resume_and_get() call will fail because the runtime PM is
temporarily disabled during suspend.

To workaround this, introduce a need_runtime_pm flag and only enable it
on mt8183-mfgcfg, which is the driver that observed deadlock previously.
Hopefully mt8183-cfgcfg won't run into the issue at the resume stage
because the GPU should have stopped rendering before the system calls
suspend.

Fixes: 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers during probe")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/clk/mediatek/clk-mt8183-mfgcfg.c |  1 +
 drivers/clk/mediatek/clk-mtk.c           | 24 ++++++++++++++----------
 drivers/clk/mediatek/clk-mtk.h           |  2 ++
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index c89c3d58fedc..b1e802bbfaef 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -29,6 +29,7 @@ static const struct mtk_gate mfg_clks[] = {
 static const struct mtk_clk_desc mfg_desc = {
 	.clks = mfg_clks,
 	.num_clks = ARRAY_SIZE(mfg_clks),
+	.need_runtime_pm = true,
 };
 
 static const struct of_device_id of_match_clk_mt8183_mfg[] = {
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index bd37ab4d1a9b..ba1d1c495bc2 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -496,14 +496,16 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 
-	devm_pm_runtime_enable(&pdev->dev);
-	/*
-	 * Do a pm_runtime_resume_and_get() to workaround a possible
-	 * deadlock between clk_register() and the genpd framework.
-	 */
-	r = pm_runtime_resume_and_get(&pdev->dev);
-	if (r)
-		return r;
+	if (mcd->need_runtime_pm) {
+		devm_pm_runtime_enable(&pdev->dev);
+		/*
+		 * Do a pm_runtime_resume_and_get() to workaround a possible
+		 * deadlock between clk_register() and the genpd framework.
+		 */
+		r = pm_runtime_resume_and_get(&pdev->dev);
+		if (r)
+			return r;
+	}
 
 	/* Calculate how many clk_hw_onecell_data entries to allocate */
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
@@ -585,7 +587,8 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_clks;
 	}
 
-	pm_runtime_put(&pdev->dev);
+	if (mcd->need_runtime_pm)
+		pm_runtime_put(&pdev->dev);
 
 	return r;
 
@@ -618,7 +621,8 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->shared_io && base)
 		iounmap(base);
 
-	pm_runtime_put(&pdev->dev);
+	if (mcd->need_runtime_pm)
+		pm_runtime_put(&pdev->dev);
 	return r;
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 22096501a60a..c17fe1c2d732 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -237,6 +237,8 @@ struct mtk_clk_desc {
 
 	int (*clk_notifier_func)(struct device *dev, struct clk *clk);
 	unsigned int mfg_clk_idx;
+
+	bool need_runtime_pm;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.45.2.505.gda0bf45e8d-goog

