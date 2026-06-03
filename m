Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49DE48164F
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496547; cv=none; b=HVqthYF9c22bxYosCi2gZcFIiFWQXr/dC6LBW6bktWk3kgaE4YXCOu04oML3vdi7X3hcZxOS9Hfkts2KUBM6Jzlhv5oHX12zDy4xZyprwTc8iv9eqTpy2/30MbFNQlrdK0jUteIcckp96ouX4PSY3xRLQQiiVrYvGdvYbvftLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496547; c=relaxed/simple;
	bh=JZF/Cu1Lu/+vvFbUxKQUvMxkNiBd2sXQABNziPpbgqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oNfYOdsTQKGjQDLC7zGEC9YnqFjta05gcsYEnTWwLkUMNsq4KwUMEtqCL62RO87Cz8OyG9laKjKFHjPP1a0nMEt3bLtkkU5Ngekvv1c9Flz841fcRQRxitMx3KC+Pd7BPijretpr3kTNlMBrRNSN/nMzPw4MVvpI6YpP/eeq/mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sj0lFOf5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wo1hKtSs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sj0lFOf5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wo1hKtSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sc+5V9Ml7sv1NeeOOXUch3H7RjzHTXyFc4umZk6JURs=;
	b=Sj0lFOf5Chif54Irnv3SDqLJlUs99uoknA495FMIxFYc6okO9T3rwbQMDBEJS+vUyoq+ZZ
	PNMwHEgnwjBz6YlMFo5NkYtjL2zsX3DzaBZVeeRNVQ/5uCl+dcINaC6NgGXVY7NHBbHbJq
	+dSEjL5w3PFvjHS5BLpW9zK3bmvJqRM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-pr9CsyKdPvO71SvoYbt7Ww-1; Wed, 03 Jun 2026 10:22:23 -0400
X-MC-Unique: pr9CsyKdPvO71SvoYbt7Ww-1
X-Mimecast-MFC-AGG-ID: pr9CsyKdPvO71SvoYbt7Ww_1780496543
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91578c374easo526227885a.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496543; x=1781101343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sc+5V9Ml7sv1NeeOOXUch3H7RjzHTXyFc4umZk6JURs=;
        b=Wo1hKtSsnjkP451JPmkIlYhAPLfppMP+t+Xl5fO9P31cUtYYKRIN7Cr10rumoXD8ur
         LV635NiuSA3/ll+Qn5NqXNlp6KHcYXcC9KqyWTOvGSHnCWjQ6Y7SGrwLgS9sn2rv/4AW
         EL0WxtZoTdxOV4YjzUC7daAkio+bwdZk4W5CCMPoyBVN36ZnVdIaOcGSTRy7sJVCywLt
         cW4wFd9XTaVNfqzjiPJ39YYrGK2HFHKfU6rEdPgNHY1ZQSNtQw9aey2XO8DvrCfD1IGm
         VprdRarJIqOTgbgmAtE+/jQ+VIHBlyR189qkTpiPkNk3O88/JiTVbKGIRqUgtYwo6sSi
         18Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496543; x=1781101343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sc+5V9Ml7sv1NeeOOXUch3H7RjzHTXyFc4umZk6JURs=;
        b=LfZJvuW0hbIMrQQZXsKlyjiEb8jDzq39DvrVlXISShGJVW3JOvpeYfkh9xZsqMIF3D
         h8gylKnmUWNRwsVgPONJGysnMxYYh1WJb9MuFEooGHerto5nrwuKzFhnxW4bHWbfXszL
         jhPOBVQxMT97j56mu+PusEHQEMEYABLiKd81ib0S5szP7A06tb9JM2ZlNtjk4YGqD7JZ
         yKN3SMbNsZ2He/oauOOdPNg3EygPInpt0096DgFh+bvX1YoKl4Xkw3ta/vruxtcQeJrO
         gCF6/UgJBdP+jGmbhhhlBam1UdOgB/4pRcmQt3R8KLi4SD/PSiFFT7s/phrMGe2B8cpx
         mx/Q==
X-Gm-Message-State: AOJu0YxMZ6MM4UN6z7UWfexO4Sc2agoqOF0xYEf20l/S7lbyD/JJTm5C
	fNzmper69i/8sReHddVjZUAcv+M6WOsSMjRLks1nwmEb9zEcOjrihtP6x5/X5nFJNRN7ITqHtMa
	87OXM4lc+JusLkXd9MX5mLoVqvWJ6R+pGHHBnJWXJVYLbOiBM46sbxX54oK0oGg==
X-Gm-Gg: Acq92OE1ZMPPUxdpySIjFd0UpgwszuGbr7mR6zF5naF48YTFYAFUhC031B2HsPfJRiH
	L1PE/z2HyQYz6qUt9yXmicUb+pmm+eLkwNatzgYiBm1nS82+em81xyKmG6xMjKGIGy9H4JKHroQ
	hKo04Wl4HUe+uvtIyx1x7qviZ2mX84jOlte7nFGhlobH/2YjXoKn4BrZUhL3mEZLYlLOJje37va
	v4e9N/Ki2vNzrIuVorrp0nJOrozy9lu8J78zu2oH3tbOIH6WqpiMV+zczZmdFiAnSaL86VCVvvR
	Xo06RcDIHoh0RUY9Xfwz6HOvjWYKr9K74hwKqC13SV6zC+YyjT2uOQxgSE60IcTLLSJ6tfDdax3
	unN2ht2MI+7U2Skzp4em02p/dCWmF3U1pXLz44nzvINLP5II678j5da0tM10GDjTEtLizvRs=
X-Received: by 2002:a05:620a:2890:b0:913:7bc8:79ac with SMTP id af79cd13be357-9158a71f5bcmr642622985a.26.1780496543044;
        Wed, 03 Jun 2026 07:22:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2890:b0:913:7bc8:79ac with SMTP id af79cd13be357-9158a71f5bcmr642614485a.26.1780496542503;
        Wed, 03 Jun 2026 07:22:22 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:21 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Jun 2026 10:21:47 -0400
Subject: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
In-Reply-To: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=JZF/Cu1Lu/+vvFbUxKQUvMxkNiBd2sXQABNziPpbgqA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULKalT707RceH93adVeuLyYv23bi062PBTInLgZwM0
 0xrrwoe6ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiv7UYGfq2mZ9xLxKamhfy
 aFrd3F2fBU6+2lBtM6nhUOtfmT7bX9cYGfZlxVkH5eiJ3Unz47m8RT8/McTyu9eMs01ZB897cl2
 OYQcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Several qcom clk providers currently have a sync_state helper set to
icc_sync_state(). With an upcoming change to the clk framework, if
sync_state is not defined for the device, then the clk framework sets it
to clk_sync_state().

Clk providers that require their own sync_state will need to call the
framework level clk_sync_state(). Let's introduce a new common helper
qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/common.c | 9 +++++++++
 drivers/clk/qcom/common.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b..31382c49c948 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -3,12 +3,14 @@
  * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
+#include <linux/interconnect-provider.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
@@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 }
 EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
 
+void qcom_cc_sync_state(struct device *dev)
+{
+	icc_sync_state(dev);
+	clk_sync_state(dev);
+}
+EXPORT_SYMBOL_GPL(qcom_cc_sync_state);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("QTI Common Clock module");
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..ee448163b1fc 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -88,5 +88,6 @@ extern int qcom_cc_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc);
 extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 				  const struct qcom_cc_desc *desc);
+extern void qcom_cc_sync_state(struct device *dev);
 
 #endif

-- 
2.54.0

