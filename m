Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E0E379ED2
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 19:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786475306; cv=none; b=qHIsLkIaeTL8fowOJN/wv01J4PpXesaSsod3HLfnbMscvDPYQA6ghNGfRkEL3N4cgYiceL8R8hs/AKHHtoLJXOk64DTiV9KlKBxTOzxjHJ5yPptyk5yhkTGqc5PVMwt1rCv6Kuw+igeDiY0w8LcH34YJxRvqpKZ/j/ca/hnWVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786475306; c=relaxed/simple;
	bh=Py4lemdvbUGCmvV0VvjjngZndco8IrQ9XtqY5PA+qq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J9qclqB6lzTLjoBEy2Fr6O8dT0Rn/A/0sVUCJP+9SybESZ2RQtfo9DNvztuoJ6LPmcnpfZ4lQ7x4BYD1GmPIQEXPWuDTUQuHqtgRAYr4kpHGSUI86p3KZUXA1GdICSySvxBC63HO/Aizm/SpB75HyoUj7UogjVjnIeKYulG+X5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2N/a5f/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2N/a5f/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so279092a91.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786475303; x=1787080103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgIdULwmGNphhsvKqIP7wqPHfCSa752rk+W5cMsn4Xk=;
        b=G2N/a5f/knDtb+n5BK1hmH5HNqLNahjqepDPXGgk7xJNIxioh+EgGG/Jd7yq6InIIg
         zVOshaJCMvE1kbJ/Z0TLIZJ+/ACoRpJwV6WAigMW7tdShEbe9gbvwrEsXzv13BRxdzn3
         uOiKOmpISZQ90estAupsZAd+b1vdfPsmt7S44JYMaNK0+y+wk2x8Df3fhpuplB6bAbqk
         AjiCcYV4Q2MJRNPY0owZi1t8CQCb0NNDrPq6vh8Qk4aW1O/53zSETGZjwWCElvT0Hpjv
         le6K/nNwc5DhU4OVDa9SN7fOos8X109UYIhJ1Sf9kzK2ZnTyrhX6ps/6ZhcH03YV7MM/
         M5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786475303; x=1787080103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgIdULwmGNphhsvKqIP7wqPHfCSa752rk+W5cMsn4Xk=;
        b=rQCbHRplJWymSHb28NoimTgMLJwTGFHKIAIuwFAcZhZflsp/ZqoBENi30sj6+CXXTw
         fe5XO6cDjKC9J5TH7jmha7MWBiJ4vDEn0X/ER9lvJmBSSy4AFEL+kKNe5qStylVxKZNk
         LdDShhQPfNtA1kfw125ijSt538dryZ73ke0QRzhyDZ2NEFuIuqoh1CGdd0Eoq4k8GotA
         O1vcRoAFwHMHvXrfkSSiUmcGwhb/IA45M02ng5asZXMX7FX762EwmvWriHPnf+IEykg0
         o8QOOTeszkvX8lc1vHYiyLl1Iw+q90ivdVYK4SrH+Q0iXD09sJssHeQnOaKtPsrXXebg
         We7g==
X-Gm-Message-State: AOJu0YxahBCHw2oDxCnWyPFoF2toK/EfqsN/gNVfFhbL9jAdy74xw+Bu
	ltkBp23KPLZH04VkgpsLUKqvolpmIsKznNDNt3rRcRRZXtD1Hgrh/YhCrc9jsA==
