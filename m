Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D804932C309
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 05:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770702064; cv=none; b=NS6/zN5JHmFWz3O49FA6B+p/CAfE5LQhMY6ANptYlGw2paMrGYkSW6sOZdWReU5kWKJnHTt28k/ir8sHMlZzgwVC9oBKCu2/YlCrH/nUMOLp4JNjWc1qZPaG3XMvMk6PhNeucpa/vU6jYBP5zXt0GrE08NHdrX+rkm3Zi+GXBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770702064; c=relaxed/simple;
	bh=XUvAjMb0BWEQ8WU28cISXZNoyB0oJxZ5JKVyBPGZXm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJq0NTNMIALa1wLQoquZ0RS35ZffEKC8PE3djl3tY5tCfchJD/Qg7xP3BBWn1SKEApK6S0TYgYG4/MFoxOyd6XXQcvbH5DCG1FN3wOgAUuBX0Z+LJyTFh/19Ll6nt8YTR0UwoeGHWypZKSt3K6BTTjpc4fpLHyhh8jFQf67Z0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SB+qbyuE; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SB+qbyuE"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb1c4679ebso103837885a.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 21:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702059; x=1771306859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3tE87q+qfGSEa6Oly0BwPABhpAUQacJ2LeCqBjkgvs=;
        b=SB+qbyuEMCueCNXVAN2qCjA9MBgLy2V5R5F4A/9HvmyoXR4N3Ssln2B2xbHwAPNoIX
         SeJl0cV1jr3xHxjYOb6dcW2Q4TsI4gM6BBjrbBScuv6VQokWrNN4wPJpRRdn95xJFssZ
         AxS+FU4tfolivLgvOZitspCsoMcRPkJzCtxKs9bO3QLRmpanR9A17xcwn4q8Hl6btuV8
         JyR+1q896BZp5l0DE4uVKKqZB6X3NPUPa3NrIr1K2m1Ug3fzWrh6OREkHLBZ1Z2IRUVv
         gELmlR/+VFdhRE29FvmDEvy/rwMx11/5nLdbIJBXT0QxgPKBniPkHgOOLCLNBtH1yst0
         XztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702059; x=1771306859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3tE87q+qfGSEa6Oly0BwPABhpAUQacJ2LeCqBjkgvs=;
        b=KKh8aXeQLNasYhgIedGoD5kOS5w4/s+jrPVEeIOkfmWOylLdekxHGJ5UaFZDqIC8P/
         6H+QhT6sJrEB+tdySnkcEy0b7s3DphtikK2jHxBxX/Y2phRF9dxhChiYJqcCxlkOtz2V
         0LF5FdlEJShNn3lMZzdZNkRHC/ysRwzQstiQtT4NIbCBIcwSxCWm/ZsPNrnygiq5wQNc
         liQeUaqXTA/q7Gf8dvmu/27FBgAyUzLURVghKkfgX+Vww/Fmy7676I1FE3suFabctdkY
         kjSOrrs545PzKFtgmDts1WEWnO2UXEA4x/+4sTkV6nKDhpptMA885/nHefu5U2vh35WI
         qeag==
X-Forwarded-Encrypted: i=1; AJvYcCUsiJfYVwkJRFe8ihLfOLQjhKNPMLLy4VAPyEijnORIZ8vohnkqngD3BhGVyRxukBUW5uEhfayjQBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy7RzOLnmWxsiJsxSzzmoKi9o0i32yH/tZZ9k0UoIdW2JhmAD3
	wHKfnQuwAFq+3gPJwqtlkZkPKwwqnSFPr4rfUue1IehdyyZ0Gf3sTXz2
X-Gm-Gg: AZuq6aKg/LLJsYQM/TaYqiyOAxnzhNC6jZMrfm8hitM9fTwEZr/0aT4nQOX9OBAk/u+
	ic2FZQBvyBdQ72W6TzAuDguaVHbyo30dLIXVUPzM4ZXz5rqQxEExDzjAloXmWz8W5p9ex31n1VQ
	yUX1k6xLzemgBJJDPaD+BnrxxY8/a/U/Xkgga3r+7jFslYwHemlQtXzHGRAPA8PaHUI6Sm9R2C9
	pmyp0v0rShXRWQaixH97JGqa3IJSyqimDmVIJY3HYgk52l5X9k1qMJgkSRB5hWjMbnZAAQsT+Id
	5ZKPG7OhdVNhXOFGGOXox2ah9eftF/0pFiNkIXS/0/3DOVA4afXG3Z8uZvFTj1BAGU3nVdER8ur
	DNtZvKdtQ3Qu5yxgng3O4dHEYtge+Z4QxBiFGNBEhjwhJMvgF5ZsI5LmTP+jOpS8m5n5xD4Z6et
	tT+RP0k3rHg9oOkQydyUdZw8lY6Vn4HXq496Z5hl6tzxLVnuCS4tHr/3qqKTSkQISkvcKkZb5gR
	w==
X-Received: by 2002:a05:620a:4041:b0:8ca:305b:748e with SMTP id af79cd13be357-8cb1f6ec283mr118885285a.57.1770702058705;
        Mon, 09 Feb 2026 21:40:58 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:58 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 4/5] regulator: mt6363: Fix interrmittent timeout
Date: Mon,  9 Feb 2026 23:37:04 -0600
Message-ID: <20260210053708.17239-4-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometimes, the mt6363 regulator would fail to initialize and return with
a TIMEOUT error, so add an extra instruction to wake up the bus before
issuing the commands.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/regulator/mt6363-regulator.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index e0fbf92e7685..03af5fa53600 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -861,7 +861,7 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 	struct irq_domain *domain;
 	struct irq_fwspec fwspec;
 	struct spmi_device *sdev;
-	int i, ret;
+	int i, ret, val;
 
 	config.regmap = mt6363_spmi_register_regmap(dev);
 	if (IS_ERR(config.regmap))
@@ -870,6 +870,13 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 	config.dev = dev;
 	sdev = to_spmi_device(dev->parent);
 
+	/*
+	 * The first read may fail if the bootloader sets sleep mode: wake up
+	 * this PMIC with W/R on the SPMI bus and ignore the first result.
+	 * This matches the MT6373 driver behavior.
+	 */
+	regmap_read(config.regmap, MT6363_TOP_TRAP, &val);
+
 	interrupt_parent = of_irq_find_parent(dev->of_node);
 	if (!interrupt_parent)
 		return dev_err_probe(dev, -EINVAL, "Cannot find IRQ parent\n");
-- 
2.51.0

