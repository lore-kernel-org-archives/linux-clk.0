Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2189B3905EB
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592463; cv=none; b=BhAsAONsXDuZfqNpAKmHgvbD4HNj81LGFnzsV48iA+e+Hq5OxZ6C4NvizEoCZbczWGl1ACEnuYSOrgJEJgvzpRPOoXmAU8CxS2rLWmIuynqC9dr4RZj1endpHkDtuZW6AawYMcd4CDA0nHsWvNWH5CyTUzuwEw9gT83jIF+ePpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592463; c=relaxed/simple;
	bh=pF75TB3MDx8IPNzKd7VQ5GEsw5MRqqFZ9NJLxGABgFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xz8GbqNqTcFRm0cJKWMiofYcmyZYnQpgeHuToSBiOkv6eocUyvG8QJET5+L8XDYFWOlDcW/VpOGjCziMHm9ma+uIjU/gw1qpRCI/YQMIxmV+2Ja+k/fYWMZ1Zm1YAZuiMWvy2lZuuYRsdR+EnIh7+T7bxXg5rdH4nu+OISLhNeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0SpwAQU+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0SpwAQU+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 00870C5DC48
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:28:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0195A60646;
	Tue, 12 May 2026 13:27:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CAC611AF8CDC;
	Tue, 12 May 2026 15:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778592459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BYr8hLWc1z4vC24X6Zcbi5jhHf39DA1phbNVUiIpIGE=;
	b=0SpwAQU+K6j2g6vY6WNjg5wtX/IyfLin7t+rrOJ01PSQXzawetLkKBXQgCQKxDXLCDUQej
	v3Pp7hOy0XtlSA5RfksLnts5uR1NS9EnqQoIg5fOk8Fc2T8IUEzgi6Jsm2Rg8jExznkFjD
	LN3dWEdVvRbeD1ZtTwYqKSsdV3RqhQ1YI7ZNW0vPDrCqxsne7GWbAMAkwF2NJZp7lM6Ms5
	FXdzcoT+fIqVyqWAwwL+CbV2XBpwqYUaO9Iko6b1oYWESI5VBht8Z9hBn0aP8kiOBxyt+v
	UbMmbQE2U2weSmszPtNbcHA0ZOP0hYTYEtTDjO5dzWvbJkW/rP443W5KIfuvEA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 12 May 2026 15:27:02 +0200
Subject: [PATCH v6 3/9] clk: fixed-factor: Rework initialization with
 parent clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-clk-eyeq7-v6-3-0540cce18fb2@bootlin.com>
References: <20260512-clk-eyeq7-v6-0-0540cce18fb2@bootlin.com>
In-Reply-To: <20260512-clk-eyeq7-v6-0-0540cce18fb2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
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

Reviewed-by: Brian Masney <bmasney@redhat.com>
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
2.54.0

