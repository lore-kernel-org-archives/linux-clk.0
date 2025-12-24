Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789A3321D3
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570868; cv=none; b=IE8iNIiL0fJYRTsT/Jl9xzakaKjuUJYu02Yl3d8bg/Is1X/myR8x2+S5l6Qh7NVPvtLUFvGcXuXaDSk1kjDg7Ul12eA6unjSko5PifpsLBaZdJhpguy61hxdIkXALZ0siNW4r/vHtkpUPipqpvCo5jpM3DPq8Of1zY6O0UNYeCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570868; c=relaxed/simple;
	bh=EKVg88+rOfU6IBSekC8pnT+bypbtFSFkwvN72GA69wY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwLF+Eq6dV6P1ftR6ono8bjo+UPJd7hhqCojQ5epLvU7zs+cyTzcpJSe0UVHnm9G4g4yufFs8XJMA7RvLcNReQMLUyvWUm/qPYLUcU4afheLzmvAKkIh2uQP/1vBiUsPk0FXTKvkBTvRhSW61qHYz4jFiPpriQD5NCCgZeA7yM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UShAc3g8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UShAc3g8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EE2BFC1A5A4;
	Wed, 24 Dec 2025 10:07:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BB3C6073D;
	Wed, 24 Dec 2025 10:07:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4C7910AB10F6;
	Wed, 24 Dec 2025 11:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766570862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N7RyILljdMQfZkiQ7TRm3/JaE4XCEFcEURo9J0hqJe8=;
	b=UShAc3g89kaQfeyubq4YYzZlNFo6zeGn2gWeTwRAcjmIFCBbRZmDTyr7iSkd7PJzD/cNSG
	JNWW15Bd8l1LpxgLpT4RK8WVjd7cACWs1uJBaGBunQsZTFKIaC7WGE5mtAhjnk6MOBNxbf
	Z9Sme5srhRz4eEEvDjImWQasMTcZKZj2Og1K3qGU0STAhBp3QF+aVgnTYyYZr0YuQgpVcg
	lEAYXpJzT0rl1p7NoQaEKdETGcL933BjMaAYy3RIRwND0JoWJdKzC5z/GgU6UQiQWNYRcs
	gEwkWtcLfNz6fv9KViHLyM/5tRiKg2lkZpz6tXVoBJYymDjA9SoYF6mWbFEVig==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 24 Dec 2025 11:07:16 +0100
Subject: [PATCH v2 03/10] clk: fixed-factor: Rework initialization with
 parent clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251224-clk-eyeq7-v2-3-81744d1025d9@bootlin.com>
References: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
In-Reply-To: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
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
index de658c9e4c53..63082115fd25 100644
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
2.52.0

