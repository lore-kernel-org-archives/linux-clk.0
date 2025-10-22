Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B1B34C81A;
	Wed, 22 Oct 2025 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147578; cv=none; b=uQwH9VIriHzFth3UFPUF+RfqRe6rx/03VnH1Z8JXDLE1nPy6QDFLVTcs9gxdjQLJt5UoX2WHp2CYzwn3aWLjRv5aPPJszfE2/xxVmsmcVHESkH9bNIPU1QMFhUDMasYOMFMgfFBM2ayQcTG6PbIfEdFG/5rBDCbqIp4ZBwmSo2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147578; c=relaxed/simple;
	bh=NYG+ETPj2x0u/ibgpjtgBYkOFUnLc2KAk3q8zgMWzxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UkHdwAqDMJaPRa/nTGfz/4CCfgu16PXyOrlQ1DYzWhRqL5gLo2690vJttuSs5GU+ZybO7jjD6S7Nd3OHORz8K6rGQ+xvD2isc9aM1PGHmbQTUIpyfhn/NYtP6TAqAnvDHLvApcV7I4u2CfMFgrH7WlcamfbzRjRQ2NSoWYda2/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EjtcJcxs; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EjtcJcxs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 138421A15C3;
	Wed, 22 Oct 2025 15:39:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0DBB606DC;
	Wed, 22 Oct 2025 15:39:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D59F102F243E;
	Wed, 22 Oct 2025 17:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761147569; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xGfi/wxxIWJSZ/P38qx/iDvGfCPuBRfGoA+hd2Uxo10=;
	b=EjtcJcxs+0UCdQ+pznvyHrNM1liawuZYM64F72qC2RqV+9x8rEl+WJsipSOUhzltGfQfUd
	gBiTdtw1ZZxUCRebSgzTMAAPNws1L3zFKJ1Xlwxwcf+fnJ8fti+0604ZNbxXB0qH8yI6lx
	VilmT1rrFnuhdSTfu+O71skgHWxiIAr/JGHziMomXH+VRq2REjfAVzT/jLjRezJognCr8h
	fXRWaEwIRWCcndBTQvG4tvPL7gTyYsJpYPVln/RB2EqM1n/pdozp7wH4rt9ZVRLV3DGa5y
	nHCqCL0LfZoj3SZXujhtdJIiBLYUhf13nTXnrLxur2Hwv5AWUzuJISgr4PHYMw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 22 Oct 2025 17:39:06 +0200
Subject: [PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for
 generic PHYs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251022-macb-phy-v1-4-f29f28fae721@bootlin.com>
References: <20251022-macb-phy-v1-0-f29f28fae721@bootlin.com>
In-Reply-To: <20251022-macb-phy-v1-0-f29f28fae721@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Grow our clk-eyeq family; it knows how to spawn reset provider and pin
controller children. Expand with a generic PHY driver on EyeQ5.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 664ce7d7868d..a9de57315e48 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -109,6 +109,7 @@ struct eqc_match_data {
 
 	const char		*reset_auxdev_name;
 	const char		*pinctrl_auxdev_name;
+	const char		*eth_phy_auxdev_name;
 
 	unsigned int		early_clk_count;
 };
@@ -361,6 +362,7 @@ static int eqc_probe(struct platform_device *pdev)
 	/* Init optional auxiliary devices. */
 	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
 	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->eth_phy_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */
@@ -521,6 +523,7 @@ static const struct eqc_match_data eqc_eyeq5_match_data = {
 
 	.reset_auxdev_name = "reset",
 	.pinctrl_auxdev_name = "pinctrl",
+	.eth_phy_auxdev_name = "phy",
 
 	.early_clk_count = ARRAY_SIZE(eqc_eyeq5_early_plls) +
 			   ARRAY_SIZE(eqc_eyeq5_early_fixed_factors),

-- 
2.51.1

