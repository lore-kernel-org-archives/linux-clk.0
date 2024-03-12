Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA7558207
	for <linux-clk@vger.kernel.org>; Tue, 12 Mar 2024 11:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710244378; cv=none; b=Nm1N24O+LNuH/1QV7sNXypaKWtpJtLeEpA/Vm3aYN4/6Bw/gNGQNMRAk9KqHQAyPqFsJI5Ao4pA1AD1WU5NJL7IPrOHPE8QCfQ3GQ05OhLd5E1Ah7jlQfoAZL0rab12u1m32HSX/1xGBJGU6yt71ODP5fE1IU/AKxFXNzhTH4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710244378; c=relaxed/simple;
	bh=mTUm9ym/RSqft+KABMxetZ2udu3o3Kzzw4feTXppzQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOeB2l9PIsCa+oUTq3pWBqgwzGqVMKAgjfEU4QSIOZH2QvtRZ5czwZQs7iZ5QhEPCKuaoM71KTVWAYfMtKZZceB3v39XpKff1sY3HebeWPCaCQzZoJ5SFJ0TQiqBK4oM+e8NB+MZ8c0iWDiR3oFCzScibkHAfBSL4a9+F7sxdB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M2W8Q4vl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M2W8Q4vl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd8f7d50c6so16160705ad.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Mar 2024 04:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710244376; x=1710849176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=32L7EdHAuQ4WnOqivRSfbIvHEBBAYz+hzKyLr7KyYy4=;
        b=M2W8Q4vlRPDFeM3hAAfZjbtUFJ1eHEkL7aEgnCmW0nH1voi1hbKB7nJ4aEWU6e+HeC
         CU28L/Hx5xO38hQiL4yYHz1ENTkO2A8cxV2t58IINQa5kudPEK0nm7d/8dRugaYiKvjq
         VXQ5rurA4PbrnLw8KxzSj0eGfQcDB4n7WtKDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710244376; x=1710849176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32L7EdHAuQ4WnOqivRSfbIvHEBBAYz+hzKyLr7KyYy4=;
        b=N69CHEbzwbogJHNQr7JnrrCMU80OLxHfesE96ojzqObnfDM97br6k313mt7NfWSmxm
         dUj2uaBE9KpD9yapldYrA4TpXtrLOsV6FdI/TKS/vOZfPBRj5Z5diE0spscbCrAtOFrQ
         HYYVX8Qa3aN1lztYn/YPHtfnVr58E62dNfXOAyKDEd9lqdS1QVHXHBK92QxTkhFnBNWi
         1qdsNhNlICxLXW5+OZQtZZvTbRhB119gvUlfweMHEnb3IzbDBY672IZE1GsgOa9n1Fql
         jybHy17y/4+tQGOKIaLVRrB01bGKz6noEyMjYDuWI9XWpcylUKb5csmd6Ob2TV3lnEWQ
         8vhA==
X-Forwarded-Encrypted: i=1; AJvYcCVLhnbTt91aSDWuR/Dau5fmLzrEY8okxfVZkBTWkeNyRwJF8Tgyp3Avk9EG3LoV7S+HL3WXGtpPcmG4PRz+ihaKwPMMb1zC8Wqu
X-Gm-Message-State: AOJu0YxyFdpX/4pXESJj/IDDUWwL9db4yHk9k/rEu5qyl0zq/0iXbFoa
	MjWFP2Cqwve1POZjsbcgsbBXs1Udyunlg9+xcardYzV16ilpnSwTtfpKv7/28Q==
X-Google-Smtp-Source: AGHT+IFHW7gNc8FGsMt9K1fDNHiUJ5TT/QPfRrLz4t4aGJMOagv8xqOkZuJYIn0TiohOgI7RjlfCgg==
X-Received: by 2002:a17:902:d2d2:b0:1dd:c227:4175 with SMTP id n18-20020a170902d2d200b001ddc2274175mr813268plc.8.1710244375852;
        Tue, 12 Mar 2024 04:52:55 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:bae3:7b5f:7434:812e])
        by smtp.gmail.com with ESMTPSA id b15-20020a170903228f00b001dd1bdee6d9sm6500179plh.31.2024.03.12.04.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 04:52:55 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bosi Zhang <u201911157@hust.edu.cn>,
	Nicolas Boichat <drinkcat@chromium.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v4] clk: mediatek: Do a runtime PM get on controllers during probe
Date: Tue, 12 Mar 2024 19:51:55 +0800
Message-ID: <20240312115249.3341654-1-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8183-mfgcfg has a mutual dependency with genpd during the probing
stage, which leads to a deadlock in the following call stack:

CPU0:  genpd_lock --> clk_prepare_lock
genpd_power_off_work_fn()
 genpd_lock()
 generic_pm_domain::power_off()
    clk_unprepare()
      clk_prepare_lock()

CPU1: clk_prepare_lock --> genpd_lock
clk_register()
  __clk_core_init()
    clk_prepare_lock()
    clk_pm_runtime_get()
      genpd_lock()

Do a runtime PM get at the probe function to make sure clk_register()
won't acquire the genpd lock. Instead of only modifying mt8183-mfgcfg,
do this on all mediatek clock controller probings because we don't
believe this would cause any regression.

Verified on MT8183 and MT8192 Chromebooks.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---
v3: https://lore.kernel.org/all/20240108081834.408403-1-treapking@chromium.org/

Changes in v4:
- Remove the need_runtime_pm flag and apply this to all mtk controllers

Changes in v3:
- Update the commit message and the comments before runtime PM call

Changes in v2:
- Fix the order of error handling
- Update the commit message and add a comment before the runtime PM call

 drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 2e55368dc4d8..bd37ab4d1a9b 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
@@ -494,6 +495,16 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
 	}
 
+
+	devm_pm_runtime_enable(&pdev->dev);
+	/*
+	 * Do a pm_runtime_resume_and_get() to workaround a possible
+	 * deadlock between clk_register() and the genpd framework.
+	 */
+	r = pm_runtime_resume_and_get(&pdev->dev);
+	if (r)
+		return r;
+
 	/* Calculate how many clk_hw_onecell_data entries to allocate */
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
@@ -574,6 +585,8 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_clks;
 	}
 
+	pm_runtime_put(&pdev->dev);
+
 	return r;
 
 unregister_clks:
@@ -604,6 +617,8 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 free_base:
 	if (mcd->shared_io && base)
 		iounmap(base);
+
+	pm_runtime_put(&pdev->dev);
 	return r;
 }
 
-- 
2.44.0.278.ge034bb2e1d-goog