X-Gm-Gg: AR+sD12km3EKytwUIVrRsjIghamh7GiOzbBabsGf1Aajr5jDSOuZHor2aQgeFDQ+wLL
	cDglFENkwdP7aFifR3lahgBFx5QS8kpzv3yPwfb9B4hPKIsozz/hjStQdjsEsYpXl315LmJaCY9
	uXBSHPuzLX55Z4BVHeusM2qkH4Ta8ZA6574jcf515b5lem4Aefbu4qHG5bRxK68KUwXtwOqGhAY
	nUwnpUdAyvQK9RdNhmeoRhxlbRLzKdAPxLbVYT+4DsS0YHoNqatalrwwWNAKvI54zWMDkW4iG1M
	qgXqSWBk665IahPaHIY2D3Vjv3Wpv27fGse/qjr+AIhHp9uDo2MorgR+I6IpP+H0Wv0tPIZZU0e
	HJ0KJGIHMdslvs6GkObrWnWyH6xcIzL7dDc8GiopeL+dUlZDjIVoEqeRcqzuQtY3KmvjhHdcR3z
	6ggEIbP57ueZytRHFYwyxreIXF9Bg5J2Mzb4q21THlOG4eCHZOHyeVWNa54z4xfA9Fse0f8AgTp
	8tCGBuSb42n1xyhqmw0y+r1p8sOVu5a1hXmioK6qBIs5NgEDWnzqkhebVWkri0RxqrCFW4+E2X6
	4RIyNtBqklkY9FXIkin7aHQyQuEue7e+zNGEyQ==
X-Received: by 2002:a17:90b:510a:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-392ec524084mr6407375a91.9.1786475303455;
        Tue, 11 Aug 2026 12:08:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f8cffe2csm695064a91.10.2026.08.11.12.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:08:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: davinci: guard da850-specific init data references
Date: Tue, 11 Aug 2026 12:08:21 -0700
Message-ID: <20260811190821.117485-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With COMPILE_TEST support, COMMON_CLK_DAVINCI can be enabled on
architectures without DaVinci support, where COMMON_CLK_DAVINCI_DA850
is not set. pll.c and psc.c unconditionally reference da850 init
functions and init data that are only built with the DA850 option,
resulting in undefined reference link errors.

Guard the da850 entries in the match tables and the CLK_OF_DECLARE
with CONFIG_COMMON_CLK_DAVINCI_DA850.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608111912.YS4Vg7Jh-lkp@intel.com/
Fixes: 34aeb6853fe2 ("clk: davinci: add COMPILE_TEST support")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/davinci/pll.c | 6 ++++++
 drivers/clk/davinci/psc.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index f73b0ac5d8a0..af95dc27f840 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -841,17 +841,23 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 	return 0;
 }
 
+#ifdef CONFIG_COMMON_CLK_DAVINCI_DA850
 /* needed in early boot for clocksource/clockevent */
 CLK_OF_DECLARE(da850_pll0, "ti,da850-pll0", of_da850_pll0_init);
+#endif
 
 static const struct of_device_id davinci_pll_of_match[] = {
+#ifdef CONFIG_COMMON_CLK_DAVINCI_DA850
 	{ .compatible = "ti,da850-pll1", .data = of_da850_pll1_init },
+#endif
 	{ }
 };
 
 static const struct platform_device_id davinci_pll_id_table[] = {
+#ifdef CONFIG_COMMON_CLK_DAVINCI_DA850
 	{ .name = "da850-pll0",  .driver_data = (kernel_ulong_t)da850_pll0_init  },
 	{ .name = "da850-pll1",  .driver_data = (kernel_ulong_t)da850_pll1_init  },
+#endif
 	{ }
 };
 
diff --git a/drivers/clk/davinci/psc.c b/drivers/clk/davinci/psc.c
index ff603520d56f..318c389eb96f 100644
--- a/drivers/clk/davinci/psc.c
+++ b/drivers/clk/davinci/psc.c
@@ -499,14 +499,18 @@ int of_davinci_psc_clk_init(struct device *dev,
 }
 
 static const struct of_device_id davinci_psc_of_match[] = {
+#ifdef CONFIG_COMMON_CLK_DAVINCI_DA850
 	{ .compatible = "ti,da850-psc0", .data = &of_da850_psc0_init_data },
 	{ .compatible = "ti,da850-psc1", .data = &of_da850_psc1_init_data },
+#endif
 	{ }
 };
 
 static const struct platform_device_id davinci_psc_id_table[] = {
+#ifdef CONFIG_COMMON_CLK_DAVINCI_DA850
 	{ .name = "da850-psc0", .driver_data = (kernel_ulong_t)&da850_psc0_init_data },
 	{ .name = "da850-psc1", .driver_data = (kernel_ulong_t)&da850_psc1_init_data },
+#endif
 	{ }
 };
 
-- 
2.55.0

