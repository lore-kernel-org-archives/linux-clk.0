Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EAB33F8D6
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637967; cv=none; b=TFtrOWNKpHhVj90wxuDoTCYpcEw7etbQS3u8jjEOjAPHOvapnrmgkMvqZWXr8SeLqhNzOQG9+/uMqGJsavOV8+LagGJjgy9RB2ZmHGCnF2lqIFNu27bCohcrPvG250N0gJByUu5knDvLf8UikCkAF4TeoiVCWikRe0DTgd6N+vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637967; c=relaxed/simple;
	bh=YouQwW+4Qw2Ma37JIRtFqJgp63Rv/mxePDlVwJHd3k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBrJLMZCeypJ9G4hwpjdh7XIc2RsChmzv2CTbSM6DNlhWoe/zxl0fnQMle2/k7qVBY3Mw4lBkmsFBQqadiE0RyrYxDVxRd9MbcTzC8LFQZ5TpU34qTRiDKDgsXgNVQrDZIlK1O92NjPo6Zk8G2u1yUx9D9WrNMoCF3nnJWIXN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1yTnsEm/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1yTnsEm/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 620C51A2CA0;
	Wed,  4 Mar 2026 15:26:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38F085FF5C;
	Wed,  4 Mar 2026 15:26:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AD69103697E6;
	Wed,  4 Mar 2026 16:26:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772637963; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vH580k/DvZMtChBfmdwtMbkilqnSWSOYibv55mMkZ4Y=;
	b=1yTnsEm/ay1oM2Ofe4ZLICJhB1C2YJ4MFgMIK+LN/gV2RuLypzC6BhylHje+Vj8gJlYHOi
	nmqRtvp5lzsx4Anw3LPghlIc0OUuyPYj9RzUNy2mgec4g21aVud7R/+3o3j8Xg0k5vpQ0L
	ovhNnmQMbUfAM4RwcqbELdxtqx5bv1etY5nYm7HY5TJUSm+ODQkOJP/Ro2T6vQzt9wQ/OP
	PzcWZ7GyOm0Av/Re2lr3jByaOsEgzIXnZ9ZyPFkrXzJgQ7oGw5waZt6TaGL86i4eAUhsfc
	9KAAc0KtQZynv9hVm3UHoIreioZ55Lb0tWlnvlp7lnzTOn2jFzK+bXnZ+BUxjQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 04 Mar 2026 16:25:17 +0100
Subject: [PATCH v4 03/10] clk: fixed-factor: Rework initialization with
 parent clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-clk-eyeq7-v4-3-9d6bd9d24bec@bootlin.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
In-Reply-To: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Use the same sequence as clk-divider, clk-gate and other to set the
parent_names, parent_hws and parent_data in the init struct when
registering a fixed-factor clock. The number of parent clocks is now
only set to one if a parent clock is provided.

Previously the number of parent clocks was always one, forcing callers
of __clk_hw_register_fixed_factor() to provide a dummy parent_data
struct with an invalid clock index in case they were not provided with
a non-NULL parent_name or parent_hw. Drop this dummy parent_data as is
not necessary anymore.

This change only has a small impact on mis-configured fixed-factor. Now a
call to clk_hw_register_fixed_factor() with a NULL parent will register
a fixed-factor with zero parent while previously it was registered with
one invalid parent. In both cases the rate of the fixed-factor is 0Hz
but it is no longer shown as orphaned.

This has no impact on properly configured fixed-factors clocks.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-fixed-factor.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 850e8b95f352..359e91441c74 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -124,13 +124,13 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 	init.name = name;
 	init.ops = &clk_fixed_factor_ops;
 	init.flags = flags;
-	if (parent_name)
-		init.parent_names = &parent_name;
-	else if (parent_hw)
-		init.parent_hws = &parent_hw;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = pdata;
+	if (parent_name || parent_hw || pdata)
+		init.num_parents = 1;
 	else
-		init.parent_data = pdata;
-	init.num_parents = 1;
+		init.num_parents = 0;
 
 	hw = &fix->hw;
 	if (dev)
@@ -190,10 +190,8 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
 		const char *name, const struct clk_hw *parent_hw,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
-	const struct clk_parent_data pdata = { .index = -1 };
-
 	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
-					      &pdata, flags, mult, div, 0, 0, true);
+					      NULL, flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_parent_hw);
 
@@ -201,10 +199,8 @@ struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
 		const char *name, const struct clk_hw *parent_hw,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
-	const struct clk_parent_data pdata = { .index = -1 };
-
 	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
-					      &pdata, flags, mult, div, 0, 0, false);
+					      NULL, flags, mult, div, 0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_parent_hw);
 
@@ -212,10 +208,8 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div)
 {
-	const struct clk_parent_data pdata = { .index = -1 };
-
 	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
-					      &pdata, flags, mult, div, 0, 0, false);
+					      NULL, flags, mult, div, 0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
 
@@ -296,10 +290,8 @@ struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div)
 {
-	const struct clk_parent_data pdata = { .index = -1 };
-
 	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
-			&pdata, flags, mult, div, 0, 0, true);
+			NULL, flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
 

-- 
2.53.0

